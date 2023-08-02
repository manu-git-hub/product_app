import 'package:flutter/cupertino.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onOkPressed;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onOkPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context);
            // onOkPressed();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
