import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/components/loading_widgets/modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class IdentityVerificationPage extends StatefulWidget {
  const IdentityVerificationPage({super.key});

  @override
  State<IdentityVerificationPage> createState() =>
      _IdentityVerificationPageState();
}

class _IdentityVerificationPageState extends State<IdentityVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(title: ''),
          body: ModalProgressHUD(
            inAsyncCall: state.oneIdAuthResponseIsNotNull,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      AppConstants.logoPng,
                      width: Responsive.width(40, context),
                      height: Responsive.height(30, context),
                    ),
                  ),
                  Text(
                    'FAIR TECH',
                    style: context.textStyle.largeTitle1,
                  ),
                  Text(
                    'mobil ilovasi',
                    style: context.textStyle.regularBody
                        .copyWith(color: context.color?.secondaryText),
                  ),
                  AppUtils.kGap24,
                  Text(
                    'Shaxsni tasdiqlash',
                    style: context.textStyle.largeTitle1,
                  ),
                  AppUtils.kGap40,
                  InkWell(
                    onTap: () {
                      getCode(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: context.theme.primaryColor,
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFF2A675B),
                            Color(0xFF168070),
                            Color(0xFF029783),
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ONE',
                            style: context.textStyle.largeTitle1.copyWith(
                                color: Colors.white,
                                letterSpacing: 8,
                                fontSize: 24),
                          ),
                          AppUtils.kGap8,
                          Stack(
                            children: [
                              SvgPicture.asset(
                                AppConstants.idPerson2,
                                width: 32,
                                height: 32,
                              ),
                              Positioned(
                                left: 8,
                                top: 5,
                                bottom: 5,
                                child: Container(
                                  color: Colors.white,
                                  width: 4,
                                  height: 22,
                                ),
                              ),
                              Positioned(
                                  right: 4,
                                  top: 4,
                                  bottom: 4,
                                  child: SvgPicture.asset(
                                    AppConstants.idPerson,
                                    width: 22,
                                    height: 22,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        );
      },
    );
  }

  void getCode(BuildContext context) async {
    dynamic resultCode = await context.push(
      Routes.authOneId,
    );
    if (resultCode != null) {
      print('code  >> ${resultCode['code']}');
      print('state >> ${resultCode['state']}');
      if (mounted) {
        context.read<SignInBloc>().add(
              GetOneIdDataEvent(
                context: context,
                resultCode: resultCode,
                onSuccess: () {
                  context.go(Routes.main);
                  LocalStorage.instance.deleteIsGuest();
                },
                onError: () {

                },
              ),
            );
      }
    }
  }
}
