import 'package:intl/intl.dart';
import 'package:tornado/network/HttpService.dart';
// region 前端扩展导入包
import 'package:tornado/bean/FileInfo.dart';
import 'package:dio/dio.dart';
// endregion

   /**
   * @author kepler
   */
class StorageController{

    static const UPLOAD_AUDIO = 'upload/uploadAudio';
   /**
   */
    static Future<FileInfo> uploadAudio(MultipartFile file, String directory) {
        return HttpService.post<FileInfo>(UPLOAD_AUDIO, queryParameters: {"file": file,"directory": directory}, fromJson: FileInfo.fromJson);
    }

    // region 前端扩展代码区
    // endregion
}
