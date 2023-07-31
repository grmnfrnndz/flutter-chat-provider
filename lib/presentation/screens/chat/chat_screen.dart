import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yes_no_app/presentation/providers/providers.dart';
import 'package:yes_no_app/domain/entities/entities.dart';
import 'package:yes_no_app/presentation/widgets/widgets.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(3.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://imagenpng.com/wp-content/uploads/2015/03/Imagen-Lapiz-PNG-DIbujo-1.png'),
            ),
          ),
          title: const Text('Chat Preview'),
          centerTitle: false,
        ),
        body: _ChatView(),
      );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    final chatProvider = context.watch<ChatProvider>();
    final messages = chatProvider.messages;


    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messages[index];

              return (message.fromwho == FromWho.mine) ? MyMessageBubble(message: message,): HerMessageBubble(message: message,);
            })
              ),

            //  box text
            MessageFieldBox(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}