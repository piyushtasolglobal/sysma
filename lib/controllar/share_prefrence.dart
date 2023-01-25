import 'package:shared_preferences/shared_preferences.dart';

class SharePre {
  // save data in local

  static setPhone(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phone', value);
  }
  static setCompanyDomain(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('companyDomain', value);
  }
  static setCompanyId(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('companyId', value);
  }
  static setCompanyName(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('companyName', value);
  }
  static setFileUrl(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('fileUrl', value);
  }
  static setInspectedFileUrl(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('inspectedFileUrl', value);
  }
  static setAudioUrl(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('audioUrl', value);
  }
  static setUserId(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', value);
  }
  static setUserName(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', value);
  }
  static setCompanyToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('companyToken', value);
  }

  static setCompleteTableStatus(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('completeTableStatus', value);
  }
  static setScheduleTableStatus(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('scheduleTableStatus', value);
  }
}