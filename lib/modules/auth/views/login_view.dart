import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/app_widgets/app_filled_btn.dart';
import 'package:social_media_app/app_widgets/app_text_btn.dart';
import 'package:social_media_app/app_widgets/custom_app_bar.dart';
import 'package:social_media_app/app_widgets/unfocus_widget.dart';
import 'package:social_media_app/constants/dimens.dart';
import 'package:social_media_app/constants/strings.dart';
import 'package:social_media_app/constants/styles.dart';
import 'package:social_media_app/modules/auth/controllers/login_controller.dart';
import 'package:social_media_app/routes/route_management.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget _buildLoginFields(BuildContext context) => GetBuilder<LoginController>(
        builder: (logic) => Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: AppStyles.defaultHorizontalPadding,
              child: FocusScope(
                node: logic.focusNode,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Dimens.boxHeight32,
                    Text(
                      StringValues.welcomeBack,
                      style: AppStyles.h2,
                      textAlign: TextAlign.center,
                    ),
                    Dimens.boxHeight8,
                    Text(
                      StringValues.loginToAccount,
                      style: AppStyles.p,
                      textAlign: TextAlign.center,
                    ),
                    Dimens.boxHeight32,
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: StringValues.emailOrUsername,
                      ),
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      style: AppStyles.style14Normal.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      controller: logic.emailUnameTextController,
                      onEditingComplete: logic.focusNode.nextFocus,
                    ),
                    Dimens.boxHeight16,
                    TextFormField(
                      obscureText: logic.showPassword,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: logic.toggleViewPassword,
                          child: Icon(
                            logic.showPassword
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash,
                          ),
                        ),
                        hintText: StringValues.password,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      maxLines: 1,
                      style: AppStyles.style14Normal.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      controller: logic.passwordTextController,
                      onEditingComplete: logic.focusNode.unfocus,
                    ),
                    Dimens.heightedBox(Dimens.twentyEight),
                    const NxTextButton(
                      label: StringValues.forgotPassword,
                      onTap: RouteManagement.goToForgotPasswordView,
                    ),
                    Dimens.boxHeight32,
                    NxFilledButton(
                      onTap: () => logic.login(),
                      label: StringValues.login,
                    ),
                    Dimens.boxHeight32,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringValues.doNotHaveAccount,
                          style: AppStyles.p,
                        ),
                        Dimens.boxWidth4,
                        NxTextButton(
                          label: StringValues.register,
                          onTap: () {
                            RouteManagement.goToBack();
                            RouteManagement.goToRegisterView();
                          },
                        ),
                      ],
                    ),
                    Dimens.boxHeight16,
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  NxAppBar _buildAppBar(BuildContext context) {
    return const NxAppBar();
  }

  @override
  Widget build(BuildContext context) {
    return UnFocusWidget(
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: Dimens.screenWidth,
            height: Dimens.screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildAppBar(context),
                _buildLoginFields(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
