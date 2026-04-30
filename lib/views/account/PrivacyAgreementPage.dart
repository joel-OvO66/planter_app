import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../generated/l10n.dart';

class PrivacyAgreementPage extends StatefulWidget {
  final String pageTitle;
  final String type;
  final bool isShowButton;

  PrivacyAgreementPage(
    this.pageTitle,
    this.type,
    {
      this.isShowButton = true
    }
  );

  @override
  State<StatefulWidget> createState() {
    return _PrivacyAgreementPageState();
  }
}

class _PrivacyAgreementPageState extends State<PrivacyAgreementPage> {
  String? content = '''
  APP服务与协议条款

欢迎使用我们的移动应用程序（以下简称"APP"）！在使用本APP之前，请您务必仔细阅读并理解以下条款。通过使用本APP，即表示您同意遵守以下条款与条件。

1. 使用规则

1.1 您同意遵守所有适用的法律法规和规定，不会在使用本APP过程中进行任何非法、违法或侵犯他人权利的活动。

1.2 您同意不会通过任何方式对APP进行未经授权的访问、修改、复制或试图破解APP的安全措施。

1.3 您承认并同意，您对使用本APP所产生的任何内容和后果负有完全的责任，包括但不限于您在APP上发布的信息和行为。

2. 隐私政策

2.1 我们尊重用户的隐私，并努力保护您的个人信息。请在使用本APP之前，仔细阅读我们的隐私政策以了解我们如何收集、使用和保护您的个人信息。

3. 用户账户

3.1 在使用本APP的某些功能时，您可能需要创建一个用户账户。您需要提供真实、准确、完整的信息，并对您的账户信息保持更新。

3.2 您的账户信息应妥善保管，不得与他人分享。您对使用您的账户产生的一切活动负有责任。

4. 知识产权

4.1 本APP及其包含的所有内容，包括但不限于文字、图片、图标、标识、音频和视频，均受知识产权法律保护。

4.2 您可以在非商业性质下使用APP的内容，但不得以任何方式侵犯我们的知识产权。

5. 免责声明

5.1 本APP将尽力确保提供准确、及时的信息，但不对信息的准确性和完整性作出保证。

5.2 在法律允许的范围内，我们不对因使用本APP而产生的任何直接或间接损失承担责任。

6. 终止与变更

6.1 我们有权在任何时间终止或暂停提供本APP，无需提前通知。

6.2 我们有权随时变更或修改本条款，变更后的条款将在APP上发布，您继续使用本APP即表示您同意接受变更后的条款。

7. 适用法律与管辖

7.1 本条款受适用法律的管辖。

7.2 如因本条款产生争议，双方应尽量友好协商解决；如协商不成，您同意将争议提交至有管辖权的法院解决。

通过下载、安装、访问或使用本APP，即表示您已阅读、理解并同意接受以上条款与条件。如果您不同意这些条款，请不要使用本APP。
  
  ''';

  String privacyPolicy = '''
  
  移动应用隐私政策

本隐私政策旨在帮助您了解我们如何收集、使用、披露和保护您的个人信息。通过使用我们的移动应用程序（以下简称"APP"），即表示您同意本隐私政策所述的信息处理方式。

1. 收集的信息

1.1 注册信息：在您使用本APP的某些功能时，可能需要您提供个人信息，如姓名、电子邮件地址等。

1.2 使用信息：我们可能会自动收集关于您使用APP的信息，包括访问时间、地理位置、设备信息、操作系统和应用程序版本等。

2. 信息的使用

2.1 我们可能将收集的信息用于以下用途：

提供、维护和改进APP的功能与服务；
向您发送与您使用相关的通知和更新；
处理您的请求和反馈；
分析用户行为以改善用户体验；
遵守法律法规和监管要求。
3. 信息披露

3.1 我们不会向任何第三方出售、出租、交易或分享您的个人信息，除非经您事先同意或法律要求。

3.2 我们可能与合作伙伴共享某些信息，以支持我们提供服务，但我们会对合作伙伴的信息使用进行严格的管理和监控。

4. 信息保护

4.1 我们采取一系列合理的技术和管理措施来保护您的个人信息，防止未经授权的访问、使用、披露或修改。

4.2 尽管我们采取了安全措施，但互联网传输存在风险，因此我们不能保证您的个人信息的绝对安全。

5. 隐私权选择

5.1 您可以通过APP的设置控制某些个人信息的收集和使用，或随时联系我们行使访问、更正、删除您的个人信息的权利。

6. 年龄限制

6.1 我们不会有意地收集未满法定年龄的儿童的个人信息。如果您是未满法定年龄的儿童，您应在法定监护人的陪同下使用本APP。

7. 隐私政策的变更

7.1 我们可能会不定期地更新本隐私政策。我们将在APP上发布更新后的隐私政策，并提醒您注意相关变更。

8. 联系我们

8.1 如果您对本隐私政策或您的个人信息有任何疑问或顾虑，请通过以下联系方式与我们取得联系：[联系邮件地址]。

通过使用本APP，即表示您同意并理解本隐私政策所述的信息处理方式。如果您不同意本隐私政策，请不要使用本APP。
  
  ''';

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    if (widget.type == "serviceAndAgreement") {
      controller = WebViewController()
        ..loadFlutterAsset('assets/files/Terms-20251107.html');
    } else {
      controller = WebViewController()
        ..loadFlutterAsset('assets/files/Policy-20251107.html');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.pageTitle),
        ),
        body: WebViewWidget(controller: controller),
        // body: Center(
        //     child: Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     //Html(data: widget.type == "serviceAndAgreement" ? this.content : privacyPolicy)
        //     WebViewWidget(controller: controller),
        //   ],
        // )),
        bottomNavigationBar: Visibility(
          visible: widget.isShowButton,
            child: BrnBottomButtonPanel(
                mainButtonName: S.of(context).I_agree,
                mainButtonOnTap: () {
                  Navigator.pop(context, true);
                },
                enableSecondaryButton: false
            ),
        ),
    );
  }
}
