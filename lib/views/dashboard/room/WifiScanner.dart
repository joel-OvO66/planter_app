import 'package:esp_blufi/esp_blufi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinput/pinput.dart';
import 'package:planter_app/provider/SettingProvider.dart';
import 'package:provider/provider.dart';
import 'package:wifi_scan/wifi_scan.dart';

import '../../../generated/l10n.dart';

mixin WifiScanner<T extends StatefulWidget> on State<T> {
  bool _obscure = true;
  
  // 检查权限并扫描WiFi
  Future<void> _checkPermissionsAndScan() async {
    if (await Permission.location.request().isGranted) {
      if (await Permission.nearbyWifiDevices.request().isGranted || await Permission.location.request().isGranted) {
      } else {
        Fluttertoast.showToast(msg: S.of(context).wifi_permission_refuse_tip, gravity: ToastGravity.CENTER);
      }
    } else {
      Fluttertoast.showToast(msg: S.of(context).wifi_permission_refuse_tip, gravity: ToastGravity.CENTER);
    }
  }

  void showWifiListDialog(Function(String userName, String password) configNetwork) async {
    await _checkPermissionsAndScan();
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text(S.of(context).wifi_select),
            backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
            content: WifiScannerDialog(configNetwork: configNetwork),
          );
        });
      },
    );
  }

  Future<void> showWifiInputDialog({
    required Function(String userName, String password) configNetwork,
    required Function() cancel}) async {

    await _checkPermissionsAndScan();
    final _formKey = GlobalKey<FormState>();
    final settingProvider = Provider.of<SettingProvider>(context, listen: false);
    final TextEditingController ssidController = TextEditingController(text: settingProvider.wifiSsid);
    final TextEditingController passwordController = TextEditingController(text: settingProvider.wifiPwd);
    _obscure = true;

    return showDialog(
      context: context,
      barrierDismissible:false,

      builder: (context) {
        return AlertDialog(
          title: Text(S.of(context).wifi_network),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StatefulBuilder(builder: (context, state) {
                  return TextFormField(
                      controller: ssidController,
                      decoration: InputDecoration(
                        labelText: S.of(context).wifi_name,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(builder: (context, setState) {
                                  return AlertDialog(
                                    title: Text(S.of(context).wifi_select),
                                    backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
                                    content: WifiScannerSelectDialog(configNetwork: (ssid) {
                                      ssidController.setText(ssid);
                                    }),
                                  );
                                });
                              },
                            );
                          },
                        ),
                      )
                  );
                }),
                StatefulBuilder(builder: (context, setState) {
                  return TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: S.of(context).wifi_password,
                      suffixIcon: IconButton(
                        icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscure = !_obscure;
                          });
                        },
                      ),
                    ),
                    obscureText: _obscure,
                  );
                })
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                cancel();
              },
              child: Text(S.of(context).cancel),
            ),
            ElevatedButton(
              onPressed: () async {
                final ssid = ssidController.text;
                final password = passwordController.text;
                settingProvider.setWifiSsid(ssid);
                settingProvider.setWifiPwd(password);
                configNetwork(ssid, password);
              },
              child: Text(S.of(context).ok),
            )
          ],
        );
      },
    );
  }
}

class WifiScannerDialog extends StatefulWidget {
  final Function(String userName, String password) configNetwork;

  const WifiScannerDialog({super.key, required this.configNetwork});

  @override
  State<WifiScannerDialog> createState() => _WifiScannerDialogState();
}

class _WifiScannerDialogState extends State<WifiScannerDialog> {
  List<WiFiAccessPoint> wifiList = [];
  String? selectedSSID;
  bool manualInput = false;
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _scanWifi();
  }

  Future<void> _scanWifi() async {
    final can = await WiFiScan.instance.canStartScan();
    if (can == CanStartScan.yes) {
      await WiFiScan.instance.startScan();
      WiFiScan.instance.getScannedResults().then((results) {
        setState(() => wifiList = results);
      });
    } else {
      Fluttertoast.showToast(msg: S.of(context).wifi_scan_failure_tip, gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    final visibleWifiList = wifiList.where((wifi) => wifi.ssid.trim().isNotEmpty).toList();
    return SizedBox(
      width: double.maxFinite,
      height: 600.sp,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
                child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(), // 避免反弹
              itemCount: visibleWifiList.length,
              itemBuilder: (context, index) {
                final wifi = visibleWifiList[index];
                return ListTile(
                  dense: true,
                  leading: Icon(Icons.wifi_rounded, color: Colors.green),
                  title: Text(wifi.ssid),
                  onTap: () {
                    Navigator.of(context).pop();
                    _showPasswordForm(wifi.ssid, false);
                  },
                );
              },
            )),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showPasswordForm(null, true);
            },
            child: Text(S.of(context).wifi_select_manual),
          )
        ],
      ),
    );
  }

  void _showPasswordForm(String? ssid, bool isManual) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController ssidController = TextEditingController(text: ssid);
    final TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(S.of(context).wifi_network),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(controller: ssidController, enabled: isManual, decoration: InputDecoration(labelText: S.of(context).wifi_name)),
                StatefulBuilder(builder: (context, setState) {
                  return TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: S.of(context).wifi_password,
                      suffixIcon: IconButton(
                        icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscure = !_obscure;
                          });
                        },
                      ),
                    ),
                    obscureText: _obscure,
                  );
                })
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(S.of(context).cancel),
            ),
            ElevatedButton(
              onPressed: () async {
                final ssid = ssidController.text;
                final password = passwordController.text;
                print("连接 Wi-Fi: $ssid 密码: $password");
                widget.configNetwork(ssid, password);
              },
              child: Text(S.of(context).ok),
            )
          ],
        );
      },
    );
  }
}


class WifiScannerSelectDialog extends StatefulWidget {
  final Function(String password) configNetwork;

  const WifiScannerSelectDialog({super.key, required this.configNetwork});

  @override
  State<WifiScannerSelectDialog> createState() => _WifiScannerSelectDialogState();
}

class _WifiScannerSelectDialogState extends State<WifiScannerSelectDialog> {
  List<WiFiAccessPoint> wifiList = [];
  @override
  void initState() {
    super.initState();
    _scanWifi();
  }

  Future<void> _scanWifi() async {
    final can = await WiFiScan.instance.canStartScan();
    if (can == CanStartScan.yes) {
      await WiFiScan.instance.startScan();
      WiFiScan.instance.getScannedResults().then((results) {
        setState(() => wifiList = results);
      });
    } else {
      Fluttertoast.showToast(msg: S.of(context).wifi_scan_failure_tip, gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    final visibleWifiList = wifiList.where((wifi) => wifi.ssid.trim().isNotEmpty).toList();
    return SizedBox(
      width: double.maxFinite,
      height: 600.sp,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(), // 避免反弹
                  itemCount: visibleWifiList.length,
                  itemBuilder: (context, index) {
                    final wifi = visibleWifiList[index];
                    return ListTile(
                      dense: true,
                      leading: Icon(Icons.wifi_rounded, color: Colors.green),
                      title: Text(wifi.ssid),
                      onTap: () {
                        Navigator.of(context).pop();
                        widget.configNetwork(wifi.ssid);
                      },
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}

