import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatefulWidget {
  final void Function(String) onSearchValueChanged;

  const SearchBar({
    required this.onSearchValueChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchTextController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) => TextField(
        onChanged: widget.onSearchValueChanged,
        controller: searchTextController,
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: BorderSide.none,
          ),
          hintText: 'Search the device code',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: searchTextController.text.isEmpty
              ? const SizedBox(width: 0)
              : IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: searchTextController.clear,
                ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
      );
}
