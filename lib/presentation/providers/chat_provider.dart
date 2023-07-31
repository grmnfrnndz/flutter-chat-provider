import 'package:flutter/material.dart';

import 'package:yes_no_app/config/helpers/helpers.dart';
import 'package:yes_no_app/domain/entities/entities.dart';


class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer  = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: 'Hi Hitomi', fromwho: FromWho.mine),
    Message(text: 'working?', fromwho: FromWho.mine),
  ];

  Future<void> sendMessage(String message) async {
    if (message.isEmpty) return;

    final newMessage = Message(text: message, fromwho: FromWho.mine);
    messages.add(newMessage);

    if(message.endsWith('?')) {
      herReply();
    }

    notifyListeners();    
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {

    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 350), 
      curve: Curves.bounceInOut);
  }
}
