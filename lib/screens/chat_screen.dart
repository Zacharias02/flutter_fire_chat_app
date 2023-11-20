import 'package:flutter/material.dart';
import 'package:flutter_fire_chat_app/helpers/firebase_repository.dart';
import 'package:flutter_fire_chat_app/widgets/chat_listing.dart';
import 'package:flutter_fire_chat_app/widgets/chat_textfield.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final FirebaseRepository _repo = FirebaseRepository();

  final TextEditingController _messageCtrl = TextEditingController();

  Future<void> _onSignOut() async {
    // TODO (9): Implement sign out.
  }

  void _onSend() {
    // TODO (10): Implement sending of message.
  }
  @override
  Widget build(BuildContext context) {
    //TODO (11): Design your chats screen.
    return const Scaffold(
      body: Center(child: Placeholder()),
    );
  }
}
