import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onOkPressed;

  const CustomAlertDialog({super.key, 
    required this.title,
    required this.content,
    required this.onOkPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onOkPressed();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
