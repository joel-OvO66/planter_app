import 'package:flutter/cupertino.dart';

class FileBeanUtil {
  /**
   * 设备图片
   */
  static Widget? assetsSvg(String? suffix) {
    switch (suffix) {
      case 'excel':
        return Image.asset('assets/images/fileBase/excel.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'css':
        return Image.asset('assets/images/fileBase/css.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'dwg':
        return Image.asset('assets/images/fileBase/dwg.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'fbx':
        return Image.asset('assets/images/fileBase/fbx.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'gif':
        return Image.asset('assets/images/fileBase/gif.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'html':
        return Image.asset('assets/images/fileBase/html.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'jpg':
        return Image.asset('assets/images/fileBase/jpg.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'js':
        return Image.asset('assets/images/fileBase/js.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'json':
        return Image.asset('assets/images/fileBase/json.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'md':
        return Image.asset('assets/images/fileBase/md.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'mp':
        return Image.asset('assets/images/fileBase/mp.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'music':
        return Image.asset('assets/images/fileBase/music.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'pdf':
        return Image.asset('assets/images/fileBase/pdf.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'png':
        return Image.asset('assets/images/fileBase/png.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'ppt':
        return Image.asset('assets/images/fileBase/ppt.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'psd':
        return Image.asset('assets/images/fileBase/psd.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'svg':
        return Image.asset('assets/images/fileBase/svg.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'ts':
        return Image.asset('assets/images/fileBase/ts.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'txt':
        return Image.asset('assets/images/fileBase/txt.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'video':
        return Image.asset('assets/images/fileBase/video.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'word':
        return Image.asset('assets/images/fileBase/word.png', width: 40, height: 40, fit: BoxFit.contain);
      case 'zip':
        return Image.asset('assets/images/fileBase/zip.png', width: 40, height: 40, fit: BoxFit.contain);
      default:
        return Image.asset('assets/images/fileBase/other.png', width: 40, height: 40, fit: BoxFit.contain);
    }
  }
}
