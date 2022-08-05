import 'package:secure/Bloc/chat_cubit/cubit/chat_cubit.dart';
import 'package:secure/Bloc/login_cubit/login_cubit.dart';
import 'package:secure/presentation/components/components.dart';
import 'package:secure/presentation/login_and_register/widgets/app_logo.dart';
import 'package:secure/presentation/login_and_register/widgets/login_register_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);
  static String id = 'LoginPage';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var loginCubit = LoginCubit.get(context);
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {},
              builder: (context, state) {
                return BlocConsumer<ChatCubit, ChatState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          const AppLogo(),
                          const SizedBox(
                            height: 60,
                          ),
                          UserField(
                            onChanged: (value) => loginCubit.email = value,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PasswordField(
                            label: 'Password',
                            onChanged: (value) {
                              loginCubit.password = value;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          loginCubit.isLoading == true
                              ? const Center(child: CircularProgressIndicator())
                              : LoginButton(
                                  label: 'Login',
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      loginCubit
                                          .loginWithEmailAndPassword(context);

                                      showSnackBar(context, 'Success', true);
                                    }
                                  },
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text('If you don\'t have an Account:',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'RegisterPage');
                                },
                                child: const Text('Sign Up',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
