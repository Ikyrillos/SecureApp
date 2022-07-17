import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:secure/Bloc/chat_cubit/cubit/chat_cubit.dart';
import 'package:secure/Bloc/login_cubit/login_cubit.dart';
import 'package:secure/Bloc/register_cubit/register_cubit.dart';
import 'package:secure/presentation/chat/chat_page.dart';
import 'package:secure/presentation/login_and_register/login_screen.dart';
import 'package:secure/presentation/login_and_register/register_screen.dart';
import 'package:secure/presentation/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child: BlocProvider(
          create: (BuildContext context) => RegisterCubit(),
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              return GetMaterialApp(
                routes: {
                  LoginForm.id: (context) => LoginForm(),
                  RegisterForm.id: (context) => RegisterForm(),
                  WelcomePage.id: (context) => const WelcomePage(),
                  ChatPage.id: (context) => ChatPage(),
                },
                home: const WelcomePage(),
              );
            },
          ),
        ),
      ),
    );
  }
}
