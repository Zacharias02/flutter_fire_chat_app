import 'package:flutter/material.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({
    super.key,
    required this.controller,
    required this.onSend,
  });

  final TextEditingController controller;
  final VoidCallback onSend;

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  bool _enableSending = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: 'Please enter your message here...',
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.send,
            color: (_enableSending) ? Colors.blue : Colors.grey,
          ),
          onPressed: (_enableSending) ? widget.onSend : null,
        ),
      ),
      onEditingComplete: (_enableSending) ? widget.onSend : null,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            _enableSending = true;
          });
        } else {
          setState(() {
            _enableSending = false;
          });
        }
      },
    );
  }
}
