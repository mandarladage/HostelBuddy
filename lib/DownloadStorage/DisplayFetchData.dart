import 'package:flutter/material.dart';
import 'package:my_mega_project/DownloadStorage/FirebaseFile.dart';
import 'package:my_mega_project/DownloadStorage/ImagePage.dart';
import 'package:my_mega_project/fortest/FirebaseApi.dart';

class DisplayFetchData extends StatefulWidget {
  @override
  _DisplayFetchDataState createState() => _DisplayFetchDataState();
}

class _DisplayFetchDataState extends State<DisplayFetchData> {
  late Future<List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    futureFiles = FirebaseApi.listAll('files/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyApp'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<FirebaseFile>>(
        future: futureFiles,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text('An Error occured while fetching Data!!!'),
                );
              } else {
                final files = snapshot.data!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeader(0),
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: files.length,
                        itemBuilder: (context, index) {
                          final file = files[index];

                          return buildFile(context, file);
                        },
                      ),
                    ),
                  ],
                );
              }
          }
        },
      ),
    );
  }
}

Widget buildFile(BuildContext context, FirebaseFile file) {
  return ListTile(
    leading: ClipOval(
      child: Image.network(
        file.url,
        width: 52,
        height: 52,
        fit: BoxFit.cover,
      ),
    ),
    title: Text(
      file.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        color: Colors.indigo,
      ),
    ),
    onTap: () => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ImagePage(file))),
  );
}

Widget buildHeader(int length) => ListTile(
      tileColor: Colors.blue,
      leading: Container(
        width: 52,
        height: 52,
        child: Icon(
          Icons.file_copy,
          color: Colors.white,
        ),
      ),
      title: Text(
        '$length Files',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
