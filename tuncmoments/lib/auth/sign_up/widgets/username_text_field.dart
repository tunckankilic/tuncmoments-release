import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuncmoments/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:tuncmoments/l10n/l10n.dart';
import 'package:shared/shared.dart';

class UsernameTextField extends StatefulWidget {
  const UsernameTextField({super.key});

  @override
  State<UsernameTextField> createState() => _UsernameTextFieldState();
}

class _UsernameTextFieldState extends State<UsernameTextField> {
  final _debouncer = Debouncer();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<SignUpCubit>();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        cubit.onUsernameUnfocused();
      }
    });
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context
        .select((SignUpCubit cubit) => cubit.state.submissionStatus.isLoading);
    final usernameError = context
        .select((SignUpCubit cubit) => cubit.state.username.errorMessage);
    return AppTextField(
      filled: true,
      focusNode: _focusNode,
      hintText: context.l10n.usernameText,
      textInputAction: TextInputAction.next,
      enabled: !isLoading,
      onChanged: (v) => _debouncer.run(
        () => context.read<SignUpCubit>().onUsernameChanged(v),
      ),
      errorMaxLines: 3,
      errorText: usernameError,
    );
  }
}
