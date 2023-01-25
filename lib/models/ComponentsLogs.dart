import 'dart:convert';
/// total : 27
/// rows : [{"checkout_form":"SMPS","label":"CheckOut","checkin":"Vipul - A","date_time":"2022-06-15 19:40:33","qty":1,"type":"user"},{"checkout_form":"SMPS","label":"CheckOut","checkin":"","date_time":"2022-06-15 19:40:42","qty":1,"type":"user"},{"checkout_form":"SMPS","label":"CheckOut","checkin":"","date_time":"2022-06-15 19:40:48","qty":1,"type":"user"},{"checkout_form":"SMPS","label":"CheckOut","checkin":"","date_time":"2022-09-19 15:23:00","qty":1,"type":"user"},{"checkout_form":"ujash - patel","label":"CheckIn","checkin":"SMPS","date_time":"2022-09-19 15:23:55","qty":1,"type":"user"},{"checkout_form":"SMPS","label":"CheckOut","checkin":"","date_time":"2022-09-19 16:52:15","qty":1,"type":"user"},{"checkout_form":"SMPS","label":"CheckOut","checkin":"","date_time":"2022-09-19 23:30:29","qty":1,"type":"user"},{"checkout_form":"SMPS","label":"CheckOut","checkin":"","date_time":"2022-09-20 10:09:00","qty":1,"type":"user"},{"checkout_form":"SMPS","label":"CheckOut","checkin":"","date_time":"2022-09-20 12:10:36","qty":1,"type":"user"},{"checkout_form":"SMPS","label":"CheckOut","checkin":"","date_time":"2022-09-20 12:30:13","qty":1,"type":"user"},{"checkout_form":"Vipul - A","label":"CheckIn","checkin":"SMPS","date_time":"2022-09-20 17:09:05","qty":1,"type":"user"},{"checkout_form":"","label":"CheckIn","checkin":"SMPS","date_time":"2022-09-20 19:20:51","qty":1,"type":"user"},{"checkout_form":"","label":"CheckIn","checkin":"SMPS","date_time":"2022-09-21 09:26:53","qty":1,"type":"user"},{"checkout_form":"ujash - patel","label":"CheckIn","checkin":"SMPS","date_time":"2022-09-21 10:01:43","qty":1,"type":"user"},{"checkout_form":"ujash - patel","label":"CheckIn","checkin":"SMPS","date_time":"2022-09-21 12:31:50","qty":1,"type":"user"},{"checkout_form":"SMPS","label":"CheckOut","checkin":"","date_time":"2022-09-21 12:43:09","qty":5,"type":"user"},{"checkout_form":"SMPS","label":"CheckOut","checkin":"","date_time":"2022-09-21 12:52:57","qty":2,"type":"user"},{"checkout_form":"SMPS","label":"CheckOut","checkin":"","date_time":"2022-10-03 16:50:11","qty":1,"type":"user"},{"checkout_form":"SMPS","label":"CheckOut","checkin":"","date_time":"2022-10-03 17:00:51","qty":1,"type":"user"},{"checkout_form":"ujash - patel","label":"CheckIn","checkin":"SMPS","date_time":"2022-10-03 17:01:22","qty":1,"type":"user"},{"checkout_form":"ujash - patel","label":"CheckIn","checkin":"SMPS","date_time":"2022-10-04 19:13:42","qty":2,"type":"user"},{"checkout_form":"ujash - patel","label":"CheckIn","checkin":"SMPS","date_time":"2022-10-06 09:57:35","qty":4,"type":"user"},{"checkout_form":"ujash - patel","label":"CheckIn","checkin":"SMPS","date_time":"2022-10-06 09:59:24","qty":2,"type":"user"},{"checkout_form":"ujash - patel","label":"CheckIn","checkin":"SMPS","date_time":"2022-10-06 10:01:07","qty":1,"type":"user"},{"checkout_form":"SMPS","label":"CheckOut","checkin":"","date_time":"2022-10-18 15:14:47","qty":1,"type":"user"},{"checkout_form":"SMPS","label":"CheckOut","checkin":"","date_time":"2022-10-18 15:24:39","qty":1,"type":"user"},{"checkout_form":"SMPS","label":"CheckOut","checkin":"","date_time":"2022-10-18 16:26:18","qty":1,"type":"user"}]
/// total_count : 27

ComponentsLogs componentsLogsFromJson(String str) => ComponentsLogs.fromJson(json.decode(str));
String componentsLogsToJson(ComponentsLogs data) => json.encode(data.toJson());
class ComponentsLogs {
  ComponentsLogs({
      num? total, 
      List<ComponentsLogsData>? rows,
      num? totalCount,}){
    _total = total;
    _rows = rows;
    _totalCount = totalCount;
}

  ComponentsLogs.fromJson(dynamic json) {
    _total = json['total'];
    if (json['rows'] != null) {
      _rows = [];
      json['rows'].forEach((v) {
        _rows?.add(ComponentsLogsData.fromJson(v));
      });
    }
    _totalCount = json['total_count'];
  }
  num? _total;
  List<ComponentsLogsData>? _rows;
  num? _totalCount;
ComponentsLogs copyWith({  num? total,
  List<ComponentsLogsData>? rows,
  num? totalCount,
}) => ComponentsLogs(  total: total ?? _total,
  rows: rows ?? _rows,
  totalCount: totalCount ?? _totalCount,
);
  num? get total => _total;
  List<ComponentsLogsData>? get rows => _rows;
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

/// checkout_form : "SMPS"
/// label : "CheckOut"
/// checkin : "Vipul - A"
/// date_time : "2022-06-15 19:40:33"
/// qty : 1
/// type : "user"

ComponentsLogsData rowsFromJson(String str) => ComponentsLogsData.fromJson(json.decode(str));
String rowsToJson(ComponentsLogsData data) => json.encode(data.toJson());
class ComponentsLogsData {
  ComponentsLogsData({
      String? checkoutForm, 
      String? label, 
      String? checkin, 
      String? dateTime, 
      num? qty, 
      String? type,}){
    _checkoutForm = checkoutForm;
    _label = label;
    _checkin = checkin;
    _dateTime = dateTime;
    _qty = qty;
    _type = type;
}

  ComponentsLogsData.fromJson(dynamic json) {
    _checkoutForm = json['checkout_form'];
    _label = json['label'];
    _checkin = json['checkin'];
    _dateTime = json['date_time'];
    _qty = json['qty'];
    _type = json['type'];
  }
  String? _checkoutForm;
  String? _label;
  String? _checkin;
  String? _dateTime;
  num? _qty;
  String? _type;
  ComponentsLogsData copyWith({  String? checkoutForm,
  String? label,
  String? checkin,
  String? dateTime,
  num? qty,
  String? type,
}) => ComponentsLogsData(  checkoutForm: checkoutForm ?? _checkoutForm,
  label: label ?? _label,
  checkin: checkin ?? _checkin,
  dateTime: dateTime ?? _dateTime,
  qty: qty ?? _qty,
  type: type ?? _type,
);
  String? get checkoutForm => _checkoutForm;
  String? get label => _label;
  String? get checkin => _checkin;
  String? get dateTime => _dateTime;
  num? get qty => _qty;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['checkout_form'] = _checkoutForm;
    map['label'] = _label;
    map['checkin'] = _checkin;
    map['date_time'] = _dateTime;
    map['qty'] = _qty;
    map['type'] = _type;
    return map;
  }

}