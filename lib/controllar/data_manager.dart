
class DataManager {
  var _phone,_userId,_userName,_companyId,_companyName,_companyDomain,_companyToken,_fileUrl,_inspectedFileUrl,_audioUrl;
  bool _connection = false;

  static final DataManager ourInstance = DataManager();
  static DataManager getInstance() {return ourInstance;}

  bool getConnection() {
    return _connection;
  }
  setConnection(value) {
    _connection = value;
  }


  String getPhone() {
    return _phone;
  }
  setPhone(value) {
    _phone = value;
  }

  String getUserId() {
    return _userId;
  }
  setUserId(value) {
    _userId = value;
  }
  String getUserName() {
    return _userName;
  }
  setUserName(value) {
    _userName = value;
  }
  String getCompanyId() {
    return _companyId;
  }
  setCompanyId(value) {
    _companyId = value;
  }
  String getCompanyName() {
    return _companyName;
  }
  setCompanyName(value) {
    _companyName = value;
  }
  String getCompanyDomain() {
    return _companyDomain;
  }
  setCompanyDomain(value) {
    _companyDomain = value;
  }
  String getFileUrl() {
    return _fileUrl;
  }
  setFileUrl(value) {
    _fileUrl = value;
  }
  String getInspectedFileUrl() {
    return _inspectedFileUrl;
  }
  setInspectedFileUrl(value) {
    _inspectedFileUrl = value;
  }
  String getAudioUrl() {
    return _audioUrl;
  }
  setAudioUrl(value) {
    _audioUrl = value;
  }
  String getCompanyToken() {
    return _companyToken;
  }
  setCompanyToken(value) {
    _companyToken = value;
  }


}