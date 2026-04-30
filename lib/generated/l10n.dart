// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `CannaPro`
  String get appName {
    return Intl.message('CannaPro', name: 'appName', desc: '', args: []);
  }

  /// `Dash Board`
  String get dashBoard {
    return Intl.message('Dash Board', name: 'dashBoard', desc: '', args: []);
  }

  /// `English`
  String get lang_en {
    return Intl.message('English', name: 'lang_en', desc: '', args: []);
  }

  /// `简体中文`
  String get lang_zh_CN {
    return Intl.message('简体中文', name: 'lang_zh_CN', desc: '', args: []);
  }

  /// `繁体中文`
  String get lang_zh_TW {
    return Intl.message('繁体中文', name: 'lang_zh_TW', desc: '', args: []);
  }

  /// `and`
  String get and {
    return Intl.message('and', name: 'and', desc: '', args: []);
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Delete`
  String get remove {
    return Intl.message('Delete', name: 'remove', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Create`
  String get create {
    return Intl.message('Create', name: 'create', desc: '', args: []);
  }

  /// `Open`
  String get open {
    return Intl.message('Open', name: 'open', desc: '', args: []);
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Manual`
  String get manual {
    return Intl.message('Manual', name: 'manual', desc: '', args: []);
  }

  /// `Auto`
  String get auto {
    return Intl.message('Auto', name: 'auto', desc: '', args: []);
  }

  /// `Cycle`
  String get cycle {
    return Intl.message('Cycle', name: 'cycle', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Previous`
  String get previous {
    return Intl.message('Previous', name: 'previous', desc: '', args: []);
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Enabled`
  String get enabled {
    return Intl.message('Enabled', name: 'enabled', desc: '', args: []);
  }

  /// `Disabled`
  String get disabled {
    return Intl.message('Disabled', name: 'disabled', desc: '', args: []);
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Common`
  String get common {
    return Intl.message('Common', name: 'common', desc: '', args: []);
  }

  /// `Hours`
  String get hour {
    return Intl.message('Hours', name: 'hour', desc: '', args: []);
  }

  /// `Minutes`
  String get minute {
    return Intl.message('Minutes', name: 'minute', desc: '', args: []);
  }

  /// `Seconds`
  String get second {
    return Intl.message('Seconds', name: 'second', desc: '', args: []);
  }

  /// `Hours`
  String get date_hour {
    return Intl.message('Hours', name: 'date_hour', desc: '', args: []);
  }

  /// `Minutes`
  String get date_minute {
    return Intl.message('Minutes', name: 'date_minute', desc: '', args: []);
  }

  /// `Seconds`
  String get date_second {
    return Intl.message('Seconds', name: 'date_second', desc: '', args: []);
  }

  /// `Year`
  String get date_year {
    return Intl.message('Year', name: 'date_year', desc: '', args: []);
  }

  /// `Month`
  String get date_month {
    return Intl.message('Month', name: 'date_month', desc: '', args: []);
  }

  /// `Day`
  String get date_day {
    return Intl.message('Day', name: 'date_day', desc: '', args: []);
  }

  /// `loading...`
  String get loading {
    return Intl.message('loading...', name: 'loading', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Please input `
  String get input {
    return Intl.message('Please input ', name: 'input', desc: '', args: []);
  }

  /// `Refresh`
  String get refresh {
    return Intl.message('Refresh', name: 'refresh', desc: '', args: []);
  }

  /// `Verification code has been sent`
  String get send_valid_code {
    return Intl.message(
      'Verification code has been sent',
      name: 'send_valid_code',
      desc: '',
      args: [],
    );
  }

  /// `Verification code is invalid`
  String get valid_code_invalid {
    return Intl.message(
      'Verification code is invalid',
      name: 'valid_code_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Your login password`
  String get yourPassword {
    return Intl.message(
      'Your login password',
      name: 'yourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your Email`
  String get yourEmail {
    return Intl.message('Your Email', name: 'yourEmail', desc: '', args: []);
  }

  /// `Please input a password`
  String get inputPassword {
    return Intl.message(
      'Please input a password',
      name: 'inputPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 8 characters include letters and number.`
  String get inputPasswordSize {
    return Intl.message(
      'Password must contain at least 8 characters include letters and number.',
      name: 'inputPasswordSize',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 8 characters include letters and number.`
  String get inputPasswordNumber {
    return Intl.message(
      'Password must contain at least 8 characters include letters and number.',
      name: 'inputPasswordNumber',
      desc: '',
      args: [],
    );
  }

  /// `Do you agree with the Service and Agreement and Privacy Policy？`
  String get privacyAgreement {
    return Intl.message(
      'Do you agree with the Service and Agreement and Privacy Policy？',
      name: 'privacyAgreement',
      desc: '',
      args: [],
    );
  }

  /// `No account？`
  String get noAccount {
    return Intl.message('No account？', name: 'noAccount', desc: '', args: []);
  }

  /// `I agree to the`
  String get loginAgree {
    return Intl.message(
      'I agree to the',
      name: 'loginAgree',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Email and password!`
  String get inputUsernamePassword {
    return Intl.message(
      'Please enter your Email and password!',
      name: 'inputUsernamePassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your username or phone number!`
  String get inputUsername {
    return Intl.message(
      'Please enter your username or phone number!',
      name: 'inputUsername',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Email!`
  String get inputEmail {
    return Intl.message(
      'Please enter your Email!',
      name: 'inputEmail',
      desc: '',
      args: [],
    );
  }

  /// `Press again to exit`
  String get exit {
    return Intl.message(
      'Press again to exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete it?`
  String get confirm_delete {
    return Intl.message(
      'Are you sure to delete it?',
      name: 'confirm_delete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to open it？`
  String get confirm_open {
    return Intl.message(
      'Are you sure to open it？',
      name: 'confirm_open',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to save the changes？`
  String get confirm_unsaved {
    return Intl.message(
      'Do you want to save the changes？',
      name: 'confirm_unsaved',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm password`
  String get confirmPassword {
    return Intl.message(
      'Please confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get emptyData {
    return Intl.message('No data', name: 'emptyData', desc: '', args: []);
  }

  /// `Services & Agreements`
  String get privacyPolicy {
    return Intl.message(
      'Services & Agreements',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use.`
  String get policy {
    return Intl.message('Terms of Use.', name: 'policy', desc: '', args: []);
  }

  /// `Privacy Policy.`
  String get private {
    return Intl.message('Privacy Policy.', name: 'private', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Log off`
  String get logoff {
    return Intl.message('Log off', name: 'logoff', desc: '', args: []);
  }

  /// `Delete Account`
  String get delete_user {
    return Intl.message(
      'Delete Account',
      name: 'delete_user',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account？This action will erase all data permanently`
  String get delete_user_confirm {
    return Intl.message(
      'Are you sure you want to delete your account？This action will erase all data permanently',
      name: 'delete_user_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgetPassword {
    return Intl.message(
      'Forget Password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to`
  String get welcome {
    return Intl.message('Welcome to', name: 'welcome', desc: '', args: []);
  }

  /// `Hello`
  String get hello {
    return Intl.message('Hello', name: 'hello', desc: '', args: []);
  }

  /// `Agree`
  String get agree {
    return Intl.message('Agree', name: 'agree', desc: '', args: []);
  }

  /// `Reject`
  String get reject {
    return Intl.message('Reject', name: 'reject', desc: '', args: []);
  }

  /// `Recover password`
  String get recover_password {
    return Intl.message(
      'Recover password',
      name: 'recover_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an email address to recover your password.`
  String get recover_password_title {
    return Intl.message(
      'Please enter an email address to recover your password.',
      name: 'recover_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Send recovery Email`
  String get send_recover_email {
    return Intl.message(
      'Send recovery Email',
      name: 'send_recover_email',
      desc: '',
      args: [],
    );
  }

  /// `Sent successfully, please check your email for verification code`
  String get send_recover_email_success {
    return Intl.message(
      'Sent successfully, please check your email for verification code',
      name: 'send_recover_email_success',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the verification code to reset your password`
  String get reset_password_title {
    return Intl.message(
      'Please enter the verification code to reset your password',
      name: 'reset_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Tip`
  String get tip {
    return Intl.message('Tip', name: 'tip', desc: '', args: []);
  }

  /// `Date Setting`
  String get time_settings {
    return Intl.message(
      'Date Setting',
      name: 'time_settings',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message('Start Date', name: 'startDate', desc: '', args: []);
  }

  /// `End Date`
  String get endDate {
    return Intl.message('End Date', name: 'endDate', desc: '', args: []);
  }

  /// `Home`
  String get navBar_home {
    return Intl.message('Home', name: 'navBar_home', desc: '', args: []);
  }

  /// `Plants`
  String get navBar_plant {
    return Intl.message('Plants', name: 'navBar_plant', desc: '', args: []);
  }

  /// `Data`
  String get navBar_data {
    return Intl.message('Data', name: 'navBar_data', desc: '', args: []);
  }

  /// `More`
  String get navBar_profile {
    return Intl.message('More', name: 'navBar_profile', desc: '', args: []);
  }

  /// `Setting`
  String get setting {
    return Intl.message('Setting', name: 'setting', desc: '', args: []);
  }

  /// `Set up`
  String get setting_setUp {
    return Intl.message('Set up', name: 'setting_setUp', desc: '', args: []);
  }

  /// `Account`
  String get setting_account {
    return Intl.message('Account', name: 'setting_account', desc: '', args: []);
  }

  /// `Feedback`
  String get setting_feedback {
    return Intl.message(
      'Feedback',
      name: 'setting_feedback',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get setting_aboutUs {
    return Intl.message(
      'About Us',
      name: 'setting_aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get setting_language {
    return Intl.message(
      'Language',
      name: 'setting_language',
      desc: '',
      args: [],
    );
  }

  /// `Time Zone`
  String get setting_timeZone {
    return Intl.message(
      'Time Zone',
      name: 'setting_timeZone',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get setting_theme {
    return Intl.message('Theme', name: 'setting_theme', desc: '', args: []);
  }

  /// `Light`
  String get setting_theme_light {
    return Intl.message(
      'Light',
      name: 'setting_theme_light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get setting_theme_dark {
    return Intl.message('Dark', name: 'setting_theme_dark', desc: '', args: []);
  }

  /// `Temperature Unit`
  String get setting_temperatureUnit {
    return Intl.message(
      'Temperature Unit',
      name: 'setting_temperatureUnit',
      desc: '',
      args: [],
    );
  }

  /// `Length Unit`
  String get setting_lengthUnit {
    return Intl.message(
      'Length Unit',
      name: 'setting_lengthUnit',
      desc: '',
      args: [],
    );
  }

  /// `First day of the week`
  String get setting_week_first_day {
    return Intl.message(
      'First day of the week',
      name: 'setting_week_first_day',
      desc: '',
      args: [],
    );
  }

  /// `Start Scan`
  String get startScan {
    return Intl.message('Start Scan', name: 'startScan', desc: '', args: []);
  }

  /// `Stop Scan`
  String get stopScan {
    return Intl.message('Stop Scan', name: 'stopScan', desc: '', args: []);
  }

  /// `Initializing`
  String get initializing {
    return Intl.message(
      'Initializing',
      name: 'initializing',
      desc: '',
      args: [],
    );
  }

  /// `Scanned to device`
  String get scanned_device {
    return Intl.message(
      'Scanned to device',
      name: 'scanned_device',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use`
  String get term_of_use {
    return Intl.message(
      'Terms of Use',
      name: 'term_of_use',
      desc: '',
      args: [],
    );
  }

  /// `Centimeter`
  String get centimeter {
    return Intl.message('Centimeter', name: 'centimeter', desc: '', args: []);
  }

  /// `Inch`
  String get inch {
    return Intl.message('Inch', name: 'inch', desc: '', args: []);
  }

  /// ` days ago`
  String get days_ago {
    return Intl.message(' days ago', name: 'days_ago', desc: '', args: []);
  }

  /// `Monday`
  String get monday {
    return Intl.message('Monday', name: 'monday', desc: '', args: []);
  }

  /// `Sunday`
  String get sunday {
    return Intl.message('Sunday', name: 'sunday', desc: '', args: []);
  }

  /// `Environment`
  String get environment {
    return Intl.message('Environment', name: 'environment', desc: '', args: []);
  }

  /// `Temp`
  String get temperature {
    return Intl.message('Temp', name: 'temperature', desc: '', args: []);
  }

  /// `Humidity`
  String get humidity {
    return Intl.message('Humidity', name: 'humidity', desc: '', args: []);
  }

  /// `Inside`
  String get inside {
    return Intl.message('Inside', name: 'inside', desc: '', args: []);
  }

  /// `Outside`
  String get outside {
    return Intl.message('Outside', name: 'outside', desc: '', args: []);
  }

  /// `ON Time`
  String get onTime {
    return Intl.message('ON Time', name: 'onTime', desc: '', args: []);
  }

  /// `OFF Time`
  String get offTime {
    return Intl.message('OFF Time', name: 'offTime', desc: '', args: []);
  }

  /// `Dim`
  String get dim {
    return Intl.message('Dim', name: 'dim', desc: '', args: []);
  }

  /// `Speed`
  String get speed {
    return Intl.message('Speed', name: 'speed', desc: '', args: []);
  }

  /// `Grow Light`
  String get light {
    return Intl.message('Grow Light', name: 'light', desc: '', args: []);
  }

  /// `Circulation Fan`
  String get fan {
    return Intl.message('Circulation Fan', name: 'fan', desc: '', args: []);
  }

  /// `Duct Fan`
  String get venFan {
    return Intl.message('Duct Fan', name: 'venFan', desc: '', args: []);
  }

  /// `Working Mode`
  String get workingMode {
    return Intl.message(
      'Working Mode',
      name: 'workingMode',
      desc: '',
      args: [],
    );
  }

  /// `Work hours`
  String get workHour {
    return Intl.message('Work hours', name: 'workHour', desc: '', args: []);
  }

  /// `Speed Level`
  String get speedLevel {
    return Intl.message('Speed Level', name: 'speedLevel', desc: '', args: []);
  }

  /// `Send success!`
  String get executeSuccess {
    return Intl.message(
      'Send success!',
      name: 'executeSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Send failure!`
  String get executeFailure {
    return Intl.message(
      'Send failure!',
      name: 'executeFailure',
      desc: '',
      args: [],
    );
  }

  /// `Delete success!`
  String get removeSuccess {
    return Intl.message(
      'Delete success!',
      name: 'removeSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Delete failure!`
  String get removeFailure {
    return Intl.message(
      'Delete failure!',
      name: 'removeFailure',
      desc: '',
      args: [],
    );
  }

  /// `Grow Plan`
  String get growPlan {
    return Intl.message('Grow Plan', name: 'growPlan', desc: '', args: []);
  }

  /// `Garden Management`
  String get farm_management {
    return Intl.message(
      'Garden Management',
      name: 'farm_management',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out？`
  String get confirm_logout {
    return Intl.message(
      'Are you sure you want to log out？',
      name: 'confirm_logout',
      desc: '',
      args: [],
    );
  }

  /// `Select a time range`
  String get select_time_range {
    return Intl.message(
      'Select a time range',
      name: 'select_time_range',
      desc: '',
      args: [],
    );
  }

  /// `Real-time Control`
  String get real_time_control {
    return Intl.message(
      'Real-time Control',
      name: 'real_time_control',
      desc: '',
      args: [],
    );
  }

  /// `Cycle Schedule`
  String get cycle_schedule {
    return Intl.message(
      'Cycle Schedule',
      name: 'cycle_schedule',
      desc: '',
      args: [],
    );
  }

  /// `Current Mode`
  String get current_mode {
    return Intl.message(
      'Current Mode',
      name: 'current_mode',
      desc: '',
      args: [],
    );
  }

  /// `Network connect error`
  String get network_connect_error {
    return Intl.message(
      'Network connect error',
      name: 'network_connect_error',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error`
  String get network_unknown_error {
    return Intl.message(
      'Unknown error',
      name: 'network_unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Connected success!`
  String get connected_success {
    return Intl.message(
      'Connected success!',
      name: 'connected_success',
      desc: '',
      args: [],
    );
  }

  /// `not set`
  String get unsetting {
    return Intl.message('not set', name: 'unsetting', desc: '', args: []);
  }

  /// `No growth plan has been set, do you want to create it now？`
  String get unsetting_scene {
    return Intl.message(
      'No growth plan has been set, do you want to create it now？',
      name: 'unsetting_scene',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get account_settings {
    return Intl.message(
      'Account Settings',
      name: 'account_settings',
      desc: '',
      args: [],
    );
  }

  /// `I agree`
  String get I_agree {
    return Intl.message('I agree', name: 'I_agree', desc: '', args: []);
  }

  /// `Welcome to register`
  String get welcome_register {
    return Intl.message(
      'Welcome to register',
      name: 'welcome_register',
      desc: '',
      args: [],
    );
  }

  /// `Password do not match, please try again.`
  String get password_validate {
    return Intl.message(
      'Password do not match, please try again.',
      name: 'password_validate',
      desc: '',
      args: [],
    );
  }

  /// `Verification code`
  String get validate_code {
    return Intl.message(
      'Verification code',
      name: 'validate_code',
      desc: '',
      args: [],
    );
  }

  /// `Inside Temperature Alert`
  String get inside_temperature_alert {
    return Intl.message(
      'Inside Temperature Alert',
      name: 'inside_temperature_alert',
      desc: '',
      args: [],
    );
  }

  /// `Inside Humidity Alert`
  String get inside_humidity_alert {
    return Intl.message(
      'Inside Humidity Alert',
      name: 'inside_humidity_alert',
      desc: '',
      args: [],
    );
  }

  /// `Countdown time`
  String get run_countdown_timer {
    return Intl.message(
      'Countdown time',
      name: 'run_countdown_timer',
      desc: '',
      args: [],
    );
  }

  /// `Running`
  String get running {
    return Intl.message('Running', name: 'running', desc: '', args: []);
  }

  /// `Manage Device`
  String get room_manage {
    return Intl.message(
      'Manage Device',
      name: 'room_manage',
      desc: '',
      args: [],
    );
  }

  /// `Network Setting`
  String get network_configure {
    return Intl.message(
      'Network Setting',
      name: 'network_configure',
      desc: '',
      args: [],
    );
  }

  /// `Set up for this grow stage`
  String get set_up_for_grow_stage {
    return Intl.message(
      'Set up for this grow stage',
      name: 'set_up_for_grow_stage',
      desc: '',
      args: [],
    );
  }

  /// `Create device`
  String get create_room {
    return Intl.message(
      'Create device',
      name: 'create_room',
      desc: '',
      args: [],
    );
  }

  /// `Add Device`
  String get create_room_scan {
    return Intl.message(
      'Add Device',
      name: 'create_room_scan',
      desc: '',
      args: [],
    );
  }

  /// `Create device manually`
  String get create_room_manual {
    return Intl.message(
      'Create device manually',
      name: 'create_room_manual',
      desc: '',
      args: [],
    );
  }

  /// `There are no devices. Add it now.`
  String get no_rooms {
    return Intl.message(
      'There are no devices. Add it now.',
      name: 'no_rooms',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get system {
    return Intl.message('System', name: 'system', desc: '', args: []);
  }

  /// `Clear Cache`
  String get clear_cache {
    return Intl.message('Clear Cache', name: 'clear_cache', desc: '', args: []);
  }

  /// `Created success!`
  String get create_success {
    return Intl.message(
      'Created success!',
      name: 'create_success',
      desc: '',
      args: [],
    );
  }

  /// `Created failure!`
  String get create_failure {
    return Intl.message(
      'Created failure!',
      name: 'create_failure',
      desc: '',
      args: [],
    );
  }

  /// `Modified success!`
  String get update_success {
    return Intl.message(
      'Modified success!',
      name: 'update_success',
      desc: '',
      args: [],
    );
  }

  /// `Modified failure`
  String get update_failure {
    return Intl.message(
      'Modified failure',
      name: 'update_failure',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure connected to this Bluetooth？`
  String get bluetooth_connect {
    return Intl.message(
      'Are you sure connected to this Bluetooth？',
      name: 'bluetooth_connect',
      desc: '',
      args: [],
    );
  }

  /// `Please connect to this Bluetooth first!`
  String get bluetooth_connect_tip {
    return Intl.message(
      'Please connect to this Bluetooth first!',
      name: 'bluetooth_connect_tip',
      desc: '',
      args: [],
    );
  }

  /// `There is already a Bluetooth connected, please disconnect it first!`
  String get bluetooth_connect_only_one_tip {
    return Intl.message(
      'There is already a Bluetooth connected, please disconnect it first!',
      name: 'bluetooth_connect_only_one_tip',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to disconnect？`
  String get bluetooth_disconnect {
    return Intl.message(
      'Are you sure you want to disconnect？',
      name: 'bluetooth_disconnect',
      desc: '',
      args: [],
    );
  }

  /// `Scanned Bluetooth devices`
  String get bluetooth_device_list {
    return Intl.message(
      'Scanned Bluetooth devices',
      name: 'bluetooth_device_list',
      desc: '',
      args: [],
    );
  }

  /// `Click on the icon on the right side of the scanned Bluetooth device list to connect the device and automatically obtain the device code`
  String get bluetooth_device_connect_tip {
    return Intl.message(
      'Click on the icon on the right side of the scanned Bluetooth device list to connect the device and automatically obtain the device code',
      name: 'bluetooth_device_connect_tip',
      desc: '',
      args: [],
    );
  }

  /// `WIFI permission denied, please grant permission manually`
  String get wifi_permission_refuse_tip {
    return Intl.message(
      'WIFI permission denied, please grant permission manually',
      name: 'wifi_permission_refuse_tip',
      desc: '',
      args: [],
    );
  }

  /// `Unable to start Wi-Fi scanning`
  String get wifi_scan_failure_tip {
    return Intl.message(
      'Unable to start Wi-Fi scanning',
      name: 'wifi_scan_failure_tip',
      desc: '',
      args: [],
    );
  }

  /// `Select Wi-Fi network`
  String get wifi_select {
    return Intl.message(
      'Select Wi-Fi network',
      name: 'wifi_select',
      desc: '',
      args: [],
    );
  }

  /// `Enter Wi-Fi name manually`
  String get wifi_select_manual {
    return Intl.message(
      'Enter Wi-Fi name manually',
      name: 'wifi_select_manual',
      desc: '',
      args: [],
    );
  }

  /// `Wi-Fi network configuration`
  String get wifi_network {
    return Intl.message(
      'Wi-Fi network configuration',
      name: 'wifi_network',
      desc: '',
      args: [],
    );
  }

  /// `Wi-Fi name`
  String get wifi_name {
    return Intl.message('Wi-Fi name', name: 'wifi_name', desc: '', args: []);
  }

  /// `Wi-Fi password`
  String get wifi_password {
    return Intl.message(
      'Wi-Fi password',
      name: 'wifi_password',
      desc: '',
      args: [],
    );
  }

  /// `Wi-Fi configuration success`
  String get wifi_config_success_tip {
    return Intl.message(
      'Wi-Fi configuration success',
      name: 'wifi_config_success_tip',
      desc: '',
      args: [],
    );
  }

  /// `Wi-Fi configuration failure`
  String get wifi_config_failure_tip {
    return Intl.message(
      'Wi-Fi configuration failure',
      name: 'wifi_config_failure_tip',
      desc: '',
      args: [],
    );
  }

  /// `Wi-Fi configuration timed out, please try again`
  String get wifi_config_timeout {
    return Intl.message(
      'Wi-Fi configuration timed out, please try again',
      name: 'wifi_config_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Bluetooth connect timeout !`
  String get bluetooth_connect_timeout {
    return Intl.message(
      'Bluetooth connect timeout !',
      name: 'bluetooth_connect_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Grow Stage`
  String get growthStage {
    return Intl.message('Grow Stage', name: 'growthStage', desc: '', args: []);
  }

  /// `-`
  String get growthStage_stageId {
    return Intl.message('-', name: 'growthStage_stageId', desc: '', args: []);
  }

  /// `-`
  String get growthStage_plant {
    return Intl.message('-', name: 'growthStage_plant', desc: '', args: []);
  }

  /// `-`
  String get room_roomId {
    return Intl.message('-', name: 'room_roomId', desc: '', args: []);
  }

  /// `Device name`
  String get room_roomName {
    return Intl.message(
      'Device name',
      name: 'room_roomName',
      desc: '',
      args: [],
    );
  }

  /// `农场`
  String get room_tenantId {
    return Intl.message('农场', name: 'room_tenantId', desc: '', args: []);
  }

  /// `Description`
  String get room_remark {
    return Intl.message('Description', name: 'room_remark', desc: '', args: []);
  }

  /// `房间下种的植物`
  String get room_plants {
    return Intl.message('房间下种的植物', name: 'room_plants', desc: '', args: []);
  }

  /// `Device status`
  String get room_roomState {
    return Intl.message(
      'Device status',
      name: 'room_roomState',
      desc: '',
      args: [],
    );
  }

  /// `Garden`
  String get farm {
    return Intl.message('Garden', name: 'farm', desc: '', args: []);
  }

  /// `无注释`
  String get farm_farmId {
    return Intl.message('无注释', name: 'farm_farmId', desc: '', args: []);
  }

  /// `Garden name`
  String get farm_farmName {
    return Intl.message(
      'Garden name',
      name: 'farm_farmName',
      desc: '',
      args: [],
    );
  }

  /// `Enter a garden name`
  String get farm_farmName_input_tip {
    return Intl.message(
      'Enter a garden name',
      name: 'farm_farmName_input_tip',
      desc: '',
      args: [],
    );
  }

  /// `Enter a description`
  String get farm_description_input_tip {
    return Intl.message(
      'Enter a description',
      name: 'farm_description_input_tip',
      desc: '',
      args: [],
    );
  }

  /// `坐标`
  String get farm_position {
    return Intl.message('坐标', name: 'farm_position', desc: '', args: []);
  }

  /// `地址`
  String get farm_address {
    return Intl.message('地址', name: 'farm_address', desc: '', args: []);
  }

  /// `是否启用`
  String get farm_enabled {
    return Intl.message('是否启用', name: 'farm_enabled', desc: '', args: []);
  }

  /// `Description`
  String get farm_remark {
    return Intl.message('Description', name: 'farm_remark', desc: '', args: []);
  }

  /// `农场下的用户`
  String get farm_users {
    return Intl.message('农场下的用户', name: 'farm_users', desc: '', args: []);
  }

  /// `临时字段：坐标`
  String get farm_latLng {
    return Intl.message('临时字段：坐标', name: 'farm_latLng', desc: '', args: []);
  }

  /// `Create Garden`
  String get create_farm {
    return Intl.message(
      'Create Garden',
      name: 'create_farm',
      desc: '',
      args: [],
    );
  }

  /// `Modify Garden`
  String get update_farm {
    return Intl.message(
      'Modify Garden',
      name: 'update_farm',
      desc: '',
      args: [],
    );
  }

  /// `Plant`
  String get plant {
    return Intl.message('Plant', name: 'plant', desc: '', args: []);
  }

  /// `*`
  String get plantCategory {
    return Intl.message('*', name: 'plantCategory', desc: '', args: []);
  }

  /// `植物类别ID`
  String get plantCategory_categoryId {
    return Intl.message(
      '植物类别ID',
      name: 'plantCategory_categoryId',
      desc: '',
      args: [],
    );
  }

  /// `Strain name`
  String get plantCategory_categoryName {
    return Intl.message(
      'Strain name',
      name: 'plantCategory_categoryName',
      desc: '',
      args: [],
    );
  }

  /// `备注`
  String get plantCategory_remark {
    return Intl.message('备注', name: 'plantCategory_remark', desc: '', args: []);
  }

  /// `农场`
  String get plantCategory_tenantId {
    return Intl.message(
      '农场',
      name: 'plantCategory_tenantId',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get plantCategory_plants {
    return Intl.message('-', name: 'plantCategory_plants', desc: '', args: []);
  }

  /// `-`
  String get plant_plantId {
    return Intl.message('-', name: 'plant_plantId', desc: '', args: []);
  }

  /// `Plant category`
  String get plant_plantCategory {
    return Intl.message(
      'Plant category',
      name: 'plant_plantCategory',
      desc: '',
      args: [],
    );
  }

  /// `Device`
  String get plant_room {
    return Intl.message('Device', name: 'plant_room', desc: '', args: []);
  }

  /// `Plant name`
  String get plant_plantName {
    return Intl.message(
      'Plant name',
      name: 'plant_plantName',
      desc: '',
      args: [],
    );
  }

  /// `农场`
  String get plant_tenantId {
    return Intl.message('农场', name: 'plant_tenantId', desc: '', args: []);
  }

  /// `Description`
  String get plant_remark {
    return Intl.message(
      'Description',
      name: 'plant_remark',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get plant_growthStages {
    return Intl.message('-', name: 'plant_growthStages', desc: '', args: []);
  }

  /// `You can click to create a new plant!`
  String get create_plant_tip {
    return Intl.message(
      'You can click to create a new plant!',
      name: 'create_plant_tip',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message('Note', name: 'note', desc: '', args: []);
  }

  /// `All Notes`
  String get note_noteId {
    return Intl.message('All Notes', name: 'note_noteId', desc: '', args: []);
  }

  /// `-`
  String get note_plant {
    return Intl.message('-', name: 'note_plant', desc: '', args: []);
  }

  /// `Description`
  String get note_noteContent {
    return Intl.message(
      'Description',
      name: 'note_noteContent',
      desc: '',
      args: [],
    );
  }

  /// `Note Date`
  String get note_noteTime {
    return Intl.message('Note Date', name: 'note_noteTime', desc: '', args: []);
  }

  /// `Attachments`
  String get note_attachments {
    return Intl.message(
      'Attachments',
      name: 'note_attachments',
      desc: '',
      args: [],
    );
  }

  /// `Water Volume`
  String get note_waterVolume {
    return Intl.message(
      'Water Volume',
      name: 'note_waterVolume',
      desc: '',
      args: [],
    );
  }

  /// `Light Schedule`
  String get note_lightSchedule {
    return Intl.message(
      'Light Schedule',
      name: 'note_lightSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get note_height {
    return Intl.message('Height', name: 'note_height', desc: '', args: []);
  }

  /// `Lamp to plant distance`
  String get note_distance {
    return Intl.message(
      'Lamp to plant distance',
      name: 'note_distance',
      desc: '',
      args: [],
    );
  }

  /// `Pot size`
  String get note_potSize {
    return Intl.message('Pot size', name: 'note_potSize', desc: '', args: []);
  }

  /// `最小温度`
  String get note_minTemp {
    return Intl.message('最小温度', name: 'note_minTemp', desc: '', args: []);
  }

  /// `最大温度`
  String get note_maxTemp {
    return Intl.message('最大温度', name: 'note_maxTemp', desc: '', args: []);
  }

  /// `最小湿度`
  String get note_minHumi {
    return Intl.message('最小湿度', name: 'note_minHumi', desc: '', args: []);
  }

  /// `最大湿度`
  String get note_maxHumi {
    return Intl.message('最大湿度', name: 'note_maxHumi', desc: '', args: []);
  }

  /// `CO2`
  String get note_co2Level {
    return Intl.message('CO2', name: 'note_co2Level', desc: '', args: []);
  }

  /// `PH`
  String get note_ph {
    return Intl.message('PH', name: 'note_ph', desc: '', args: []);
  }

  /// `Note type`
  String get note_noteType {
    return Intl.message('Note type', name: 'note_noteType', desc: '', args: []);
  }

  /// `-`
  String get sceneSpec_name {
    return Intl.message('-', name: 'sceneSpec_name', desc: '', args: []);
  }

  /// `-`
  String get sceneSpec_sceneType {
    return Intl.message('-', name: 'sceneSpec_sceneType', desc: '', args: []);
  }

  /// `-`
  String get sceneSpec_brightness_shutdownTemp {
    return Intl.message(
      '-',
      name: 'sceneSpec_brightness_shutdownTemp',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sceneSpec_brightness_sunriseDay {
    return Intl.message(
      '-',
      name: 'sceneSpec_brightness_sunriseDay',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sceneSpec_brightness_dimmingTemp {
    return Intl.message(
      '-',
      name: 'sceneSpec_brightness_dimmingTemp',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sceneSpec_brightness_points {
    return Intl.message(
      '-',
      name: 'sceneSpec_brightness_points',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sceneSpec_spectrum_dim1 {
    return Intl.message(
      '-',
      name: 'sceneSpec_spectrum_dim1',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sceneSpec_spectrum_dim2 {
    return Intl.message(
      '-',
      name: 'sceneSpec_spectrum_dim2',
      desc: '',
      args: [],
    );
  }

  /// `位置`
  String get latLng {
    return Intl.message('位置', name: 'latLng', desc: '', args: []);
  }

  /// `-`
  String get latLng_lng {
    return Intl.message('-', name: 'latLng_lng', desc: '', args: []);
  }

  /// `-`
  String get latLng_lat {
    return Intl.message('-', name: 'latLng_lat', desc: '', args: []);
  }

  /// `-`
  String get latLng_alt {
    return Intl.message('-', name: 'latLng_alt', desc: '', args: []);
  }

  /// `-`
  String get roomProfile_roomId {
    return Intl.message('-', name: 'roomProfile_roomId', desc: '', args: []);
  }

  /// `房间名称`
  String get roomProfile_roomName {
    return Intl.message(
      '房间名称',
      name: 'roomProfile_roomName',
      desc: '',
      args: [],
    );
  }

  /// `Plant name`
  String get roomProfile_plantName {
    return Intl.message(
      'Plant name',
      name: 'roomProfile_plantName',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get roomProfile_remark {
    return Intl.message(
      'Description',
      name: 'roomProfile_remark',
      desc: '',
      args: [],
    );
  }

  /// `房间状态`
  String get roomProfile_roomState {
    return Intl.message(
      '房间状态',
      name: 'roomProfile_roomState',
      desc: '',
      args: [],
    );
  }

  /// `环境传感器数据`
  String get roomProfile_sensorData {
    return Intl.message(
      '环境传感器数据',
      name: 'roomProfile_sensorData',
      desc: '',
      args: [],
    );
  }

  /// `场景模式`
  String get roomProfile_sceneMode {
    return Intl.message(
      '场景模式',
      name: 'roomProfile_sceneMode',
      desc: '',
      args: [],
    );
  }

  /// `当前场景`
  String get roomProfile_currentSceneIndex {
    return Intl.message(
      '当前场景',
      name: 'roomProfile_currentSceneIndex',
      desc: '',
      args: [],
    );
  }

  /// `用户`
  String get user {
    return Intl.message('用户', name: 'user', desc: '', args: []);
  }

  /// `Id`
  String get user_userId {
    return Intl.message('Id', name: 'user_userId', desc: '', args: []);
  }

  /// `Account`
  String get user_userName {
    return Intl.message('Account', name: 'user_userName', desc: '', args: []);
  }

  /// `用户是否为超级用户`
  String get user_superUser {
    return Intl.message(
      '用户是否为超级用户',
      name: 'user_superUser',
      desc: '',
      args: [],
    );
  }

  /// `用户姓名`
  String get user_realName {
    return Intl.message('用户姓名', name: 'user_realName', desc: '', args: []);
  }

  /// `头像链接`
  String get user_avatarUrl {
    return Intl.message('头像链接', name: 'user_avatarUrl', desc: '', args: []);
  }

  /// `手机号码`
  String get user_mobile {
    return Intl.message('手机号码', name: 'user_mobile', desc: '', args: []);
  }

  /// `Your Email`
  String get user_email {
    return Intl.message('Your Email', name: 'user_email', desc: '', args: []);
  }

  /// `密码`
  String get user_password {
    return Intl.message('密码', name: 'user_password', desc: '', args: []);
  }

  /// `启用/停用`
  String get user_enabled {
    return Intl.message('启用/停用', name: 'user_enabled', desc: '', args: []);
  }

  /// `性别`
  String get user_gender {
    return Intl.message('性别', name: 'user_gender', desc: '', args: []);
  }

  /// `最后登录时间`
  String get user_lastLoginTime {
    return Intl.message(
      '最后登录时间',
      name: 'user_lastLoginTime',
      desc: '',
      args: [],
    );
  }

  /// `用户头像`
  String get user_avatar {
    return Intl.message('用户头像', name: 'user_avatar', desc: '', args: []);
  }

  /// `备注`
  String get user_remark {
    return Intl.message('备注', name: 'user_remark', desc: '', args: []);
  }

  /// `职位`
  String get user_position {
    return Intl.message('职位', name: 'user_position', desc: '', args: []);
  }

  /// `角色`
  String get user_roles {
    return Intl.message('角色', name: 'user_roles', desc: '', args: []);
  }

  /// `所在的工厂`
  String get user_farms {
    return Intl.message('所在的工厂', name: 'user_farms', desc: '', args: []);
  }

  /// `用户的权限数据`
  String get user_authorities {
    return Intl.message(
      '用户的权限数据',
      name: 'user_authorities',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get user_tenantId {
    return Intl.message('-', name: 'user_tenantId', desc: '', args: []);
  }

  /// `权限管理`
  String get permission {
    return Intl.message('权限管理', name: 'permission', desc: '', args: []);
  }

  /// `ID`
  String get permission_permissionId {
    return Intl.message(
      'ID',
      name: 'permission_permissionId',
      desc: '',
      args: [],
    );
  }

  /// `资源编码`
  String get permission_privilegeCode {
    return Intl.message(
      '资源编码',
      name: 'permission_privilegeCode',
      desc: '',
      args: [],
    );
  }

  /// `角色`
  String get permission_role {
    return Intl.message('角色', name: 'permission_role', desc: '', args: []);
  }

  /// `系统角色`
  String get role {
    return Intl.message('系统角色', name: 'role', desc: '', args: []);
  }

  /// `角色ID`
  String get role_roleId {
    return Intl.message('角色ID', name: 'role_roleId', desc: '', args: []);
  }

  /// `角色编码`
  String get role_roleCode {
    return Intl.message('角色编码', name: 'role_roleCode', desc: '', args: []);
  }

  /// `角色名称`
  String get role_roleName {
    return Intl.message('角色名称', name: 'role_roleName', desc: '', args: []);
  }

  /// `启用/停用`
  String get role_enabled {
    return Intl.message('启用/停用', name: 'role_enabled', desc: '', args: []);
  }

  /// `备注`
  String get role_remark {
    return Intl.message('备注', name: 'role_remark', desc: '', args: []);
  }

  /// `角色权限`
  String get role_permissions {
    return Intl.message('角色权限', name: 'role_permissions', desc: '', args: []);
  }

  /// `角色下的用户`
  String get role_users {
    return Intl.message('角色下的用户', name: 'role_users', desc: '', args: []);
  }

  /// `资源编码`
  String get role_privilegeCodes {
    return Intl.message(
      '资源编码',
      name: 'role_privilegeCodes',
      desc: '',
      args: [],
    );
  }

  /// `温度`
  String get sensorData_temperatures {
    return Intl.message(
      '温度',
      name: 'sensorData_temperatures',
      desc: '',
      args: [],
    );
  }

  /// `湿度`
  String get sensorData_humidities {
    return Intl.message(
      '湿度',
      name: 'sensorData_humidities',
      desc: '',
      args: [],
    );
  }

  /// `二氧化碳`
  String get sensorData_co2s {
    return Intl.message('二氧化碳', name: 'sensorData_co2s', desc: '', args: []);
  }

  /// `光照度`
  String get sensorData_phs {
    return Intl.message('光照度', name: 'sensorData_phs', desc: '', args: []);
  }

  /// `光照度`
  String get sensorData_illuminances {
    return Intl.message(
      '光照度',
      name: 'sensorData_illuminances',
      desc: '',
      args: [],
    );
  }

  /// `EC值`
  String get sensorData_ecs {
    return Intl.message('EC值', name: 'sensorData_ecs', desc: '', args: []);
  }

  /// `大气压`
  String get sensorData_atms {
    return Intl.message('大气压', name: 'sensorData_atms', desc: '', args: []);
  }

  /// `-`
  String get sensorRecord_id {
    return Intl.message('-', name: 'sensorRecord_id', desc: '', args: []);
  }

  /// `Device Code`
  String get sensorRecord_deviceId {
    return Intl.message(
      'Device Code',
      name: 'sensorRecord_deviceId',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sensorRecord_deviceName {
    return Intl.message(
      '-',
      name: 'sensorRecord_deviceName',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sensorRecord_type {
    return Intl.message('-', name: 'sensorRecord_type', desc: '', args: []);
  }

  /// `-`
  String get sensorRecord_value {
    return Intl.message('-', name: 'sensorRecord_value', desc: '', args: []);
  }

  /// `-`
  String get sensorRecord_formatValue {
    return Intl.message(
      '-',
      name: 'sensorRecord_formatValue',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sensorRecord_createTime {
    return Intl.message(
      '-',
      name: 'sensorRecord_createTime',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sensorRecord_timestamp {
    return Intl.message(
      '-',
      name: 'sensorRecord_timestamp',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get camera_cameraName {
    return Intl.message('-', name: 'camera_cameraName', desc: '', args: []);
  }

  /// `-`
  String get camera_playUrl {
    return Intl.message('-', name: 'camera_playUrl', desc: '', args: []);
  }

  /// `-`
  String get camera_cameraType {
    return Intl.message('-', name: 'camera_cameraType', desc: '', args: []);
  }

  /// `模式(Mode)实体类`
  String get mode {
    return Intl.message('模式(Mode)实体类', name: 'mode', desc: '', args: []);
  }

  /// `MODE_ID`
  String get mode_modeId {
    return Intl.message('MODE_ID', name: 'mode_modeId', desc: '', args: []);
  }

  /// `模式名称`
  String get mode_modeName {
    return Intl.message('模式名称', name: 'mode_modeName', desc: '', args: []);
  }

  /// `农场`
  String get mode_tenantId {
    return Intl.message('农场', name: 'mode_tenantId', desc: '', args: []);
  }

  /// `-`
  String get mode_room {
    return Intl.message('-', name: 'mode_room', desc: '', args: []);
  }

  /// `-`
  String get mode_modeItems {
    return Intl.message('-', name: 'mode_modeItems', desc: '', args: []);
  }

  /// `模式项(ModeItem)实体类`
  String get modeItem {
    return Intl.message(
      '模式项(ModeItem)实体类',
      name: 'modeItem',
      desc: '',
      args: [],
    );
  }

  /// `ITEM_ID`
  String get modeItem_itemId {
    return Intl.message('ITEM_ID', name: 'modeItem_itemId', desc: '', args: []);
  }

  /// `-`
  String get modeItem_mode {
    return Intl.message('-', name: 'modeItem_mode', desc: '', args: []);
  }

  /// `-`
  String get modeItem_itemName {
    return Intl.message('-', name: 'modeItem_itemName', desc: '', args: []);
  }

  /// `排序`
  String get modeItem_sortIndex {
    return Intl.message('排序', name: 'modeItem_sortIndex', desc: '', args: []);
  }

  /// `Grow Plan`
  String get scene_sceneId {
    return Intl.message('Grow Plan', name: 'scene_sceneId', desc: '', args: []);
  }

  /// `Grow plan name`
  String get scene_sceneName {
    return Intl.message(
      'Grow plan name',
      name: 'scene_sceneName',
      desc: '',
      args: [],
    );
  }

  /// `Room`
  String get scene_room {
    return Intl.message('Room', name: 'scene_room', desc: '', args: []);
  }

  /// `序号`
  String get scene_sceneIndex {
    return Intl.message('序号', name: 'scene_sceneIndex', desc: '', args: []);
  }

  /// `-`
  String get scene_shutdownTemp {
    return Intl.message('-', name: 'scene_shutdownTemp', desc: '', args: []);
  }

  /// `-`
  String get scene_sunriseDay {
    return Intl.message('-', name: 'scene_sunriseDay', desc: '', args: []);
  }

  /// `-`
  String get scene_dimmingTemp {
    return Intl.message('-', name: 'scene_dimmingTemp', desc: '', args: []);
  }

  /// `-`
  String get scene_brightnessPoints {
    return Intl.message(
      '-',
      name: 'scene_brightnessPoints',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get scene_spectrumDim1 {
    return Intl.message('-', name: 'scene_spectrumDim1', desc: '', args: []);
  }

  /// `-`
  String get scene_spectrumDim2 {
    return Intl.message('-', name: 'scene_spectrumDim2', desc: '', args: []);
  }

  /// `Description`
  String get scene_remark {
    return Intl.message(
      'Description',
      name: 'scene_remark',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get scene_manModeParam {
    return Intl.message('-', name: 'scene_manModeParam', desc: '', args: []);
  }

  /// `-`
  String get scene_seedingParam {
    return Intl.message('-', name: 'scene_seedingParam', desc: '', args: []);
  }

  /// `-`
  String get scene_vegetativeParam {
    return Intl.message('-', name: 'scene_vegetativeParam', desc: '', args: []);
  }

  /// `-`
  String get scene_floweringParam {
    return Intl.message('-', name: 'scene_floweringParam', desc: '', args: []);
  }

  /// `-`
  String get scene_settingType {
    return Intl.message('-', name: 'scene_settingType', desc: '', args: []);
  }

  /// `-`
  String get sceneSetting_modeEnable {
    return Intl.message(
      '-',
      name: 'sceneSetting_modeEnable',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sceneSetting_dim1Per {
    return Intl.message('-', name: 'sceneSetting_dim1Per', desc: '', args: []);
  }

  /// `-`
  String get sceneSetting_dim2Per {
    return Intl.message('-', name: 'sceneSetting_dim2Per', desc: '', args: []);
  }

  /// `-`
  String get sceneSetting_dim3Per {
    return Intl.message('-', name: 'sceneSetting_dim3Per', desc: '', args: []);
  }

  /// `-`
  String get sceneSetting_schEnable {
    return Intl.message(
      '-',
      name: 'sceneSetting_schEnable',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sceneSetting_schStartTime {
    return Intl.message(
      '-',
      name: 'sceneSetting_schStartTime',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sceneSetting_schEndTime {
    return Intl.message(
      '-',
      name: 'sceneSetting_schEndTime',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sceneSetting_schStartDate {
    return Intl.message(
      '-',
      name: 'sceneSetting_schStartDate',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sceneSetting_schEndDate {
    return Intl.message(
      '-',
      name: 'sceneSetting_schEndDate',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sceneSetting_vent_sch1 {
    return Intl.message(
      '-',
      name: 'sceneSetting_vent_sch1',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sceneSetting_vent_sch2 {
    return Intl.message(
      '-',
      name: 'sceneSetting_vent_sch2',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sceneSetting_vent_sch3 {
    return Intl.message(
      '-',
      name: 'sceneSetting_vent_sch3',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get sceneSetting_fan_sch1 {
    return Intl.message('-', name: 'sceneSetting_fan_sch1', desc: '', args: []);
  }

  /// `-`
  String get sceneSetting_fan_sch2 {
    return Intl.message('-', name: 'sceneSetting_fan_sch2', desc: '', args: []);
  }

  /// `-`
  String get sceneSetting_fan_sch3 {
    return Intl.message('-', name: 'sceneSetting_fan_sch3', desc: '', args: []);
  }

  /// `-`
  String get ventSchedule_enable {
    return Intl.message('-', name: 'ventSchedule_enable', desc: '', args: []);
  }

  /// `-`
  String get ventSchedule_lowTemp {
    return Intl.message('-', name: 'ventSchedule_lowTemp', desc: '', args: []);
  }

  /// `-`
  String get ventSchedule_highTemp {
    return Intl.message('-', name: 'ventSchedule_highTemp', desc: '', args: []);
  }

  /// `-`
  String get ventSchedule_workLevel {
    return Intl.message(
      '-',
      name: 'ventSchedule_workLevel',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get ventSchedule_workTime {
    return Intl.message('-', name: 'ventSchedule_workTime', desc: '', args: []);
  }

  /// `-`
  String get fanSchedule_enable {
    return Intl.message('-', name: 'fanSchedule_enable', desc: '', args: []);
  }

  /// `-`
  String get fanSchedule_lowTemp {
    return Intl.message('-', name: 'fanSchedule_lowTemp', desc: '', args: []);
  }

  /// `-`
  String get fanSchedule_highTemp {
    return Intl.message('-', name: 'fanSchedule_highTemp', desc: '', args: []);
  }

  /// `-`
  String get fanSchedule_workLevel {
    return Intl.message('-', name: 'fanSchedule_workLevel', desc: '', args: []);
  }

  /// `-`
  String get fanSchedule_workTime {
    return Intl.message('-', name: 'fanSchedule_workTime', desc: '', args: []);
  }

  /// `-`
  String get manModeParam_dim1Per {
    return Intl.message('-', name: 'manModeParam_dim1Per', desc: '', args: []);
  }

  /// `-`
  String get manModeParam_dim2Per {
    return Intl.message('-', name: 'manModeParam_dim2Per', desc: '', args: []);
  }

  /// `-`
  String get manModeParam_dim3Per {
    return Intl.message('-', name: 'manModeParam_dim3Per', desc: '', args: []);
  }

  /// `-`
  String get manModeParam_schEnable {
    return Intl.message(
      '-',
      name: 'manModeParam_schEnable',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get manModeParam_schStartTime {
    return Intl.message(
      '-',
      name: 'manModeParam_schStartTime',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get manModeParam_schEndTime {
    return Intl.message(
      '-',
      name: 'manModeParam_schEndTime',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get manModeParam_schStartDate {
    return Intl.message(
      '-',
      name: 'manModeParam_schStartDate',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get manModeParam_schEndDate {
    return Intl.message(
      '-',
      name: 'manModeParam_schEndDate',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get manModeParam_ventOnTime {
    return Intl.message(
      '-',
      name: 'manModeParam_ventOnTime',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get manModeParam_ventOffTime {
    return Intl.message(
      '-',
      name: 'manModeParam_ventOffTime',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get manModeParam_ventLevel {
    return Intl.message(
      '-',
      name: 'manModeParam_ventLevel',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get manModeParam_fanOnTime {
    return Intl.message(
      '-',
      name: 'manModeParam_fanOnTime',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get manModeParam_fanOffTime {
    return Intl.message(
      '-',
      name: 'manModeParam_fanOffTime',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get manModeParam_fanLevel {
    return Intl.message('-', name: 'manModeParam_fanLevel', desc: '', args: []);
  }

  /// `帐号ID`
  String get authCustomer_id {
    return Intl.message('帐号ID', name: 'authCustomer_id', desc: '', args: []);
  }

  /// `帐号名称`
  String get authCustomer_name {
    return Intl.message('帐号名称', name: 'authCustomer_name', desc: '', args: []);
  }

  /// `姓名`
  String get authCustomer_email {
    return Intl.message('姓名', name: 'authCustomer_email', desc: '', args: []);
  }

  /// `密码`
  String get authCustomer_password {
    return Intl.message(
      '密码',
      name: 'authCustomer_password',
      desc: '',
      args: [],
    );
  }

  /// `头像地址`
  String get authCustomer_avatar {
    return Intl.message(
      '头像地址',
      name: 'authCustomer_avatar',
      desc: '',
      args: [],
    );
  }

  /// `token`
  String get authCustomer_token {
    return Intl.message(
      'token',
      name: 'authCustomer_token',
      desc: '',
      args: [],
    );
  }

  /// `扩展数据`
  String get authCustomer_extend {
    return Intl.message(
      '扩展数据',
      name: 'authCustomer_extend',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get feedback {
    return Intl.message('Feedback', name: 'feedback', desc: '', args: []);
  }

  /// `-`
  String get feedback_feedId {
    return Intl.message('-', name: 'feedback_feedId', desc: '', args: []);
  }

  /// `Content`
  String get feedback_content {
    return Intl.message(
      'Content',
      name: 'feedback_content',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get feedback_user {
    return Intl.message('User', name: 'feedback_user', desc: '', args: []);
  }

  /// `Reply`
  String get feedback_reply {
    return Intl.message('Reply', name: 'feedback_reply', desc: '', args: []);
  }

  /// `Handler`
  String get feedback_handler {
    return Intl.message(
      'Handler',
      name: 'feedback_handler',
      desc: '',
      args: [],
    );
  }

  /// `Handle Time`
  String get feedback_handleTime {
    return Intl.message(
      'Handle Time',
      name: 'feedback_handleTime',
      desc: '',
      args: [],
    );
  }

  /// `{note_noteType, select, WATERING{Watering} NUTRIENTS{Nutrients} PEST_CONTROL{Pest Control} TRIM{Trim} LIGHT_SCHEDULE{Light Schedule} HEIGHT{Height} LAMP_TO_PLANT_DISTANCE{Lamp To Plant Distance} POT_SIZE{Pot Size} TEMPERATURE_HUMIDITY{Temperature Humidity} CO2{Co2} TRANING{Traning} ROOT_PH{Root Ph} OTHER{Other} other{-}}`
  String note_noteType_enum(Object note_noteType) {
    return Intl.select(
      note_noteType,
      {
        'WATERING': 'Watering',
        'NUTRIENTS': 'Nutrients',
        'PEST_CONTROL': 'Pest Control',
        'TRIM': 'Trim',
        'LIGHT_SCHEDULE': 'Light Schedule',
        'HEIGHT': 'Height',
        'LAMP_TO_PLANT_DISTANCE': 'Lamp To Plant Distance',
        'POT_SIZE': 'Pot Size',
        'TEMPERATURE_HUMIDITY': 'Temperature Humidity',
        'CO2': 'Co2',
        'TRANING': 'Traning',
        'ROOT_PH': 'Root Ph',
        'OTHER': 'Other',
        'other': '-',
      },
      name: 'note_noteType_enum',
      desc: '',
      args: [note_noteType],
    );
  }

  /// `{room_roomState, select, NORMAL{正常} ALARM{报警} OPERATING{操作中} other{-}}`
  String room_roomState_enum(Object room_roomState) {
    return Intl.select(
      room_roomState,
      {'NORMAL': '正常', 'ALARM': '报警', 'OPERATING': '操作中', 'other': '-'},
      name: 'room_roomState_enum',
      desc: '',
      args: [room_roomState],
    );
  }

  /// `{role_defaultRole, select, STAFF{默认角色} MAINTAIN_USER{保养人员} REPAIR_USER{维修人员} PRECISE_USER{精密度检查人员} MANAGER{厂区管理员} ADMIN{系统管理员} other{-}}`
  String role_defaultRole_enum(Object role_defaultRole) {
    return Intl.select(
      role_defaultRole,
      {
        'STAFF': '默认角色',
        'MAINTAIN_USER': '保养人员',
        'REPAIR_USER': '维修人员',
        'PRECISE_USER': '精密度检查人员',
        'MANAGER': '厂区管理员',
        'ADMIN': '系统管理员',
        'other': '-',
      },
      name: 'role_defaultRole_enum',
      desc: '',
      args: [role_defaultRole],
    );
  }

  /// `{sceneSetting_settingType, select, SEEDING{Seedling} VEGETATIVE{Vegetative} FLOWERING{Flowering} other{-}}`
  String sceneSetting_settingType_enum(Object sceneSetting_settingType) {
    return Intl.select(
      sceneSetting_settingType,
      {
        'SEEDING': 'Seedling',
        'VEGETATIVE': 'Vegetative',
        'FLOWERING': 'Flowering',
        'other': '-',
      },
      name: 'sceneSetting_settingType_enum',
      desc: '',
      args: [sceneSetting_settingType],
    );
  }

  /// `Running Status`
  String get dash_running_status {
    return Intl.message(
      'Running Status',
      name: 'dash_running_status',
      desc: '',
      args: [],
    );
  }

  /// `Lighting`
  String get dash_lighting {
    return Intl.message('Lighting', name: 'dash_lighting', desc: '', args: []);
  }

  /// `Fan`
  String get dash_fan {
    return Intl.message('Fan', name: 'dash_fan', desc: '', args: []);
  }

  /// `Ventilator`
  String get dash_ventilator {
    return Intl.message(
      'Ventilator',
      name: 'dash_ventilator',
      desc: '',
      args: [],
    );
  }

  /// `Manual Light Setting`
  String get manual_light_setting {
    return Intl.message(
      'Manual Light Setting',
      name: 'manual_light_setting',
      desc: '',
      args: [],
    );
  }

  /// `Auto Light Setting`
  String get auto_light_setting {
    return Intl.message(
      'Auto Light Setting',
      name: 'auto_light_setting',
      desc: '',
      args: [],
    );
  }

  /// `Manual Fan Setting`
  String get manual_fan_setting {
    return Intl.message(
      'Manual Fan Setting',
      name: 'manual_fan_setting',
      desc: '',
      args: [],
    );
  }

  /// `Auto Fan Setting`
  String get auto_fan_setting {
    return Intl.message(
      'Auto Fan Setting',
      name: 'auto_fan_setting',
      desc: '',
      args: [],
    );
  }

  /// `Manual Ventilator Setting`
  String get manual_vent_setting {
    return Intl.message(
      'Manual Ventilator Setting',
      name: 'manual_vent_setting',
      desc: '',
      args: [],
    );
  }

  /// `Auto Ventilator Setting`
  String get auto_vent_setting {
    return Intl.message(
      'Auto Ventilator Setting',
      name: 'auto_vent_setting',
      desc: '',
      args: [],
    );
  }

  /// `Device setting`
  String get device_setting {
    return Intl.message(
      'Device setting',
      name: 'device_setting',
      desc: '',
      args: [],
    );
  }

  /// `Lock Screen Setting`
  String get lock_screen_setting {
    return Intl.message(
      'Lock Screen Setting',
      name: 'lock_screen_setting',
      desc: '',
      args: [],
    );
  }

  /// `Screen lock`
  String get screen_lock {
    return Intl.message('Screen lock', name: 'screen_lock', desc: '', args: []);
  }

  /// `Key Sound Setting`
  String get dev_key_sound_setting {
    return Intl.message(
      'Key Sound Setting',
      name: 'dev_key_sound_setting',
      desc: '',
      args: [],
    );
  }

  /// `Key sound`
  String get dev_key_sound {
    return Intl.message('Key sound', name: 'dev_key_sound', desc: '', args: []);
  }

  /// `Date Range`
  String get grow_date_range {
    return Intl.message(
      'Date Range',
      name: 'grow_date_range',
      desc: '',
      args: [],
    );
  }

  /// `On`
  String get on {
    return Intl.message('On', name: 'on', desc: '', args: []);
  }

  /// `Off`
  String get off {
    return Intl.message('Off', name: 'off', desc: '', args: []);
  }

  /// `Sync time to the device`
  String get auto_sync_dev_time {
    return Intl.message(
      'Sync time to the device',
      name: 'auto_sync_dev_time',
      desc: '',
      args: [],
    );
  }

  /// `Garden is empty, Add a garden now !`
  String get farms_list_empty_tip_add {
    return Intl.message(
      'Garden is empty, Add a garden now !',
      name: 'farms_list_empty_tip_add',
      desc: '',
      args: [],
    );
  }

  /// `Can't be empty`
  String get valid_required_not_empty_tip {
    return Intl.message(
      'Can\'t be empty',
      name: 'valid_required_not_empty_tip',
      desc: '',
      args: [],
    );
  }

  /// `Length no more than`
  String get valid_len_no_more_than {
    return Intl.message(
      'Length no more than',
      name: 'valid_len_no_more_than',
      desc: '',
      args: [],
    );
  }

  /// `Length no less than`
  String get valid_len_no_less_than {
    return Intl.message(
      'Length no less than',
      name: 'valid_len_no_less_than',
      desc: '',
      args: [],
    );
  }

  /// `Max no more than`
  String get valid_no_more_than {
    return Intl.message(
      'Max no more than',
      name: 'valid_no_more_than',
      desc: '',
      args: [],
    );
  }

  /// `Min no less than`
  String get valid_no_less_than {
    return Intl.message(
      'Min no less than',
      name: 'valid_no_less_than',
      desc: '',
      args: [],
    );
  }

  /// `Email format error`
  String get valid_email_format_err_tip {
    return Intl.message(
      'Email format error',
      name: 'valid_email_format_err_tip',
      desc: '',
      args: [],
    );
  }

  /// `Phone format error`
  String get valid_phone_format_err_tip {
    return Intl.message(
      'Phone format error',
      name: 'valid_phone_format_err_tip',
      desc: '',
      args: [],
    );
  }

  /// `Identity card is too short`
  String get valid_identity_card_too_short {
    return Intl.message(
      'Identity card is too short',
      name: 'valid_identity_card_too_short',
      desc: '',
      args: [],
    );
  }

  /// `Identity card verify fail`
  String get valid_identity_card_verify_err {
    return Intl.message(
      'Identity card verify fail',
      name: 'valid_identity_card_verify_err',
      desc: '',
      args: [],
    );
  }

  /// `Format error`
  String get valid_format_error {
    return Intl.message(
      'Format error',
      name: 'valid_format_error',
      desc: '',
      args: [],
    );
  }

  /// `It must be an integer`
  String get valid_must_be_integer {
    return Intl.message(
      'It must be an integer',
      name: 'valid_must_be_integer',
      desc: '',
      args: [],
    );
  }

  /// `Must be numeric and no more two digits`
  String get valid_must_numeric_more_tow_d {
    return Intl.message(
      'Must be numeric and no more two digits',
      name: 'valid_must_numeric_more_tow_d',
      desc: '',
      args: [],
    );
  }

  /// `Must be numeric and no more three digits`
  String get valid_must_numeric_more_three_d {
    return Intl.message(
      'Must be numeric and no more three digits',
      name: 'valid_must_numeric_more_three_d',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to connect this bluetooth?\nAnd configure device network`
  String get confirm_connect_bluetooth {
    return Intl.message(
      'Are you sure to connect this bluetooth?\nAnd configure device network',
      name: 'confirm_connect_bluetooth',
      desc: '',
      args: [],
    );
  }

  /// `No Device Found?`
  String get not_found_device_tip {
    return Intl.message(
      'No Device Found?',
      name: 'not_found_device_tip',
      desc: '',
      args: [],
    );
  }

  /// `Make sure the nearby device is powered on.`
  String get confirm_device_power_on_tip {
    return Intl.message(
      'Make sure the nearby device is powered on.',
      name: 'confirm_device_power_on_tip',
      desc: '',
      args: [],
    );
  }

  /// `Move your mobile phone closer to your device.`
  String get confirm_device_search_range_tip {
    return Intl.message(
      'Move your mobile phone closer to your device.',
      name: 'confirm_device_search_range_tip',
      desc: '',
      args: [],
    );
  }

  /// `Swipe down on the screen to search again.`
  String get device_re_search_tip {
    return Intl.message(
      'Swipe down on the screen to search again.',
      name: 'device_re_search_tip',
      desc: '',
      args: [],
    );
  }

  /// `Not found items`
  String get tip_not_content_tip {
    return Intl.message(
      'Not found items',
      name: 'tip_not_content_tip',
      desc: '',
      args: [],
    );
  }

  /// `Take picture`
  String get snap {
    return Intl.message('Take picture', name: 'snap', desc: '', args: []);
  }

  /// `Album`
  String get photo {
    return Intl.message('Album', name: 'photo', desc: '', args: []);
  }

  /// `Scene photo`
  String get scene_photo {
    return Intl.message('Scene photo', name: 'scene_photo', desc: '', args: []);
  }

  /// `Create note`
  String get create_note {
    return Intl.message('Create note', name: 'create_note', desc: '', args: []);
  }

  /// `Upload`
  String get upload {
    return Intl.message('Upload', name: 'upload', desc: '', args: []);
  }

  /// `Filming`
  String get filming {
    return Intl.message('Filming', name: 'filming', desc: '', args: []);
  }

  /// `Connecting...`
  String get do_connecting {
    return Intl.message(
      'Connecting...',
      name: 'do_connecting',
      desc: '',
      args: [],
    );
  }

  /// `Config network...`
  String get do_config_network {
    return Intl.message(
      'Config network...',
      name: 'do_config_network',
      desc: '',
      args: [],
    );
  }

  /// `Mobile bluetooth function, not turned on`
  String get bluetooth_not_on_tip {
    return Intl.message(
      'Mobile bluetooth function, not turned on',
      name: 'bluetooth_not_on_tip',
      desc: '',
      args: [],
    );
  }

  /// `Turn on the bluetooth, Click the button below!`
  String get open_bluetooth_tip {
    return Intl.message(
      'Turn on the bluetooth, Click the button below!',
      name: 'open_bluetooth_tip',
      desc: '',
      args: [],
    );
  }

  /// `Turn on Bluetooth`
  String get open_bluetooth {
    return Intl.message(
      'Turn on Bluetooth',
      name: 'open_bluetooth',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `SIGN IN`
  String get account_login {
    return Intl.message('SIGN IN', name: 'account_login', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Tip: Synchronize the device time with the system.`
  String get tip_sync_time {
    return Intl.message(
      'Tip: Synchronize the device time with the system.',
      name: 'tip_sync_time',
      desc: '',
      args: [],
    );
  }

  /// `Tip: This chang only apply to the APP, it will not be synchronized to the device.`
  String get tip_temp_uint {
    return Intl.message(
      'Tip: This chang only apply to the APP, it will not be synchronized to the device.',
      name: 'tip_temp_uint',
      desc: '',
      args: [],
    );
  }

  /// `CREATE YOUR ACCOUNT`
  String get welcome_create_account {
    return Intl.message(
      'CREATE YOUR ACCOUNT',
      name: 'welcome_create_account',
      desc: '',
      args: [],
    );
  }

  /// `Device`
  String get room {
    return Intl.message('Device', name: 'room', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
