import 'dart:convert';
/// api_status : 1
/// api_message : "User is Found Asset."
/// AllUserAssetAssgainData : [{"id":2516,"name":"Portable Fire Ext - CA - 2 Kg","asset_tag":"UAT-01647","model_id":124,"model_name":"Portable Fire Ext - CA - 2 KG","serial":"4853","purchase_date":"2022-09-01","purchase_cost":null,"order_number":null,"assigned_to":null,"notes":null,"image":"asset-image-ALfhFHoljN.png","user_id":38,"created_at":"2022-09-13 07:59:54","updated_at":"2022-09-13 14:11:34","physical":1,"deleted_at":null,"status_id":2,"archived":0,"warranty_months":36,"depreciate":0,"supplier_id":9,"requestable":0,"rtd_location_id":39,"location":"FSE - Store","_snipeit_mac_address_1":null,"accepted":null,"last_checkout":null,"expected_checkin":null,"company_id":10,"assigned_type":null,"last_audit_date":"2022-09-19 05:42:20","next_audit_date":null,"location_id":39,"checkin_counter":0,"checkout_counter":0,"requests_counter":0,"audit_params_values":null,"audit_params_transaction":null,"dyamic_model_fieldset":null,"category_name":"Fire Extinguishers NASA","supplier_name":"NASA","company_name":"ASAN","_snipeit_uplink_ports_2":null,"_snipeit_power_over_ethernet_poe_3":null,"_snipeit_fan_4":null,"_snipeit_power_supply_5":null,"_snipeit_features_6":null,"_snipeit_network_management_7":null,"_snipeit_warranty_type_8":null,"_snipeit_network_ports_9":null,"prev_main_owner_type":"Inherit","_snipeit_mac_id_10":null,"_snipeit_ip_address_11":null,"_snipeit_username_12":null,"_snipeit_password_13":null,"_snipeit_port_number_14":null,"mail_status":0,"category_id":56,"status":"Deployed","asset_status":1,"pm_history":[{"audit_schdule_id":7480,"audit_id":110,"audit_name":"Portable Fire Extinguisher ( Weekly )","asset_tag_id":2516,"audit_start_date":"2022-09-14 00:00:00","audit_end_date":"2022-09-14 15:00:00","schedule_expire_date":"2022-09-15 00:00:00","audit_inspection_date":"2022-09-14 17:29:15","audit_status":"completed","audit_result":"Pass","inspection_delay":"Yes","audit_params_id":79,"asset_owner_id":38,"asset_user_owner_id":null,"deleted_at":null,"institution_id":10,"prev_maintenanace_owner_type":"group","prev_maintenanace_owner_id":6,"params_master_id":"79","is_process":1,"escalated_audit_levels":null,"push_send_notification":1,"created_at":"2022-09-14 11:45:19","updated_at":"2022-09-14 17:29:15","audited_params":null}]}]

AssetsStatus assetsStatusFromJson(String str) => AssetsStatus.fromJson(json.decode(str));
String assetsStatusToJson(AssetsStatus data) => json.encode(data.toJson());
class AssetsStatus {
  AssetsStatus({
      num? apiStatus, 
      String? apiMessage, 
      List<AllUserAssetAssgainData>? allUserAssetAssgainData,}){
    _apiStatus = apiStatus;
    _apiMessage = apiMessage;
    _allUserAssetAssgainData = allUserAssetAssgainData;
}

  AssetsStatus.fromJson(dynamic json) {
    _apiStatus = json['api_status'];
    _apiMessage = json['api_message'];
    if (json['AllUserAssetAssgainData'] != null) {
      _allUserAssetAssgainData = [];
      json['AllUserAssetAssgainData'].forEach((v) {
        _allUserAssetAssgainData?.add(AllUserAssetAssgainData.fromJson(v));
      });
    }
  }
  num? _apiStatus;
  String? _apiMessage;
  List<AllUserAssetAssgainData>? _allUserAssetAssgainData;
AssetsStatus copyWith({  num? apiStatus,
  String? apiMessage,
  List<AllUserAssetAssgainData>? allUserAssetAssgainData,
}) => AssetsStatus(  apiStatus: apiStatus ?? _apiStatus,
  apiMessage: apiMessage ?? _apiMessage,
  allUserAssetAssgainData: allUserAssetAssgainData ?? _allUserAssetAssgainData,
);
  num? get apiStatus => _apiStatus;
  String? get apiMessage => _apiMessage;
  List<AllUserAssetAssgainData>? get allUserAssetAssgainData => _allUserAssetAssgainData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['api_status'] = _apiStatus;
    map['api_message'] = _apiMessage;
    if (_allUserAssetAssgainData != null) {
      map['AllUserAssetAssgainData'] = _allUserAssetAssgainData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2516
/// name : "Portable Fire Ext - CA - 2 Kg"
/// asset_tag : "UAT-01647"
/// model_id : 124
/// model_name : "Portable Fire Ext - CA - 2 KG"
/// serial : "4853"
/// purchase_date : "2022-09-01"
/// purchase_cost : null
/// order_number : null
/// assigned_to : null
/// notes : null
/// image : "asset-image-ALfhFHoljN.png"
/// user_id : 38
/// created_at : "2022-09-13 07:59:54"
/// updated_at : "2022-09-13 14:11:34"
/// physical : 1
/// deleted_at : null
/// status_id : 2
/// archived : 0
/// warranty_months : 36
/// depreciate : 0
/// supplier_id : 9
/// requestable : 0
/// rtd_location_id : 39
/// location : "FSE - Store"
/// _snipeit_mac_address_1 : null
/// accepted : null
/// last_checkout : null
/// expected_checkin : null
/// company_id : 10
/// assigned_type : null
/// last_audit_date : "2022-09-19 05:42:20"
/// next_audit_date : null
/// location_id : 39
/// checkin_counter : 0
/// checkout_counter : 0
/// requests_counter : 0
/// audit_params_values : null
/// audit_params_transaction : null
/// dyamic_model_fieldset : null
/// category_name : "Fire Extinguishers NASA"
/// supplier_name : "NASA"
/// company_name : "ASAN"
/// _snipeit_uplink_ports_2 : null
/// _snipeit_power_over_ethernet_poe_3 : null
/// _snipeit_fan_4 : null
/// _snipeit_power_supply_5 : null
/// _snipeit_features_6 : null
/// _snipeit_network_management_7 : null
/// _snipeit_warranty_type_8 : null
/// _snipeit_network_ports_9 : null
/// prev_main_owner_type : "Inherit"
/// _snipeit_mac_id_10 : null
/// _snipeit_ip_address_11 : null
/// _snipeit_username_12 : null
/// _snipeit_password_13 : null
/// _snipeit_port_number_14 : null
/// mail_status : 0
/// category_id : 56
/// status : "Deployed"
/// asset_status : 1
/// pm_history : [{"audit_schdule_id":7480,"audit_id":110,"audit_name":"Portable Fire Extinguisher ( Weekly )","asset_tag_id":2516,"audit_start_date":"2022-09-14 00:00:00","audit_end_date":"2022-09-14 15:00:00","schedule_expire_date":"2022-09-15 00:00:00","audit_inspection_date":"2022-09-14 17:29:15","audit_status":"completed","audit_result":"Pass","inspection_delay":"Yes","audit_params_id":79,"asset_owner_id":38,"asset_user_owner_id":null,"deleted_at":null,"institution_id":10,"prev_maintenanace_owner_type":"group","prev_maintenanace_owner_id":6,"params_master_id":"79","is_process":1,"escalated_audit_levels":null,"push_send_notification":1,"created_at":"2022-09-14 11:45:19","updated_at":"2022-09-14 17:29:15","audited_params":null}]

AllUserAssetAssgainData allUserAssetAssgainDataFromJson(String str) => AllUserAssetAssgainData.fromJson(json.decode(str));
String allUserAssetAssgainDataToJson(AllUserAssetAssgainData data) => json.encode(data.toJson());
class AllUserAssetAssgainData {
  AllUserAssetAssgainData({
      num? id, 
      String? name, 
      String? assetTag, 
      num? modelId, 
      String? modelName, 
      String? serial, 
      String? purchaseDate, 
      dynamic purchaseCost, 
      dynamic orderNumber, 
      dynamic assignedTo, 
      dynamic notes, 
      String? image, 
      num? userId, 
      String? createdAt, 
      String? updatedAt, 
      num? physical, 
      dynamic deletedAt, 
      num? statusId, 
      num? archived, 
      num? warrantyMonths, 
      num? depreciate, 
      num? supplierId, 
      num? requestable, 
      num? rtdLocationId, 
      String? location, 
      dynamic snipeitMacAddress1, 
      dynamic accepted, 
      dynamic lastCheckout, 
      dynamic expectedCheckin, 
      num? companyId, 
      dynamic assignedType, 
      String? lastAuditDate, 
      dynamic nextAuditDate, 
      num? locationId, 
      num? checkinCounter, 
      num? checkoutCounter, 
      num? requestsCounter, 
      dynamic auditParamsValues, 
      dynamic auditParamsTransaction, 
      dynamic dyamicModelFieldset, 
      String? categoryName, 
      String? supplierName, 
      String? companyName, 
      dynamic snipeitUplinkPorts2, 
      dynamic snipeitPowerOverEthernetPoe3, 
      dynamic snipeitFan4, 
      dynamic snipeitPowerSupply5, 
      dynamic snipeitFeatures6, 
      dynamic snipeitNetworkManagement7, 
      dynamic snipeitWarrantyType8, 
      dynamic snipeitNetworkPorts9, 
      String? prevMainOwnerType, 
      dynamic snipeitMacId10, 
      dynamic snipeitIpAddress11, 
      dynamic snipeitUsername12, 
      dynamic snipeitPassword13, 
      dynamic snipeitPortNumber14, 
      num? mailStatus, 
      num? categoryId, 
      String? status, 
      num? assetStatus, 
      List<PmHistory>? pmHistory,}){
    _id = id;
    _name = name;
    _assetTag = assetTag;
    _modelId = modelId;
    _modelName = modelName;
    _serial = serial;
    _purchaseDate = purchaseDate;
    _purchaseCost = purchaseCost;
    _orderNumber = orderNumber;
    _assignedTo = assignedTo;
    _notes = notes;
    _image = image;
    _userId = userId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _physical = physical;
    _deletedAt = deletedAt;
    _statusId = statusId;
    _archived = archived;
    _warrantyMonths = warrantyMonths;
    _depreciate = depreciate;
    _supplierId = supplierId;
    _requestable = requestable;
    _rtdLocationId = rtdLocationId;
    _location = location;
    _snipeitMacAddress1 = snipeitMacAddress1;
    _accepted = accepted;
    _lastCheckout = lastCheckout;
    _expectedCheckin = expectedCheckin;
    _companyId = companyId;
    _assignedType = assignedType;
    _lastAuditDate = lastAuditDate;
    _nextAuditDate = nextAuditDate;
    _locationId = locationId;
    _checkinCounter = checkinCounter;
    _checkoutCounter = checkoutCounter;
    _requestsCounter = requestsCounter;
    _auditParamsValues = auditParamsValues;
    _auditParamsTransaction = auditParamsTransaction;
    _dyamicModelFieldset = dyamicModelFieldset;
    _categoryName = categoryName;
    _supplierName = supplierName;
    _companyName = companyName;
    _snipeitUplinkPorts2 = snipeitUplinkPorts2;
    _snipeitPowerOverEthernetPoe3 = snipeitPowerOverEthernetPoe3;
    _snipeitFan4 = snipeitFan4;
    _snipeitPowerSupply5 = snipeitPowerSupply5;
    _snipeitFeatures6 = snipeitFeatures6;
    _snipeitNetworkManagement7 = snipeitNetworkManagement7;
    _snipeitWarrantyType8 = snipeitWarrantyType8;
    _snipeitNetworkPorts9 = snipeitNetworkPorts9;
    _prevMainOwnerType = prevMainOwnerType;
    _snipeitMacId10 = snipeitMacId10;
    _snipeitIpAddress11 = snipeitIpAddress11;
    _snipeitUsername12 = snipeitUsername12;
    _snipeitPassword13 = snipeitPassword13;
    _snipeitPortNumber14 = snipeitPortNumber14;
    _mailStatus = mailStatus;
    _categoryId = categoryId;
    _status = status;
    _assetStatus = assetStatus;
    _pmHistory = pmHistory;
}

  AllUserAssetAssgainData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _assetTag = json['asset_tag'];
    _modelId = json['model_id'];
    _modelName = json['model_name'];
    _serial = json['serial'];
    _purchaseDate = json['purchase_date'];
    _purchaseCost = json['purchase_cost'];
    _orderNumber = json['order_number'];
    _assignedTo = json['assigned_to'];
    _notes = json['notes'];
    _image = json['image'];
    _userId = json['user_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _physical = json['physical'];
    _deletedAt = json['deleted_at'];
    _statusId = json['status_id'];
    _archived = json['archived'];
    _warrantyMonths = json['warranty_months'];
    _depreciate = json['depreciate'];
    _supplierId = json['supplier_id'];
    _requestable = json['requestable'];
    _rtdLocationId = json['rtd_location_id'];
    _location = json['location'];
    _snipeitMacAddress1 = json['_snipeit_mac_address_1'];
    _accepted = json['accepted'];
    _lastCheckout = json['last_checkout'];
    _expectedCheckin = json['expected_checkin'];
    _companyId = json['company_id'];
    _assignedType = json['assigned_type'];
    _lastAuditDate = json['last_audit_date'];
    _nextAuditDate = json['next_audit_date'];
    _locationId = json['location_id'];
    _checkinCounter = json['checkin_counter'];
    _checkoutCounter = json['checkout_counter'];
    _requestsCounter = json['requests_counter'];
    _auditParamsValues = json['audit_params_values'];
    _auditParamsTransaction = json['audit_params_transaction'];
    _dyamicModelFieldset = json['dyamic_model_fieldset'];
    _categoryName = json['category_name'];
    _supplierName = json['supplier_name'];
    _companyName = json['company_name'];
    _snipeitUplinkPorts2 = json['_snipeit_uplink_ports_2'];
    _snipeitPowerOverEthernetPoe3 = json['_snipeit_power_over_ethernet_poe_3'];
    _snipeitFan4 = json['_snipeit_fan_4'];
    _snipeitPowerSupply5 = json['_snipeit_power_supply_5'];
    _snipeitFeatures6 = json['_snipeit_features_6'];
    _snipeitNetworkManagement7 = json['_snipeit_network_management_7'];
    _snipeitWarrantyType8 = json['_snipeit_warranty_type_8'];
    _snipeitNetworkPorts9 = json['_snipeit_network_ports_9'];
    _prevMainOwnerType = json['prev_main_owner_type'];
    _snipeitMacId10 = json['_snipeit_mac_id_10'];
    _snipeitIpAddress11 = json['_snipeit_ip_address_11'];
    _snipeitUsername12 = json['_snipeit_username_12'];
    _snipeitPassword13 = json['_snipeit_password_13'];
    _snipeitPortNumber14 = json['_snipeit_port_number_14'];
    _mailStatus = json['mail_status'];
    _categoryId = json['category_id'];
    _status = json['status'];
    _assetStatus = json['asset_status'];
    if (json['pm_history'] != null) {
      _pmHistory = [];
      json['pm_history'].forEach((v) {
        _pmHistory?.add(PmHistory.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  String? _assetTag;
  num? _modelId;
  String? _modelName;
  String? _serial;
  String? _purchaseDate;
  dynamic _purchaseCost;
  dynamic _orderNumber;
  dynamic _assignedTo;
  dynamic _notes;
  String? _image;
  num? _userId;
  String? _createdAt;
  String? _updatedAt;
  num? _physical;
  dynamic _deletedAt;
  num? _statusId;
  num? _archived;
  num? _warrantyMonths;
  num? _depreciate;
  num? _supplierId;
  num? _requestable;
  num? _rtdLocationId;
  String? _location;
  dynamic _snipeitMacAddress1;
  dynamic _accepted;
  dynamic _lastCheckout;
  dynamic _expectedCheckin;
  num? _companyId;
  dynamic _assignedType;
  String? _lastAuditDate;
  dynamic _nextAuditDate;
  num? _locationId;
  num? _checkinCounter;
  num? _checkoutCounter;
  num? _requestsCounter;
  dynamic _auditParamsValues;
  dynamic _auditParamsTransaction;
  dynamic _dyamicModelFieldset;
  String? _categoryName;
  String? _supplierName;
  String? _companyName;
  dynamic _snipeitUplinkPorts2;
  dynamic _snipeitPowerOverEthernetPoe3;
  dynamic _snipeitFan4;
  dynamic _snipeitPowerSupply5;
  dynamic _snipeitFeatures6;
  dynamic _snipeitNetworkManagement7;
  dynamic _snipeitWarrantyType8;
  dynamic _snipeitNetworkPorts9;
  String? _prevMainOwnerType;
  dynamic _snipeitMacId10;
  dynamic _snipeitIpAddress11;
  dynamic _snipeitUsername12;
  dynamic _snipeitPassword13;
  dynamic _snipeitPortNumber14;
  num? _mailStatus;
  num? _categoryId;
  String? _status;
  num? _assetStatus;
  List<PmHistory>? _pmHistory;
AllUserAssetAssgainData copyWith({  num? id,
  String? name,
  String? assetTag,
  num? modelId,
  String? modelName,
  String? serial,
  String? purchaseDate,
  dynamic purchaseCost,
  dynamic orderNumber,
  dynamic assignedTo,
  dynamic notes,
  String? image,
  num? userId,
  String? createdAt,
  String? updatedAt,
  num? physical,
  dynamic deletedAt,
  num? statusId,
  num? archived,
  num? warrantyMonths,
  num? depreciate,
  num? supplierId,
  num? requestable,
  num? rtdLocationId,
  String? location,
  dynamic snipeitMacAddress1,
  dynamic accepted,
  dynamic lastCheckout,
  dynamic expectedCheckin,
  num? companyId,
  dynamic assignedType,
  String? lastAuditDate,
  dynamic nextAuditDate,
  num? locationId,
  num? checkinCounter,
  num? checkoutCounter,
  num? requestsCounter,
  dynamic auditParamsValues,
  dynamic auditParamsTransaction,
  dynamic dyamicModelFieldset,
  String? categoryName,
  String? supplierName,
  String? companyName,
  dynamic snipeitUplinkPorts2,
  dynamic snipeitPowerOverEthernetPoe3,
  dynamic snipeitFan4,
  dynamic snipeitPowerSupply5,
  dynamic snipeitFeatures6,
  dynamic snipeitNetworkManagement7,
  dynamic snipeitWarrantyType8,
  dynamic snipeitNetworkPorts9,
  String? prevMainOwnerType,
  dynamic snipeitMacId10,
  dynamic snipeitIpAddress11,
  dynamic snipeitUsername12,
  dynamic snipeitPassword13,
  dynamic snipeitPortNumber14,
  num? mailStatus,
  num? categoryId,
  String? status,
  num? assetStatus,
  List<PmHistory>? pmHistory,
}) => AllUserAssetAssgainData(  id: id ?? _id,
  name: name ?? _name,
  assetTag: assetTag ?? _assetTag,
  modelId: modelId ?? _modelId,
  modelName: modelName ?? _modelName,
  serial: serial ?? _serial,
  purchaseDate: purchaseDate ?? _purchaseDate,
  purchaseCost: purchaseCost ?? _purchaseCost,
  orderNumber: orderNumber ?? _orderNumber,
  assignedTo: assignedTo ?? _assignedTo,
  notes: notes ?? _notes,
  image: image ?? _image,
  userId: userId ?? _userId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  physical: physical ?? _physical,
  deletedAt: deletedAt ?? _deletedAt,
  statusId: statusId ?? _statusId,
  archived: archived ?? _archived,
  warrantyMonths: warrantyMonths ?? _warrantyMonths,
  depreciate: depreciate ?? _depreciate,
  supplierId: supplierId ?? _supplierId,
  requestable: requestable ?? _requestable,
  rtdLocationId: rtdLocationId ?? _rtdLocationId,
  location: location ?? _location,
  snipeitMacAddress1: snipeitMacAddress1 ?? _snipeitMacAddress1,
  accepted: accepted ?? _accepted,
  lastCheckout: lastCheckout ?? _lastCheckout,
  expectedCheckin: expectedCheckin ?? _expectedCheckin,
  companyId: companyId ?? _companyId,
  assignedType: assignedType ?? _assignedType,
  lastAuditDate: lastAuditDate ?? _lastAuditDate,
  nextAuditDate: nextAuditDate ?? _nextAuditDate,
  locationId: locationId ?? _locationId,
  checkinCounter: checkinCounter ?? _checkinCounter,
  checkoutCounter: checkoutCounter ?? _checkoutCounter,
  requestsCounter: requestsCounter ?? _requestsCounter,
  auditParamsValues: auditParamsValues ?? _auditParamsValues,
  auditParamsTransaction: auditParamsTransaction ?? _auditParamsTransaction,
  dyamicModelFieldset: dyamicModelFieldset ?? _dyamicModelFieldset,
  categoryName: categoryName ?? _categoryName,
  supplierName: supplierName ?? _supplierName,
  companyName: companyName ?? _companyName,
  snipeitUplinkPorts2: snipeitUplinkPorts2 ?? _snipeitUplinkPorts2,
  snipeitPowerOverEthernetPoe3: snipeitPowerOverEthernetPoe3 ?? _snipeitPowerOverEthernetPoe3,
  snipeitFan4: snipeitFan4 ?? _snipeitFan4,
  snipeitPowerSupply5: snipeitPowerSupply5 ?? _snipeitPowerSupply5,
  snipeitFeatures6: snipeitFeatures6 ?? _snipeitFeatures6,
  snipeitNetworkManagement7: snipeitNetworkManagement7 ?? _snipeitNetworkManagement7,
  snipeitWarrantyType8: snipeitWarrantyType8 ?? _snipeitWarrantyType8,
  snipeitNetworkPorts9: snipeitNetworkPorts9 ?? _snipeitNetworkPorts9,
  prevMainOwnerType: prevMainOwnerType ?? _prevMainOwnerType,
  snipeitMacId10: snipeitMacId10 ?? _snipeitMacId10,
  snipeitIpAddress11: snipeitIpAddress11 ?? _snipeitIpAddress11,
  snipeitUsername12: snipeitUsername12 ?? _snipeitUsername12,
  snipeitPassword13: snipeitPassword13 ?? _snipeitPassword13,
  snipeitPortNumber14: snipeitPortNumber14 ?? _snipeitPortNumber14,
  mailStatus: mailStatus ?? _mailStatus,
  categoryId: categoryId ?? _categoryId,
  status: status ?? _status,
  assetStatus: assetStatus ?? _assetStatus,
  pmHistory: pmHistory ?? _pmHistory,
);
  num? get id => _id;
  String? get name => _name;
  String? get assetTag => _assetTag;
  num? get modelId => _modelId;
  String? get modelName => _modelName;
  String? get serial => _serial;
  String? get purchaseDate => _purchaseDate;
  dynamic get purchaseCost => _purchaseCost;
  dynamic get orderNumber => _orderNumber;
  dynamic get assignedTo => _assignedTo;
  dynamic get notes => _notes;
  String? get image => _image;
  num? get userId => _userId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get physical => _physical;
  dynamic get deletedAt => _deletedAt;
  num? get statusId => _statusId;
  num? get archived => _archived;
  num? get warrantyMonths => _warrantyMonths;
  num? get depreciate => _depreciate;
  num? get supplierId => _supplierId;
  num? get requestable => _requestable;
  num? get rtdLocationId => _rtdLocationId;
  String? get location => _location;
  dynamic get snipeitMacAddress1 => _snipeitMacAddress1;
  dynamic get accepted => _accepted;
  dynamic get lastCheckout => _lastCheckout;
  dynamic get expectedCheckin => _expectedCheckin;
  num? get companyId => _companyId;
  dynamic get assignedType => _assignedType;
  String? get lastAuditDate => _lastAuditDate;
  dynamic get nextAuditDate => _nextAuditDate;
  num? get locationId => _locationId;
  num? get checkinCounter => _checkinCounter;
  num? get checkoutCounter => _checkoutCounter;
  num? get requestsCounter => _requestsCounter;
  dynamic get auditParamsValues => _auditParamsValues;
  dynamic get auditParamsTransaction => _auditParamsTransaction;
  dynamic get dyamicModelFieldset => _dyamicModelFieldset;
  String? get categoryName => _categoryName;
  String? get supplierName => _supplierName;
  String? get companyName => _companyName;
  dynamic get snipeitUplinkPorts2 => _snipeitUplinkPorts2;
  dynamic get snipeitPowerOverEthernetPoe3 => _snipeitPowerOverEthernetPoe3;
  dynamic get snipeitFan4 => _snipeitFan4;
  dynamic get snipeitPowerSupply5 => _snipeitPowerSupply5;
  dynamic get snipeitFeatures6 => _snipeitFeatures6;
  dynamic get snipeitNetworkManagement7 => _snipeitNetworkManagement7;
  dynamic get snipeitWarrantyType8 => _snipeitWarrantyType8;
  dynamic get snipeitNetworkPorts9 => _snipeitNetworkPorts9;
  String? get prevMainOwnerType => _prevMainOwnerType;
  dynamic get snipeitMacId10 => _snipeitMacId10;
  dynamic get snipeitIpAddress11 => _snipeitIpAddress11;
  dynamic get snipeitUsername12 => _snipeitUsername12;
  dynamic get snipeitPassword13 => _snipeitPassword13;
  dynamic get snipeitPortNumber14 => _snipeitPortNumber14;
  num? get mailStatus => _mailStatus;
  num? get categoryId => _categoryId;
  String? get status => _status;
  num? get assetStatus => _assetStatus;
  List<PmHistory>? get pmHistory => _pmHistory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['asset_tag'] = _assetTag;
    map['model_id'] = _modelId;
    map['model_name'] = _modelName;
    map['serial'] = _serial;
    map['purchase_date'] = _purchaseDate;
    map['purchase_cost'] = _purchaseCost;
    map['order_number'] = _orderNumber;
    map['assigned_to'] = _assignedTo;
    map['notes'] = _notes;
    map['image'] = _image;
    map['user_id'] = _userId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['physical'] = _physical;
    map['deleted_at'] = _deletedAt;
    map['status_id'] = _statusId;
    map['archived'] = _archived;
    map['warranty_months'] = _warrantyMonths;
    map['depreciate'] = _depreciate;
    map['supplier_id'] = _supplierId;
    map['requestable'] = _requestable;
    map['rtd_location_id'] = _rtdLocationId;
    map['location'] = _location;
    map['_snipeit_mac_address_1'] = _snipeitMacAddress1;
    map['accepted'] = _accepted;
    map['last_checkout'] = _lastCheckout;
    map['expected_checkin'] = _expectedCheckin;
    map['company_id'] = _companyId;
    map['assigned_type'] = _assignedType;
    map['last_audit_date'] = _lastAuditDate;
    map['next_audit_date'] = _nextAuditDate;
    map['location_id'] = _locationId;
    map['checkin_counter'] = _checkinCounter;
    map['checkout_counter'] = _checkoutCounter;
    map['requests_counter'] = _requestsCounter;
    map['audit_params_values'] = _auditParamsValues;
    map['audit_params_transaction'] = _auditParamsTransaction;
    map['dyamic_model_fieldset'] = _dyamicModelFieldset;
    map['category_name'] = _categoryName;
    map['supplier_name'] = _supplierName;
    map['company_name'] = _companyName;
    map['_snipeit_uplink_ports_2'] = _snipeitUplinkPorts2;
    map['_snipeit_power_over_ethernet_poe_3'] = _snipeitPowerOverEthernetPoe3;
    map['_snipeit_fan_4'] = _snipeitFan4;
    map['_snipeit_power_supply_5'] = _snipeitPowerSupply5;
    map['_snipeit_features_6'] = _snipeitFeatures6;
    map['_snipeit_network_management_7'] = _snipeitNetworkManagement7;
    map['_snipeit_warranty_type_8'] = _snipeitWarrantyType8;
    map['_snipeit_network_ports_9'] = _snipeitNetworkPorts9;
    map['prev_main_owner_type'] = _prevMainOwnerType;
    map['_snipeit_mac_id_10'] = _snipeitMacId10;
    map['_snipeit_ip_address_11'] = _snipeitIpAddress11;
    map['_snipeit_username_12'] = _snipeitUsername12;
    map['_snipeit_password_13'] = _snipeitPassword13;
    map['_snipeit_port_number_14'] = _snipeitPortNumber14;
    map['mail_status'] = _mailStatus;
    map['category_id'] = _categoryId;
    map['status'] = _status;
    map['asset_status'] = _assetStatus;
    if (_pmHistory != null) {
      map['pm_history'] = _pmHistory?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// audit_schdule_id : 7480
/// audit_id : 110
/// audit_name : "Portable Fire Extinguisher ( Weekly )"
/// asset_tag_id : 2516
/// audit_start_date : "2022-09-14 00:00:00"
/// audit_end_date : "2022-09-14 15:00:00"
/// schedule_expire_date : "2022-09-15 00:00:00"
/// audit_inspection_date : "2022-09-14 17:29:15"
/// audit_status : "completed"
/// audit_result : "Pass"
/// inspection_delay : "Yes"
/// audit_params_id : 79
/// asset_owner_id : 38
/// asset_user_owner_id : null
/// deleted_at : null
/// institution_id : 10
/// prev_maintenanace_owner_type : "group"
/// prev_maintenanace_owner_id : 6
/// params_master_id : "79"
/// is_process : 1
/// escalated_audit_levels : null
/// push_send_notification : 1
/// created_at : "2022-09-14 11:45:19"
/// updated_at : "2022-09-14 17:29:15"
/// audited_params : null

PmHistory pmHistoryFromJson(String str) => PmHistory.fromJson(json.decode(str));
String pmHistoryToJson(PmHistory data) => json.encode(data.toJson());
class PmHistory {
  PmHistory({
      num? auditSchduleId, 
      num? auditId, 
      String? auditName, 
      num? assetTagId, 
      String? auditStartDate, 
      String? auditEndDate, 
      String? scheduleExpireDate, 
      String? auditInspectionDate, 
      String? auditStatus, 
      String? auditResult, 
      String? inspectionDelay, 
      num? auditParamsId, 
      num? assetOwnerId, 
      dynamic assetUserOwnerId, 
      dynamic deletedAt, 
      num? institutionId, 
      String? prevMaintenanaceOwnerType, 
      num? prevMaintenanaceOwnerId, 
      String? paramsMasterId, 
      num? isProcess, 
      dynamic escalatedAuditLevels, 
      num? pushSendNotification, 
      String? createdAt, 
      String? updatedAt, 
      dynamic auditedParams,}){
    _auditSchduleId = auditSchduleId;
    _auditId = auditId;
    _auditName = auditName;
    _assetTagId = assetTagId;
    _auditStartDate = auditStartDate;
    _auditEndDate = auditEndDate;
    _scheduleExpireDate = scheduleExpireDate;
    _auditInspectionDate = auditInspectionDate;
    _auditStatus = auditStatus;
    _auditResult = auditResult;
    _inspectionDelay = inspectionDelay;
    _auditParamsId = auditParamsId;
    _assetOwnerId = assetOwnerId;
    _assetUserOwnerId = assetUserOwnerId;
    _deletedAt = deletedAt;
    _institutionId = institutionId;
    _prevMaintenanaceOwnerType = prevMaintenanaceOwnerType;
    _prevMaintenanaceOwnerId = prevMaintenanaceOwnerId;
    _paramsMasterId = paramsMasterId;
    _isProcess = isProcess;
    _escalatedAuditLevels = escalatedAuditLevels;
    _pushSendNotification = pushSendNotification;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _auditedParams = auditedParams;
}

  PmHistory.fromJson(dynamic json) {
    _auditSchduleId = json['audit_schdule_id'];
    _auditId = json['audit_id'];
    _auditName = json['audit_name'];
    _assetTagId = json['asset_tag_id'];
    _auditStartDate = json['audit_start_date'];
    _auditEndDate = json['audit_end_date'];
    _scheduleExpireDate = json['schedule_expire_date'];
    _auditInspectionDate = json['audit_inspection_date'];
    _auditStatus = json['audit_status'];
    _auditResult = json['audit_result'];
    _inspectionDelay = json['inspection_delay'];
    _auditParamsId = json['audit_params_id'];
    _assetOwnerId = json['asset_owner_id'];
    _assetUserOwnerId = json['asset_user_owner_id'];
    _deletedAt = json['deleted_at'];
    _institutionId = json['institution_id'];
    _prevMaintenanaceOwnerType = json['prev_maintenanace_owner_type'];
    _prevMaintenanaceOwnerId = json['prev_maintenanace_owner_id'];
    _paramsMasterId = json['params_master_id'];
    _isProcess = json['is_process'];
    _escalatedAuditLevels = json['escalated_audit_levels'];
    _pushSendNotification = json['push_send_notification'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _auditedParams = json['audited_params'];
  }
  num? _auditSchduleId;
  num? _auditId;
  String? _auditName;
  num? _assetTagId;
  String? _auditStartDate;
  String? _auditEndDate;
  String? _scheduleExpireDate;
  String? _auditInspectionDate;
  String? _auditStatus;
  String? _auditResult;
  String? _inspectionDelay;
  num? _auditParamsId;
  num? _assetOwnerId;
  dynamic _assetUserOwnerId;
  dynamic _deletedAt;
  num? _institutionId;
  String? _prevMaintenanaceOwnerType;
  num? _prevMaintenanaceOwnerId;
  String? _paramsMasterId;
  num? _isProcess;
  dynamic _escalatedAuditLevels;
  num? _pushSendNotification;
  String? _createdAt;
  String? _updatedAt;
  dynamic _auditedParams;
PmHistory copyWith({  num? auditSchduleId,
  num? auditId,
  String? auditName,
  num? assetTagId,
  String? auditStartDate,
  String? auditEndDate,
  String? scheduleExpireDate,
  String? auditInspectionDate,
  String? auditStatus,
  String? auditResult,
  String? inspectionDelay,
  num? auditParamsId,
  num? assetOwnerId,
  dynamic assetUserOwnerId,
  dynamic deletedAt,
  num? institutionId,
  String? prevMaintenanaceOwnerType,
  num? prevMaintenanaceOwnerId,
  String? paramsMasterId,
  num? isProcess,
  dynamic escalatedAuditLevels,
  num? pushSendNotification,
  String? createdAt,
  String? updatedAt,
  dynamic auditedParams,
}) => PmHistory(  auditSchduleId: auditSchduleId ?? _auditSchduleId,
  auditId: auditId ?? _auditId,
  auditName: auditName ?? _auditName,
  assetTagId: assetTagId ?? _assetTagId,
  auditStartDate: auditStartDate ?? _auditStartDate,
  auditEndDate: auditEndDate ?? _auditEndDate,
  scheduleExpireDate: scheduleExpireDate ?? _scheduleExpireDate,
  auditInspectionDate: auditInspectionDate ?? _auditInspectionDate,
  auditStatus: auditStatus ?? _auditStatus,
  auditResult: auditResult ?? _auditResult,
  inspectionDelay: inspectionDelay ?? _inspectionDelay,
  auditParamsId: auditParamsId ?? _auditParamsId,
  assetOwnerId: assetOwnerId ?? _assetOwnerId,
  assetUserOwnerId: assetUserOwnerId ?? _assetUserOwnerId,
  deletedAt: deletedAt ?? _deletedAt,
  institutionId: institutionId ?? _institutionId,
  prevMaintenanaceOwnerType: prevMaintenanaceOwnerType ?? _prevMaintenanaceOwnerType,
  prevMaintenanaceOwnerId: prevMaintenanaceOwnerId ?? _prevMaintenanaceOwnerId,
  paramsMasterId: paramsMasterId ?? _paramsMasterId,
  isProcess: isProcess ?? _isProcess,
  escalatedAuditLevels: escalatedAuditLevels ?? _escalatedAuditLevels,
  pushSendNotification: pushSendNotification ?? _pushSendNotification,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  auditedParams: auditedParams ?? _auditedParams,
);
  num? get auditSchduleId => _auditSchduleId;
  num? get auditId => _auditId;
  String? get auditName => _auditName;
  num? get assetTagId => _assetTagId;
  String? get auditStartDate => _auditStartDate;
  String? get auditEndDate => _auditEndDate;
  String? get scheduleExpireDate => _scheduleExpireDate;
  String? get auditInspectionDate => _auditInspectionDate;
  String? get auditStatus => _auditStatus;
  String? get auditResult => _auditResult;
  String? get inspectionDelay => _inspectionDelay;
  num? get auditParamsId => _auditParamsId;
  num? get assetOwnerId => _assetOwnerId;
  dynamic get assetUserOwnerId => _assetUserOwnerId;
  dynamic get deletedAt => _deletedAt;
  num? get institutionId => _institutionId;
  String? get prevMaintenanaceOwnerType => _prevMaintenanaceOwnerType;
  num? get prevMaintenanaceOwnerId => _prevMaintenanaceOwnerId;
  String? get paramsMasterId => _paramsMasterId;
  num? get isProcess => _isProcess;
  dynamic get escalatedAuditLevels => _escalatedAuditLevels;
  num? get pushSendNotification => _pushSendNotification;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get auditedParams => _auditedParams;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['audit_schdule_id'] = _auditSchduleId;
    map['audit_id'] = _auditId;
    map['audit_name'] = _auditName;
    map['asset_tag_id'] = _assetTagId;
    map['audit_start_date'] = _auditStartDate;
    map['audit_end_date'] = _auditEndDate;
    map['schedule_expire_date'] = _scheduleExpireDate;
    map['audit_inspection_date'] = _auditInspectionDate;
    map['audit_status'] = _auditStatus;
    map['audit_result'] = _auditResult;
    map['inspection_delay'] = _inspectionDelay;
    map['audit_params_id'] = _auditParamsId;
    map['asset_owner_id'] = _assetOwnerId;
    map['asset_user_owner_id'] = _assetUserOwnerId;
    map['deleted_at'] = _deletedAt;
    map['institution_id'] = _institutionId;
    map['prev_maintenanace_owner_type'] = _prevMaintenanaceOwnerType;
    map['prev_maintenanace_owner_id'] = _prevMaintenanaceOwnerId;
    map['params_master_id'] = _paramsMasterId;
    map['is_process'] = _isProcess;
    map['escalated_audit_levels'] = _escalatedAuditLevels;
    map['push_send_notification'] = _pushSendNotification;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['audited_params'] = _auditedParams;
    return map;
  }

}