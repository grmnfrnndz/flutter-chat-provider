import 'package:flutter/material.dart';


class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;


  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode(); 


    final outlineInputBorder = UnderlineInputBorder(
       borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(5)
    );

    final inputDecoration = InputDecoration(
          hintText: 'end your message with a "?"',
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          filled: true,
          suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined), 
          onPressed: () {
            // get value of textFormField
            final textValue = textController.value.text;
            onValue(textValue);
            textController.clear();
          }
        ),
      );

    return TextFormField(
      keyboardType: TextInputType.text,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        // full word
        textController.clear();
        focusNode.requestFocus();
        onValue(value);

      },
      // onChanged: (value) {
      //     // only character press
      // },
    );
  }
}