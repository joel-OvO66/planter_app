import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:planter_app/entity/farm/entity/Note.dart';

import '../../../entity/farm/entity/Plant.dart';
import '../../../generated/l10n.dart';
import '../../../style/AppTheme.dart';
import '../../../ui/card/BasicCard.dart';
import 'NoteForm.dart';

class NoteTypePage extends StatefulWidget {
  final Plant plant;
  const NoteTypePage({super.key, required this.plant});

  @override
  State<NoteTypePage> createState() => _NoteTypePageState();
}

class _NoteTypePageState extends State<NoteTypePage> {
  @override
  Widget build(BuildContext context) {
    double iconWidth = (MediaQuery.of(context).size.width - 86.sp) / 4;

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).note_noteType), actions: []),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 200.sp),
          TextButton.icon(
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Theme.of(context).primaryColorLight)),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => NoteForm(plant: widget.plant, noteType: NoteType.OTHER))).then((value) {
                if (value != null) {}
              });
            },
            icon: const Icon(Icons.add, color: AppTheme.textColorWhite),
            label: Text(
              "  ${S.of(context).create_note}  ",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppTheme.textColorWhite),
            ),
          ),
          SizedBox(height: 100.sp),
          BasicCard(
              child: Wrap(
                  alignment: WrapAlignment.start,
                  children: NoteType.values.takeWhile((value) => value != NoteType.OTHER).map((noteType) {
                    return SizedBox(
                        width: iconWidth,
                        height: iconWidth,
                        child: BrnIconButton(
                            direction: Direction.bottom,
                            iconHeight: 56.sp,
                            iconWidth: 56.sp,
                            name: S.of(context).note_noteType_enum(noteType),
                            iconWidget: Icon(noteType.iconData(), color: Theme.of(context).primaryColorLight),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => NoteForm(plant: widget.plant, noteType: noteType))).then((value) {
                                if (value != null) {}
                              });
                            }));
                  }).toList())),
        ],
      )),
    );
  }
}
