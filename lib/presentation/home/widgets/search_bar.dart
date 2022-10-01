import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  final void Function(String) onSearchValueChanged;

  const SearchBar({
    required this.onSearchValueChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextField(
        onChanged: onSearchValueChanged,
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: BorderSide.none,
          ),
          hintText: 'Search the device code',
          prefixIcon: const Icon(Icons.search),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
      );
}
