import 'dart:convert';
/// total : 1
/// rows : [{"id":6,"user_id":1,"assigned_type":"user","accessory_id":3,"assigned_to":45,"assigned_asset":null,"assigned_location":0,"qty":3,"created_at":"2022-10-06 11:23:58","updated_at":null,"note":"Notes","user":"aman - ","location":"","assets":""}]
/// total_count : 1

AccessoryUser accessoryUserFromJson(String str) => AccessoryUser.fromJson(json.decode(str));
String accessoryUserToJson(AccessoryUser data) => json.encode(data.toJson());
class AccessoryUser {
  AccessoryUser({
      num? total, 
      List<AccessoryUserData>? rows,
      num? totalCount,}){
    _total = total;
    _rows = rows;
    _totalCount = totalCount;
}

  AccessoryUser.fromJson(dynamic json) {
    _total = json['total'];
    if (json['rows'] != null) {
      _rows = [];
      json['rows'].forEach((v) {
        _rows?.add(AccessoryUserData.fromJson(v));
      });
    }
    _totalCount = json['total_count'];
  }
  num? _total;
  List<AccessoryUserData>? _rows;
  num? _totalCount;
AccessoryUser copyWith({  num? total,
  List<AccessoryUserData>? rows,
  num? totalCount,
}) => AccessoryUser(  total: total ?? _total,
  rows: rows ?? _rows,
  totalCount: totalCount ?? _totalCount,
);
  num? get total => _total;
  List<AccessoryUserData>? get rows => _rows;
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

/// id : 6
/// user_id : 1
/// assigned_type : "user"
/// accessory_id : 3
/// assigned_to : 45
/// assigned_asset : null
/// assigned_location : 0
/// qty : 3
/// created_at : "2022-10-06 11:23:58"
/// updated_at : null
/// note : "Notes"
/// user : "aman - "
/// location : ""
/// assets : ""

AccessoryUserData rowsFromJson(String str) => AccessoryUserData.fromJson(json.decode(str));
String rowsToJson(AccessoryUserData data) => json.encode(data.toJson());
class AccessoryUserData {
  AccessoryUserData({
      num? id, 
      num? userId, 
      String? assignedType, 
      num? accessoryId, 
      num? assignedTo, 
      dynamic assignedAsset, 
      num? assignedLocation, 
      num? qty, 
      String? createdAt, 
      dynamic updatedAt, 
      String? note, 
      String? user, 
      String? location, 
      String? assets,}){
    _id = id;
    _userId = userId;
    _assignedType = assignedType;
    _accessoryId = accessoryId;
    _assignedTo = assignedTo;
    _assignedAsset = assignedAsset;
    _assignedLocation = assignedLocation;
    _qty = qty;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _note = note;
    _user = user;
    _location = location;
    _assets = assets;
}

  AccessoryUserData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _assignedType = json['assigned_type'];
    _accessoryId = json['accessory_id'];
    _assignedTo = json['assigned_to'];
    _assignedAsset = json['assigned_asset'];
    _assignedLocation = json['assigned_location'];
    _qty = json['qty'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _note = json['note'];
    _user = json['user'];
    _location = json['location'];
    _assets = json['assets'];
  }
  num? _id;
  num? _userId;
  String? _assignedType;
  num? _accessoryId;
  num? _assignedTo;
  dynamic _assignedAsset;
  num? _assignedLocation;
  num? _qty;
  String? _createdAt;
  dynamic _updatedAt;
  String? _note;
  String? _user;
  String? _location;
  String? _assets;
  AccessoryUserData copyWith({  num? id,
  num? userId,
  String? assignedType,
  num? accessoryId,
  num? assignedTo,
  dynamic assignedAsset,
  num? assignedLocation,
  num? qty,
  String? createdAt,
  dynamic updatedAt,
  String? note,
  String? user,
  String? location,
  String? assets,
}) => AccessoryUserData(  id: id ?? _id,
  userId: userId ?? _userId,
  assignedType: assignedType ?? _assignedType,
  accessoryId: accessoryId ?? _accessoryId,
  assignedTo: assignedTo ?? _assignedTo,
  assignedAsset: assignedAsset ?? _assignedAsset,
  assignedLocation: assignedLocation ?? _assignedLocation,
  qty: qty ?? _qty,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  note: note ?? _note,
  user: user ?? _user,
  location: location ?? _location,
  assets: assets ?? _assets,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get assignedType => _assignedType;
  num? get accessoryId => _accessoryId;
  num? get assignedTo => _assignedTo;
  dynamic get assignedAsset => _assignedAsset;
  num? get assignedLocation => _assignedLocation;
  num? get qty => _qty;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  String? get note => _note;
  String? get user => _user;
  String? get location => _location;
  String? get assets => _assets;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['assigned_type'] = _assignedType;
    map['accessory_id'] = _accessoryId;
    map['assigned_to'] = _assignedTo;
    map['assigned_asset'] = _assignedAsset;
    map['assigned_location'] = _assignedLocation;
    map['qty'] = _qty;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['note'] = _note;
    map['user'] = _user;
    map['location'] = _location;
    map['assets'] = _assets;
    return map;
  }

}