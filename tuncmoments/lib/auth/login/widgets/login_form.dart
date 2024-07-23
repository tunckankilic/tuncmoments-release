import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuncmoments/app/app.dart';
import 'package:tuncmoments/auth/login/cubit/login_cubit.dart';
import 'package:tuncmoments/auth/login/widgets/widgets.dart';
import 'package:shared/shared.dart';

/// {@template login_form}
/// Login form that contains email and password fields.
/// {@endtemplate}
class LoginForm extends StatefulWidget {
  /// {@macro login_form}
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  void initState() {
    super.initState();
    context.read<LoginCubit>().resetState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<LoginCubit>().resetState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isError) {
          openSnackbar(
            SnackbarMessage.error(
              title: loginSubmissionStatusMessage[state.status]!.title,
              description:
                  loginSubmissionStatusMessage[state.status]?.description ??
                      state.message,
            ),
            clearIfQueue: true,
          );
        }
      },
      listenWhen: (p, c) => p.status != c.status,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EmailTextField(),
          const PasswordTextField(),
        ].spacerBetween(height: AppSpacing.md),
      ),
    );
  }
}
