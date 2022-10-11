import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeviceInfoTextFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const DeviceInfoTextFieldWidget({
    required this.label,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
          label: Wrap(
            children: [
              const Text('*', style: TextStyle(color: Colors.red)),
              const Padding(padding: EdgeInsets.all(2)),
              Text(label),
            ],
          ),
        ),
      );
}
