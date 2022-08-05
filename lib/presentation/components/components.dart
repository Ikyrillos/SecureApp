import 'package:another_flushbar/flushbar.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:secure/constants.dart';
import 'package:flutter/material.dart';
import 'package:secure/models/menu_item.dart';
import 'package:secure/models/message.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  // Function? onSubmit,
  void Function(String)? onChange,
  String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  bool isPassword = false,
  IconData? suffix,
  Function? suffixPressed,
  String? hint,
  onTap,
  // bool enabled = true,
  bool readOnly = false,
}) =>
    TextFormField(
      cursorRadius: const Radius.circular(10.0),
      // validator: (s) {
      //   validate(s);
      // },
      validator: validate,
      textInputAction: TextInputAction.next,
      readOnly: readOnly,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      // onFieldSubmitted: (S) {
      //   onSubmit!(S);
      // },
      
      onChanged: onChange,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: () {
                  suffixPressed!();
                },
              )
            : null,
      ),
    );

// widget that show a snackbar
showSnackBar(BuildContext context, String message, bool? success) {
  var successColor = Colors.green;
  return Get.snackbar(
    "Feedback",
    message,
    duration: const Duration(milliseconds: 1000),
    backgroundColor: success == true ? successColor : Colors.red,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 0,
    borderWidth: 2,
    barBlur: 0,
  );
}

PopupMenuItem<CustomMenuItem> buildItem(CustomMenuItem e) {
  return PopupMenuItem<CustomMenuItem>(
    value: e,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(e.icon, color: Colors.black),
        const SizedBox(width: 5),
        Text(e.title.toString()),
      ],
    ),
    onTap: () {
      e.onTap!();
    },
  );
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.message,
  }) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 30, top: 16, bottom: 16, right: 30),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: SelectableText(
          message.message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class RChatBubble extends StatelessWidget {
  const RChatBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:
            const EdgeInsets.only(left: 30, top: 16, bottom: 16, right: 30),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Color(0xff006D84),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
