import 'dart:async';

import 'package:axnol_project/core/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  static Future<XFile?> pickImageFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      return pickedImage;
    } else {
      Future.sync(
        () => SnackBarUtils.showMessage("No Image picked"),
      );
      return null;
    }
  }

  static Future<XFile?> pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return pickedImage;
    } else {
      Future.sync(
        () => SnackBarUtils.showMessage("No Image picked"),
      );
      return null;
    }
  }

  static Future<XFile?> showDialogueForImagePicker(
    BuildContext context, [
    bool showDeleteOption = false,
  ]) async {
    final imageCompleter = Completer<XFile?>();
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Consumer(
            builder: (context, ref, child) {
              return Column(
                children: [
                  TextButton(
                      onPressed: () async {
                        imageCompleter.complete(
                            await ImagePickerUtils.pickImageFromCamera(
                                context));
                        Future.sync(() => Navigator.pop(context));
                      },
                      child: const Text('Camera',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black,
                          ))),
                  TextButton(
                      onPressed: () async {
                        imageCompleter.complete(
                          await ImagePickerUtils.pickImageFromGallery(context),
                        );
                        Future.sync(() => Navigator.pop(context));
                      },
                      child: const Text('Gallery',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black,
                          ))),

                  /// Show the delete option if required
                  if (showDeleteOption)
                    TextButton(
                      onPressed: () async {
                        /// An empty path is given to remove the selected image
                        imageCompleter.complete(
                          XFile(''),
                        );
                        Future.sync(() => Navigator.pop(context));
                      },
                      child: const Text('Delete',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black,
                          )),
                    ),
                ],
              );
            },
          ),
        );
      },
    );

    final imageSelected = await (imageCompleter.future);
    return imageSelected;
  }
}
