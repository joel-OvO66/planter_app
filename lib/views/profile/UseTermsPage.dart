import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:planter_app/generated/l10n.dart';

class UseTermsPage extends StatelessWidget {
  const UseTermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).term_of_use),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Html(data: "")],
        )),
        bottomNavigationBar: BrnBottomButtonPanel(
            mainButtonName: S.of(context).agree,
            mainButtonOnTap: () {
              Navigator.pop(context, true);
            },
            enableSecondaryButton: false));
  }
}
