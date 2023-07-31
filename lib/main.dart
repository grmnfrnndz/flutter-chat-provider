import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yes_no_app/presentation/providers/providers.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/screens/screens.dart';

void main() => runApp(const StateApp());


class StateApp extends StatelessWidget {
  const StateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => ChatProvider(),),
      ],
      child: const MyApp());
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const ChatScreen(),
      theme: AppTheme(selectedColor: 1).theme()
    );
  }
}