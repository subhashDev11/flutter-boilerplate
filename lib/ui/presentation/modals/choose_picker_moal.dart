import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

Future<ImageSource?> showChoosePickerModal(BuildContext context) async {
  ImageSource? source;
  await showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return CupertinoActionSheet(
        title: const Text('Pick Image From'),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            source = null;
            Navigator.of(context).pop();
          },
          isDefaultAction: true,
          isDestructiveAction: true,
          child: const Text('Cancel'),
        ),
       actions: [
         CupertinoActionSheetAction(
           onPressed: () {
             source = ImageSource.camera;
             Navigator.of(context).pop();
           },
           isDefaultAction: false,
           child: const Text('Camera'),
         ),
         CupertinoActionSheetAction(
           onPressed: () {
             source = ImageSource.gallery;
             Navigator.of(context).pop();
           },
           isDefaultAction: true,
           child: const Text('Photos'),
         ),
       ],
      );
    },
  );
  return source;
}
