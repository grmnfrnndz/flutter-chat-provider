import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';



class HerMessageBubble extends StatelessWidget {

  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: const TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(height: 5,),

        _ImageBubble(message: message,),

        const SizedBox(height: 5,),
      ],
    );
  }
}



class _ImageBubble extends StatelessWidget {

  final Message message;
  
  const _ImageBubble({required this.message});

  @override
  Widget build(BuildContext context) {

      final size = MediaQuery.of(context).size;

      return ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.network(message.url!,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgess) {

            // imagen loaded
            if (loadingProgess == null) return child;

            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Sending img'),
            );


          },
        ));
  }
}