import 'package:secure/presentation/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);
  String? email;
  String? password;
  var isLoading = false;
  void loginWithEmailAndPassword(
    BuildContext context,
  ) async {
    isLoading = true;
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      isLoading = false;
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      emit(LoginFailure());
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email.', false);
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.', false);
      }
    } catch (e) {
      emit(LoginFailure());
    }
  }
}
