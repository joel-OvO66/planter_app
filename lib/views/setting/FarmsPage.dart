import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:planter_app/entity/farm/entity/Farm.dart';
import 'package:provider/provider.dart';

import '../../api/FarmController.dart';
import '../../common/FarmService.dart';
import '../../gen/assets.gen.dart';
import '../../generated/l10n.dart';
import '../../ui/DialogAlert.dart';
import '../../ui/SlidableItem.dart';
import '../../ui/list/ListTileItem.dart';
import 'FarmForm.dart';
import 'FarmSettingPage.dart';

/// FarmsPage 主类
class FarmsPage extends StatefulWidget {
  const FarmsPage({Key? key}) : super(key: key);

  @override
  _FarmsPageState createState() => _FarmsPageState();
}

/// FarmsPage UI布局
class _FarmsPageState extends State<FarmsPage> {
  List<Farm> farms = [];

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
    farms = context.watch<FarmService>().farms;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).farm_management),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 0, right: 8),
            icon: Icon(Icons.add, size: 62.sp,),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FarmForm(bCreate: true,))).then((value) {
                if (value != null) {}
              });
            },
          ),
        ],
      ),
      body: farms.isEmpty
          ? Column(children: [
              Container(
                height: 200.sp,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 300.sp, bottom: 35.sp),
                //child: Assets.images.farmSetting.farmlistEmpty.image(width: double.infinity),
              ),
              Text(S.of(context).farms_list_empty_tip_add, style: TextStyle(color: Colors.black87, fontSize: 24.sp)),
              Text("+", style: TextStyle(color: Colors.black87, fontSize: 48.sp)),
            ])
          : Container(
              padding: EdgeInsets.fromLTRB(24.sp, 24.sp, 24.sp, 12.sp),
              child: ListView.separated(
                itemCount: farms.length,
                itemBuilder: (context, index) {
                  Farm farm = farms[index];
                  return ListTileItem(
                      leading: Icon(Ionicons.flower_outline, color: Theme.of(context).primaryColorLight),
                      horizontalTitleGap: 24.sp,
                      title: farm.tenantName!,
                      subtitle: farm.remark,
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        //   return FarmSettingPage(farm: farm);
                        // }));
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FarmForm(farm: farm, bCreate: false,))).then((value) {
                          if (value != null) {
                            setState(() {
                              farm.copy(value);
                            });
                          }
                        });
                      }
                  );
                  // return SlidableItem(
                  //     showEdit: true,
                  //     editOnTap: () {
                  //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => FarmForm(farm: farm, bCreate: false,))).then((value) {
                  //         if (value != null) {
                  //           setState(() {
                  //             farm.copy(value);
                  //           });
                  //         }
                  //       });
                  //     },
                  //     deleteOnTap: () {
                  //       DialogAlert.removeConfirm(context, () {
                  //         FarmController.deleteFarmById(farm.tenantId).then((value) {
                  //           Fluttertoast.showToast(msg: S.of(context).removeSuccess);
                  //           context.read<FarmService>().removeFarm(farm.tenantId);
                  //         }).onError((error, stackTrace) => null);
                  //       });
                  //     },
                  //     child: ListTileItem(
                  //         leading: Icon(Ionicons.flower_outline, color: Theme.of(context).primaryColorLight),
                  //         horizontalTitleGap: 24.sp,
                  //         title: farm.tenantName!,
                  //         subtitle: farm.remark,
                  //         trailing: const Icon(Icons.arrow_forward_ios),
                  //         onTap: () {
                  //           Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  //             return FarmSettingPage(farm: farm);
                  //           }));
                  //         }));
                  // ;
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20.sp);
                },
              ),
            ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => FarmForm())).then((value) {
      //       if (value != null) {}
      //     });
      //   },
      // ),
    );
  }
}
