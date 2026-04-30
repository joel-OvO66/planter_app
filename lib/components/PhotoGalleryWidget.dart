import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:tornado/bean/FileInfo.dart';
import 'package:tornado/network/HttpService.dart';
import 'package:tornado/upload/UploadPhotoVideo.dart';
import 'package:tornado/widget/photo-view/photo-view-simple.dart';

import '../Constants.dart';

/**
 * PhotoGallery 主类
 **/
class PhotoGalleryWidget extends StatefulWidget {
  List<FileInfo>? fileInfos;

  bool enableUpload;

  bool showDelete;

  String? uploadUrl;

  String? uploadDirectory;

  EdgeInsetsGeometry? padding;

  int max;

  String? hintText;

  String? snapText;

  String? photoText;

  String? cancelText;

  String? filming;

  PhotoGalleryWidget(this.fileInfos, {Key? key, this.enableUpload = false,
    this.padding,
    this.uploadUrl,
    this.uploadDirectory,
    this.max = 10,
    this.showDelete = true,
    this.hintText,
    this.snapText,
    this.photoText,
    this.cancelText,
    this.filming
  })
      : super(key: key);

  @override
  _PhotoGalleryWidgetState createState() => _PhotoGalleryWidgetState();
}

/**
 * PhotoGallery UI布局
 **/
class _PhotoGalleryWidgetState extends State<PhotoGalleryWidget> with _PhotoGalleryMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.fileInfos == null) {
      widget.fileInfos = [];
    }
    List<Widget> children = List.generate(widget.fileInfos!.length, (index) => _buildGridItemView(widget.fileInfos![index]));
    if (widget.enableUpload && widget.fileInfos!.length < widget.max) {
      children.add(GestureDetector(
          onTap: () {
            UploadPhotoVideo(widget.uploadUrl!,
                widget.uploadDirectory!,
                hint: widget.hintText,
                snapText: widget.snapText,
                photoText: widget.photoText,
                cancelText: widget.cancelText,
                filming: widget.filming
            ).initiateUpload(
                context,
                true,
                true,
              (fileBean) {
                setState(() {
                  widget.fileInfos!.add(fileBean);
                }
              );
            });
          },
          child: Container(
            alignment: Alignment.center,
            child: Icon(Icons.add, color: Colors.white, size: 48),
            color: Color(0xffebebeb),
          )));
    }
    return GridView.count(
        shrinkWrap: true,
        // 无法随父内容滚动
        physics: const NeverScrollableScrollPhysics(),
        //水平子Widget之间间距
        crossAxisSpacing: 10.0,
        //垂直子Widget之间间距
        mainAxisSpacing: 30.0,
        //GridView内边距
        padding: widget.padding ?? EdgeInsets.all(10.0),
        //一行的Widget数量
        crossAxisCount: 3,
        //子Widget宽高比例
        childAspectRatio: 1,
        //子Widget列表
        children: children);
  }

  Widget _buildGridItemView(FileInfo fileBean) {
    // if (!fileBean.url!.startsWith(EnvConfig.baseURL)) {
    //   var index = fileBean.url!.indexOf("data/");
    //   fileBean.url = EnvConfig.baseURL + fileBean.url!.substring(index, fileBean.url!.length);
    // }
    return Stack(children: [
      InkWell(
          child: AspectRatio(aspectRatio: 1.0, child: Image.network(fileBean.url!, fit: BoxFit.cover)),
          onTap: () {
            print('点击图片');
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PhotoViewSimpleScreen(
                imageProvider: NetworkImage(fileBean.url!),
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace){
                  return Container();
                },
                heroTag: fileBean.name,
                backgroundDecoration: const BoxDecoration(color: Colors.black),
              );
            }));
          }),
      if (widget.showDelete)
        Positioned(
            right: 5,
            top: 5,
            child: Container(
                width: 32.sp,
                height: 32.sp,
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.black),
                child: GestureDetector(
                  onTap: () {
                    HttpService.deleteFile("upload/removeFile", queryParameters: {"filePath": fileBean.filePath}).then((value) => null);
                    widget.fileInfos!.remove(fileBean);
                    setState(() {});
                  },
                  child: Icon(Icons.close, size: 26.sp, color: Colors.white),
                )))
    ]);
  }
}

/**
 * PhotoGallery 数据逻辑
 **/
mixin _PhotoGalleryMixin<T extends StatefulWidget> on State<T> {}

//StringUtil
class StringUtil {
  // static String localUrlHandle(String url) {
  //   String local = 'http://127.0.0.1:6001/';
  //   bool isLocal = url.startsWith(local);
  //   return isLocal ? url.replaceFirst(local, EnvConfig.baseURL) : url;
  // }

  /**
     * 电子标签编号中间8位 换成*
     */
  static String changeRfidCode(String rfidCode) {
    return rfidCode.replaceRange(8, 16, '********');
  }
}
