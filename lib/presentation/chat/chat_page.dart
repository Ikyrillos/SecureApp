import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure/Bloc/chat_cubit/cubit/chat_cubit.dart';
import 'package:secure/constants.dart';
import 'package:secure/models/menu_item.dart';
import 'package:secure/models/menu_items.dart';
import 'package:secure/presentation/components/components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  final ScrollController listController = ScrollController();
  static const String id = 'ChatPage';
  String _onSubmittedValue = '';

  void scrollTOBottom() {
    listController.animateTo(
      listController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    var userEmail = FirebaseAuth.instance.currentUser!.email;
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ChatCubit.get(context);
        cubit.getMessages();
        return StreamBuilder<QuerySnapshot>(
            stream: cubit.messages.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: kPrimaryColor,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          FontAwesomeIcons.shield,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Secure',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    centerTitle: true,
                    actions: [
                      PopupMenuButton<CustomMenuItem>(
                        itemBuilder: (context) => [
                          ...MenuItems.items.map(buildItem).toList(),
                          const PopupMenuDivider(),
                          ...MenuItems.items2.map(buildItem).toList(),
                        ],
                      ),
                    ],
                  ),
                  body: Column(children: [
                    Expanded(
                      child: ListView.builder(
                          reverse: true,
                          controller: listController,
                          itemCount: cubit.messagesList.length,
                          itemBuilder: (context, index) {
                            cubit.emailChanged();
                            return cubit.messagesList[index].id == cubit.email
                                ? ChatBubble(
                                    message: cubit.messagesList[index],
                                  )
                                : RChatBubble(
                                    message: cubit.messagesList[index]);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: cubit.messageController,
                        onSubmitted: (value) {
                          cubit.messages.add({
                            'message': value,
                            'createdAt': DateTime.now(),
                            'id': cubit.email,
                          }).catchError((e) {
                            debugPrint(e);
                          });
                          cubit.messageController.clear();
                          listController.animateTo(
                            0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn,
                          );
                        },
                        onChanged: (val) {
                          _onSubmittedValue = val;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            hintText: 'Type a message',
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.send,
                                color: kPrimaryColor,
                              ),
                              onPressed: () {
                                cubit.messages.add({
                                  'message': _onSubmittedValue,
                                  'createdAt': DateTime.now(),
                                  'id': cubit.email,
                                }).catchError((e) {
                                  debugPrint(e);
                                });
                                cubit.messageController.clear();
                                listController.animateTo(
                                  0,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.fastOutSlowIn,
                                );
                              },
                            )),
                      ),
                    ),
                  ]),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            });
      },
    );
  }
}
