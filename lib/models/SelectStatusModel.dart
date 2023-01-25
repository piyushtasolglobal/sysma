import 'dart:convert';
/// total : 3
/// rows : [{"id":1,"name":"Pending","type":"pending","color":null,"show_in_nav":false,"default_label":false,"assets_count":2,"notes":"These assets are not yet ready to be deployed, usually because of configuration or waiting on parts.","created_at":null,"updated_at":null,"available_actions":{"update":true,"delete":false}},{"id":2,"name":"Ready to Deploy","type":"deployable","color":null,"show_in_nav":false,"default_label":false,"assets_count":808,"notes":"These assets are ready to deploy.","created_at":null,"updated_at":null,"available_actions":{"update":true,"delete":false}},{"id":3,"name":"Archived","type":"archived","color":null,"show_in_nav":false,"default_label":false,"assets_count":2,"notes":"These assets are no longer in circulation or viable.","created_at":null,"updated_at":null,"available_actions":{"update":true,"delete":false}}]

SelectStatusModel selectStatusModelFromJson(String str) => SelectStatusModel.fromJson(json.decode(str));
String selectStatusModelToJson(SelectStatusModel data) => json.encode(data.toJson());
class SelectStatusModel {
  SelectStatusModel({
      num? total, 
      List<StatusData>? rows,}){
    _total = total;
    _rows = rows;
}

  SelectStatusModel.fromJson(dynamic json) {
    _total = json['total'];
    if (json['rows'] != null) {
      _rows = [];
      json['rows'].forEach((v) {
        _rows?.add(StatusData.fromJson(v));
      });
    }
  }
  num? _total;
  List<StatusData>? _rows;
SelectStatusModel copyWith({  num? total,
  List<StatusData>? rows,
}) => SelectStatusModel(  total: total ?? _total,
  rows: rows ?? _rows,
);
  num? get total => _total;
  List<StatusData>? get rows => _rows;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    if (_rows != null) {
      map['rows'] = _rows?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Pending"
/// type : "pending"
/// color : null
/// show_in_nav : false
/// default_label : false
/// assets_count : 2
/// notes : "These assets are not yet ready to be deployed, usually because of configuration or waiting on parts."
/// created_at : null
/// updated_at : null
/// available_actions : {"update":true,"delete":false}

StatusData rowsFromJson(String str) => StatusData.fromJson(json.decode(str));
String rowsToJson(StatusData data) => json.encode(data.toJson());
class StatusData {
  StatusData({
      num? id, 
      String? name, 
      String? type, 
      dynamic color, 
      bool? showInNav, 
      bool? defaultLabel, 
      num? assetsCount, 
      String? notes, 
      dynamic createdAt, 
      dynamic updatedAt, 
      AvailableActions? availableActions,}){
    _id = id;
    _name = name;
    _type = type;
    _color = color;
    _showInNav = showInNav;
    _defaultLabel = defaultLabel;
    _assetsCount = assetsCount;
    _notes = notes;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _availableActions = availableActions;
}

  StatusData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _type = json['type'];
    _color = json['color'];
    _showInNav = json['show_in_nav'];
    _defaultLabel = json['default_label'];
    _assetsCount = json['assets_count'];
    _notes = json['notes'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _availableActions = json['available_actions'] != null ? AvailableActions.fromJson(json['available_actions']) : null;
  }
  num? _id;
  String? _name;
  String? _type;
  dynamic _color;
  bool? _showInNav;
  bool? _defaultLabel;
  num? _assetsCount;
  String? _notes;
  dynamic _createdAt;
  dynamic _updatedAt;
  AvailableActions? _availableActions;
StatusData copyWith({  num? id,
  String? name,
  String? type,
  dynamic color,
  bool? showInNav,
  bool? defaultLabel,
  num? assetsCount,
  String? notes,
  dynamic createdAt,
  dynamic updatedAt,
  AvailableActions? availableActions,
}) => StatusData(  id: id ?? _id,
  name: name ?? _name,
  type: type ?? _type,
  color: color ?? _color,
  showInNav: showInNav ?? _showInNav,
  defaultLabel: defaultLabel ?? _defaultLabel,
  assetsCount: assetsCount ?? _assetsCount,
  notes: notes ?? _notes,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  availableActions: availableActions ?? _availableActions,
);
  num? get id => _id;
  String? get name => _name;
  String? get type => _type;
  dynamic get color => _color;
  bool? get showInNav => _showInNav;
  bool? get defaultLabel => _defaultLabel;
  num? get assetsCount => _assetsCount;
  String? get notes => _notes;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  AvailableActions? get availableActions => _availableActions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['type'] = _type;
    map['color'] = _color;
    map['show_in_nav'] = _showInNav;
    map['default_label'] = _defaultLabel;
    map['assets_count'] = _assetsCount;
    map['notes'] = _notes;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_availableActions != null) {
      map['available_actions'] = _availableActions?.toJson();
    }
    return map;
  }

}

/// update : true
/// delete : false

AvailableActions availableActionsFromJson(String str) => AvailableActions.fromJson(json.decode(str));
String availableActionsToJson(AvailableActions data) => json.encode(data.toJson());
class AvailableActions {
  AvailableActions({
      bool? update, 
      bool? delete,}){
    _update = update;
    _delete = delete;
}

  AvailableActions.fromJson(dynamic json) {
    _update = json['update'];
    _delete = json['delete'];
  }
  bool? _update;
  bool? _delete;
AvailableActions copyWith({  bool? update,
  bool? delete,
}) => AvailableActions(  update: update ?? _update,
  delete: delete ?? _delete,
);
  bool? get update => _update;
  bool? get delete => _delete;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['update'] = _update;
    map['delete'] = _delete;
    return map;
  }

}