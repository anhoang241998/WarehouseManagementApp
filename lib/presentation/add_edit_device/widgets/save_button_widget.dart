import 'package:flutter/material.dart';

class SaveButtonWidget extends StatelessWidget {
  final VoidCallback saveButtonTapped;

  const SaveButtonWidget({
    required this.saveButtonTapped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: saveButtonTapped,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.infinity, 40),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.save),
            SizedBox(width: 10),
            Text('Save'),
          ],
        ),
      );
}
