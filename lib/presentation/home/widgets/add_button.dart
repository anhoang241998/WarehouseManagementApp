import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final VoidCallback setOnTapListener;

  const AddButton({required this.setOnTapListener, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 16, 16),
        child: FloatingActionButton(
          onPressed: setOnTapListener,
          child: const Icon(Icons.add),
        ),
      );
}
