import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:fairtech_mobile/src/core/constants/app_constants.dart';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/app_utils.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/auth/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button.dart';
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
        listener: (context, state) {
          if (state.oneIdAuthResponse != null) {
            context.pushReplacement(Routes.authConfirmed);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state.oneIdAuthResponseIsNotNull,
            color: Colors.black54,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppUtils.kGap40,
                  Image.asset(
                    AppConstants.logoPng,
                    width: 200,
                    height: 200,
                  ),
                  AppUtils.kGap40,
                  Text(
                    context.tr('fairTechSignUpText'),
                    style: TextStyle(
                      color: context.theme.primaryColor,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  AppUtils.kGap40,
                  SvgPicture.asset(
                    AppConstants.oneId,
                    width: Responsive.width(60, context),
                    height: 60,
                  ),
                  const Spacer(),
                  AppUtils.kGap12,
                  InkWell(
                    onTap: () {
                      getCode(context);
                    },
                    child: CustomButton(text: context.tr('signUp'),),
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
    );
    if (resultCode != null) {
      print('code  >> ${resultCode['code']}');
      print('state >> ${resultCode['state']}');
      if (mounted) {
        context.read<SignInBloc>().add(GetOneIdDataEvent(context: context, resultCode: resultCode));
      }
    }
  }
}
