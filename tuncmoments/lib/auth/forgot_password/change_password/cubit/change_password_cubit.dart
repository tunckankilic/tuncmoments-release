import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_fields/form_fields.dart';
import 'package:shared/shared.dart';
import 'package:user_repository/user_repository.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const ChangePasswordState.initial());

  final UserRepository _userRepository;

  /// Changes password visibility, making it visible or not.
  void changePasswordVisibility() => emit(
        state.copyWith(showPassword: !state.showPassword),
      );

  /// Emits initial state of login screen.
  void resetState() => emit(const ChangePasswordState.initial());

  /// OTP field was unfocused, here is checking if previous state with OTP
  /// was valid, in order to indicate it in state after unfocus.
  void onOtpUnfocused() {
    final previousScreenState = state;
    final previousOtpState = previousScreenState.otp;
    final previousOtpValue = previousOtpState.value;

    final newOtpState = Otp.dirty(
      previousOtpValue,
    );
    final newScreenState = previousScreenState.copyWith(
      otp: newOtpState,
    );
    emit(newScreenState);
  }

  /// OTP value was changed, triggering new changes in state.
  void onOtpChanged(String newValue) {
    final previousScreenState = state;
    final previousOtpState = previousScreenState.otp;
    final shouldValidate = previousOtpState.invalid;
    final newOtpState = shouldValidate
        ? Otp.dirty(
            newValue,
          )
        : Otp.pure(
            newValue,
          );

    final newScreenState = state.copyWith(
      otp: newOtpState,
    );

    emit(newScreenState);
  }

  /// Password field was unfocused, here is checking if previous state with
  /// password was valid, in order to indicate it in state after unfocus.
  void onPasswordUnfocused() {
    final previousScreenState = state;
    final previousPasswordState = previousScreenState.password;
    final previousPasswordValue = previousPasswordState.value;

    final newPasswordState = Password.dirty(
      previousPasswordValue,
    );
    final newScreenState = previousScreenState.copyWith(
      password: newPasswordState,
    );
    emit(newScreenState);
  }

  /// Password value was changed, triggering new changes in state.
  void onPasswordChanged(String newValue) {
    final previousScreenState = state;
    final previousPasswordState = previousScreenState.password;
    final shouldValidate = previousPasswordState.invalid;
    final newPasswordState = shouldValidate
        ? Password.dirty(
            newValue,
          )
        : Password.pure(
            newValue,
          );

    final newScreenState = state.copyWith(
      password: newPasswordState,
    );

    emit(newScreenState);
  }

  Future<void> onSubmit({required String email}) async {
    final password = Password.dirty(state.password.value);
    final otp = Otp.dirty(state.otp.value);
    final isFormValid = FormzValid([password, otp]).isFormValid;

    final newState = state.copyWith(
      password: password,
      otp: otp,
      status: isFormValid ? ChangePasswordStatus.loading : null,
    );

    emit(newState);

    if (!isFormValid) return;

    try {
      await _userRepository.resetPassword(
        email: email,
        token: state.otp.value,
        newPassword: state.password.value,
      );
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: ChangePasswordStatus.invalidOtp));
    }
  }
}
