import 'dart:convert';
/// total : 3
/// rows : [{"id":3,"name":"acceasdemo","user_can_checkout":true,"available_actions":{"update":true,"delete":true,"checkout":true}},{"id":1,"name":"Access Kit","user_can_checkout":true,"available_actions":{"update":true,"delete":true,"checkout":true}},{"id":4,"name":"CCTV Kit","user_can_checkout":true,"available_actions":{"update":true,"delete":true,"checkout":true}}]

Kits kitsFromJson(String str) => Kits.fromJson(json.decode(str));
String kitsToJson(Kits data) => json.encode(data.toJson());
class Kits {
  Kits({
      num? total, 
      List<KitsData>? rows,}){
    _total = total;
    _rows = rows;
}

  Kits.fromJson(dynamic json) {
    _total = json['total'];
    if (json['rows'] != null) {
      _rows = [];
      json['rows'].forEach((v) {
        _rows?.add(KitsData.fromJson(v));
      });
    }
  }
  num? _total;
  List<KitsData>? _rows;
Kits copyWith({  num? total,
  List<KitsData>? rows,
}) => Kits(  total: total ?? _total,
  rows: rows ?? _rows,
);
  num? get total => _total;
  List<KitsData>? get rows => _rows;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    if (_rows != null) {
      map['rows'] = _rows?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// name : "acceasdemo"
/// user_can_checkout : true
/// available_actions : {"update":true,"delete":true,"checkout":true}

KitsData rowsFromJson(String str) => KitsData.fromJson(json.decode(str));
String rowsToJson(KitsData data) => json.encode(data.toJson());
class KitsData {
  KitsData({
      num? id, 
      String? name, 
      bool? userCanCheckout, 
      AvailableActions? availableActions,}){
    _id = id;
    _name = name;
    _userCanCheckout = userCanCheckout;
    _availableActions = availableActions;
}

  KitsData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _userCanCheckout = json['user_can_checkout'];
    _availableActions = json['available_actions'] != null ? AvailableActions.fromJson(json['available_actions']) : null;
  }
  num? _id;
  String? _name;
  bool? _userCanCheckout;
  AvailableActions? _availableActions;
  KitsData copyWith({  num? id,
  String? name,
  bool? userCanCheckout,
  AvailableActions? availableActions,
}) => KitsData(  id: id ?? _id,
  name: name ?? _name,
  userCanCheckout: userCanCheckout ?? _userCanCheckout,
  availableActions: availableActions ?? _availableActions,
);
  num? get id => _id;
  String? get name => _name;
  bool? get userCanCheckout => _userCanCheckout;
  AvailableActions? get availableActions => _availableActions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['user_can_checkout'] = _userCanCheckout;
    if (_availableActions != null) {
      map['available_actions'] = _availableActions?.toJson();
    }
    return map;
  }

}

/// update : true
/// delete : true
/// checkout : true

AvailableActions availableActionsFromJson(String str) => AvailableActions.fromJson(json.decode(str));
String availableActionsToJson(AvailableActions data) => json.encode(data.toJson());
class AvailableActions {
  AvailableActions({
      bool? update, 
      bool? delete, 
      bool? checkout,}){
    _update = update;
    _delete = delete;
    _checkout = checkout;
}

  AvailableActions.fromJson(dynamic json) {
    _update = json['update'];
    _delete = json['delete'];
    _checkout = json['checkout'];
  }
  bool? _update;
  bool? _delete;
  bool? _checkout;
AvailableActions copyWith({  bool? update,
  bool? delete,
  bool? checkout,
}) => AvailableActions(  update: update ?? _update,
  delete: delete ?? _delete,
  checkout: checkout ?? _checkout,
);
  bool? get update => _update;
  bool? get delete => _delete;
  bool? get checkout => _checkout;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['update'] = _update;
    map['delete'] = _delete;
    map['checkout'] = _checkout;
    return map;
  }

}