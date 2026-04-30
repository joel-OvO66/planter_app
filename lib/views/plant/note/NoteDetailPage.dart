import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:planter_app/entity/farm/entity/Note.dart';
import 'package:tornado/util/DateFormater.dart';

import '../../../components/PhotoGalleryWidget.dart';
import '../../../entity/farm/entity/Plant.dart';
import '../../../generated/l10n.dart';
import '../../../ui/description/DescriptItemRemark.dart';
import '../../../ui/description/DescriptionItem.dart';

class NoteDetailPage extends StatefulWidget {
  final Plant plant;
  final Note note;
  const NoteDetailPage({super.key, required this.note, required this.plant});

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();

  static List<Widget> buildNoteContents(BuildContext context, Note note) {
    List<Widget> widgets = [];
    switch (note.noteType) {
      case NoteType.WATERING:
        widgets.add(DescriptionItem(S.of(context).note_waterVolume, "${note.waterVolume}L"));
        break;
      case NoteType.NUTRIENTS:
        // TODO: Handle this case.
        break;
      case NoteType.PEST_CONTROL:
        // TODO: Handle this case.
        break;
      case NoteType.TRIM:
        // TODO: Handle this case.
        break;
      case NoteType.LIGHT_SCHEDULE:
        widgets.add(DescriptionItem(S.of(context).note_lightSchedule, "${note.lightSchedule}h/${24 - note.lightSchedule}h"));
        break;
      case NoteType.HEIGHT:
        widgets.add(DescriptionItem(S.of(context).note_height, "${note.height} CM"));
        break;
      case NoteType.LAMP_TO_PLANT_DISTANCE:
        widgets.add(DescriptionItem(S.of(context).note_distance, "${note.distance} CM"));
        break;
      case NoteType.POT_SIZE:
        widgets.add(DescriptionItem(S.of(context).note_potSize, "${note.potSize}L"));
        break;
      case NoteType.TEMPERATURE_HUMIDITY:
        widgets.add(DescriptionItem(S.of(context).note_minTemp, "${note.minTemp}°C~${note.maxTemp}°C"));
        widgets.add(DescriptionItem(S.of(context).note_minHumi, "${note.minHumi}%~${note.maxHumi}%"));
        break;
      case NoteType.CO2:
        widgets.add(DescriptionItem(S.of(context).note_co2Level, "${note.co2Level} ppm"));
        break;
      case NoteType.TRANING:
        // TODO: Handle this case.
        break;
      case NoteType.ROOT_PH:
        widgets.add(DescriptionItem(S.of(context).note_ph, note.ph.toString()));
        break;
      case NoteType.OTHER:
        // TODO: Handle this case.
        break;
      case null:
        // TODO: Handle this case.
        break;
    }
    return widgets;
  }
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  @override
  Widget build(BuildContext context) {
    Note note = widget.note;
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).note)),
        body: Padding(
            padding: EdgeInsets.only(left: 24.sp, top: 12.sp, right: 24.sp),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ListTile(
                contentPadding: EdgeInsets.all(20.sp),
                leading: Icon(Ionicons.leaf_outline, size: 72.sp, color: Theme.of(context).primaryColorLight),
                title: Text(widget.plant.plantName!, style: Theme.of(context).textTheme.headlineLarge),
                subtitle: Text(DateFormater.formatDateTimeNoSecond(note.noteTime)),
              ),
              ...NoteDetailPage.buildNoteContents(context, note),
              DescriptionItemRemark(S.of(context).note_noteContent, note.noteContent ?? "", left: 0),
              PhotoGalleryWidget(note.attachments, padding: EdgeInsets.only(left: 0, top: 12.sp, right: 0), enableUpload: false, showDelete: false)
            ])));
  }
}
