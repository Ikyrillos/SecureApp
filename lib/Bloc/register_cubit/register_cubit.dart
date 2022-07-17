import 'package:secure/presentation/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);
  String? email;
  String? password;
  String? passwordConfirm;
  bool isLoading = false;

  void registerUserWithPassword(
      BuildContext context, String? email, String? password) async {
    emit(RegisterLoading());
    try {
      var auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      FirebaseAuth.instance.signOut();
      Navigator.pop(context);
      showSnackBar(context, 'Sucessfully registered', true);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'Please provide stronger password', false);
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'email already exists', false);
      }
    } catch (e) {
      emit(RegisterFailure());
    }
  }
}
