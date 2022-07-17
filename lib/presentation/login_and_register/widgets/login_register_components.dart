import 'package:secure/presentation/components/components.dart';
import 'package:flutter/material.dart';

class UserField extends StatelessWidget {
  const UserField({Key? key, this.onChanged, this.label}) : super(key: key);
  final void Function(String)? onChanged;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return defaultFormField(
      validate: label == 'name'
          ? (value) {
              if (value == '') {
                return 'Please enter your name';
              }
              return 'Please enter your name';
            }
          : (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              } else if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
      onChange: onChanged,
      controller: TextEditingController(),
      type: TextInputType.emailAddress,
      label: label ?? 'Email',
      prefix: Icons.person,
    );
  }
}

// ignore: must_be_immutable
class LoginButton extends StatelessWidget {
  LoginButton({Key? key, required this.label, this.onPressed})
      : super(key: key);
  String? label;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label ?? 'Login'),
    );
  }
}

// ignore: must_be_immutable
class PasswordField extends StatelessWidget {
  PasswordField(
      {Key? key, required this.label, this.onChanged, this.matchPassword})
      : super(key: key);
  String label;
  String? matchPassword;
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return defaultFormField(
      validate: (value) {
        if (value!.isEmpty) {
          return 'Please enter a password';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      onChange: onChanged,
      isPassword: true,
      controller: TextEditingController(),
      type: TextInputType.emailAddress,
      label: label,
      prefix: Icons.shield,
    );
  }
}
