import 'dart:convert';

import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/pharm_info/presentation/bloc/pharm_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({super.key});

  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  @override
  void initState() {
    context.read<PharmInfoBloc>().add(GetProfileDataPharmEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String image = LocalStorage.instance.getUserImageUrl();
    print('image43 => *** $image ****');

    final memImage = const Base64Decoder().convert(image);
    print('memImage => *** $memImage ****');
    return BlocBuilder<PharmInfoBloc, PharmInfoState>(
      builder: (context, state) {
        final data = state.profileDataResponse;
        return Scaffold(
            appBar: CustomAppBar(
              title: context.tr('personalInformation'),
            ),
            body:data == null? const Center(
              child: CircularProgressIndicator(),
            ): Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.memory(
                      memImage,
                      width: Responsive.width(40, context),
                      height: Responsive.height(20, context),
                      fit: BoxFit.fill,
                    ),
                    AppUtils.kGap12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child: Text('Familyasi', style: context.textStyle.regularBody)),
                        Expanded(
                            child: Text(
                          data.lastName,
                          style: context.textStyle.largeTitle2.copyWith(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.end,
                        )),
                      ],
                    ),
                    AppUtils.kGap12,
                    Row(
                      children: [
                        Expanded(
                            child: Text('Ismi',
                                style: context.textStyle.regularBody)),
                        Expanded(
                            child: Text(
                          data.firstName,
                          style: context.textStyle.largeTitle2.copyWith(fontSize: 14),
                              textAlign: TextAlign.end,
                        )),
                      ],
                    ),
                    AppUtils.kGap12,
                    Row(
                      children: [
                        Expanded(
                            child: Text('Sharifi', style: context.textStyle.regularBody)),
                        Expanded(
                            child: Text(
                          data.middleName,
                          style: context.textStyle.largeTitle2.copyWith(fontSize: 14,), textAlign: TextAlign.end,
                        )),
                      ],
                    ),
                    AppUtils.kGap12,
                    Row(
                      children: [
                        Expanded(child: Text('Tug\'ilgan sanasi', style: context.textStyle.regularBody)),
                        Expanded(child: Text(
                          data.birthday,
                          style: context.textStyle.largeTitle2.copyWith(fontSize: 14), textAlign: TextAlign.end,
                        )),
                      ],
                    ),
                    AppUtils.kGap12,
                    Row(
                      children: [
                        Expanded(
                            child: Text('JSH SHIR',
                                style: context.textStyle.regularBody)),
                        Expanded(
                            child: Text(
                          data.pinfl,
                          style: context.textStyle.largeTitle2.copyWith(fontSize: 14), textAlign: TextAlign.end,
                        )),
                      ],
                    ),
                    AppUtils.kGap12,
                    Row(
                      children: [
                        Expanded(
                            child: Text('Yashash manzili',
                                style: context.textStyle.regularBody)),
                        AppUtils.kGap12,
                        Expanded(
                            child: Text(
                          data.perAdress,
                          style: context.textStyle.largeTitle2
                              .copyWith(fontSize: 14), textAlign: TextAlign.end,
                        )),
                      ],
                    ),
                    AppUtils.kGap12,
                    Row(
                      children: [
                        Expanded(
                            child: Text('Tug\'ilgan joyi',
                                style: context.textStyle.regularBody)),
                        AppUtils.kGap12,
                        Expanded(
                            child: Text(
                              data.birthPlace,
                              style: context.textStyle.largeTitle2.copyWith(fontSize: 14), textAlign: TextAlign.end,
                            )),
                      ],
                    ),
                    AppUtils.kGap12,
                    Row(
                      children: [
                        Expanded(
                            child: Text('Kim tomonidan berilgan',
                                style: context.textStyle.regularBody)),
                        AppUtils.kGap12,
                        Expanded(
                            child: Text(
                              data.passportGivenWho,
                              style: context.textStyle.largeTitle2.copyWith(fontSize: 14), textAlign: TextAlign.end,
                            )),
                      ],
                    ),
                    AppUtils.kGap12,
                    Row(
                      children: [
                        Expanded(
                            child: Text('Pasport seriyasi va raqami',
                                style: context.textStyle.regularBody)),
                        AppUtils.kGap12,
                        Expanded(
                            child: Text(
                              '${data.passportSeries} ${data.passportNumber}',
                              style: context.textStyle.largeTitle2
                                  .copyWith(fontSize: 14), textAlign: TextAlign.end,
                            )),
                      ],
                    ),
                    AppUtils.kGap12,
                    Row(
                      children: [
                        Expanded(
                            child: Text('Pasport berilgan sana',
                                style: context.textStyle.regularBody)),
                        AppUtils.kGap12,
                        Expanded(
                            child: Text(
                              data.passportGivenDate,
                              style: context.textStyle.largeTitle2
                                  .copyWith(fontSize: 14), textAlign: TextAlign.end,
                            )),
                      ],
                    ),
                    AppUtils.kGap12,
                    Row(
                      children: [
                        Expanded(
                            child: Text('Amal qilish muddati',
                                style: context.textStyle.regularBody)),
                        AppUtils.kGap12,
                        Expanded(
                            child: Text(
                              data.passportEndDate,
                              style: context.textStyle.largeTitle2
                                  .copyWith(fontSize: 14), textAlign: TextAlign.end,
                            )),
                      ],
                    ),
                    AppUtils.kGap12,
                    Row(
                      children: [
                        Expanded(
                            child: Text('Telefon raqami',
                                style: context.textStyle.regularBody)),
                        AppUtils.kGap12,
                        Expanded(
                            child: Text(
                              data.phoneNumber,
                              style: context.textStyle.largeTitle2
                                  .copyWith(fontSize: 14), textAlign: TextAlign.end,
                            )),
                      ],
                    ),


                  ],
                ),
              ),
            ));
      },
    );
  }
}
