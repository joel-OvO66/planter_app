import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:planter_app/entity/farm/domain/PlantNode.dart';
import 'package:planter_app/entity/farm/entity/Note.dart';
import 'package:planter_app/entity/farm/entity/Plant.dart';
import 'package:planter_app/ui/card/BasicCard.dart';
import 'package:tornado/network/HttpService.dart';
import 'package:tornado/page/PaginationState.dart';
import 'package:tornado/upload/UploadPhotoVideo.dart';
import 'package:tornado/util/DateFormater.dart';
import 'package:tornado/widget/EmptyContent.dart';

import '../../api/NoteController.dart';
import '../../components/PhotoGalleryWidget.dart';
import '../../components/page/PaginationMixin.dart';
import '../../generated/l10n.dart';
import '../../ui/card/HeadTransparentCard.dart';
import 'note/NoteDetailPage.dart';
import 'note/NoteTypePage.dart';

/**
 * PlantDetailPage 主类
 **/
class PlantDetailPage extends StatefulWidget {
  final Plant plant;

  const PlantDetailPage({Key? key, required this.plant}) : super(key: key);

  @override
  _PlantDetailPageState createState() => _PlantDetailPageState();
}

/**
 * PlantDetailPage UI布局
 **/
class _PlantDetailPageState extends PaginationState<Note, PlantDetailPage> with _PlantDetailPageMixin, PaginationMixin {
  _PlantDetailPageState() : super(NoteController.PAGE_NOTE, (json) => Note.fromJson(json));

  late PlantNode plantNode;

  @override
  void initState() {
    super.initState();
    plantNode = PlantNode();
    pagination.addDefaultFilter("plant.plantId", widget.plant.plantId);
    pagination.setDefaultSort("nodeTime", "desc");
    reload();
    NoteController.getPlantNodeByPlantId(widget.plant.plantId).ifNotNull((value) {
      setState(() {
        plantNode = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Plant plant = widget.plant;
    return Scaffold(
      appBar: AppBar(
        title: Text(plant.plantName!),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 0, right: 0),
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {
              UploadPhotoVideo("plant/uploadCover", "plant",
                  hint: "Upload cover",
                  queryParameters: {"plantId": plant.plantId},
                snapText: S.of(context).snap,
                photoText: S.of(context).photo,
                cancelText: S.of(context).cancel,
              ).initiateUpload(context, true, false, (fileBean) {
                setState(() {
                  widget.plant.cover = fileBean;
                });
              });
            },
          ),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(140),
            child: Image.network(
              widget.plant.cover?.url ?? '',
              width: MediaQuery.of(context).size.width,
              height: 140,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Ionicons.image);
              },
            )),
      ),
      body: buildContent2(
          emptyContent: Container(),
          separatorBuilder: (context, index) {
            return SizedBox(height: 24.sp);
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NoteTypePage(plant: plant))).then((value) {
            if (value != null) {
              reload();
            }
          });
        },
      ),
    );
  }

  Widget buildContent2({IndexedWidgetBuilder? separatorBuilder, Color? backgroundColor, Widget? emptyContent}) {
    Plant plant = widget.plant;
    return RefreshIndicator(
        onRefresh: doRefresh,
        color: Colors.blue,
        backgroundColor: backgroundColor ?? Colors.grey[200],
        child: Column(children: [
          Expanded(
              child: ListView(
            children: [
              BasicCard(
                title: plant.plantName,
                subtitle: "${S.of(context).plantCategory_categoryName}: ${plant.plantCategory?.categoryName ?? ''}",
                // padding: EdgeInsets.all(0),
                child: Padding(
                    padding: EdgeInsets.only(left: 24.sp, top: 12.sp, bottom: 12.sp),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(S.of(context).growthStage, style: Theme.of(context).textTheme.headlineMedium), Text('Germination for 1 day')],
                      ),
                      SizedBox(width: 32.sp),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(S.of(context).room_roomName, style: Theme.of(context).textTheme.headlineMedium), Text(plant.room!.roomName!)])
                    ])),
              ),
              BasicCard(
                child: buildGrid(),
              ),
              ...pagination.content!.map((note) {
                return Padding(
                    padding: EdgeInsets.only(top: 24.sp, left: 24.sp, bottom: 12.sp, right: 24.sp),
                    child: HeadTransparentCard(
                        icon: const Icon(Icons.timer_sharp),
                        title: DateFormater.formatDateTimeNoSecond(note.noteTime),
                        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          ...NoteDetailPage.buildNoteContents(context, note),
                          Text(note.noteContent ?? ""),
                          PhotoGalleryWidget(note.attachments, padding: EdgeInsets.only(top: 18.sp), enableUpload: false, showDelete: false)
                        ]),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NoteDetailPage(note: note, plant: widget.plant)));
                        }));
              }).toList(),
              _buildBottom()
            ],
            // physics: const AlwaysScrollableScrollPhysics(),
          ))
        ]));
  }

  Widget _buildBottom() {
    if (pagination.content!.length > 0) {
      return buildInfiniteWidget();
    } else if (loading) {
      return buildInfiniteWidget();
    } else {
      return EmptyContent();
    }
  }

  Widget buildGrid() {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // 禁用 GridView 自己的滚动
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two items per row
        childAspectRatio: 2.8, // Adjust the height of each item
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
      ),
      children: [
        _buildNoteItem(S.of(context).note_noteId, plantNode.noteCount.toString()),
        _buildNoteItem(S.of(context).note_lightSchedule, plantNode.lightSchedule != null ? "${plantNode.lightSchedule}h/${24 - plantNode.lightSchedule!}h" : "--"),
        _buildNoteItem(S.of(context).note_potSize, plantNode.potSize != null ? "${plantNode.potSize}L" : "--"),
        _buildNoteItem(S.of(context).note_height, plantNode.height != null ? "${plantNode.height} CM" : "--"),
        _buildNoteItem(S.of(context).note_distance, plantNode.distance != null ? "${plantNode.distance} CM" : "--"),
        _buildNoteItem(S.of(context).note_noteType_enum(NoteType.TRANING), "--"),
        _buildNoteItem(S.of(context).temperature, plantNode.minTemp != null ? "${plantNode.minTemp}°C~${plantNode.maxTemp}°C" : "--"),
        _buildNoteItem(S.of(context).humidity, plantNode.minHumi != null ? "${plantNode.minHumi}%~${plantNode.maxHumi}%" : "--"),
        _buildNoteItem(S.of(context).note_co2Level, plantNode.co2Level != null ? "${plantNode.co2Level} ppm" : "--"),
        _buildNoteItem(S.of(context).note_ph, plantNode.ph?.toString() ?? "--"),
        // _buildNoteItem("Repellent", "0"),
        _buildNoteItem(S.of(context).note_noteType_enum(NoteType.WATERING), "${plantNode.waterDaysAgo ?? '--'} ${S.of(context).days_ago}"),
        _buildNoteItem(S.of(context).note_noteType_enum(NoteType.NUTRIENTS), "${plantNode.nutrientDaysAgo ?? '--'} ${S.of(context).days_ago}"),
        _buildNoteItem(S.of(context).note_noteType_enum(NoteType.PEST_CONTROL), "${plantNode.pestControlDaysAgo ?? '--'} ${S.of(context).days_ago}"),
        _buildNoteItem(S.of(context).note_noteType_enum(NoteType.TRIM), "${plantNode.trimDaysAgo ?? '--'} ${S.of(context).days_ago}"),
      ],
    );
  }

  Widget _buildNoteItem(String label, String value) {
    return Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.1.sp),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis), maxLines: 1),
            SizedBox(height: 15.0.sp),
            Text(value, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).textTheme.bodyMedium!.color!.withValues(alpha: 0.7), overflow: TextOverflow.ellipsis), maxLines: 1),
          ],
        ));
  }
}

/**
 * PlantDetailPage 数据逻辑
 **/
mixin _PlantDetailPageMixin<T extends StatefulWidget> on State<T> {}
