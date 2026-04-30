import 'dart:async';
import 'dart:convert';

import 'package:esp_blufi/esp_blufi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinput/pinput.dart';
import 'package:planter_app/ui/DialogAlert.dart';
import 'package:tornado/form/FormItem.dart';
import 'package:tornado/form/FormMixin.dart';
import 'package:tornado/form/Validator.dart';

import '../../../Constants.dart';
import '../../../api/RoomController.dart';
import '../../../components/form/TextAreaInputFormFiled.dart';
import '../../../components/form/TextInputFormField.dart';
import '../../../entity/farm/entity/Room.dart';
import '../../../generated/l10n.dart';
import '../../../ui/MainButton.dart';
import '../../setting/BlueScanButton.dart';
import 'WifiScanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/**
 * RoomForm 主类
 **/
class RoomForm extends StatefulWidget {
  final Room? room;
  final bool bCreate;

  const RoomForm({Key? key, this.room, this.bCreate = true}) : super(key: key);

  @override
  _RoomFormState createState() => _RoomFormState();
}

/**
 * RoomForm UI布局
 **/
class _RoomFormState extends State<RoomForm> with FormMixin<Room, RoomForm>, WifiScanner {
  List<FormItem> formItems = [];

  // 定义一个GlobalKey来访问FormField的状态
  final GlobalKey<FormFieldState<String>> _fieldKey = GlobalKey<FormFieldState<String>>();

  TextEditingController controller = TextEditingController();
  final _espBlufiPlugin = EspBlufi();
  /**
   * 扫描状态
   */
  bool scanning = false;

  /// rfid设备是否初始化
  bool inited = false;

  bool _isProvisioning = false;
  Timer? _provisionTimeoutTimer;

  List<BlueTooth> blueToothList = [];

  @override
  void initState() {
    super.initState();
    if (widget.room != null) {
      entity = Room.fromJson(jsonDecode(jsonEncode(widget.room)));
      controller.text = entity.deviceId ?? "";
      if (controller.text.isNotEmpty) {
        _fieldKey.currentState?.didChange(controller.text);
      }
    } else {
      entity = Room();
    }
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void initPlatformState() {
    String? platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _espBlufiPlugin.getPlatformVersion().then((version) {
        platformVersion = version;
        setState(() {
          inited = true;
        });
      });
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    _espBlufiPlugin.onMessageReceived(successCallback: (String? data) async {
      print("success data: $data");
      Map<String, dynamic> mapData = json.decode(data ?? "");
      if (mapData.containsKey('key')) {
        String key = mapData['key'];
        if (key == 'receive_device_custom_data') {
          String? deviceId = mapData['value'];
          if (deviceId != null) {
            entity.deviceId = deviceId;
            controller.setText(deviceId);
            // 手动触发didChange方法
            _fieldKey.currentState?.didChange(controller.text);
            Fluttertoast.showToast(msg: S.of(context).scanned_device);
          }
        } else if (key == 'ble_scan_result') {
          Map<String, dynamic> peripheral = mapData['value'];
          String? address = peripheral['address'];
          String name = peripheral['name'];
          String rssi = peripheral['rssi'];
          if (address != null && !blueToothList.any((element) => element.address == address)) {
            setState(() {
              blueToothList.add(BlueTooth(name: name, address: address, rssi: rssi));
            });
          }
          // scanResult[address] = name;
        } else if (key == "peripheral_disconnect") {
          if (mapData['value'] == "1") {
            // connected = false;
          }
        } else if (key == "device_wifi_connect") {
          _isProvisioning = false;
          _provisionTimeoutTimer?.cancel();
          EasyLoading.dismiss();
          String? value = mapData['value'];
          if (value == "1") {
            // 当收到 device_wifi_connect 的value ==1 时，成功
            Fluttertoast.showToast(msg: S.of(context).wifi_config_success_tip, gravity: ToastGravity.CENTER);
            Navigator.of(context).pop();
          } else {
            // 当收到 device_wifi_connect 的value ==0 时，失败
            Fluttertoast.showToast(msg: S.of(context).wifi_config_failure_tip, gravity: ToastGravity.CENTER);
          }
        }
      }
    }, errorCallback: (String? error) {
      print(error);
    });
  }

  @override
  Future<void> dispose() async {
    await _espBlufiPlugin.requestCloseConnection();
    if (scanning) {
      stopScan();
    }
    _espBlufiPlugin.onMessageReceived(successCallback: null, errorCallback: null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // BrnInitializer.register(allThemeConfig: BrunoThemeConfig.lightBrnTheme());
    return Scaffold(
        appBar: AppBar(title: Text("${widget.room != null ? S.of(context).edit : S.of(context).create} Room")),
        body: Form(
            key: formKey, //设置globalKey，用于后面获取FormState
            child: Column(
              children: [
                TextInputFormField(
                    title: S.of(context).room_roomName,
                    isRequire: true,
                    placeholder: '${S.of(context).input}${S.of(context).room_roomName}',
                    maxCharCount: 32,
                    initialValue: entity.roomName,
                    validators: [Validator.required(context)],
                    onSaved: (value) {
                      entity.roomName = value;
                    }),
                TextInputFormField(
                    key: _fieldKey,
                    title: S.of(context).sensorRecord_deviceId,
                    isRequire: true,
                    isEdit: widget.bCreate,
                    placeholder: '${S.of(context).input}${S.of(context).sensorRecord_deviceId}',
                    maxCharCount: 32,
                    controller: controller,
                    initialValue: entity.deviceId ?? "",
                    validators: [Validator.required(context)],
                    onChanged: (value) {
                      entity.deviceId = value;
                    },
                    onSaved: (value) {
                      entity.deviceId = value;
                    }),
                TextAreaInputFormFiled(
                    title: S.of(context).room_remark,
                    maxCharCount: 255,
                    placeholder: S.of(context).farm_description_input_tip,
                    initialValue: entity.remark,
                    onSaved: (value) {
                      entity.remark = value;
                    }),
                GestureDetector(
                    onTap: () async {
                      await requestBlePermissions();
                      if (scanning) {
                        stopScan();
                      } else {
                        Fluttertoast.showToast(msg: S.of(context).bluetooth_device_connect_tip, gravity: ToastGravity.CENTER);
                        _espBlufiPlugin.scanDeviceInfo(filterString: Constants.CONNECTED_BLUETOOTH_DEVICE_NAME).then((value) {
                          setState(() {
                            scanning = true;
                            // connected = false;
                          });
                        });
                      }
                    },
                    child: BlueScanButton(scanning: scanning, inited: inited)),
                Padding(padding: EdgeInsets.only(left: 24.sp), child: Text(S.of(context).bluetooth_device_list)),
                Expanded(
                    child: ListView(
                        children: blueToothList
                            .map((e) => ListTile(
                                  title: Text(e.name),
                                  subtitle: Text(e.address),
                                  leading: Text(e.rssi),
                                  trailing: SizedBox(
                                      width: 136.sp,
                                      child: Row(children: [
                                        GestureDetector(
                                            onTap: () {
                                              if (e.connected) {
                                                showWifiListDialog((userName, password) {
                                                  if (_isProvisioning) return;
                                                  _isProvisioning = true;
                                                  //发送配网命令
                                                  EasyLoading.show();
                                                  _espBlufiPlugin.configProvision(username: userName, password: password);
                                                  _provisionTimeoutTimer = Timer(Duration(seconds: 20), () {
                                                    if (!_isProvisioning) return;
                                                    _isProvisioning = false;
                                                    EasyLoading.dismiss();
                                                    Fluttertoast.showToast(msg: S.of(context).wifi_config_timeout, gravity: ToastGravity.CENTER);
                                                  });
                                                });
                                              } else {
                                                Fluttertoast.showToast(msg: S.of(context).bluetooth_connect_tip, gravity: ToastGravity.CENTER);
                                              }
                                            },
                                            child: Icon(Icons.wifi_rounded, color: e.connected ? Colors.green : null)),
                                        SizedBox(width: 22.sp),
                                        GestureDetector(
                                          onTap: () {
                                            if (e.connected) {
                                              DialogAlert.confirm(context, onOk: () {
                                                _espBlufiPlugin.requestCloseConnection().then((value) {
                                                  setState(() {
                                                    e.connected = false;
                                                  });
                                                });
                                              }, title: S.of(context).bluetooth_disconnect);
                                            } else {
                                              bool connected = blueToothList.any((blueTooth) => blueTooth.connected);
                                              if (connected) {
                                                Fluttertoast.showToast(msg: S.of(context).bluetooth_connect_only_one_tip);
                                              } else {
                                                DialogAlert.confirm(context, onOk: () {
                                                  _espBlufiPlugin.connectPeripheral(peripheralAddress: e.address).then((value) {
                                                    setState(() {
                                                      e.connected = true;
                                                    });
                                                    Fluttertoast.showToast(msg: S.of(context).connected_success);
                                                  });
                                                }, title: S.of(context).bluetooth_connect);
                                              }
                                            }
                                          },
                                          child: Icon(e.connected ? Icons.bluetooth_connected : Icons.bluetooth_disabled, color: e.connected ? Colors.blue : null),
                                        )
                                      ])),
                                ))
                            .toList())),
                // TextButton(
                //     onPressed: () async {
                //       await BlufiPlugin.instance.stopScan();
                //     },
                //     child: Text('Stop Scan')),
                // TextButton(
                //     onPressed: () async {
                //       await BlufiPlugin.instance.connectPeripheral(peripheralAddress: scanResult.keys.first);
                //     },
                //     child: Text('Connect Peripheral')),
                // TextButton(
                //     onPressed: () async {
                //       await BlufiPlugin.instance.requestCloseConnection();
                //     },
                //     child: Text('Close Connect')),
                // TextButton(
                //     onPressed: () async {
                //       await BlufiPlugin.instance.configProvision(username: 'ABCXYZ', password: '0913456789');
                //     },
                //     child: Text('Config Provision')),
                // TextButton(
                //     onPressed: () async {
                //       String command = '12345678';
                //       await BlufiPlugin.instance.postCustomData(command);
                //     },
                //     child: Text('Send Custom Data')),
                // Text(contentJson ?? '')
              ],
            )),
        bottomNavigationBar: MainButton(
          margin: EdgeInsets.only(bottom: 30.sp, left: 24.sp, right: 24.sp),
          onPressed: () {
            submitForm();
          },
          text: S.of(context).save,
        ));
  }

  Future<void> stopScan() async {
    setState(() {
      scanning = false;
    });

    await _espBlufiPlugin.stopScan();
  }

  Future<void> requestBlePermissions() async {
    // Android 12+
    if (await Permission.bluetoothScan.isDenied) {
      await Permission.bluetoothScan.request();
    }
    if (await Permission.bluetoothConnect.isDenied) {
      await Permission.bluetoothConnect.request();
    }

    // Android 10+
    if (await Permission.locationWhenInUse.isDenied) {
      await Permission.locationWhenInUse.request();
    }
  }

  @override
  onValidSuccess(Room formValue) {
    if (widget.room != null) {
      RoomController.updateRoom(formValue).then((value) {
        Fluttertoast.showToast(msg: S.of(context).update_success);
        Navigator.of(context).pop(value);
      }, onError: (error) {
        Fluttertoast.showToast(msg: S.of(context).update_failure);
      }).whenComplete(() => submitted = false);
    } else {
      RoomController.addRoom(formValue).then((value) {
        Fluttertoast.showToast(msg: S.of(context).create_success);
        Navigator.of(context).pop(value);
      }, onError: (error) {
        Fluttertoast.showToast(msg: S.of(context).create_failure);
      }).whenComplete(() => submitted = false);
    }
  }
}

class BlueTooth {
  String address;
  String name;
  String rssi;
  bool connected;

  BlueTooth({required this.name, required this.address, required this.rssi, this.connected = false}) {}
}
