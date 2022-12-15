
import 'dart:io';

import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:jss_flutter/components/apiservice.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';


class PdfViewerPage extends StatefulWidget {
  final File file;
  final String url;

  const PdfViewerPage({
    Key? key,
    required this.file,
    required this.url,
  }) : super(key: key);

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
   String? localPath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ApiServiceProvider.loadPDF(widget.url).then((value) {
      setState(() {
        localPath = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          IconButton(
            onPressed: () async {
             bool? save= await saveFile(widget.url,  url.split('/').last);
             if(save==true)
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'successfully saved to internal storage "Download" folder',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
             else
               ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(
                   content: Text(
                     'Unable to download',
                     style: TextStyle(color: Colors.white),
                   ),
                 ),
               );
            },
            icon: const Icon(Icons.download_rounded),
          ),
        ],
      ),
      body:  localPath != null
          ? PDFView(
        filePath: localPath,
      )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Future<bool?> saveFile(String url, String fileName) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,

    ].request();

    if(statuses[Permission.storage]!.isGranted){
      var dir = await DownloadsPathProvider.downloadsDirectory;
      if(dir != null){
        String savename = url.split('/').last;
        String savePath = dir.path + "/$savename";
        print(savePath);
        try {
          await Dio().download(
              url,
              savePath,
              onReceiveProgress: (received, total) {
                if (total != -1) {
                  print((received / total * 100).toStringAsFixed(0) + "%");
                  //you can build progressbar feature too
                }
              });
          print("File is saved to download folder.");
          return true;
        } on DioError catch (e) {
          print(e.message);
          return false;
        }
      }
    }else{
      print("No permission to read and write.");
      return false;
    }
    // try {
    //   if (await _requestPermission(Permission.storage)) {
    //     Directory? directory;
    //     directory = await getExternalStorageDirectory();
    //     String newPath = "";
    //     List<String> paths = directory!.path.split("/");
    //     for (int x = 1; x < paths.length; x++) {
    //       String folder = paths[x];
    //       if (folder != "Android") {
    //         newPath += "/"+folder;
    //       } else {
    //         break;
    //       }
    //     }
    //     newPath = newPath + "/PDF_Download";
    //     directory = Directory(newPath);
    //
    //     File saveFile = File(directory.path + "/$fileName");
    //     if (kDebugMode) {
    //       print(saveFile.path);
    //     }
    //     if (!await directory.exists()) {
    //       await directory.create(recursive: true);
    //     }
    //     if (await directory.exists()) {
    //       await Dio().download(
    //         url,
    //         saveFile.path,
    //       );
    //     }
    //   }
    //   return true;
    // } catch (e) {
    //   return false;
    // }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }
}
