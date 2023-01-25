/// total : 4
/// rows : [{"id":1,"user_id":1,"consumable_id":2,"assigned_type":"user","assigned_to":45,"assigned_asset":null,"assigned_location":null,"qty":1,"note":"trsrf","created_at":"2022-09-07 16:56:04","updated_at":"2022-09-07 16:56:04","user":"aman - ","location":"","assets":""},{"id":2,"user_id":1,"consumable_id":2,"assigned_type":"asset","assigned_to":0,"assigned_asset":1,"assigned_location":null,"qty":1,"note":"sda","created_at":"2022-09-07 16:56:17","updated_at":"2022-09-07 16:56:17","user":"","location":"","assets":"Extinguisher kanex  -1"},{"id":3,"user_id":1,"consumable_id":2,"assigned_type":"location","assigned_to":0,"assigned_asset":null,"assigned_location":24,"qty":1,"note":"das","created_at":"2022-09-07 16:56:30","updated_at":"2022-09-07 16:56:30","user":"","location":"Block B","assets":""},{"id":8,"user_id":1,"consumable_id":2,"assigned_type":"user","assigned_to":0,"assigned_asset":null,"assigned_location":0,"qty":6,"note":"Notes","created_at":"2022-10-06 04:27:04","updated_at":"2022-10-06 04:27:04","user":"","location":"","assets":""}]
/// total_count : 4

class ConsumableUserModel {
  ConsumableUserModel({
      num? total, 
      List<ConsumableUserData>? rows,
      num? totalCount,}){
    _total = total;
    _rows = rows;
    _totalCount = totalCount;
}

  ConsumableUserModel.fromJson(dynamic json) {
    _total = json['total'];
    if (json['rows'] != null) {
      _rows = [];
      json['rows'].forEach((v) {
        _rows?.add(ConsumableUserData.fromJson(v));
      });
    }
    _totalCount = json['total_count'];
  }
  num? _total;
  List<ConsumableUserData>? _rows;
  num? _totalCount;
ConsumableUserModel copyWith({  num? total,
  List<ConsumableUserData>? rows,
  num? totalCount,
}) => ConsumableUserModel(  total: total ?? _total,
  rows: rows ?? _rows,
  totalCount: totalCount ?? _totalCount,
);
  num? get total => _total;
  List<ConsumableUserData>? get rows => _rows;
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

/// id : 1
/// user_id : 1
/// consumable_id : 2
/// assigned_type : "user"
/// assigned_to : 45
/// assigned_asset : null
/// assigned_location : null
/// qty : 1
/// note : "trsrf"
/// created_at : "2022-09-07 16:56:04"
/// updated_at : "2022-09-07 16:56:04"
/// user : "aman - "
/// location : ""
/// assets : ""

class ConsumableUserData {
  ConsumableUserData({
      num? id, 
      num? userId, 
      num? consumableId, 
      String? assignedType, 
      num? assignedTo, 
      dynamic assignedAsset, 
      dynamic assignedLocation, 
      num? qty, 
      String? note, 
      String? createdAt, 
      String? updatedAt, 
      String? user, 
      String? location, 
      String? assets,}){
    _id = id;
    _userId = userId;
    _consumableId = consumableId;
    _assignedType = assignedType;
    _assignedTo = assignedTo;
    _assignedAsset = assignedAsset;
    _assignedLocation = assignedLocation;
    _qty = qty;
    _note = note;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _user = user;
    _location = location;
    _assets = assets;
}

  ConsumableUserData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _consumableId = json['consumable_id'];
    _assignedType = json['assigned_type'];
    _assignedTo = json['assigned_to'];
    _assignedAsset = json['assigned_asset'];
    _assignedLocation = json['assigned_location'];
    _qty = json['qty'];
    _note = json['note'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _user = json['user'];
    _location = json['location'];
    _assets = json['assets'];
  }
  num? _id;
  num? _userId;
  num? _consumableId;
  String? _assignedType;
  num? _assignedTo;
  dynamic _assignedAsset;
  dynamic _assignedLocation;
  num? _qty;
  String? _note;
  String? _createdAt;
  String? _updatedAt;
  String? _user;
  String? _location;
  String? _assets;
  ConsumableUserData copyWith({  num? id,
  num? userId,
  num? consumableId,
  String? assignedType,
  num? assignedTo,
  dynamic assignedAsset,
  dynamic assignedLocation,
  num? qty,
  String? note,
  String? createdAt,
  String? updatedAt,
  String? user,
  String? location,
  String? assets,
}) => ConsumableUserData(  id: id ?? _id,
  userId: userId ?? _userId,
  consumableId: consumableId ?? _consumableId,
  assignedType: assignedType ?? _assignedType,
  assignedTo: assignedTo ?? _assignedTo,
  assignedAsset: assignedAsset ?? _assignedAsset,
  assignedLocation: assignedLocation ?? _assignedLocation,
  qty: qty ?? _qty,
  note: note ?? _note,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  user: user ?? _user,
  location: location ?? _location,
  assets: assets ?? _assets,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get consumableId => _consumableId;
  String? get assignedType => _assignedType;
  num? get assignedTo => _assignedTo;
  dynamic get assignedAsset => _assignedAsset;
  dynamic get assignedLocation => _assignedLocation;
  num? get qty => _qty;
  String? get note => _note;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get user => _user;
  String? get location => _location;
  String? get assets => _assets;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['consumable_id'] = _consumableId;
    map['assigned_type'] = _assignedType;
    map['assigned_to'] = _assignedTo;
    map['assigned_asset'] = _assignedAsset;
    map['assigned_location'] = _assignedLocation;
    map['qty'] = _qty;
    map['note'] = _note;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['user'] = _user;
    map['location'] = _location;
    map['assets'] = _assets;
    return map;
  }

}