import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ImagePickerWidget extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onImagePickerTapped;

  const ImagePickerWidget({
    required this.imageFile,
    required this.onImagePickerTapped,
    Key? key,
  }) : super(key: key);

  Widget renderEmptyBorderImagePart() => DottedBorder(
        color: Colors.grey.shade400,
        dashPattern: const [4],
        strokeWidth: 3,
        borderType: BorderType.RRect,
        child: SizedBox(
          height: 200,
          child: Center(
            child: Icon(
              Icons.image,
              size: 150,
              color: Colors.grey.shade400,
            ),
          ),
        ),
      );

  Widget renderChangeImage() => Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(4),
        clipBehavior: Clip.antiAlias,
        child: Center(
          child: AspectRatio(
            aspectRatio: 4 / 4,
            child: Image.file(
              imageFile!,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onImagePickerTapped,
        child: imageFile == null
            ? renderEmptyBorderImagePart()
            : renderChangeImage(),
      );
}
