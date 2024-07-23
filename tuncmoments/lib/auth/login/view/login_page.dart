import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuncmoments/auth/login/cubit/login_cubit.dart';
import 'package:tuncmoments/auth/login/widgets/auth_provider_sign_in_button.dart';
import 'package:tuncmoments/auth/login/widgets/login_form.dart';
import 'package:tuncmoments/auth/login/widgets/sign_in_button.dart';
import 'package:tuncmoments/auth/login/widgets/widgets.dart';
import 'package:user_repository/user_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginCubit(userRepository: context.read<UserRepository>()),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      releaseFocus: true,
      resizeToAvoidBottomInset: true,
      body: AppConstrainedScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.xlg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap.v(AppSpacing.xxxlg + AppSpacing.xxxlg),
            AppLogo(
              height: AppSpacing.xxxlg,
              fit: BoxFit.fitHeight,
              width: double.infinity,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginForm(),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: AppSpacing.md,
                      top: AppSpacing.xs,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ForgotPasswordButton(),
                    ),
                  ),
                  Align(child: SignInButton()),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSpacing.md,
                    ),
                    child: AppDivider(withText: true),
                  ),
                  // Align(
                  //   child: AuthProviderSignInButton(
                  //     provider: AuthProvider.google,
                  //     onPressed: () =>
                  //         context.read<LoginCubit>().loginWithGoogle(),
                  //   ),
                  // ),
                  // Align(
                  //   child: AuthProviderSignInButton(
                  //     provider: AuthProvider.github,
                  //     onPressed: () =>
                  //         context.read<LoginCubit>().loginWithGithub(),
                  //   ),
                  // ),
                ],
              ),
            ),
            SignUpNewAccountButton(),
          ],
        ),
      ),
    );
  }
}
