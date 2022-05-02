import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_mega_project/DownloadStorage/SubListView.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;

class UploadImageToStorage extends StatefulWidget {
  // final String? refParentName;
  // final String? parentName;
  // final String? parentEmail;
  //
  // const UploadImageToStorage(
  //     this.refParentName, this.parentName, this.parentEmail);

  @override
  _UploadImageToStorageState createState() => _UploadImageToStorageState();
}

FirebaseStorage storage = FirebaseStorage.instance;

Future<void> _upload(String inputSource) async {
  final picker = ImagePicker();
  XFile? pickedImage;
  try {
    pickedImage = await picker.pickImage(
        source:
            inputSource == 'camera' ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 1920);

    final String fileName = path.basename(pickedImage!.path);
    File imageFile = File(pickedImage.path);

    try {
      // Uploading the selected image with some custom meta data
      await storage.ref('Hostel/h_profile/' + 'basename').putFile(
          imageFile,
          SettableMetadata(customMetadata: {
            'hostelName': 'Tranquillia',
            'uploaded_by': 'A bad guy',
            'description': 'Some description...'
          }));

      // Refresh the UI
      setState() {}
      ;
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  } catch (err) {
    if (kDebugMode) {
      print(err);
    }
  }
}

class _UploadImageToStorageState extends State<UploadImageToStorage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hostel Buddy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        _upload('camera');
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => SubListView()),
                            (Route<dynamic> route) => false);
                      },
                      icon: const Icon(Icons.camera),
                      label: const Text('camera')),
                  ElevatedButton.icon(
                      onPressed: () => _upload('gallery'),
                      icon: const Icon(Icons.library_add),
                      label: const Text('Gallery')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
