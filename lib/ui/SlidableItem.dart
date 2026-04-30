import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../generated/l10n.dart';

class SlidableItem extends StatefulWidget {
  final Widget child;

  final bool? showEdit;

  final VoidCallback? editOnTap;

  final VoidCallback deleteOnTap;

  const SlidableItem({super.key, required this.child, required this.deleteOnTap, this.showEdit = false, this.editOnTap});

  @override
  State<SlidableItem> createState() => _SlidableItemState();
}

class _SlidableItemState extends State<SlidableItem> with SingleTickerProviderStateMixin {
  late SlidableController slidableController;
  @override
  void initState() {
    super.initState();
    slidableController = SlidableController(this);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
        direction: Axis.horizontal,
        controller: slidableController,
        endActionPane: ActionPane(
          extentRatio: 0.55,
          motion: const ScrollMotion(),
          children: [
            if (widget.showEdit!)
              SlidableAction(
                onPressed: (BuildContext context) {
                  if (widget.editOnTap != null) {
                    slidableController.close();
                    widget.editOnTap!();
                  }
                },
                autoClose: true,
                backgroundColor: Colors.blue,
                icon: Icons.edit,
                label: S.of(context).edit,
              ),
            SlidableAction(
              onPressed: (BuildContext context) {
                slidableController.close();
                widget.deleteOnTap();
              },
              autoClose: true,
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: S.of(context).remove,
            ),
          ],
        ),
        child: widget.child);
  }
}
