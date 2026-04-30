import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:esp_blufi/esp_blufi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:planter_app/Constants.dart';
import 'package:planter_app/ui/DialogAlert.dart';

import '../../../../generated/l10n.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../room/WifiScanner.dart';

class DeviceScanPage extends StatefulWidget {
  final bool isAddDevice;

  const DeviceScanPage({Key? key, this.isAddDevice = false}) : super(key: key);

  @override
  _DeviceScanPageState createState() => _DeviceScanPageState();
}

class _DeviceScanPageState extends State<DeviceScanPage> with WifiScanner {

  late StreamSubscription _subscription;

  final _espBlufiPlugin = EspBlufi();

  bool scanning = false;

  bool connected = false;

  BluetoothAdapterState state = BluetoothAdapterState.unknown;

  bool bInit = false;

  Timer? _provisionTimeoutTimer;

  Timer? setupTimer ;
  Timer? connectedTimeoutTimer;

  List<BlueTooth> blueToothList = [];

  String? deviceId;

  SetupState setupState = SetupState.unknown;

  @override
  void initState() {
    super.initState();
    _subscription = FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
      setState(() {
        this.state = state;
      });
    });
    initPlatformState();
    state = FlutterBluePlus.adapterStateNow;
    _scannerBlueDevice();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void initPlatformState() {
    String? platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _espBlufiPlugin.getPlatformVersion().then((version) {
        platformVersion = version;
        setState(() {
          bInit = true;
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
      if (!mounted) return;

      Map<String, dynamic> mapData = json.decode(data ?? "");
      if (mapData.containsKey('key')) {
        String key = mapData['key'];
        if (key == 'receive_device_custom_data') {
          String? deviceId = mapData['value'];
          this.deviceId = deviceId;
        } else if (key == 'ble_scan_result') {
          Map<String, dynamic> peripheral = mapData['value'];
          String? address = peripheral['address'];
          String name = peripheral['name'];
          String rssi = peripheral['rssi'];
          if (address != null) {
            BlueTooth element = BlueTooth(name: name, address: address, rssi: rssi);
            final int index = blueToothList.indexWhere((d) => d.address == element.address);
            setState(() {
              if (index < 0 ) {
                blueToothList.add(element);
              } else {
                blueToothList[index] = element;
              }
            });
          }
          // scanResult[address] = name;
        } else if (key == "peripheral_connect") {
          if (mapData['value'] == "1") {
            connected = true;
          }
        } else if(key == "peripheral_disconnect"){
          if (mapData['value'] == "1") {
            connected = false;
          }
        }else if (key == "device_wifi_connect") {
          setupState = SetupState.doWifiConnected;
          _provisionTimeoutTimer?.cancel();
          String? value = mapData['value'];
          if (value == "1") {
            // 当收到 device_wifi_connect 的value ==1 时，成功
            //Fluttertoast.showToast(msg: S.of(context).wifi_config_success_tip, gravity: ToastGravity.CENTER);
            EasyLoading.showSuccess(S.of(context).wifi_config_success_tip);
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
  void dispose() {
    _subscription.cancel();
    _provisionTimeoutTimer?.cancel();
    setupTimer?.cancel();
    connectedTimeoutTimer?.cancel();

    try {
      _espBlufiPlugin.onMessageReceived(successCallback: null, errorCallback: null);
      if (connected) {
        _espBlufiPlugin.requestCloseConnection();
      }
      if (scanning) {
        _espBlufiPlugin.stopScan();
      }
    }catch(e){
      debugPrint("############### e $e");
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    requestBlePermissions();

    Widget body = const SizedBox();
    if (state == BluetoothAdapterState.off) {
      body = _buildBlueOffWidget(context);
    } else {
      body =  _scanDeviceWidget(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).network_configure),
        centerTitle: true,
      ),
      body: body,
      bottomNavigationBar: _buildNotFoundTip(context),
    );
  }

  Widget _buildBlueOffWidget(BuildContext context) {
    return Center (
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //const Icon(Icons.bluetooth_disabled, size: 45,),
          //const Padding(padding: EdgeInsetsGeometry.only(top: 10)),
          //Text(S.of(context).bluetooth_not_on_tip, style: const TextStyle(fontSize: 16),),
          //const Padding(padding: EdgeInsetsGeometry.only(top: 10)),
          Text(S.of(context).open_bluetooth_tip),
          const Padding(padding: EdgeInsetsGeometry.only(top: 10)),
          ElevatedButton.icon(
            onPressed: () async {
              await openBluetooth();
            },
            //icon: const Icon(Icons.add, color: Colors.white), // 图标
            //icon: const Icon(Icons.bluetooth_disabled, size: 45 ),
            label: Text(S.of(context).open_bluetooth, style: const TextStyle(color: Colors.white)), // 文字
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColorLight,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.sp)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
            ),
          ),

          // TextButton(
          //     child: Text(S.of(context).open_bluetooth),
          //     onPressed: () async {
          //       await openBluetooth();
          //     }
          // )
        ],
      ),
    );
  }

  Widget _buildScannerTip(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          if (blueToothList.isEmpty && scanning) ...[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.bluetooth_audio, size: 45,),
                  const Padding(padding: EdgeInsetsGeometry.only(top: 10)),
                  Text(S.of(context).not_found_device_tip, style: TextStyle(fontSize: 18),),
                  const Padding(padding: EdgeInsetsGeometry.only(top: 10)),
                  Text("1.${S.of(context).confirm_device_power_on_tip}"),
                  Text("2.${S.of(context).confirm_device_search_range_tip}"),
                ],
              ),
            ),
          ],

          if (blueToothList.isEmpty && scanning == false) ...[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.bluetooth_audio, size: 45,),
                  const Padding(padding: EdgeInsetsGeometry.only(top: 10)),
                  Text(S.of(context).not_found_device_tip, style: TextStyle(fontSize: 18),),
                  const Padding(padding: EdgeInsetsGeometry.only(top: 10)),
                  Text("1.${S.of(context).confirm_device_power_on_tip}"),
                  Text("2.${S.of(context).confirm_device_search_range_tip}"),
                  Text("3.${S.of(context).device_re_search_tip}"),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _scanDeviceWidget(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () {
          if (scanning) {
            return Future.value();
          }
          return _scannerBlueDevice();
        },
        child: Column (
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(visible: scanning, child: const LinearProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue))),
              Expanded(
                child: _buildBluetoothListView(),
              ),
            ]
        ),
    );
  }

  Widget _buildNotFoundTip(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      //padding: const EdgeInsetsGeometry.only(top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Icon(Icons.bluetooth_audio, size: 45,),
          //Padding(padding: EdgeInsetsGeometry.only(top: 10)),
          //const Divider(),
          const Padding(padding: EdgeInsetsGeometry.only(top: 10)),
          Text(S.of(context).not_found_device_tip, style: TextStyle(fontSize: 16),),
          const Padding(padding: EdgeInsetsGeometry.only(top: 5)),
          Text("1.${S.of(context).confirm_device_power_on_tip}"),
          Text("2.${S.of(context).confirm_device_search_range_tip}"),
          Text("3.${S.of(context).device_re_search_tip}"),
          const Padding(padding: EdgeInsetsGeometry.only(bottom: 20)),
        ],
      ),
    );
  }

  Widget _buildBluetoothListView() {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: blueToothList.length,
      itemBuilder: (context, index) {
        BlueTooth blueTooth = blueToothList[index];
        return ListTileTheme(
          data: Theme.of(context).listTileTheme.copyWith(
              titleTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w600
              )
          ),
          child: ListTile(
              title: Text(blueTooth.name),
              subtitle: Text(blueTooth.address),
              leading: const Icon(Icons.bluetooth_connected),
              trailing: SizedBox(
                  width: 150.sp,
                  child: Row(children: [
                    Text(blueTooth.rssi),
                    SizedBox(width: 50.sp,),
                    Icon(Icons.arrow_forward_ios, size: 24.sp),
                  ])
              ),
              onTap: () async {
                _stopScanBlueDevice();
                await disconnectedBlueDevice();
                DialogAlert.connectBlueToothConfirm(context, () async {
                  setupState = SetupState.doConnecting;
                  setupTimer = Timer.periodic(const Duration(seconds: 1), _setupTimerWork);
                  connectedTimeoutTimer = Timer(const Duration(seconds: 20), _timeoutConnected);

                  EasyLoading.show(status: S.of(context).do_connecting, maskType: EasyLoadingMaskType.clear);
                  await _espBlufiPlugin.connectPeripheral(peripheralAddress: blueTooth.address);
                });
              }),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 10.sp);
      },
    );
  }

  Future<void> _timeoutProvision() async {
    //Fluttertoast.showToast(msg: S.of(context).wifi_config_timeout, gravity: ToastGravity.CENTER);
    EasyLoading.showError(S.of(context).wifi_config_timeout);

    setupState = SetupState.unknown;

    setupTimer?.cancel();
    setupTimer = null;

    connectedTimeoutTimer?.cancel();
    connectedTimeoutTimer = null;
  }

  Future<void> _timeoutConnected() async {
    EasyLoading.showError(S.of(context).bluetooth_connect_timeout);

    setupState = SetupState.unknown;

    setupTimer?.cancel();
    setupTimer = null;

    _provisionTimeoutTimer?.cancel();
    _provisionTimeoutTimer = null;
  }

  Future<void> _setupTimerWork(timer) async {
    if (setupState == SetupState.doConnecting){
      if(deviceId != null && connected) {
        setupState = SetupState.doConnected;

        connectedTimeoutTimer?.cancel();
        connectedTimeoutTimer = null;
      }
    }
    if (setupState == SetupState.doConnected) {
      setupState = SetupState.doWifiConnecting;

      EasyLoading.dismiss();
      showWifiInputDialog(configNetwork : (userName, password) {
        Navigator.of(context).pop();
        EasyLoading.show(status: S.of(context).do_config_network, maskType: EasyLoadingMaskType.clear);
        _espBlufiPlugin.configProvision(username: userName, password: password);
        _provisionTimeoutTimer = Timer(const Duration(seconds: 20), _timeoutProvision);
      }, cancel: (){
        setupTimer?.cancel();
        setupTimer = null;

        setupState = SetupState.unknown;
      });
    }
    if (setupState == SetupState.doWifiConnected) {
      setupState = SetupState.unknown;
      setupTimer?.cancel();
      setupTimer = null;

      if (widget.isAddDevice) {
        Navigator.of(context).pop(deviceId);
      }
    }
  }

  Future<void > _scannerBlueDevice() async {
    disconnectedBlueDevice();
    if (!scanning) {
      _espBlufiPlugin.scanDeviceInfo(filterString: Constants.CONNECTED_BLUETOOTH_DEVICE_NAME).then((value) {
        setState(() {
          scanning = true;
          blueToothList.clear();
        });
      });
      Future.delayed(const Duration(seconds: 20), _stopScanBlueDevice);
    }
  }

  Future<void > _stopScanBlueDevice() async {
    setState(() {
      scanning = false;
    });
    await _espBlufiPlugin.stopScan();
  }

  Future<void> disconnectedBlueDevice() async {
    if (connected) {
      return _espBlufiPlugin.requestCloseConnection();
    }
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

  Future<void> openBluetooth() async {
    // 检查位置权限（对于Android 6.0及以上版本）
    var status = await Permission.locationWhenInUse.status;
    if (!status.isGranted) {
      await Permission.locationWhenInUse.request();
    }
    if (await FlutterBluePlus.isSupported == false) {
      return;
    }
    // turn on bluetooth ourself if we can
    // for iOS, the user controls bluetooth enable/disable
    if (Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
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

enum SetupState {
  unknown,
  doConnecting,
  doConnected,
  doWifiConnecting,
  doWifiConnected;
}

