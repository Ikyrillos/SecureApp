import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure/Bloc/chat_cubit/user_details_cubit/cubit/user_cubit_state.dart';
// ignore: library_prefixes
import 'package:secure/models/user_model.dart' as userModel;
import 'package:secure/presentation/components/components.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  var nameController = TextEditingController();
  var dateController = TextEditingController();
  var phoneController = TextEditingController();
  var idController = TextEditingController();
  bool isLoading = false;
  static UserCubit get(context) => BlocProvider.of<UserCubit>(context);

  // create firebase document with user details
  Future createUserDetails(
    BuildContext context,
  ) async {
    isLoading = true;
    emit(UserLoading());
    try {
      var docUser =
          FirebaseFirestore.instance.collection('users').doc(idController.text);

      var newUser = userModel.User(
        id: idController.text,
        name: nameController.text,
        phone: phoneController.text,
        dateOfBirth: dateController.text,
      );
      var json = newUser.toJson();
      await docUser.set(json);
      // clean controllers
      nameController.clear();
      dateController.clear();
      phoneController.clear();
      idController.clear();
      emit(UserSuccess());
      isLoading = false;
    } catch (e) {
      emit(UserFailure());
      isLoading = false;
    }
  }
}
