import 'dart:convert';
/// total : 8
/// rows : [{"id":9,"user_id":1,"assigned_qty":1,"component_id":1,"assigned_type":"user","asset_id":null,"assigned_to":45,"assigned_location":0,"created_at":"2022-09-20 07:00:13","updated_at":null,"user":"aman - ","location":"","assets":""},{"id":10,"user_id":1,"assigned_qty":5,"component_id":1,"assigned_type":"user","asset_id":null,"assigned_to":45,"assigned_location":0,"created_at":"2022-09-21 07:13:09","updated_at":null,"user":"aman - ","location":"","assets":""},{"id":11,"user_id":1,"assigned_qty":2,"component_id":1,"assigned_type":"user","asset_id":null,"assigned_to":45,"assigned_location":0,"created_at":"2022-09-21 07:22:57","updated_at":null,"user":"aman - ","location":"","assets":""},{"id":12,"user_id":1,"assigned_qty":1,"component_id":1,"assigned_type":"user","asset_id":null,"assigned_to":1,"assigned_location":null,"created_at":"2022-10-03 11:20:11","updated_at":null,"user":"ujash - patel","location":"","assets":""},{"id":13,"user_id":1,"assigned_qty":1,"component_id":1,"assigned_type":"user","asset_id":null,"assigned_to":1,"assigned_location":null,"created_at":"2022-10-03 11:30:51","updated_at":null,"user":"ujash - patel","location":"","assets":""},{"id":14,"user_id":1,"assigned_qty":1,"component_id":1,"assigned_type":"user","asset_id":null,"assigned_to":1,"assigned_location":null,"created_at":"2022-10-18 09:44:47","updated_at":null,"user":"ujash - patel","location":"","assets":""},{"id":15,"user_id":1,"assigned_qty":1,"component_id":1,"assigned_type":"user","asset_id":null,"assigned_to":1,"assigned_location":null,"created_at":"2022-10-18 09:54:39","updated_at":null,"user":"ujash - patel","location":"","assets":""},{"id":16,"user_id":1,"assigned_qty":1,"component_id":1,"assigned_type":"user","asset_id":null,"assigned_to":1,"assigned_location":null,"created_at":"2022-10-18 10:56:18","updated_at":null,"user":"ujash - patel","location":"","assets":""}]
/// total_count : 8

ComponentsUser componentsUserFromJson(String str) => ComponentsUser.fromJson(json.decode(str));
String componentsUserToJson(ComponentsUser data) => json.encode(data.toJson());
class ComponentsUser {
  ComponentsUser({
      num? total, 
      List<ComponentsUserData>? rows,
      num? totalCount,}){
    _total = total;
    _rows = rows;
    _totalCount = totalCount;
}

  ComponentsUser.fromJson(dynamic json) {
    _total = json['total'];
    if (json['rows'] != null) {
      _rows = [];
      json['rows'].forEach((v) {
        _rows?.add(ComponentsUserData.fromJson(v));
      });
    }
    _totalCount = json['total_count'];
  }
  num? _total;
  List<ComponentsUserData>? _rows;
  num? _totalCount;
ComponentsUser copyWith({  num? total,
  List<ComponentsUserData>? rows,
  num? totalCount,
}) => ComponentsUser(  total: total ?? _total,
  rows: rows ?? _rows,
  totalCount: totalCount ?? _totalCount,
);
  num? get total => _total;
  List<ComponentsUserData>? get rows => _rows;
  num? get totalCount => _totalCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    if (_rows != null) {
      map['rows'] = _rows?.map((v) => v.toJson()).toList();
    }
    map['total_count'] = _totalCount;
    return map;
  }

}

/// id : 9
/// user_id : 1
/// assigned_qty : 1
/// component_id : 1
/// assigned_type : "user"
/// asset_id : null
/// assigned_to : 45
/// assigned_location : 0
/// created_at : "2022-09-20 07:00:13"
/// updated_at : null
/// user : "aman - "
/// location : ""
/// assets : ""

ComponentsUserData rowsFromJson(String str) => ComponentsUserData.fromJson(json.decode(str));
String rowsToJson(ComponentsUserData data) => json.encode(data.toJson());
class ComponentsUserData {
  ComponentsUserData({
      num? id, 
      num? userId, 
      num? assignedQty, 
      num? componentId, 
      String? assignedType, 
      dynamic assetId, 
      num? assignedTo, 
      num? assignedLocation, 
      String? createdAt, 
      dynamic updatedAt, 
      String? user, 
      String? location, 
      String? assets,}){
    _id = id;
    _userId = userId;
    _assignedQty = assignedQty;
    _componentId = componentId;
    _assignedType = assignedType;
    _assetId = assetId;
    _assignedTo = assignedTo;
    _assignedLocation = assignedLocation;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _user = user;
    _location = location;
    _assets = assets;
}

  ComponentsUserData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _assignedQty = json['assigned_qty'];
    _componentId = json['component_id'];
    _assignedType = json['assigned_type'];
    _assetId = json['asset_id'];
    _assignedTo = json['assigned_to'];
    _assignedLocation = json['assigned_location'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _user = json['user'];
    _location = json['location'];
    _assets = json['assets'];
  }
  num? _id;
  num? _userId;
  num? _assignedQty;
  num? _componentId;
  String? _assignedType;
  dynamic _assetId;
  num? _assignedTo;
  num? _assignedLocation;
  String? _createdAt;
  dynamic _updatedAt;
  String? _user;
  String? _location;
  String? _assets;
  ComponentsUserData copyWith({  num? id,
  num? userId,
  num? assignedQty,
  num? componentId,
  String? assignedType,
  dynamic assetId,
  num? assignedTo,
  num? assignedLocation,
  String? createdAt,
  dynamic updatedAt,
  String? user,
  String? location,
  String? assets,
}) => ComponentsUserData(  id: id ?? _id,
  userId: userId ?? _userId,
  assignedQty: assignedQty ?? _assignedQty,
  componentId: componentId ?? _componentId,
  assignedType: assignedType ?? _assignedType,
  assetId: assetId ?? _assetId,
  assignedTo: assignedTo ?? _assignedTo,
  assignedLocation: assignedLocation ?? _assignedLocation,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  user: user ?? _user,
  location: location ?? _location,
  assets: assets ?? _assets,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get assignedQty => _assignedQty;
  num? get componentId => _componentId;
  String? get assignedType => _assignedType;
  dynamic get assetId => _assetId;
  num? get assignedTo => _assignedTo;
  num? get assignedLocation => _assignedLocation;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  String? get user => _user;
  String? get location => _location;
  String? get assets => _assets;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['assigned_qty'] = _assignedQty;
    map['component_id'] = _componentId;
    map['assigned_type'] = _assignedType;
    map['asset_id'] = _assetId;
    map['assigned_to'] = _assignedTo;
    map['assigned_location'] = _assignedLocation;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['user'] = _user;
    map['location'] = _location;
    map['assets'] = _assets;
    return map;
  }

}