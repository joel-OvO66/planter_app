import 'package:intl/intl.dart';
import 'package:tornado/network/HttpService.dart';
// region 前端扩展导入包
import 'package:tornado/security/Privilege.dart';

import '../entity/security/entity/Role.dart';
import '../entity/security/entity/User.dart';
// endregion

   /**
   * 系统管理员或用户
   */
class SecurityController{

    static const ADD_ROLE = 'security/addRole';
   /**
   * 添加角色
   * @param role
   * @return Role
   * @throws IOException
   * @throws FieldException
   */
    static Future<Role> addRole(Role role) {
        return HttpService.post<Role>(ADD_ROLE, data: role, fromJson: Role.fromJson);
    }

    static const CHANGE_FARM = 'security/changeFarm';
   /**
   * 切换工厂
   * @param authentication
   * @param farmId
   * @return String
   */
    static Future<String> changeFarm(String farmId) {
        return HttpService.post<String>(CHANGE_FARM, queryParameters: {"farmId": farmId});
    }

    static const ENABLED_ROLE = 'security/enabledRole';
   /**
   * 启用禁用角色
   * @param roleId
   * @param enabled
   * @return bool
   */
    static Future<bool> enabledRole(int roleId, bool enabled) {
        return HttpService.post<bool>(ENABLED_ROLE, queryParameters: {"roleId": roleId,"enabled": enabled});
    }

    static const GET_LOGIN_USER_INFO = 'security/getLoginUserInfo';
   /**
   * 查询登录用户信息
   * @param authentication
   * @return User
   */
    static Future<User?> getLoginUserInfo() {
        return HttpService.get<User>(GET_LOGIN_USER_INFO, fromJson: User.fromJson);
    }

    static const GET_PRIVILEGE_CODES_BY_ROLE_ID = 'security/getPrivilegeCodesByRoleId';
   /**
   * 根据角色ID获取权限编码
   * @param roleId
   * @return List<String>
   */
    static Future<List<String>?> getPrivilegeCodesByRoleId(int roleId) {
        return HttpService.getList<String>(GET_PRIVILEGE_CODES_BY_ROLE_ID, queryParameters: {"roleId": roleId});
    }

    static const GET_ROLE_BY_ID = 'security/getRoleById';
   /**
   * 获取角色
   * @param roleId
   * @return Role
   */
    static Future<Role?> getRoleById(int roleId) {
        return HttpService.get<Role>(GET_ROLE_BY_ID, queryParameters: {"roleId": roleId}, fromJson: Role.fromJson);
    }

    static const GET_USER_BY_USER_NAME = 'security/getUserByUserName';
   /**
   * 根据用户名获取用户
   * @param roleCodes
   * @return User
   * @param userName
   * @return User
   */
    static Future<User?> getUserByUserName(String userName) {
        return HttpService.get<User>(GET_USER_BY_USER_NAME, queryParameters: {"userName": userName}, fromJson: User.fromJson);
    }

    static const GET_USERS_BY_FARM_ID = 'security/getUsersByFarmId';
   /**
   * 根据CustomerId查询Customer下所有的农场
   * @return List<User>
   */
    static Future<List<User>?> getUsersByFarmId() {
        return HttpService.getList<User>(GET_USERS_BY_FARM_ID, fromJson: User.fromJson);
    }

    static const LOGOFF_USER = 'security/logoffUser';
   /**
   * 启用禁用用户
   * @return bool
   */
    static Future<bool> logoffUser() {
        return HttpService.post<bool>(LOGOFF_USER);
    }

    static const PAGE_ROLE = 'security/pageRole';

    static const PAGE_USER = 'security/pageUser';

    static const REMOVE_ROLE_BY_ID = 'security/removeRoleById';
   /**
   * 删除角色
   * @param roleId
   * @return int
   * @throws IOException
   */
    static Future<int?> removeRoleById(int roleId) {
        return HttpService.delete<int>(REMOVE_ROLE_BY_ID, queryParameters: {"roleId": roleId});
    }

    static const REMOVE_USER_BY_ID = 'security/removeUserById';
   /**
   * 删除用户
   * @param userId
   * @param authentication
   */
    static Future<void> removeUserById(int userId) {
        return HttpService.delete<void>(REMOVE_USER_BY_ID, queryParameters: {"userId": userId});
    }

    static const RESET_USER_PASSWORD = 'security/resetUserPassword';
   /**
   * 重置密码
   * @param user
   * @return String
   */
    static Future<String> resetUserPassword(User user) {
        return HttpService.post<String>(RESET_USER_PASSWORD, data: user);
    }

    static const UPDATE_PASSWORD = 'security/updatePassword';
   /**
   * 改变用户密码
   * @param userId
   * @return bool
   * @param password
   * @param authentication
   * @return bool
   */
    static Future<bool> updatePassword(String password) {
        return HttpService.post<bool>(UPDATE_PASSWORD, queryParameters: {"password": password});
    }

    static const UPDATE_PRIVILEGES = 'security/updatePrivileges';
   /**
   * 更新权限
   * @param privileges
   * @return String
   * @throws IOException
   */
    static Future<String> updatePrivileges(List<Privilege> privileges) {
        return HttpService.post<String>(UPDATE_PRIVILEGES, data: privileges);
    }

    static const UPDATE_PROFILE = 'security/updateProfile';
   /**
   * 更新用户配置
   * @param user
   * @return User
   */
    static Future<User> updateProfile(User user) {
        return HttpService.post<User>(UPDATE_PROFILE, data: user, fromJson: User.fromJson);
    }

    static const UPDATE_ROLE = 'security/updateRole';
   /**
   * 修改角色
   * @param role
   * @return Role
   * @throws FieldException
   * @throws IOException
   */
    static Future<Role> updateRole(Role role) {
        return HttpService.post<Role>(UPDATE_ROLE, data: role, fromJson: Role.fromJson);
    }

    static const UPDATE_USER = 'security/updateUser';
   /**
   * 更新用户
   * @param user
   * @return bool
   * @throws FieldException
   */
    static Future<bool> updateUser(User user) {
        return HttpService.post<bool>(UPDATE_USER, data: user);
    }

    static const UPDATE_USER_INFO = 'security/updateUserInfo';
   /**
   * 用户自己修改用户信息
   * @param user
   * @return User
   * @throws FieldException
   */
    static Future<User> updateUserInfo(User user) {
        return HttpService.post<User>(UPDATE_USER_INFO, data: user, fromJson: User.fromJson);
    }

    // region 前端扩展代码区
    // endregion
}
