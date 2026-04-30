import 'Privilege.dart';

class SecurityService {
  // 工厂模式
  factory SecurityService() => _getInstance();

  static SecurityService get instance => _getInstance();
  static SecurityService _instance = SecurityService._internal();

  List<Privilege>? _privileges;

  SecurityService._internal() {}

  static SecurityService _getInstance() {
    if (_instance == null) {
      _instance = new SecurityService._internal();
    }
    return _instance;
  }

  setPrivileges(List<Privilege>? privileges) {
    this._privileges = privileges;
  }

  /**
   * 判断是否具有权限
   */
  bool hasPermission(String privilegeCode) {
    return _findPrivilege(privilegeCode, _privileges);
  }

  bool _findPrivilege(String code, List<Privilege>? ples) {
    if (ples != null) {
      for (var privilege in ples) {
        if (privilege.code == code) {
          return true;
        }
        bool permission = _findPrivilege(code, privilege.children);
        if (permission) {
          return permission;
        }
      }
    }
    return false;
  }
}
