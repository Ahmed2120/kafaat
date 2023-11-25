// import 'dart:io';
//
// import 'package:kafaat/core/core_exports.dart';
// import 'package:multi_image_picker/multi_image_picker.dart';
// import 'package:path_provider/path_provider.dart';
//
// Future<List<File>> pickImages(BuildContext context) async {
//   List<File> resultList = [];
//
//   try {
//     List<Asset> selectedAssets = await MultiImagePicker.pickImages(
//       maxImages: 5,
//       enableCamera: true,
//       selectedAssets: [],
//       cupertinoOptions: const CupertinoOptions(takePhotoIcon: 'chat'),
//       materialOptions: const MaterialOptions(
//         actionBarColor: '#abcdef',
//         actionBarTitle: 'Select Images',
//         allViewTitle: 'All Photos',
//         useDetailsView: false,
//         selectCircleStrokeColor: '#000000',
//       ),
//     );
//
//     for (Asset asset in selectedAssets) {
//       File file = await convertAssetToFile(asset);
//       resultList.add(file);
//     }
//   } on Exception catch (e) {
//     print(e);
//   }
//
//   return resultList;
// }
//
//
// Future<void> showImagePickerDialog(BuildContext context) async {
//   List<File> selectedImages = await pickImages(context);
//
//   if (selectedImages.isNotEmpty) {
//     for (File imageFile in selectedImages) {
//       // Use imageFile for display or further processing
//       print('Selected Image: ${imageFile.path}');
//     }
//   }
// }
//
// Future<File> convertAssetToFile(Asset asset) async {
//   final byteData = await asset.getByteData();
//   final tempFile = File('${(await getTemporaryDirectory()).path}/${asset.name}');
//   await tempFile.writeAsBytes(byteData.buffer.asUint8List());
//   return tempFile;
// }