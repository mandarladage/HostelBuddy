import 'package:flutter/material.dart';
import 'package:my_mega_project/DownloadStorage/FirebaseFile.dart';
import 'package:my_mega_project/fortest/FirebaseApi.dart';

class ImagePage extends StatelessWidget {
  final FirebaseFile file;

  ImagePage(this.file);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(file.name),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseApi.downloadFile(file.ref);

                final snackBar = SnackBar(
                  content: Text('Downloaded ${file.name}'),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: Icon(Icons.file_download)),
          const SizedBox(width: 12),
        ],
      ),
      body: Image.network(
        file.url,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
