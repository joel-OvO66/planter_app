import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:planter_app/common/FarmService.dart';
import 'package:planter_app/entity/farm/entity/Plant.dart';
import 'package:planter_app/gen/assets.gen.dart';
import 'package:planter_app/ui/DialogAlert.dart';
import 'package:planter_app/views/plant/PlantForm.dart';
import 'package:provider/provider.dart';
import 'package:tornado/page/PaginationState.dart';

import '../../api/PlantController.dart';
import '../../components/page/PaginationMixin.dart';
import '../../generated/l10n.dart';
import '../../ui/EmptyData.dart';
import '../../ui/SlidableItem.dart';
import '../../ui/list/ListTileItem.dart';
import 'PlantDetailPage.dart';

/**
 * PlantPage 主类
 **/
class PlantsPage extends StatefulWidget {
  const PlantsPage({Key? key}) : super(key: key);

  @override
  _PlantsPageState createState() => _PlantsPageState();
}

/**
 * PlantPage UI布局
 **/
class _PlantsPageState extends PaginationState<Plant, PlantsPage> with _PlantPageMixin, PaginationMixin {
  _PlantsPageState() : super(PlantController.PAGE_PLANT, (json) => Plant.fromJson(json));

  @override
  void initState() {
    super.initState();
    reload();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final provider = Provider.of<FarmService>(context);
    if (provider.currentFarm != null) {
      reload();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).navBar_plant),
        actions: [
          IconButton(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 0, right: 0),
              icon: Assets.images.homePlus.image(width: 48.sp),//Icon(Icons.add, size: 62.sp,),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PlantForm())).then((value) {
                  if (value != null) {
                    reload();
                  }
                });
              }),
        ],
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(24.sp, 12.sp, 24.sp, 12.sp),
          child: buildContent(
              emptyContent: EmptyData(
                  content: S.of(context).create_plant_tip,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PlantForm())).then((value) {
                      if (value != null) {
                        reload();
                      }
                    });
                  }),
              itemBuilder: (context, index) {
                Plant plant = pagination.content![index];
                return SlidableItem(
                    showEdit: true,
                    editOnTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlantForm(plant: plant))).then((value) {
                        if (value != null) {
                          reload();
                        }
                      });
                    },
                    deleteOnTap: () {
                      DialogAlert.removeConfirm(context, () {
                        PlantController.removePlantById(plant.plantId).then((value) {
                          setState(() {
                            pagination.content.remove(plant);
                          });
                        });
                      });
                    },
                    child: ListTileItem(
                        contentPadding: EdgeInsets.only(top: 16.sp, bottom: 16.sp, left: 32.sp),
                        leading: Image.network(
                          plant.cover?.url ?? '',
                          width: 94.sp,
                          height: 94.sp,
                          // cacheWidth: 56,
                          // cacheHeight: 56,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Ionicons.leaf_outline, size: 72.sp, color: Theme.of(context).primaryColorLight);
                          },
                        ),
                        horizontalTitleGap: 26.sp,
                        title: plant.plantName,
                        subtitle: plant.room?.roomName,
                        trailing: const Icon(Icons.arrow_forward_ios),
                        crossAxisCount: 2,
                        detail: [],
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlantDetailPage(plant: plant)));
                        }));
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 24.sp);
              })),
      floatingActionButton: SafeArea(
          child: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PlantForm())).then((value) {
            if (value != null) {
              reload();
            }
          });
        },
      )),
    );
  }
}

/**
 * PlantPage 数据逻辑
 **/
mixin _PlantPageMixin<T extends StatefulWidget> on State<T> {}
