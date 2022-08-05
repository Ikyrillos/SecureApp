import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure/Bloc/register_cubit/register_cubit.dart';
import 'package:secure/presentation/components/components.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:secure/presentation/login_and_register/user_details_screen.dart';
import 'package:secure/presentation/login_and_register/widgets/app_logo.dart';

import 'widgets/login_register_components.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({
    Key? key,
  }) : super(key: key);

  static String id = 'RegisterPage';
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var registerCubit = RegisterCubit.get(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 160,
                  ),
                  const AppLogo(),
                  const SizedBox(
                    height: 60,
                  ),
                  UserField(
                    onChanged: (value) => registerCubit.email = value,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PasswordField(
                    label: 'Password',
                    onChanged: (value) {
                      registerCubit.password = value;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PasswordField(
                      matchPassword: 'password confirmation is incorrect',
                      label: 'Confirm password',
                      onChanged: (value) {
                        registerCubit.passwordConfirm = value;
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginButton(
                      label: 'Next',
                      onPressed: () async {
                        if (registerCubit.password !=
                            registerCubit.passwordConfirm) {
                          // showSnackBar(
                          //     context, 'Passwords do not match', false);
                        } else {
                          if (formKey.currentState!.validate()) {
                            try {
                              registerCubit.registerUserWithPassword(context,
                                  registerCubit.email, registerCubit.password);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return UserDetails(
                                  userId: registerCubit.email,
                                );
                              }));
                            } catch (e) {
                              if (kDebugMode) {
                                print(e);
                              }
                            }
                          }
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
