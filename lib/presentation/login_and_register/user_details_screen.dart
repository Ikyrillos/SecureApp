import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:secure/Bloc/chat_cubit/user_details_cubit/cubit/user_cubit_cubit.dart';
import 'package:secure/Bloc/chat_cubit/user_details_cubit/cubit/user_cubit_state.dart';
import 'package:secure/models/user_model.dart';
import 'package:secure/presentation/components/components.dart';
import 'package:secure/presentation/login_and_register/login_screen.dart';
import 'package:secure/presentation/login_and_register/widgets/app_logo.dart';
import 'package:secure/presentation/login_and_register/widgets/login_register_components.dart';

class UserDetails extends StatelessWidget {
  UserDetails({Key? key, this.userId}) : super(key: key);
  static String id = 'user_details';
  final String? userId;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var userCubit = UserCubit.get(context);
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  const AppLogo(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: defaultFormField(
                      controller: userCubit.nameController,
                      type: TextInputType.name,
                      label: 'Name',
                      validate: (p0) {
                        return p0!.isEmpty ? 'Please enter your name' : null;
                      },
                      prefix: Icons.text_fields,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: defaultFormField(
                      controller: userCubit.phoneController,
                      type: TextInputType.phone,
                      label: 'Phone',
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      prefix: Icons.phone,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: defaultFormField(
                        controller: userCubit.dateController,
                        type: TextInputType.datetime,
                        label: 'Date of birth',
                        prefix: Icons.date_range,
                        hint: 'dd/mm/yyyy',
                        validate: (p0) {
                          if (p0!.isEmpty) {
                            return 'Please enter your date of birth';
                          }
                          return null;
                        },
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2050),
                          ).then((value) => userCubit.dateController.text =
                              DateFormat('dd/MM/yyyy').format(value!));
                        },
                        readOnly: true),
                  ),
                  userCubit.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              userCubit.idController.text = userId!;
                              userCubit
                                  .createUserDetails(context)
                                  .then((value) {
                                showSnackBar(
                                    context, 'Successfully registered', true);
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginForm()),
                                    (route) => false);
                              }).catchError((error) => showSnackBar(
                                      context, error.toString(), false));
                            }
                          },
                          child: const Text('Create account'),
                        ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
