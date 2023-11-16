import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog extends StatelessWidget {
  final ValueChanged<XFile?> onImageReceived;

  const ImagePickerDialog({
    Key? key,
    required this.onImageReceived,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: imagePickerList(context)
              .map((e) => TextButton(
                  onPressed: () => imagePickerList(context).indexOf(e) == 0
                      ? getImagePath(ImageSource.camera)
                      : getImagePath(ImageSource.gallery),
                  style: const ButtonStyle(alignment: Alignment.centerRight),
                  child: Text(
                    e,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  )))
              .toList(),
        ),
      ),
    );
  }

  void getImagePath(ImageSource source) async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: source);
    onImageReceived(file);
  }

  List<String> imagePickerList(BuildContext ctx) => ['Camera', 'Gallery'];
}
