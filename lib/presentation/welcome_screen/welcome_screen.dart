import 'package:secure/Bloc/login_cubit/login_cubit.dart';
import 'package:secure/presentation/chat/chat_page.dart';
import 'package:secure/presentation/login_and_register/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  static const String id = 'WelcomePage';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (state is LoginLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (snapshot.hasData) {
                  if (state is LoginLoading) {
                    LoginCubit.get(context).isLoading = true;
                  } else if (state is LoginSuccess) {
                    LoginCubit.get(context).isLoading = false;
                  }
                  // ignore: unrelated_type_equality_checks
                  return  ChatPage();
                } else {
                  return LoginForm();
                }
              }),
        );
      },
    );
  }
}
