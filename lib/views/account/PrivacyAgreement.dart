import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';
import 'PrivacyAgreementPage.dart';

class PrivacyAgreement extends StatelessWidget {
  final bool agree;
  final bool agreeBottom;

  final String label;

  final VoidCallback? onPressed;
  final VoidCallback? onPressedBottom;

  const PrivacyAgreement({Key? key, required this.agree, required this.agreeBottom, required this.label, this.onPressed, this.onPressedBottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: const EdgeInsetsGeometry.only(left: 10, right: 10),
                    child: GestureDetector(
                      onTap: onPressed,
                      child: Icon(agree ? Icons.check_box : Icons.check_box_outline_blank, size: 20, color: Theme.of(context).primaryColorLight),
                    ),
                  ),
                  Text(label,  style: TextStyle(fontSize: 24.sp)),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return PrivacyAgreementPage(S.of(context).privacyPolicy, 'serviceAndAgreement');
                        }));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 6, right: 6),
                        child: Text(S.of(context).policy, style: TextStyle(color: Theme.of(context).primaryColorLight, fontSize: 23.sp, overflow: TextOverflow.ellipsis)),
                      ),
                    ),
                  ),
                ]
            ),

            SizedBox(height: 15.sp,),

            Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
              Padding(padding: const EdgeInsetsGeometry.only(left: 10, right: 10),
                child: GestureDetector(
                  onTap: onPressedBottom,
                  child: Icon(agreeBottom ? Icons.check_box : Icons.check_box_outline_blank, size: 20, color: Theme.of(context).primaryColorLight),
                ),
              ),
              Text(label, style: TextStyle(fontSize: 24.sp)),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return PrivacyAgreementPage(S.of(context).private, 'privacyPolicy');
                    }));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 6),
                    child: Text(S.of(context).private, style: TextStyle(color: Theme.of(context).primaryColorLight, fontSize: 23.sp, overflow: TextOverflow.ellipsis)),
                  ),
                ),
              )
            ]),
          ],
        )

    );
  }
}
