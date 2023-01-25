import 'dart:convert';
/// total : 2
/// rows : [{"checkout_form":"G Floor Production","label":"CheckOut","checkin":"Kamlesh - ","date_time":"15-09-22 16:01","qty":1,"type":"user"},{"checkout_form":"Kamlesh - ","label":"CheckIn","checkin":"G Floor Production","date_time":"04-10-22 19:09","qty":1,"type":"user"}]
/// total_count : 2

AccessoriesLogs accessoriesLogsFromJson(String str) => AccessoriesLogs.fromJson(json.decode(str));
String accessoriesLogsToJson(AccessoriesLogs data) => json.encode(data.toJson());
class AccessoriesLogs {
  AccessoriesLogs({
      num? total, 
      List<AccessoriesLogsData>? rows,
      num? totalCount,}){
    _total = total;
    _rows = rows;
    _totalCount = totalCount;
}

  AccessoriesLogs.fromJson(dynamic json) {
    _total = json['total'];
    if (json['rows'] != null) {
      _rows = [];
      json['rows'].forEach((v) {
        _rows?.add(AccessoriesLogsData.fromJson(v));
      });
    }
    _totalCount = json['total_count'];
  }
  num? _total;
  List<AccessoriesLogsData>? _rows;
  num? _totalCount;
AccessoriesLogs copyWith({  num? total,
  List<AccessoriesLogsData>? rows,
  num? totalCount,
}) => AccessoriesLogs(  total: total ?? _total,
  rows: rows ?? _rows,
  totalCount: totalCount ?? _totalCount,
);
  num? get total => _total;
  List<AccessoriesLogsData>? get rows => _rows;
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

/// checkout_form : "G Floor Production"
/// label : "CheckOut"
/// checkin : "Kamlesh - "
/// date_time : "15-09-22 16:01"
/// qty : 1
/// type : "user"

AccessoriesLogsData rowsFromJson(String str) => AccessoriesLogsData.fromJson(json.decode(str));
String rowsToJson(AccessoriesLogsData data) => json.encode(data.toJson());
class AccessoriesLogsData {
  AccessoriesLogsData({
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

  AccessoriesLogsData.fromJson(dynamic json) {
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
  AccessoriesLogsData copyWith({  String? checkoutForm,
  String? label,
  String? checkin,
  String? dateTime,
  num? qty,
  String? type,
}) => AccessoriesLogsData(  checkoutForm: checkoutForm ?? _checkoutForm,
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