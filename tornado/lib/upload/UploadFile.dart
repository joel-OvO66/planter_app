import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dio/dio.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:tornado/network/HttpService.dart';

class UploadFile {
  /**
   * 上传url
   */
  final String uploadUrl;

  /**
   * 存储文件路径
   */
  final String directory;

  UploadFile(this.uploadUrl, this.directory);

  /**
   * 单选文件
   */
  pickFile(Function success, {List<String>? allowedExtensions = const ['jpg', 'jpeg', 'png', 'bmp', 'doc', 'docx', 'xls', 'xlsx', 'pdf']}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: allowedExtensions);
    if (result != null) {
      var formData = FormData.fromMap({'file': await MultipartFile.fromFile(result.files.single.path!, filename: result.files.single.name), 'directory': directory});
      HttpService.uploadFile(uploadUrl, formData).then((fileBean) {
        if (success != null) {
          success(fileBean);
        }
      });
    } else {
      // User canceled the picker
    }
  }
}
