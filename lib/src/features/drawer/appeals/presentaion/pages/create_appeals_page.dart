import 'dart:io';
import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/components/input/custom_text_field.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/components/input/masked_text_controller.dart';
import 'package:fairtech_mobile/src/features/components/bottom_sheet/custom_bottom_sheet.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button_without_gradient.dart';
import 'package:fairtech_mobile/src/features/components/dropdown/custom_dropdown_form_filed.dart';
import 'package:fairtech_mobile/src/features/components/loading_widgets/modal_progress_hud.dart';
import 'package:fairtech_mobile/src/features/components/snackbar/app_snackbar.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/data/models/appeal_image_type_response.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/domain/models/appeal_model.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/presentaion/bloc/appeals_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CreateAppealsPage extends StatefulWidget {
  const CreateAppealsPage({super.key});

  @override
  State<CreateAppealsPage> createState() => _CreateAppealsPageState();
}

class _CreateAppealsPageState extends State<CreateAppealsPage> {
  final _addressController = TextEditingController();
  final _pinflController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _shortDescController = TextEditingController();
  final _stirController = TextEditingController();
  String? dropdownValueCategory;
  String? dropdownPersonType;

  bool typeSelected = false;

  List<String> subCategoryList = [];

  List<String> personTypeList = [
    'Jismoniy shaxs',
    'Yuridik shaxs',
  ];

  final _phoneNumberController = MaskedTextController(
    mask: '+000 (00) 000-00-00',
  );

  bool isPinflEnabled = false;
  bool isPhoneNumberEnabled = false;
  bool isAddressEnabled = false;

  String? dropDownValue;

  List<File?> selectedFileList1 = [];
  List<File?> selectedFileList2 = [];
  List<File?> selectedFileList3 = [];
  List<String> selectedFileNameList1 = [];
  List<String> selectedFileNameList2 = [];
  List<String> selectedFileNameList3 = [];

  List<int> imageIdList = [];

  List<ListElement> list = [];


  File? selectedfile1;
  File? selectedfile2;
  File? selectedfile3;
  String fileName = "";

  selectFile1() async {
    // pick file from gallery
    setState(() {
      dropDownValue = null;
    });
    String? filePath = await FilePicker.platform
        .pickFiles(type: FileType.any)
        .then((value) => value?.files.single.path);

    if (filePath != null) {
      setState(() {
        selectedfile1 = File(filePath); // picked file
        selectedFileList1.add(selectedfile1);
        fileName = filePath.split('/').last;
        selectedFileNameList1.add(fileName);
      });
      typeSelected = false;
    }
  }

  selectFile2() async {
    // pick file from gallery
    String? filePath = await FilePicker.platform
        .pickFiles(type: FileType.any)
        .then((value) => value?.files.single.path);

    if (filePath != null) {
      setState(() {
        selectedfile2 = File(filePath); // picked file
        selectedFileList2.add(selectedfile2);
        fileName = filePath.split('/').last;
        selectedFileNameList2.add(fileName);
      });
    }
  }

  selectFile3() async {
    // pick file from gallery
    String? filePath = await FilePicker.platform
        .pickFiles(type: FileType.any)
        .then((value) => value?.files.single.path);

    if (filePath != null) {
      setState(() {
        selectedfile3 = File(filePath); // picked file
        selectedFileList3.add(selectedfile3);
        fileName = filePath.split('/').last;
        selectedFileNameList3.add(fileName);
      });
    }
  }

  bool isChecked = false;

  LatLng? center;
  String? fullAddress;
  @override
  void initState() {
    print('******* AppealsPage *******');
    dropdownPersonType = personTypeList.first;
    context.read<AppealsBloc>().add(GetProfileDataEvent(context: context));
    context.read<AppealsBloc>().add(GetImageTypeEvent(context: context));
    context.read<AppealsBloc>().add(GetAppealTypeEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppealsBloc, AppealsState>(
      listener: (context, state) {
        if(state.appealImageTypeResponse != null){
          list.addAll(state.appealImageTypeResponse?.list ??[]);
        }
        if(state.appealTypeResponse != null){
          print('state.appealTypeResponse?.list ${state.appealTypeResponse?.list}');
          state.appealTypeResponse?.list.forEach((element) {
            subCategoryList.add(element.nameUz);
          });
          dropdownValueCategory = subCategoryList.first;
        }
        _phoneNumberController.text = '${state.profileDataResponse?.phoneNumber}';
        if (state.sendAppealResponse?.status == 0) {
          AppSnackBar.showSuccessSnackBar(context,'Success','${state.sendAppealResponse?.message}');
          selectedFileList1 = [];
          selectedFileNameList1 = [];
          setState(() {
            isPinflEnabled = false;
            isPhoneNumberEnabled = false;
            isAddressEnabled = false;
          });
          context.pop();
        }
      },
      builder: (context, state) {
        if(state.profileDataResponse == null){
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return Scaffold(
          // appBar: CustomAppBar(title: 'Murojaat yaratish',),
          body: ModalProgressHUD(
            inAsyncCall: state.appealIsSending,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppUtils.kGap40,
                   AppUtils.kGap24,
                   Card(
                     color: Colors.white,
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Murojaatchi ma\'lumotlari', style: context.textStyle.regularTitle2.copyWith(color: context.theme.primaryColor),),
                           AppUtils.kGap12,
                           Text('Shaxs turi',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText),),
                           DropdownButtonFormField(
                               value: dropdownPersonType,
                               icon: const Icon(Icons.arrow_drop_down),
                               elevation: 16,
                               dropdownColor: Colors.white,
                               style: context.textStyle.regularBody,
                               decoration: InputDecoration(
                                 fillColor: context.theme.cardColor,
                                 filled: true,
                                 hintText: 'Shaxs turi',
                                 hintStyle: context.textStyle.regularBody,
                                 // prefixIcon: const Icon(Icons.not_listed_location_outlined),
                                 border: OutlineInputBorder(
                                   borderRadius:
                                   const BorderRadius.all(Radius.circular(16)),
                                   borderSide: BorderSide(
                                       color: context.theme.primaryColor, width: 1),
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderRadius:
                                   const BorderRadius.all(Radius.circular(16)),
                                   borderSide: BorderSide(
                                       color: context.theme.primaryColor, width: 1),
                                 ),
                                 focusedBorder: OutlineInputBorder(
                                   borderRadius:
                                   const BorderRadius.all(Radius.circular(16)),
                                   borderSide: BorderSide(
                                       color: context.theme.primaryColor, width: 1),
                                 ),
                                 errorBorder: OutlineInputBorder(
                                   borderRadius:
                                   const BorderRadius.all(Radius.circular(16)),
                                   borderSide: BorderSide(
                                       color: context.theme.primaryColor, width: 1),
                                 ),
                                 focusedErrorBorder: OutlineInputBorder(
                                   borderRadius:
                                   const BorderRadius.all(Radius.circular(16)),
                                   borderSide: BorderSide(
                                       color: context.theme.primaryColor, width: 1),
                                 ),
                               ),
                               items: personTypeList.map<DropdownMenuItem<String>>((String value) {
                                 return DropdownMenuItem<String>(
                                   value: value,
                                   child: Text(
                                     value,
                                     maxLines: 3,
                                     overflow: TextOverflow.ellipsis,
                                   ),
                                 );
                               }).toList(),
                               onChanged: (String? value) {
                                 setState(() {
                                   dropdownPersonType = value!;
                                 });
                               }),
                           const SizedBox(
                             height: 12,
                           ),
                           Text('Foydalanuvchi JSHSHIR',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
                           Row(
                             children: [
                               Expanded(
                                 child: InkWell(
                                   onTap: () {
                                     AppSnackBar.showWarningSnackBar(
                                         context, 'You can\'t change this field'
                                     );
                                   },
                                   child: CustomTextField(
                                     controller: _pinflController..text = '${state.profileDataResponse?.pinfl}',
                                     enabled: false,
                                     style: context.textStyle.regularBody,
                                   ),
                                 ),
                               ),
                               const SizedBox(
                                 width: 48,
                               ),
                             ],
                           ),
                           const SizedBox(
                             height: 12,
                           ),
                           Text('Murojaatchi FISH',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
                           Row(
                             children: [
                               Expanded(
                                 child: CustomTextField(
                                   controller: _fullNameController
                                     ..text =
                                         '${state.profileDataResponse?.lastName} ${state.profileDataResponse?.firstName} ${state.profileDataResponse?.middleName}',
                                   enabled: false,
                                   style: context.textStyle.regularBody,
                                 ),
                               ),
                               const SizedBox(
                                 width: 48,
                               ),
                             ],
                           ),
                           const SizedBox(
                             height: 12,
                           ),
                           Text('Telefon raqami',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
                           Row(
                             children: [
                               Expanded(
                                 child: CustomTextField(
                                   controller: _phoneNumberController,
                                   enabled: isPhoneNumberEnabled,
                                   style: context.textStyle.regularBody,
                                 ),
                               ),
                               IconButton(
                                 onPressed: () {
                                   setState(
                                         () {
                                       isPhoneNumberEnabled = true;
                                     },
                                   );
                                 },
                                 icon: Icon(Icons.edit_rounded),
                               )
                             ],
                           ),
                           const SizedBox(
                             height: 12,
                           ),
                           Text('Pochta indeksi',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
                           Row(
                             children: [
                               const Expanded(
                                 child: CustomTextField(
                                   keyboardType: TextInputType.multiline,
                                   maxLines: 5,
                                 ),
                               ),
                               IconButton(
                                 onPressed: () {},
                                 icon: const Icon(Icons.edit_rounded),
                               )
                             ],
                           ),
                           const SizedBox(
                             height: 12,
                           ),
                           Text('Manzili',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
                           Row(
                             children: [
                               Expanded(
                                 child: CustomTextField(
                                   controller: _addressController
                                     ..text = '${state.profileDataResponse?.perAdress}',
                                   keyboardType: TextInputType.multiline,
                                   enabled: isAddressEnabled,
                                   maxLines: 5,
                                   // style: context.textStyle.regularBody,
                                 ),
                               ),
                               IconButton(
                                 onPressed: () {
                                   setState(
                                         () {
                                       isAddressEnabled = true;
                                     },
                                   );
                                 },
                                 icon: const Icon(Icons.edit_rounded),
                               )
                             ],
                           ),
                         ],
                       ),
                     ),
                   ),
                    const SizedBox(
                      height: 24,
                    ),
                    Card(
                     color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Murojaat turi',style: context.textStyle.regularTitle2.copyWith(color: context.theme.primaryColor)),
                            const SizedBox(
                              height: 12,
                            ),
                            DropdownButtonFormField(
                                value: dropdownValueCategory,
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 16,
                                isExpanded: true,
                                isDense: false,
                                // itemHeight: 48,
                                dropdownColor: Colors.white,
                                style: context.textStyle.regularBody,
                                decoration: InputDecoration(
                                  fillColor: context.theme.cardColor,
                                  filled: true,
                                  hintText: 'Category',
                                  hintStyle: context.textStyle.regularBody,
                                  // prefixIcon: const Icon(Icons.not_listed_location_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                    borderSide: BorderSide(
                                        color: context.theme.primaryColor, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                    borderSide: BorderSide(
                                        color: context.theme.primaryColor, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                    borderSide: BorderSide(
                                        color: context.theme.primaryColor, width: 1),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                    borderSide: BorderSide(
                                        color: context.theme.primaryColor, width: 1),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                    borderSide: BorderSide(
                                        color: context.theme.primaryColor, width: 1),
                                  ),
                                ),
                                items: subCategoryList.toSet().toList()
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      minVerticalPadding: 4,
                                      title: Text(
                                        value,
                                        maxLines: 3,
                                        // style: context.textStyle.regularBody,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    dropdownValueCategory = value!;
                                  });
                                }),
                            AppUtils.kGap12,
                            Text('Qisqacha mazmuni',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
                            CustomTextField(
                              controller: _shortDescController,
                              hintText: 'Qisqacha mazmunini kiriting',
                              keyboardType: TextInputType.multiline,
                              minLines: 5,
                              maxLines: 10,
                              style: context.textStyle.regularBody,
                            ),
                            AppUtils.kGap12,
                            Text('STIR',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
                            CustomTextField(
                              hintText: 'STIR ni kiriting',
                              keyboardType: TextInputType.number,
                              controller: _stirController,
                              style: context.textStyle.regularBody,
                            ),
                            AppUtils.kGap24,
                            CustomButtonWithoutGradient(
                              onTap: (){
                                customModalBottomSheet(
                                    context: context, 
                                    builder: (ctx, controller) {
                                      List<String> items = [];
                                      for (var element in list) {
                                        items.add(element.nameUz);
                                      }
                                      return SizedBox(
                                        width: Responsive.width(100, context),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                            const Text('File turini tanlang'),
                                            CustomDropDownFormField(
                                                value: dropDownValue,
                                                hintText: 'Rasm turini tanlang',
                                                items: items.toSet().toList(), onChanged: (val){
                                              typeSelected = true;
                                              list.forEach((element) {
                                                if(element.nameUz == val){
                                                  imageIdList.add(element.id);
                                                }
                                              });
                                            }),
                                            AppUtils.kGap24,
                                            CustomButtonWithoutGradient(onTap: (){
                                              if(typeSelected == false){
                                                AppSnackBar.showWarningSnackBar(context, 'File Turini tanlang');
                                              }else{
                                                selectFile1();
                                              }
                                            }, text: 'File tanlash',
                                            textColor: Colors.white,
                                            ),
                                            AppUtils.kGap24,
                                            // CustomButtonWithoutGradient(onTap: (){}, text: 'Camera'),
                                            //   AppUtils.kGap24,
                                            //   AppUtils.kGap24,
                                              AppUtils.kGap24,
                                            CustomButtonWithoutGradient(onTap: (){
                                              context.pop();
                                            }, text: 'Submit',
                                              textColor: Colors.white,
                                            ),
                                          ],),
                                        ),
                                      );
                                    }
                                );
                              },
                              text: 'Fayl biriktirish',
                              textColor: Colors.white,
                            ),
                            AppUtils.kGap4,
                            selectedFileNameList1.isEmpty
                                ? Container()
                                : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...selectedFileNameList1.map((item) => Container(
                                    margin: const EdgeInsets.symmetric(vertical: 4),
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey[100]),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Icons.file_copy, color: Colors.redAccent),
                                        const SizedBox(width: 12),
                                        Flexible(
                                          child: Text(
                                            item,
                                            style: context.textStyle.regularBody,
                                          ),
                                        ),
                                      ],
                                    )
                                ),)
                              ],
                            ),
                            selectedFileNameList2.isEmpty? Container():AppUtils.kGap12,
                            selectedFileNameList2.isEmpty
                                ? Container()
                                : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...selectedFileNameList2.map((item) => Container(
                                    margin: const EdgeInsets.symmetric(vertical: 4),
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey[100]),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Icons.file_copy, color: Colors.redAccent),
                                        const SizedBox(width: 12),
                                        Flexible(
                                          child: Text(
                                            item,
                                            style: context.textStyle.regularBody,
                                          ),
                                        ),
                                      ],
                                    )
                                ),)
                              ],
                            ),
                            selectedFileNameList2.isEmpty? Container():AppUtils.kGap12,
                            selectedFileNameList3.isEmpty
                                ? Container()
                                : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...selectedFileNameList3.map((item) => Container(
                                    margin: const EdgeInsets.symmetric(vertical: 4),
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey[100]),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Icons.file_copy, color: Colors.redAccent),
                                        const SizedBox(width: 12),
                                        Flexible(
                                          child: Text(
                                            item,
                                            style: context.textStyle.regularBody,
                                          ),
                                        ),
                                      ],
                                    )
                                ),)
                              ],
                            ),
                            AppUtils.kGap12,
                            CustomButtonWithoutGradient(
                              onTap: () async{
                                // context.read<AppealsBloc>().add(GetAppealTypeEvent(context: context));
                                dynamic result = await context.push(Routes.selectFromMap);

                                print('result <<<$result >>>');
                                if(result != null) {
                                  setState(() {
                                    center = result['coordinates'];
                                    fullAddress = result['lane'];
                                  });
                                }
                              },
                              text: 'Xaritadagi joylashgan joyi *',
                              textColor: Colors.white,
                            ),
                            AppUtils.kGap12,
                            center == null? Container():Text('${center?.latitude} ${center?.longitude}',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText, fontWeight: FontWeight.w400)),
                            center == null? Container():AppUtils.kGap8,
                            center == null? Container():Text('$fullAddress',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    CheckboxListTile(
                      checkColor: Colors.white,
                      value: isChecked,
                      splashRadius: 12,
                      title: Text('Huquqbuzarlik to\'g\'risida xabar uchun mukofotdan voz kechaman',style: context.textStyle.regularTitle2.copyWith(color: context.color?.primaryText)),
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    AppUtils.kGap40,
                    Row(
                      children: [
                        Expanded(
                          child: CustomButtonWithoutGradient(
                            onTap: (){

                            },
                            text: 'Qoralama saqlash',
                            color: Colors.yellow,
                            textColor: Colors.white,
                          ),
                        ),
                        AppUtils.kGap12,
                        Expanded(
                            child: CustomButtonWithoutGradient(
                              onTap: () {
                                if(selectedFileList1.isNotEmpty && _stirController.text.isNotEmpty &&
                                    _shortDescController.text.isNotEmpty &&
                                fullAddress != null
                                ){
                                  context.read<AppealsBloc>().add(
                                    SendAppealEvent(
                                      context: context,
                                      appealModel: AppealModel(
                                          sender: 'app',
                                          applierType: dropdownPersonType ?? '',
                                          applierJshshir: state.profileDataResponse?.pinfl ?? '',
                                          applierFullname: '${state.profileDataResponse?.lastName} ${state.profileDataResponse?.firstName} ${state.profileDataResponse?.middleName}',
                                          applierZipcode: 100053,
                                          applierAddress: _addressController.text,
                                          appealTypeId: 2,
                                          appealType: dropdownValueCategory,
                                          appealSubtype: 'appealSubtype',
                                          appealDescription: _shortDescController.text.trim(),
                                          applierNumber: _phoneNumberController.text,
                                          appealFileList: selectedFileList1,
                                          documentTypeIds: imageIdList.toSet().toList(),
                                          lang: '12.34343434',
                                          lat: '34.45553566',
                                          orgTin: _stirController.text.toString().trim()
                                      ),
                                    ),
                                  );
                                }else{
                                  AppSnackBar.showWarningSnackBar(context, 'Iltimos barcha maydonlarni to\'ldiring');
                                }

                              },
                              text: 'Yuborish',
                              textColor: Colors.white,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
