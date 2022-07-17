import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure/constants.dart';
import 'package:secure/models/message.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  TextEditingController messageController = TextEditingController();
  String? email;
  List<Message> messagesList = [];
  static ChatCubit get(context) => BlocProvider.of<ChatCubit>(context);

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollection);

  Future getMessages() async {
    var messages =
        await this.messages.orderBy('createdAt', descending: true).get();
    messagesList =
        messages.docs.map((doc) => Message.fromJson(doc.data())).toList();
    emit(ChatLoaded(messages: messagesList));
  }

  void emailChanged() {
    email = FirebaseAuth.instance.currentUser!.email;
    emit(SaveEmailState());
  }
}
