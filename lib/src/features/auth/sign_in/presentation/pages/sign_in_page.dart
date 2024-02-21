import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/di/dependency_manager.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/local_storage.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:fairtech_mobile/src/features/components/loading_widgets/modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state.oneIdAuthResponseIsNotNull,
            color: Colors.black54,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppUtils.kGap40,
                  Image.asset(
                    AppConstants.logoPng,
                    width: Responsive.width(80, context),
                    height: Responsive.height(50, context),
                    fit: BoxFit.contain,
                  ),
                  AppUtils.kGap40,
                  AppUtils.kGap40,
                  AppUtils.kGap12,
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
                          AppUtils.kGap12,
                          Container(
                            color: Colors.white,
                            width: 1,
                            height: 22,
                          ),
                          AppUtils.kGap12,
                          Text(
                            'Ro\'yxatdan o\'tish',
                            style: context.textStyle.largeTitle1
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void getCode(BuildContext context) async {
    dynamic resultCode = await context.push(
      Routes.authOneId,
      extra: SignInBloc(signInRepository)
    );
    if (resultCode != null) {
      final sigInInBloc = resultCode['signInBloc'] as SignInBloc;
      if (mounted) {
        sigInInBloc.add(
              GetOneIdDataEvent(
                context: context,
                resultCode: resultCode,
                onSuccess: () {
                  context.pushReplacement(Routes.authConfirmed);
                  LocalStorage.instance.deleteIsGuest();
                },
                onError: () {},
              ),
            );
      }
    }
  }
}
