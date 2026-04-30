import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planter_app/api/SceneController.dart';
import 'package:planter_app/entity/farm/domain/RoomProfile.dart';

import '../../../entity/strategy/entity/Scene.dart';
import '../../../gen/assets.gen.dart';
import '../../../generated/l10n.dart';
import '../../../ui/DialogAlert.dart';
import '../../../ui/SlidableItem.dart';
import '../../../ui/list/ListTileItem.dart';
import 'SceneDetailPage.dart';
import 'SceneForm.dart';

/**
 * ScenesPage 主类
 **/
class ScenesPage extends StatefulWidget {
  final RoomProfile room;

  const ScenesPage({Key? key, required this.room}) : super(key: key);

  @override
  _ScenesPageState createState() => _ScenesPageState();
}

/**
 * ScenesPage UI布局
 **/
class _ScenesPageState extends State<ScenesPage> {
  List<Scene> scenes = [];

  @override
  void initState() {
    super.initState();
    reloadScenes();
  }

  @override
  void dispose() {
    super.dispose();
  }

  reloadScenes() {
    SceneController.getScenesByRoomId(widget.room.roomId).then((value) {
      if (value != null) {
        setState(() {
          scenes = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).scene_sceneId),
        actions: [
          IconButton(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 0, right: 0),
              icon: Assets.images.homePlus.image(width: 48.sp),//Icon(Icons.add, size: 62.sp,),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SceneForm(roomId: widget.room.roomId))).then((value) {
                  if (value != null) {
                    reloadScenes();
                  }
                });
              }
          ),
        ],
      ),
      body: scenes.isEmpty
          ? Column(children: [
              Container(
                height: 200.sp,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 300.sp, bottom: 35.sp),
                //child: Assets.images.farmSetting.farmlistEmpty.image(width: double.infinity),
              ),
              //Text("There are no farms.Add ot now.", style: TextStyle(color: Colors.black87, fontSize: 18.sp))
            ])
          : Container(
              padding: EdgeInsets.fromLTRB(24.sp, 24.sp, 24.sp, 12.sp),
              child: ListView.separated(
                itemCount: scenes.length,
                itemBuilder: (context, index) {
                  Scene scene = scenes[index];
                  return SlidableItem(
                      showEdit: true,
                      editOnTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                          return SceneForm(scene: scene, roomId: widget.room.roomId);
                        })).then((value) {
                          if (value != null) {
                            reloadScenes();
                          }
                        });
                      },
                      deleteOnTap: () {
                        DialogAlert.removeConfirm(context, () {
                          SceneController.removeSceneById(scene.sceneId).then((value) {
                            Fluttertoast.showToast(msg: S.of(context).removeSuccess);
                            setState(() {
                              scenes.remove(scene);
                            });
                          }).onError((error, stackTrace) {
                            Fluttertoast.showToast(msg: S.of(context).removeFailure);
                          });
                        });
                      },
                      child: ListTileItem(
                          leading: Icon(Icons.schedule_outlined, size: 40.sp, color: Theme.of(context).primaryColorLight),
                          horizontalTitleGap: 24.sp,
                          title: scene.sceneName!,
                          subtitle: scene.remark,
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return SceneDetailPage(scene: scene);
                            }));
                          }));
                  ;
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20.sp);
                },
              ),
            ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => SceneForm(roomId: widget.room.roomId))).then((value) {
      //       if (value != null) {
      //         reloadScenes();
      //       }
      //     });
      //   },
      // ),
    );
  }
}
