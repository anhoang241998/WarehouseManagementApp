import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownWidget extends StatelessWidget {
  final String dropDownLabel;
  final List<String> values;
  final String selectedValue;
  final bool isDropDownRequired;
  final void Function(String value) onDropDownChangeValue;

  const DropDownWidget({
    required this.dropDownLabel,
    required this.values,
    required this.selectedValue,
    required this.isDropDownRequired,
    required this.onDropDownChangeValue,
    Key? key,
  }) : super(key: key);

  DropdownMenuItem buildMenuItems(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 200,
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
            label: Wrap(
              children: [
                Text(
                  isDropDownRequired ? '*' : '',
                  style: const TextStyle(color: Colors.red),
                ),
                Padding(padding: EdgeInsets.all(isDropDownRequired ? 2 : 0)),
                Text(dropDownLabel),
              ],
            ),
          ),
          value: selectedValue,
          isExpanded: true,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 15.sp,
          ),
          items: values.map(buildMenuItems).toList(),
          onChanged: (value) => onDropDownChangeValue(value as String),
        ),
      );
}
