import 'dart:io';

// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'keys.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class FileService {
  static String _extStorage = "";

  static Map<String, Future Function()> downloadTasks = {};

  static Future<List<String>> ensureReady() async {
    await _createFolder(path_main);

    return <String>[
      await _createFolder(path_invoice),
    ];
  }

  static Future<String> _createFolder(String filePath) async {
    Directory? baseDir;
    String path = await getBaseFilePath();
    if (path.isNotEmpty) {
      baseDir = Directory('$path/$filePath');
    }
    // if (Platform.isAndroid) {
    //   if (await _requestPermission(Permission.storage)) {
    //     baseDir = await getExternalStorageDirectory();
    //     String newPath = '';
    //     List<String> folders = baseDir!.path.split('/');
    //     for (int i = 1; i < folders.length; i++) {
    //       String folder = folders[i];
    //       if (folder != 'Android') {
    //         newPath += "/$folder";
    //       } else {
    //         break;
    //       }
    //     }
    //     newPath = '$newPath/$filePath';
    //     baseDir = Directory(newPath);
    //   }
    // } else {
    //   if (await _requestPermission(Permission.photos)) {
    //     baseDir = await getTemporaryDirectory();
    //   }
    // }
    if (baseDir == null) {
      throw Exception('Base directory is null.');
    }
    try {
      await baseDir.create(recursive: true);
    } catch (e) {
      print('in catch $e');
    }
    return baseDir.path;
  }

  static Future<String> getBaseFilePath() async {
    Directory? baseDir;
    if (Platform.isAndroid) {
      final deviceInfo = await DeviceInfoPlugin().androidInfo;
      if (deviceInfo.version.sdkInt > 32) {
        if (await _requestPermission(Permission.photos)) {
          baseDir = await getExternalStorageDirectory();
          String newPath = '';
          List<String> folders = baseDir!.path.split('/');
          for (int i = 1; i < folders.length; i++) {
            String folder = folders[i];
            if (folder != 'Android') {
              newPath += "/$folder";
            } else {
              break;
            }
          }
          return newPath;
        }
      } else {
        if (await _requestPermission(Permission.storage)) {
          baseDir = await getExternalStorageDirectory();
          String newPath = '';
          List<String> folders = baseDir!.path.split('/');
          for (int i = 1; i < folders.length; i++) {
            String folder = folders[i];
            if (folder != 'Android') {
              newPath += "/$folder";
            } else {
              break;
            }
          }
          return newPath;
        }
      }
    } else {
      if (await _requestPermission(Permission.photos)) {
        baseDir = await getTemporaryDirectory();
        return baseDir.path;
      }
    }
    return '';
  }

  static changeImageFileName(String filename) {
    int timeStamp = DateTime.now().millisecondsSinceEpoch;
    var splits = filename.split('.');
    return 'IMG-$timeStamp.${splits.last}';
  }

  static _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  static Future<String> createFolder(String cow) async {
    if (_extStorage == "") {
      if (Platform.isAndroid) {
        Directory? extStorage = await getExternalStorageDirectory();
        print(
            "***********************${extStorage!.path}***************************");
        _extStorage = extStorage.path.split('Android')[0];
      } else {
        _extStorage = (await getApplicationDocumentsDirectory()).path;
      }
    }

    final folderName = cow;
    final path = Directory("path $_extStorage$folderName");
    if ((await path.exists())) {
      return path.path;
    } else {
      var status = await Permission.storage.request();
      if (status != PermissionStatus.granted) {
        Get.snackbar('Permission Error', 'Please allow storage permission!');
        return '';
      }

      try {
        await path.create();
      } catch (e) {
        if (Platform.isAndroid) {
          print('in cache $e');
          _extStorage = (await getExternalStorageDirectory())!.path;
          //var d = _extStorage.split('data');
          //_extStorage = "${d[0]}media${Platform.pathSeparator}${d[1].split(Platform.pathSeparator)[1]}${Platform.pathSeparator}";
          //await requestScopedStorage("${_extStorage}Talkmia");
          print(_extStorage);
          return await createFolder(cow);
        } else {
          rethrow;
        }
      }
      return path.path;
    }
  }

  static Future<File> moveFile(File sourceFile, String newPath) async {
    var fileName = sourceFile.path.split(Platform.pathSeparator).last;
    newPath = "$newPath${Platform.pathSeparator}$fileName";
    try {
      // prefer using rename as it is probably faster
      return await sourceFile.rename(newPath);
    } on FileSystemException {
      // if rename fails, copy the source file and then delete it
      final newFile = await sourceFile.copy(newPath);
      await sourceFile.delete();
      return newFile;
    }
  }

  // static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
  //   final SendPort? send = IsolateNameServer.lookupPortByName('downloader_send_port');
  //   send?.send([id, status, progress]);
  // }
}
