/// total : 4
/// rows : [{"checkout_form":"ETP Area ","label":"CheckOut","checkin":"aman - ","qty":1,"type":"user"},{"checkout_form":"ETP Area ","label":"CheckOut","checkin":"Extinguisher kanex  -1 ","qty":1,"type":"asset"},{"checkout_form":"ETP Area ","label":"CheckOut","checkin":"Block B","qty":1,"type":"location"},{"checkout_form":"ETP Area ","label":"CheckOut","checkin":"","qty":6,"type":"user"}]
/// total_count : 4

class ConsumableLogsModel {
  ConsumableLogsModel({
      num? total, 
      List<ConsumableLogsData>? rows,
      num? totalCount,}){
    _total = total;
    _rows = rows;
    _totalCount = totalCount;
}

  ConsumableLogsModel.fromJson(dynamic json) {
    _total = json['total'];
    if (json['rows'] != null) {
      _rows = [];
      json['rows'].forEach((v) {
        _rows?.add(ConsumableLogsData.fromJson(v));
      });
    }
    _totalCount = json['total_count'];
  }
  num? _total;
  List<ConsumableLogsData>? _rows;
  num? _totalCount;
ConsumableLogsModel copyWith({  num? total,
  List<ConsumableLogsData>? rows,
  num? totalCount,
}) => ConsumableLogsModel(  total: total ?? _total,
  rows: rows ?? _rows,
  totalCount: totalCount ?? _totalCount,
);
  num? get total => _total;
  List<ConsumableLogsData>? get rows => _rows;
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

/// checkout_form : "ETP Area "
/// label : "CheckOut"
/// checkin : "aman - "
/// qty : 1
/// type : "user"

class ConsumableLogsData {
  ConsumableLogsData({
      String? checkoutForm, 
      String? label, 
      String? checkin, 
      num? qty, 
      String? type,}){
    _checkoutForm = checkoutForm;
    _label = label;
    _checkin = checkin;
    _qty = qty;
    _type = type;
}

  ConsumableLogsData.fromJson(dynamic json) {
    _checkoutForm = json['checkout_form'];
    _label = json['label'];
    _checkin = json['checkin'];
    _qty = json['qty'];
    _type = json['type'];
  }
  String? _checkoutForm;
  String? _label;
  String? _checkin;
  num? _qty;
  String? _type;
  ConsumableLogsData copyWith({  String? checkoutForm,
  String? label,
  String? checkin,
  num? qty,
  String? type,
}) => ConsumableLogsData(  checkoutForm: checkoutForm ?? _checkoutForm,
  label: label ?? _label,
  checkin: checkin ?? _checkin,
  qty: qty ?? _qty,
  type: type ?? _type,
);
  String? get checkoutForm => _checkoutForm;
  String? get label => _label;
  String? get checkin => _checkin;
  num? get qty => _qty;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['checkout_form'] = _checkoutForm;
    map['label'] = _label;
    map['checkin'] = _checkin;
    map['qty'] = _qty;
    map['type'] = _type;
    return map;
  }

}