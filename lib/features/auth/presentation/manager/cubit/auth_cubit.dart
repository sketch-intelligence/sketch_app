import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch/features/auth/domain/use_case/login_use_case.dart';
import 'package:sketch/features/auth/presentation/manager/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  bool isObscure = true;
  bool passwordObscure = true;
  bool confirmPasswordObscure = true;
  LoginParams loginParams = LoginParams(email: '', password: '');
  // ForgetPasswordParams forgetPasswordParams = ForgetPasswordParams();
  // SignupParams signupParams = SignupParams();

  changeObscurePassword() {
    isObscure = !isObscure;
    emit(UpdateAuthState());
  }

  changeObscurePasswordSignUp() {
    passwordObscure = !passwordObscure;
    emit(UpdateAuthState());
  }

  changeObscureConfirmPassword() {
    confirmPasswordObscure = !confirmPasswordObscure;
    emit(UpdateAuthState());
  }

  clearObscure() {
    isObscure = true;
    passwordObscure = true;
    confirmPasswordObscure = true;
  }
}
