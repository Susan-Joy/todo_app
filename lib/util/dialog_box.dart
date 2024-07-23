// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:to/util/my_button.dart';


class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key, required this.controller,required this.onSave,required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.pink[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "new",
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            MyButton(text: "Save", onPressed: onSave),
            const SizedBox(width: 8),
             MyButton(text: "Cancel", onPressed: onCancel),
          ],
          ),
        ],
        ),
      ),
    );
  }
}
