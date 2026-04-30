import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:tornado/network/HttpService.dart';

class UploadPhotoVideo {
  /**
   * 提示语
   */
  final String? hint;

  /**
   * 上传url
   */
  final String uploadUrl;

  final String? snapText;

  final String? photoText;

  final String? cancelText;

  final String? filming;

  /**
   * 存储文件路径
   */
  final String directory;

  final Map<String, dynamic>? queryParameters;

  final ImagePicker _picker = ImagePicker();

  UploadPhotoVideo(this.uploadUrl, this.directory, {this.hint, this.snapText, this.photoText, this.cancelText, this.filming, this.queryParameters});

  /**
   * 作用于打开手机的 拍照 或者 相册
   */
  initiateUpload(BuildContext context, bool enablePhoto, bool enableVideo, Function success) async {
    await showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            //和hint重复了
            // title: Text('提示'),
            message: Text(hint == null ? '' : hint!),
            actions: <Widget>[
              if (enablePhoto)
                CupertinoActionSheetAction(
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    // 框架的图标出不来
                    // Container(
                    //   margin: EdgeInsets.only(right: 8),
                    //   child: SvgPicture.asset('assets/images/svg/photograph.svg', width: 24),
                    // ),
                    Text(snapText?? '拍照', style: TextStyle(color: Colors.black, fontSize: 14)),
                  ]),
                  onPressed: () {
                    _open("photo", ImageSource.camera).then((value) {
                      // FileBean
                      success(value);
                      Navigator.of(context).pop(cancelText?? 'cancel');
                    });
                  },
                ),
              if (enableVideo)
                CupertinoActionSheetAction(
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    // Container(
                    //   margin: EdgeInsets.only(right: 8),
                    //   child: SvgPicture.asset('assets/images/svg/photograph.svg', width: 24),
                    // ),
                    Text(filming?? '拍摄', style: TextStyle(color: Colors.black, fontSize: 14)),
                  ]),
                  onPressed: () {
                    _open("video", ImageSource.camera).then((value) {
                      // FileBean
                      success(value);
                      Navigator.of(context).pop('cancel');
                    });
                  },
                ),
              CupertinoActionSheetAction(
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    // Container(
                    //   margin: EdgeInsets.only(right: 8),
                    //   child: SvgPicture.asset('assets/images/svg/photo-album.svg', width: 24),
                    // ),
                    Text(photoText?? '相册', style: TextStyle(color: Colors.black, fontSize: 14)),
                  ]),
                  onPressed: () {
                    _open('photo', ImageSource.gallery).then((value) {
                      // FileBean
                      success(value);
                      Navigator.of(context).pop(cancelText ?? 'cancel');
                    });
                  })
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text(cancelText ?? '取消',  style: TextStyle(color: Colors.red, fontSize: 15)),
              onPressed: () {
                Navigator.of(context).pop(cancelText ?? 'cancel');
              },
              isDestructiveAction: true,
            ),
          );
        });
  }

  /**
   * 拍照 或 相册
   * type 类型 图片 或 文件
   * imageSource 类型 相机 或 相册
   */
  Future<FileInfo> _open(String type, ImageSource imageSource) async {
    final XFile? uploadFile = type == 'photo' ? await _picker.pickImage(source: imageSource) : await _picker.pickVideo(source: imageSource);
    var formData =null;
    if(type == 'photo'){
      File? compressFile = await imageCompressAndGetFile(File(uploadFile!.path));
        formData = FormData.fromMap({'file': await MultipartFile.fromFile(compressFile!.path,), 'directory': directory});
    }else{
        formData = FormData.fromMap({'file': await MultipartFile.fromFile(uploadFile!.path, filename: uploadFile.name), 'directory': directory});
    }
    return HttpService.uploadFile(uploadUrl, formData,queryParameters:queryParameters);
  }

  Future<File?> imageCompressAndGetFile(File file) async {
    if (file.lengthSync() < 200 * 1024) {
      return file;
    }
    int quality = 100;
    if (file.lengthSync() > 4 * 1024 * 1024) {
      quality = 50;
    } else if (file.lengthSync() > 2 * 1024 * 1024) {
      quality = 60;
    } else if (file.lengthSync() > 1 * 1024 * 1024) {
      quality = 70;
    } else if (file.lengthSync() > 0.5 * 1024 * 1024) {
      quality = 80;
    } else if (file.lengthSync() > 0.25 * 1024 * 1024) {
      quality = 90;
    }
    Directory tempDir = await getTemporaryDirectory();
    String targetPath = tempDir.absolute.path + "/" + DateTime.now().millisecondsSinceEpoch.toString() + ".jpg";

    Future<File?> result = Future.value(file);
    // FlutterImageCompress.compressAndGetFile(
    //   file.absolute.path,
    //   targetPath,
    //   minWidth: 600,
    //   quality: quality,
    //   rotate: 0,
    // );

    return result;
  }
}
