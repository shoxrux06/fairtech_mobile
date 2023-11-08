import 'dart:io';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/components/input/custom_text_field.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/components/input/masked_text_controller.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button.dart';
import 'package:fairtech_mobile/src/features/components/loading_widgets/modal_progress_hud.dart';
import 'package:fairtech_mobile/src/features/components/snackbar/app_snackbar.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/domain/models/appeal_model.dart';
import 'package:fairtech_mobile/src/features/drawer/appeals/presentaion/bloc/appeals_bloc.dart';
import 'package:fairtech_mobile/src/features/main/presentation/bloc/main/main_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
  String? dropdownValueCategory;
  String? dropdownPersonType;

  List<String> subCategoryList = [
    'Dori vositalari va tibbiyot buyumlarini belgilangan narxdan yuqori sotish',
    'Dori vositalari belgilangan narxdan yuqori sotish',
  ];

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

  List<File?> selectedFileList = [];
  List<String> selectedFileNameList = [];

  File? selectedfile;
  String fileName = "";

  selectFile() async {
    // pick file from gallery
    String? filePath = await FilePicker.platform
        .pickFiles(type: FileType.any)
        .then((value) => value?.files.single.path);

    if (filePath != null) {
      setState(() {
        selectedfile = File(filePath); // picked file
        selectedFileList.add(selectedfile);
        fileName = filePath.split('/').last;
        selectedFileNameList.add(fileName);
        print('File path <<${selectedfile?.path}>>');
      });
    }
  }

  @override
  void initState() {
    print('******* AppealsPage *******');
    dropdownValueCategory = subCategoryList.first;
    dropdownPersonType = personTypeList.first;
    context.read<AppealsBloc>().add(GetProfileDataEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppealsBloc, AppealsState>(
      listener: (context, state) {
        _phoneNumberController.text = '${state.profileDataResponse?.phoneNumber}';
        if (state.sendAppealResponse?.status == 0) {
          AppSnackBar.showSuccessSnackBar(context, '${state.sendAppealResponse?.message}');
          selectedFileList = [];
          selectedFileNameList = [];
          setState(() {
            isPinflEnabled = false;
            isPhoneNumberEnabled = false;
            isAddressEnabled = false;
          });
          context.pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(title: 'Murojaat yaratish',),
          body: ModalProgressHUD(
            inAsyncCall: state.appealIsSending,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: context.theme.primaryColor,
                        ),
                        child: const Text('Murojaatchi ma\'lumotlari'),
                      ),
                    ),
                    AppUtils.kGap12,
                    Text('Shaxs turi'),
                    DropdownButtonFormField(
                        value: dropdownPersonType,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        dropdownColor: Colors.white,
                        style: const TextStyle(color: Colors.grey),
                        decoration: InputDecoration(
                          fillColor: context.theme.cardColor,
                          filled: true,
                          hintText: 'Shaxs turi',
                          hintStyle: TextStyle(
                              color: context.theme.canvasColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
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
                        items: personTypeList
                            .map<DropdownMenuItem<String>>((String value) {
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
                    const Text('Foydalanuvchi JSHSHIR'),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // ScaffoldMessenger.of(context).showSnackBar(snackBar)
                              AppSnackBar.showWarningSnackBar(
                                  context, 'You cant change this field');
                            },
                            child: CustomTextField(
                              controller: _pinflController..text = '${state.profileDataResponse?.pinfl}',
                              enabled: false,
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
                    const Text('Murojaatchi FISH'),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: _fullNameController
                              ..text =
                                  '${state.profileDataResponse?.lastName} ${state.profileDataResponse?.firstName} ${state.profileDataResponse?.middleName}',
                            enabled: false,
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
                    const Text('Telefon raqami'),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: _phoneNumberController,
                            enabled: isPhoneNumberEnabled,
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
                    const Text('Pochta indeksi'),
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
                    const Text('Manzili'),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: _addressController
                              ..text = '${state.profileDataResponse?.perAdress}',
                            keyboardType: TextInputType.multiline,
                            enabled: isAddressEnabled,
                            maxLines: 5,
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
                          icon: Icon(Icons.edit_rounded),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: context.theme.primaryColor,
                        ),
                        child: const Text('Murojaat mazmuni'),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    DropdownButtonFormField(
                        value: dropdownValueCategory,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        isExpanded: true,
                        isDense: false,
                        itemHeight: 50,
                        dropdownColor: Colors.white,
                        style: const TextStyle(color: Colors.grey),
                        decoration: InputDecoration(
                          fillColor: context.theme.cardColor,
                          filled: true,
                          hintText: 'Category',
                          hintStyle: TextStyle(
                              color: context.theme.canvasColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
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
                        items: subCategoryList
                            .map<DropdownMenuItem<String>>((String value) {
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
                            dropdownValueCategory = value!;
                          });
                        }),
                    AppUtils.kGap12,
                    const Text('Qisqacha mazmuni'),
                    CustomTextField(
                      controller: _shortDescController,
                      hintText: 'Enter short description',
                      keyboardType: TextInputType.multiline,
                      minLines: 5,
                      maxLines: 10,
                    ),
                    AppUtils.kGap24,
                    InkWell(
                      onTap: () {
                        selectFile();
                      },
                      child: CustomButton(
                        text: 'Fayl yuklash',
                        color: context.theme.primaryColor.withOpacity(0.5),
                      ),
                    ),
                    AppUtils.kGap12,
                    selectedFileNameList.isEmpty
                        ? Container()
                        : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...selectedFileNameList.map((item) => Container(
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
                                    style: const TextStyle(color: Colors.black, fontSize: 14),
                                  ),
                                ),
                              ],
                            )
                        ),)
                      ],
                    ),
                    const SizedBox(height: 10),
                    AppUtils.kGap40,
                    Row(
                      children: [
                        const Expanded(
                          child: CustomButton(
                            text: 'Qoralam saqlash',
                            color: Colors.yellow,
                          ),
                        ),
                        AppUtils.kGap12,
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            context.read<AppealsBloc>().add(
                                  SendAppealEvent(
                                    context: context,
                                    appealModel: AppealModel(
                                      applierType: dropdownPersonType ?? '',
                                      applierJshshir: state.profileDataResponse?.pinfl ?? '',
                                      applierFullname: '${state.profileDataResponse?.lastName} ${state.profileDataResponse?.firstName} ${state.profileDataResponse?.middleName}',
                                      applierZipcode: 100053,
                                      applierAddress: _addressController.text,
                                      appealType: dropdownValueCategory,
                                      appealSubtype: 'appealSubtype',
                                      appealDescription: _shortDescController.text.trim(),
                                      applierNumber: _phoneNumberController.text,
                                      appealFileList: selectedFileList,
                                    ),
                                  ),
                                );
                          },
                          child: const CustomButton(
                            text: 'Yuborish',
                          ),
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
