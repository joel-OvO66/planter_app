// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(note_noteType) =>
      "${Intl.select(note_noteType, {'WATERING': 'Watering', 'NUTRIENTS': 'Nutrients', 'PEST_CONTROL': 'Pest Control', 'TRIM': 'Trim', 'LIGHT_SCHEDULE': 'Light Schedule', 'HEIGHT': 'Height', 'LAMP_TO_PLANT_DISTANCE': 'Lamp To Plant Distance', 'POT_SIZE': 'Pot Size', 'TEMPERATURE_HUMIDITY': 'Temperature Humidity', 'CO2': 'Co2', 'TRANING': 'Traning', 'ROOT_PH': 'Root Ph', 'OTHER': 'Other', 'other': '-'})}";

  static String m1(role_defaultRole) =>
      "${Intl.select(role_defaultRole, {'STAFF': '默认角色', 'MAINTAIN_USER': '保养人员', 'REPAIR_USER': '维修人员', 'PRECISE_USER': '精密度检查人员', 'MANAGER': '厂区管理员', 'ADMIN': '系统管理员', 'other': '-'})}";

  static String m2(room_roomState) =>
      "${Intl.select(room_roomState, {'NORMAL': '正常', 'ALARM': '报警', 'OPERATING': '操作中', 'other': '-'})}";

  static String m3(sceneSetting_settingType) =>
      "${Intl.select(sceneSetting_settingType, {'SEEDING': 'Seedling', 'VEGETATIVE': 'Vegetative', 'FLOWERING': 'Flowering', 'other': '-'})}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "I_agree": MessageLookupByLibrary.simpleMessage("I agree"),
    "account_login": MessageLookupByLibrary.simpleMessage("SIGN IN"),
    "account_settings": MessageLookupByLibrary.simpleMessage(
      "Account Settings",
    ),
    "agree": MessageLookupByLibrary.simpleMessage("Agree"),
    "and": MessageLookupByLibrary.simpleMessage("and"),
    "appName": MessageLookupByLibrary.simpleMessage("CannaPro"),
    "apply": MessageLookupByLibrary.simpleMessage("Apply"),
    "authCustomer_avatar": MessageLookupByLibrary.simpleMessage("头像地址"),
    "authCustomer_email": MessageLookupByLibrary.simpleMessage("姓名"),
    "authCustomer_extend": MessageLookupByLibrary.simpleMessage("扩展数据"),
    "authCustomer_id": MessageLookupByLibrary.simpleMessage("帐号ID"),
    "authCustomer_name": MessageLookupByLibrary.simpleMessage("帐号名称"),
    "authCustomer_password": MessageLookupByLibrary.simpleMessage("密码"),
    "authCustomer_token": MessageLookupByLibrary.simpleMessage("token"),
    "auto": MessageLookupByLibrary.simpleMessage("Auto"),
    "auto_fan_setting": MessageLookupByLibrary.simpleMessage(
      "Auto Fan Setting",
    ),
    "auto_light_setting": MessageLookupByLibrary.simpleMessage(
      "Auto Light Setting",
    ),
    "auto_sync_dev_time": MessageLookupByLibrary.simpleMessage(
      "Sync time to the device",
    ),
    "auto_vent_setting": MessageLookupByLibrary.simpleMessage(
      "Auto Ventilator Setting",
    ),
    "bluetooth_connect": MessageLookupByLibrary.simpleMessage(
      "Are you sure connected to this Bluetooth？",
    ),
    "bluetooth_connect_only_one_tip": MessageLookupByLibrary.simpleMessage(
      "There is already a Bluetooth connected, please disconnect it first!",
    ),
    "bluetooth_connect_timeout": MessageLookupByLibrary.simpleMessage(
      "Bluetooth connect timeout !",
    ),
    "bluetooth_connect_tip": MessageLookupByLibrary.simpleMessage(
      "Please connect to this Bluetooth first!",
    ),
    "bluetooth_device_connect_tip": MessageLookupByLibrary.simpleMessage(
      "Click on the icon on the right side of the scanned Bluetooth device list to connect the device and automatically obtain the device code",
    ),
    "bluetooth_device_list": MessageLookupByLibrary.simpleMessage(
      "Scanned Bluetooth devices",
    ),
    "bluetooth_disconnect": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to disconnect？",
    ),
    "bluetooth_not_on_tip": MessageLookupByLibrary.simpleMessage(
      "Mobile bluetooth function, not turned on",
    ),
    "camera_cameraName": MessageLookupByLibrary.simpleMessage("-"),
    "camera_cameraType": MessageLookupByLibrary.simpleMessage("-"),
    "camera_playUrl": MessageLookupByLibrary.simpleMessage("-"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "centimeter": MessageLookupByLibrary.simpleMessage("Centimeter"),
    "clear_cache": MessageLookupByLibrary.simpleMessage("Clear Cache"),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "common": MessageLookupByLibrary.simpleMessage("Common"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage(
      "Please confirm password",
    ),
    "confirm_connect_bluetooth": MessageLookupByLibrary.simpleMessage(
      "Are you sure to connect this bluetooth?\nAnd configure device network",
    ),
    "confirm_delete": MessageLookupByLibrary.simpleMessage(
      "Are you sure to delete it?",
    ),
    "confirm_device_power_on_tip": MessageLookupByLibrary.simpleMessage(
      "Make sure the nearby device is powered on.",
    ),
    "confirm_device_search_range_tip": MessageLookupByLibrary.simpleMessage(
      "Move your mobile phone closer to your device.",
    ),
    "confirm_logout": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to log out？",
    ),
    "confirm_open": MessageLookupByLibrary.simpleMessage(
      "Are you sure to open it？",
    ),
    "confirm_unsaved": MessageLookupByLibrary.simpleMessage(
      "Do you want to save the changes？",
    ),
    "connected_success": MessageLookupByLibrary.simpleMessage(
      "Connected success!",
    ),
    "create": MessageLookupByLibrary.simpleMessage("Create"),
    "create_account": MessageLookupByLibrary.simpleMessage("Create Account"),
    "create_failure": MessageLookupByLibrary.simpleMessage("Created failure!"),
    "create_farm": MessageLookupByLibrary.simpleMessage("Create Garden"),
    "create_note": MessageLookupByLibrary.simpleMessage("Create note"),
    "create_plant_tip": MessageLookupByLibrary.simpleMessage(
      "You can click to create a new plant!",
    ),
    "create_room": MessageLookupByLibrary.simpleMessage("Create device"),
    "create_room_manual": MessageLookupByLibrary.simpleMessage(
      "Create device manually",
    ),
    "create_room_scan": MessageLookupByLibrary.simpleMessage("Add Device"),
    "create_success": MessageLookupByLibrary.simpleMessage("Created success!"),
    "current_mode": MessageLookupByLibrary.simpleMessage("Current Mode"),
    "cycle": MessageLookupByLibrary.simpleMessage("Cycle"),
    "cycle_schedule": MessageLookupByLibrary.simpleMessage("Cycle Schedule"),
    "dashBoard": MessageLookupByLibrary.simpleMessage("Dash Board"),
    "dash_fan": MessageLookupByLibrary.simpleMessage("Fan"),
    "dash_lighting": MessageLookupByLibrary.simpleMessage("Lighting"),
    "dash_running_status": MessageLookupByLibrary.simpleMessage(
      "Running Status",
    ),
    "dash_ventilator": MessageLookupByLibrary.simpleMessage("Ventilator"),
    "date_day": MessageLookupByLibrary.simpleMessage("Day"),
    "date_hour": MessageLookupByLibrary.simpleMessage("Hours"),
    "date_minute": MessageLookupByLibrary.simpleMessage("Minutes"),
    "date_month": MessageLookupByLibrary.simpleMessage("Month"),
    "date_second": MessageLookupByLibrary.simpleMessage("Seconds"),
    "date_year": MessageLookupByLibrary.simpleMessage("Year"),
    "days_ago": MessageLookupByLibrary.simpleMessage(" days ago"),
    "delete_user": MessageLookupByLibrary.simpleMessage("Delete Account"),
    "delete_user_confirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete your account？This action will erase all data permanently",
    ),
    "dev_key_sound": MessageLookupByLibrary.simpleMessage("Key sound"),
    "dev_key_sound_setting": MessageLookupByLibrary.simpleMessage(
      "Key Sound Setting",
    ),
    "device_re_search_tip": MessageLookupByLibrary.simpleMessage(
      "Swipe down on the screen to search again.",
    ),
    "device_setting": MessageLookupByLibrary.simpleMessage("Device setting"),
    "dim": MessageLookupByLibrary.simpleMessage("Dim"),
    "disabled": MessageLookupByLibrary.simpleMessage("Disabled"),
    "do_config_network": MessageLookupByLibrary.simpleMessage(
      "Config network...",
    ),
    "do_connecting": MessageLookupByLibrary.simpleMessage("Connecting..."),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "emptyData": MessageLookupByLibrary.simpleMessage("No data"),
    "enabled": MessageLookupByLibrary.simpleMessage("Enabled"),
    "endDate": MessageLookupByLibrary.simpleMessage("End Date"),
    "environment": MessageLookupByLibrary.simpleMessage("Environment"),
    "executeFailure": MessageLookupByLibrary.simpleMessage("Send failure!"),
    "executeSuccess": MessageLookupByLibrary.simpleMessage("Send success!"),
    "exit": MessageLookupByLibrary.simpleMessage("Press again to exit"),
    "fan": MessageLookupByLibrary.simpleMessage("Circulation Fan"),
    "fanSchedule_enable": MessageLookupByLibrary.simpleMessage("-"),
    "fanSchedule_highTemp": MessageLookupByLibrary.simpleMessage("-"),
    "fanSchedule_lowTemp": MessageLookupByLibrary.simpleMessage("-"),
    "fanSchedule_workLevel": MessageLookupByLibrary.simpleMessage("-"),
    "fanSchedule_workTime": MessageLookupByLibrary.simpleMessage("-"),
    "farm": MessageLookupByLibrary.simpleMessage("Garden"),
    "farm_address": MessageLookupByLibrary.simpleMessage("地址"),
    "farm_description_input_tip": MessageLookupByLibrary.simpleMessage(
      "Enter a description",
    ),
    "farm_enabled": MessageLookupByLibrary.simpleMessage("是否启用"),
    "farm_farmId": MessageLookupByLibrary.simpleMessage("无注释"),
    "farm_farmName": MessageLookupByLibrary.simpleMessage("Garden name"),
    "farm_farmName_input_tip": MessageLookupByLibrary.simpleMessage(
      "Enter a garden name",
    ),
    "farm_latLng": MessageLookupByLibrary.simpleMessage("临时字段：坐标"),
    "farm_management": MessageLookupByLibrary.simpleMessage(
      "Garden Management",
    ),
    "farm_position": MessageLookupByLibrary.simpleMessage("坐标"),
    "farm_remark": MessageLookupByLibrary.simpleMessage("Description"),
    "farm_users": MessageLookupByLibrary.simpleMessage("农场下的用户"),
    "farms_list_empty_tip_add": MessageLookupByLibrary.simpleMessage(
      "Garden is empty, Add a garden now !",
    ),
    "feedback": MessageLookupByLibrary.simpleMessage("Feedback"),
    "feedback_content": MessageLookupByLibrary.simpleMessage("Content"),
    "feedback_feedId": MessageLookupByLibrary.simpleMessage("-"),
    "feedback_handleTime": MessageLookupByLibrary.simpleMessage("Handle Time"),
    "feedback_handler": MessageLookupByLibrary.simpleMessage("Handler"),
    "feedback_reply": MessageLookupByLibrary.simpleMessage("Reply"),
    "feedback_user": MessageLookupByLibrary.simpleMessage("User"),
    "filming": MessageLookupByLibrary.simpleMessage("Filming"),
    "forgetPassword": MessageLookupByLibrary.simpleMessage("Forget Password"),
    "growPlan": MessageLookupByLibrary.simpleMessage("Grow Plan"),
    "grow_date_range": MessageLookupByLibrary.simpleMessage("Date Range"),
    "growthStage": MessageLookupByLibrary.simpleMessage("Grow Stage"),
    "growthStage_plant": MessageLookupByLibrary.simpleMessage("-"),
    "growthStage_stageId": MessageLookupByLibrary.simpleMessage("-"),
    "hello": MessageLookupByLibrary.simpleMessage("Hello"),
    "hour": MessageLookupByLibrary.simpleMessage("Hours"),
    "humidity": MessageLookupByLibrary.simpleMessage("Humidity"),
    "inch": MessageLookupByLibrary.simpleMessage("Inch"),
    "initializing": MessageLookupByLibrary.simpleMessage("Initializing"),
    "input": MessageLookupByLibrary.simpleMessage("Please input "),
    "inputEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter your Email!",
    ),
    "inputPassword": MessageLookupByLibrary.simpleMessage(
      "Please input a password",
    ),
    "inputPasswordNumber": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least 8 characters include letters and number.",
    ),
    "inputPasswordSize": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least 8 characters include letters and number.",
    ),
    "inputUsername": MessageLookupByLibrary.simpleMessage(
      "Please enter your username or phone number!",
    ),
    "inputUsernamePassword": MessageLookupByLibrary.simpleMessage(
      "Please enter your Email and password!",
    ),
    "inside": MessageLookupByLibrary.simpleMessage("Inside"),
    "inside_humidity_alert": MessageLookupByLibrary.simpleMessage(
      "Inside Humidity Alert",
    ),
    "inside_temperature_alert": MessageLookupByLibrary.simpleMessage(
      "Inside Temperature Alert",
    ),
    "lang_en": MessageLookupByLibrary.simpleMessage("English"),
    "lang_zh_CN": MessageLookupByLibrary.simpleMessage("简体中文"),
    "lang_zh_TW": MessageLookupByLibrary.simpleMessage("繁体中文"),
    "latLng": MessageLookupByLibrary.simpleMessage("位置"),
    "latLng_alt": MessageLookupByLibrary.simpleMessage("-"),
    "latLng_lat": MessageLookupByLibrary.simpleMessage("-"),
    "latLng_lng": MessageLookupByLibrary.simpleMessage("-"),
    "light": MessageLookupByLibrary.simpleMessage("Grow Light"),
    "loading": MessageLookupByLibrary.simpleMessage("loading..."),
    "lock_screen_setting": MessageLookupByLibrary.simpleMessage(
      "Lock Screen Setting",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginAgree": MessageLookupByLibrary.simpleMessage("I agree to the"),
    "logoff": MessageLookupByLibrary.simpleMessage("Log off"),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "manModeParam_dim1Per": MessageLookupByLibrary.simpleMessage("-"),
    "manModeParam_dim2Per": MessageLookupByLibrary.simpleMessage("-"),
    "manModeParam_dim3Per": MessageLookupByLibrary.simpleMessage("-"),
    "manModeParam_fanLevel": MessageLookupByLibrary.simpleMessage("-"),
    "manModeParam_fanOffTime": MessageLookupByLibrary.simpleMessage("-"),
    "manModeParam_fanOnTime": MessageLookupByLibrary.simpleMessage("-"),
    "manModeParam_schEnable": MessageLookupByLibrary.simpleMessage("-"),
    "manModeParam_schEndDate": MessageLookupByLibrary.simpleMessage("-"),
    "manModeParam_schEndTime": MessageLookupByLibrary.simpleMessage("-"),
    "manModeParam_schStartDate": MessageLookupByLibrary.simpleMessage("-"),
    "manModeParam_schStartTime": MessageLookupByLibrary.simpleMessage("-"),
    "manModeParam_ventLevel": MessageLookupByLibrary.simpleMessage("-"),
    "manModeParam_ventOffTime": MessageLookupByLibrary.simpleMessage("-"),
    "manModeParam_ventOnTime": MessageLookupByLibrary.simpleMessage("-"),
    "manual": MessageLookupByLibrary.simpleMessage("Manual"),
    "manual_fan_setting": MessageLookupByLibrary.simpleMessage(
      "Manual Fan Setting",
    ),
    "manual_light_setting": MessageLookupByLibrary.simpleMessage(
      "Manual Light Setting",
    ),
    "manual_vent_setting": MessageLookupByLibrary.simpleMessage(
      "Manual Ventilator Setting",
    ),
    "minute": MessageLookupByLibrary.simpleMessage("Minutes"),
    "mode": MessageLookupByLibrary.simpleMessage("模式(Mode)实体类"),
    "modeItem": MessageLookupByLibrary.simpleMessage("模式项(ModeItem)实体类"),
    "modeItem_itemId": MessageLookupByLibrary.simpleMessage("ITEM_ID"),
    "modeItem_itemName": MessageLookupByLibrary.simpleMessage("-"),
    "modeItem_mode": MessageLookupByLibrary.simpleMessage("-"),
    "modeItem_sortIndex": MessageLookupByLibrary.simpleMessage("排序"),
    "mode_modeId": MessageLookupByLibrary.simpleMessage("MODE_ID"),
    "mode_modeItems": MessageLookupByLibrary.simpleMessage("-"),
    "mode_modeName": MessageLookupByLibrary.simpleMessage("模式名称"),
    "mode_room": MessageLookupByLibrary.simpleMessage("-"),
    "mode_tenantId": MessageLookupByLibrary.simpleMessage("农场"),
    "monday": MessageLookupByLibrary.simpleMessage("Monday"),
    "more": MessageLookupByLibrary.simpleMessage("More"),
    "navBar_data": MessageLookupByLibrary.simpleMessage("Data"),
    "navBar_home": MessageLookupByLibrary.simpleMessage("Home"),
    "navBar_plant": MessageLookupByLibrary.simpleMessage("Plants"),
    "navBar_profile": MessageLookupByLibrary.simpleMessage("More"),
    "network_configure": MessageLookupByLibrary.simpleMessage(
      "Network Setting",
    ),
    "network_connect_error": MessageLookupByLibrary.simpleMessage(
      "Network connect error",
    ),
    "network_unknown_error": MessageLookupByLibrary.simpleMessage(
      "Unknown error",
    ),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "noAccount": MessageLookupByLibrary.simpleMessage("No account？"),
    "no_rooms": MessageLookupByLibrary.simpleMessage(
      "There are no devices. Add it now.",
    ),
    "not_found_device_tip": MessageLookupByLibrary.simpleMessage(
      "No Device Found?",
    ),
    "note": MessageLookupByLibrary.simpleMessage("Note"),
    "note_attachments": MessageLookupByLibrary.simpleMessage("Attachments"),
    "note_co2Level": MessageLookupByLibrary.simpleMessage("CO2"),
    "note_distance": MessageLookupByLibrary.simpleMessage(
      "Lamp to plant distance",
    ),
    "note_height": MessageLookupByLibrary.simpleMessage("Height"),
    "note_lightSchedule": MessageLookupByLibrary.simpleMessage(
      "Light Schedule",
    ),
    "note_maxHumi": MessageLookupByLibrary.simpleMessage("最大湿度"),
    "note_maxTemp": MessageLookupByLibrary.simpleMessage("最大温度"),
    "note_minHumi": MessageLookupByLibrary.simpleMessage("最小湿度"),
    "note_minTemp": MessageLookupByLibrary.simpleMessage("最小温度"),
    "note_noteContent": MessageLookupByLibrary.simpleMessage("Description"),
    "note_noteId": MessageLookupByLibrary.simpleMessage("All Notes"),
    "note_noteTime": MessageLookupByLibrary.simpleMessage("Note Date"),
    "note_noteType": MessageLookupByLibrary.simpleMessage("Note type"),
    "note_noteType_enum": m0,
    "note_ph": MessageLookupByLibrary.simpleMessage("PH"),
    "note_plant": MessageLookupByLibrary.simpleMessage("-"),
    "note_potSize": MessageLookupByLibrary.simpleMessage("Pot size"),
    "note_waterVolume": MessageLookupByLibrary.simpleMessage("Water Volume"),
    "off": MessageLookupByLibrary.simpleMessage("Off"),
    "offTime": MessageLookupByLibrary.simpleMessage("OFF Time"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "on": MessageLookupByLibrary.simpleMessage("On"),
    "onTime": MessageLookupByLibrary.simpleMessage("ON Time"),
    "open": MessageLookupByLibrary.simpleMessage("Open"),
    "open_bluetooth": MessageLookupByLibrary.simpleMessage("Turn on Bluetooth"),
    "open_bluetooth_tip": MessageLookupByLibrary.simpleMessage(
      "Turn on the bluetooth, Click the button below!",
    ),
    "outside": MessageLookupByLibrary.simpleMessage("Outside"),
    "password_validate": MessageLookupByLibrary.simpleMessage(
      "Password do not match, please try again.",
    ),
    "permission": MessageLookupByLibrary.simpleMessage("权限管理"),
    "permission_permissionId": MessageLookupByLibrary.simpleMessage("ID"),
    "permission_privilegeCode": MessageLookupByLibrary.simpleMessage("资源编码"),
    "permission_role": MessageLookupByLibrary.simpleMessage("角色"),
    "photo": MessageLookupByLibrary.simpleMessage("Album"),
    "plant": MessageLookupByLibrary.simpleMessage("Plant"),
    "plantCategory": MessageLookupByLibrary.simpleMessage("*"),
    "plantCategory_categoryId": MessageLookupByLibrary.simpleMessage("植物类别ID"),
    "plantCategory_categoryName": MessageLookupByLibrary.simpleMessage(
      "Strain name",
    ),
    "plantCategory_plants": MessageLookupByLibrary.simpleMessage("-"),
    "plantCategory_remark": MessageLookupByLibrary.simpleMessage("备注"),
    "plantCategory_tenantId": MessageLookupByLibrary.simpleMessage("农场"),
    "plant_growthStages": MessageLookupByLibrary.simpleMessage("-"),
    "plant_plantCategory": MessageLookupByLibrary.simpleMessage(
      "Plant category",
    ),
    "plant_plantId": MessageLookupByLibrary.simpleMessage("-"),
    "plant_plantName": MessageLookupByLibrary.simpleMessage("Plant name"),
    "plant_remark": MessageLookupByLibrary.simpleMessage("Description"),
    "plant_room": MessageLookupByLibrary.simpleMessage("Device"),
    "plant_tenantId": MessageLookupByLibrary.simpleMessage("农场"),
    "policy": MessageLookupByLibrary.simpleMessage("Terms of Use."),
    "previous": MessageLookupByLibrary.simpleMessage("Previous"),
    "privacyAgreement": MessageLookupByLibrary.simpleMessage(
      "Do you agree with the Service and Agreement and Privacy Policy？",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Services & Agreements",
    ),
    "private": MessageLookupByLibrary.simpleMessage("Privacy Policy."),
    "real_time_control": MessageLookupByLibrary.simpleMessage(
      "Real-time Control",
    ),
    "recover_password": MessageLookupByLibrary.simpleMessage(
      "Recover password",
    ),
    "recover_password_title": MessageLookupByLibrary.simpleMessage(
      "Please enter an email address to recover your password.",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "reject": MessageLookupByLibrary.simpleMessage("Reject"),
    "remove": MessageLookupByLibrary.simpleMessage("Delete"),
    "removeFailure": MessageLookupByLibrary.simpleMessage("Delete failure!"),
    "removeSuccess": MessageLookupByLibrary.simpleMessage("Delete success!"),
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "reset_password_title": MessageLookupByLibrary.simpleMessage(
      "Please enter the verification code to reset your password",
    ),
    "role": MessageLookupByLibrary.simpleMessage("系统角色"),
    "role_defaultRole_enum": m1,
    "role_enabled": MessageLookupByLibrary.simpleMessage("启用/停用"),
    "role_permissions": MessageLookupByLibrary.simpleMessage("角色权限"),
    "role_privilegeCodes": MessageLookupByLibrary.simpleMessage("资源编码"),
    "role_remark": MessageLookupByLibrary.simpleMessage("备注"),
    "role_roleCode": MessageLookupByLibrary.simpleMessage("角色编码"),
    "role_roleId": MessageLookupByLibrary.simpleMessage("角色ID"),
    "role_roleName": MessageLookupByLibrary.simpleMessage("角色名称"),
    "role_users": MessageLookupByLibrary.simpleMessage("角色下的用户"),
    "room": MessageLookupByLibrary.simpleMessage("Device"),
    "roomProfile_currentSceneIndex": MessageLookupByLibrary.simpleMessage(
      "当前场景",
    ),
    "roomProfile_plantName": MessageLookupByLibrary.simpleMessage("Plant name"),
    "roomProfile_remark": MessageLookupByLibrary.simpleMessage("Description"),
    "roomProfile_roomId": MessageLookupByLibrary.simpleMessage("-"),
    "roomProfile_roomName": MessageLookupByLibrary.simpleMessage("房间名称"),
    "roomProfile_roomState": MessageLookupByLibrary.simpleMessage("房间状态"),
    "roomProfile_sceneMode": MessageLookupByLibrary.simpleMessage("场景模式"),
    "roomProfile_sensorData": MessageLookupByLibrary.simpleMessage("环境传感器数据"),
    "room_manage": MessageLookupByLibrary.simpleMessage("Manage Device"),
    "room_plants": MessageLookupByLibrary.simpleMessage("房间下种的植物"),
    "room_remark": MessageLookupByLibrary.simpleMessage("Description"),
    "room_roomId": MessageLookupByLibrary.simpleMessage("-"),
    "room_roomName": MessageLookupByLibrary.simpleMessage("Device name"),
    "room_roomState": MessageLookupByLibrary.simpleMessage("Device status"),
    "room_roomState_enum": m2,
    "room_tenantId": MessageLookupByLibrary.simpleMessage("农场"),
    "run_countdown_timer": MessageLookupByLibrary.simpleMessage(
      "Countdown time",
    ),
    "running": MessageLookupByLibrary.simpleMessage("Running"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "scanned_device": MessageLookupByLibrary.simpleMessage("Scanned to device"),
    "sceneSetting_dim1Per": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSetting_dim2Per": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSetting_dim3Per": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSetting_fan_sch1": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSetting_fan_sch2": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSetting_fan_sch3": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSetting_modeEnable": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSetting_schEnable": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSetting_schEndDate": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSetting_schEndTime": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSetting_schStartDate": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSetting_schStartTime": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSetting_settingType_enum": m3,
    "sceneSetting_vent_sch1": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSetting_vent_sch2": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSetting_vent_sch3": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSpec_brightness_dimmingTemp": MessageLookupByLibrary.simpleMessage(
      "-",
    ),
    "sceneSpec_brightness_points": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSpec_brightness_shutdownTemp": MessageLookupByLibrary.simpleMessage(
      "-",
    ),
    "sceneSpec_brightness_sunriseDay": MessageLookupByLibrary.simpleMessage(
      "-",
    ),
    "sceneSpec_name": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSpec_sceneType": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSpec_spectrum_dim1": MessageLookupByLibrary.simpleMessage("-"),
    "sceneSpec_spectrum_dim2": MessageLookupByLibrary.simpleMessage("-"),
    "scene_brightnessPoints": MessageLookupByLibrary.simpleMessage("-"),
    "scene_dimmingTemp": MessageLookupByLibrary.simpleMessage("-"),
    "scene_floweringParam": MessageLookupByLibrary.simpleMessage("-"),
    "scene_manModeParam": MessageLookupByLibrary.simpleMessage("-"),
    "scene_photo": MessageLookupByLibrary.simpleMessage("Scene photo"),
    "scene_remark": MessageLookupByLibrary.simpleMessage("Description"),
    "scene_room": MessageLookupByLibrary.simpleMessage("Room"),
    "scene_sceneId": MessageLookupByLibrary.simpleMessage("Grow Plan"),
    "scene_sceneIndex": MessageLookupByLibrary.simpleMessage("序号"),
    "scene_sceneName": MessageLookupByLibrary.simpleMessage("Grow plan name"),
    "scene_seedingParam": MessageLookupByLibrary.simpleMessage("-"),
    "scene_settingType": MessageLookupByLibrary.simpleMessage("-"),
    "scene_shutdownTemp": MessageLookupByLibrary.simpleMessage("-"),
    "scene_spectrumDim1": MessageLookupByLibrary.simpleMessage("-"),
    "scene_spectrumDim2": MessageLookupByLibrary.simpleMessage("-"),
    "scene_sunriseDay": MessageLookupByLibrary.simpleMessage("-"),
    "scene_vegetativeParam": MessageLookupByLibrary.simpleMessage("-"),
    "screen_lock": MessageLookupByLibrary.simpleMessage("Screen lock"),
    "second": MessageLookupByLibrary.simpleMessage("Seconds"),
    "select_time_range": MessageLookupByLibrary.simpleMessage(
      "Select a time range",
    ),
    "send": MessageLookupByLibrary.simpleMessage("Send"),
    "send_recover_email": MessageLookupByLibrary.simpleMessage(
      "Send recovery Email",
    ),
    "send_recover_email_success": MessageLookupByLibrary.simpleMessage(
      "Sent successfully, please check your email for verification code",
    ),
    "send_valid_code": MessageLookupByLibrary.simpleMessage(
      "Verification code has been sent",
    ),
    "sensorData_atms": MessageLookupByLibrary.simpleMessage("大气压"),
    "sensorData_co2s": MessageLookupByLibrary.simpleMessage("二氧化碳"),
    "sensorData_ecs": MessageLookupByLibrary.simpleMessage("EC值"),
    "sensorData_humidities": MessageLookupByLibrary.simpleMessage("湿度"),
    "sensorData_illuminances": MessageLookupByLibrary.simpleMessage("光照度"),
    "sensorData_phs": MessageLookupByLibrary.simpleMessage("光照度"),
    "sensorData_temperatures": MessageLookupByLibrary.simpleMessage("温度"),
    "sensorRecord_createTime": MessageLookupByLibrary.simpleMessage("-"),
    "sensorRecord_deviceId": MessageLookupByLibrary.simpleMessage(
      "Device Code",
    ),
    "sensorRecord_deviceName": MessageLookupByLibrary.simpleMessage("-"),
    "sensorRecord_formatValue": MessageLookupByLibrary.simpleMessage("-"),
    "sensorRecord_id": MessageLookupByLibrary.simpleMessage("-"),
    "sensorRecord_timestamp": MessageLookupByLibrary.simpleMessage("-"),
    "sensorRecord_type": MessageLookupByLibrary.simpleMessage("-"),
    "sensorRecord_value": MessageLookupByLibrary.simpleMessage("-"),
    "set_up_for_grow_stage": MessageLookupByLibrary.simpleMessage(
      "Set up for this grow stage",
    ),
    "setting": MessageLookupByLibrary.simpleMessage("Setting"),
    "setting_aboutUs": MessageLookupByLibrary.simpleMessage("About Us"),
    "setting_account": MessageLookupByLibrary.simpleMessage("Account"),
    "setting_feedback": MessageLookupByLibrary.simpleMessage("Feedback"),
    "setting_language": MessageLookupByLibrary.simpleMessage("Language"),
    "setting_lengthUnit": MessageLookupByLibrary.simpleMessage("Length Unit"),
    "setting_setUp": MessageLookupByLibrary.simpleMessage("Set up"),
    "setting_temperatureUnit": MessageLookupByLibrary.simpleMessage(
      "Temperature Unit",
    ),
    "setting_theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "setting_theme_dark": MessageLookupByLibrary.simpleMessage("Dark"),
    "setting_theme_light": MessageLookupByLibrary.simpleMessage("Light"),
    "setting_timeZone": MessageLookupByLibrary.simpleMessage("Time Zone"),
    "setting_week_first_day": MessageLookupByLibrary.simpleMessage(
      "First day of the week",
    ),
    "skip": MessageLookupByLibrary.simpleMessage("Skip"),
    "snap": MessageLookupByLibrary.simpleMessage("Take picture"),
    "speed": MessageLookupByLibrary.simpleMessage("Speed"),
    "speedLevel": MessageLookupByLibrary.simpleMessage("Speed Level"),
    "startDate": MessageLookupByLibrary.simpleMessage("Start Date"),
    "startScan": MessageLookupByLibrary.simpleMessage("Start Scan"),
    "stopScan": MessageLookupByLibrary.simpleMessage("Stop Scan"),
    "sunday": MessageLookupByLibrary.simpleMessage("Sunday"),
    "system": MessageLookupByLibrary.simpleMessage("System"),
    "temperature": MessageLookupByLibrary.simpleMessage("Temp"),
    "term_of_use": MessageLookupByLibrary.simpleMessage("Terms of Use"),
    "time_settings": MessageLookupByLibrary.simpleMessage("Date Setting"),
    "tip": MessageLookupByLibrary.simpleMessage("Tip"),
    "tip_not_content_tip": MessageLookupByLibrary.simpleMessage(
      "Not found items",
    ),
    "tip_sync_time": MessageLookupByLibrary.simpleMessage(
      "Tip: Synchronize the device time with the system.",
    ),
    "tip_temp_uint": MessageLookupByLibrary.simpleMessage(
      "Tip: This chang only apply to the APP, it will not be synchronized to the device.",
    ),
    "unsetting": MessageLookupByLibrary.simpleMessage("not set"),
    "unsetting_scene": MessageLookupByLibrary.simpleMessage(
      "No growth plan has been set, do you want to create it now？",
    ),
    "update_failure": MessageLookupByLibrary.simpleMessage("Modified failure"),
    "update_farm": MessageLookupByLibrary.simpleMessage("Modify Garden"),
    "update_success": MessageLookupByLibrary.simpleMessage("Modified success!"),
    "upload": MessageLookupByLibrary.simpleMessage("Upload"),
    "user": MessageLookupByLibrary.simpleMessage("用户"),
    "user_authorities": MessageLookupByLibrary.simpleMessage("用户的权限数据"),
    "user_avatar": MessageLookupByLibrary.simpleMessage("用户头像"),
    "user_avatarUrl": MessageLookupByLibrary.simpleMessage("头像链接"),
    "user_email": MessageLookupByLibrary.simpleMessage("Your Email"),
    "user_enabled": MessageLookupByLibrary.simpleMessage("启用/停用"),
    "user_farms": MessageLookupByLibrary.simpleMessage("所在的工厂"),
    "user_gender": MessageLookupByLibrary.simpleMessage("性别"),
    "user_lastLoginTime": MessageLookupByLibrary.simpleMessage("最后登录时间"),
    "user_mobile": MessageLookupByLibrary.simpleMessage("手机号码"),
    "user_password": MessageLookupByLibrary.simpleMessage("密码"),
    "user_position": MessageLookupByLibrary.simpleMessage("职位"),
    "user_realName": MessageLookupByLibrary.simpleMessage("用户姓名"),
    "user_remark": MessageLookupByLibrary.simpleMessage("备注"),
    "user_roles": MessageLookupByLibrary.simpleMessage("角色"),
    "user_superUser": MessageLookupByLibrary.simpleMessage("用户是否为超级用户"),
    "user_tenantId": MessageLookupByLibrary.simpleMessage("-"),
    "user_userId": MessageLookupByLibrary.simpleMessage("Id"),
    "user_userName": MessageLookupByLibrary.simpleMessage("Account"),
    "valid_code_invalid": MessageLookupByLibrary.simpleMessage(
      "Verification code is invalid",
    ),
    "valid_email_format_err_tip": MessageLookupByLibrary.simpleMessage(
      "Email format error",
    ),
    "valid_format_error": MessageLookupByLibrary.simpleMessage("Format error"),
    "valid_identity_card_too_short": MessageLookupByLibrary.simpleMessage(
      "Identity card is too short",
    ),
    "valid_identity_card_verify_err": MessageLookupByLibrary.simpleMessage(
      "Identity card verify fail",
    ),
    "valid_len_no_less_than": MessageLookupByLibrary.simpleMessage(
      "Length no less than",
    ),
    "valid_len_no_more_than": MessageLookupByLibrary.simpleMessage(
      "Length no more than",
    ),
    "valid_must_be_integer": MessageLookupByLibrary.simpleMessage(
      "It must be an integer",
    ),
    "valid_must_numeric_more_three_d": MessageLookupByLibrary.simpleMessage(
      "Must be numeric and no more three digits",
    ),
    "valid_must_numeric_more_tow_d": MessageLookupByLibrary.simpleMessage(
      "Must be numeric and no more two digits",
    ),
    "valid_no_less_than": MessageLookupByLibrary.simpleMessage(
      "Min no less than",
    ),
    "valid_no_more_than": MessageLookupByLibrary.simpleMessage(
      "Max no more than",
    ),
    "valid_phone_format_err_tip": MessageLookupByLibrary.simpleMessage(
      "Phone format error",
    ),
    "valid_required_not_empty_tip": MessageLookupByLibrary.simpleMessage(
      "Can\'t be empty",
    ),
    "validate_code": MessageLookupByLibrary.simpleMessage("Verification code"),
    "venFan": MessageLookupByLibrary.simpleMessage("Duct Fan"),
    "ventSchedule_enable": MessageLookupByLibrary.simpleMessage("-"),
    "ventSchedule_highTemp": MessageLookupByLibrary.simpleMessage("-"),
    "ventSchedule_lowTemp": MessageLookupByLibrary.simpleMessage("-"),
    "ventSchedule_workLevel": MessageLookupByLibrary.simpleMessage("-"),
    "ventSchedule_workTime": MessageLookupByLibrary.simpleMessage("-"),
    "welcome": MessageLookupByLibrary.simpleMessage("Welcome to"),
    "welcome_create_account": MessageLookupByLibrary.simpleMessage(
      "CREATE YOUR ACCOUNT",
    ),
    "welcome_register": MessageLookupByLibrary.simpleMessage(
      "Welcome to register",
    ),
    "wifi_config_failure_tip": MessageLookupByLibrary.simpleMessage(
      "Wi-Fi configuration failure",
    ),
    "wifi_config_success_tip": MessageLookupByLibrary.simpleMessage(
      "Wi-Fi configuration success",
    ),
    "wifi_config_timeout": MessageLookupByLibrary.simpleMessage(
      "Wi-Fi configuration timed out, please try again",
    ),
    "wifi_name": MessageLookupByLibrary.simpleMessage("Wi-Fi name"),
    "wifi_network": MessageLookupByLibrary.simpleMessage(
      "Wi-Fi network configuration",
    ),
    "wifi_password": MessageLookupByLibrary.simpleMessage("Wi-Fi password"),
    "wifi_permission_refuse_tip": MessageLookupByLibrary.simpleMessage(
      "WIFI permission denied, please grant permission manually",
    ),
    "wifi_scan_failure_tip": MessageLookupByLibrary.simpleMessage(
      "Unable to start Wi-Fi scanning",
    ),
    "wifi_select": MessageLookupByLibrary.simpleMessage("Select Wi-Fi network"),
    "wifi_select_manual": MessageLookupByLibrary.simpleMessage(
      "Enter Wi-Fi name manually",
    ),
    "workHour": MessageLookupByLibrary.simpleMessage("Work hours"),
    "workingMode": MessageLookupByLibrary.simpleMessage("Working Mode"),
    "yes": MessageLookupByLibrary.simpleMessage("Yes"),
    "yourEmail": MessageLookupByLibrary.simpleMessage("Your Email"),
    "yourPassword": MessageLookupByLibrary.simpleMessage("Your login password"),
  };
}
