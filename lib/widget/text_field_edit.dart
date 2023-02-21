import 'package:flutter/material.dart';

class TextFieldEdit extends StatelessWidget {
  final String? hint;
  final TextEditingController? textEditController;
  const TextFieldEdit({super.key, this.hint, this.textEditController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: textEditController,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
