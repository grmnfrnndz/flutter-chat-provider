// entities - only pure code dart

enum FromWho {
  mine, hers
}

class Message {

  final String text;
  final String? url;
  final FromWho fromwho;

  Message(
   {
    required this.text, 
    this.url, 
    required this.fromwho
  });

}



