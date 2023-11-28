
import 'package:flutter/material.dart';

class ConversationPage extends StatefulWidget {
  static const routeName = 'ConversationPage';

  const ConversationPage({super.key});

  @override
  ConversationPageState createState() => ConversationPageState();
}

class ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}