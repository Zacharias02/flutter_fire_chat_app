import 'package:flutter/material.dart';

class ChatItemTile extends StatelessWidget {
  const ChatItemTile({
    super.key,
    required this.fullName,
    this.message,
    required this.createdAt,
    this.forReceiver = false,
  });

  const ChatItemTile.forReceiver({
    Key? key,
    required this.fullName,
    this.message,
    required this.createdAt,
    this.forReceiver = true,
  }) : super(key: key);

  final String fullName;
  final String? message;
  final DateTime createdAt;

  final bool forReceiver;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: (forReceiver) ? Alignment.bottomLeft : Alignment.bottomRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            (forReceiver)
                ? CircleAvatar(
                    child: Text(fullName[0].toUpperCase()),
                  )
                : const SizedBox.shrink(),
            if (forReceiver) const SizedBox(width: 15.0),
            Container(
              constraints: const BoxConstraints(maxWidth: 300),
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: forReceiver ? Colors.grey : Colors.blue,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (forReceiver)
                    Text(
                      fullName,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  if (forReceiver) const SizedBox(height: 8.0),
                  SelectableText(
                    message!,
                    style: const TextStyle(
                        fontSize: 16, overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
