import 'dart:convert';
/// total : 1
/// rows : [{"id":1,"name":"SMPS","image":null,"serial":"98201","location":{"id":16,"name":"ETP Area "},"qty":50,"min_amt":10,"category":null,"order_number":"1354","purchase_date":{"diff_for_human":"6 months ago","date":"2022-03-15","formatted":"15 Mar, 2022"},"purchase_cost":"20,000.00","remaining":40,"company":{"id":3,"name":"Uat limited "},"notes":null,"created_at":{"diff_for_human":"2 months ago","datetime":"2022-07-27 10:19:31","formatted":"27 Jul, 2022 10:19AM"},"updated_at":{"diff_for_human":"2 months ago","datetime":"2022-07-27 10:19:31","formatted":"27 Jul, 2022 10:19AM"},"user_can_checkout":1,"available_actions":{"checkout":true,"checkin":true,"update":true,"delete":true}}]

Components componentsFromJson(String str) => Components.fromJson(json.decode(str));
String componentsToJson(Components data) => json.encode(data.toJson());
class Components {
  Components({
      num? total, 
      List<ComponentData>? rows,}){
    _total = total;
    _rows = rows;
}

  Components.fromJson(dynamic json) {
    _total = json['total'];
    if (json['rows'] != null) {
      _rows = [];
      json['rows'].forEach((v) {
        _rows?.add(ComponentData.fromJson(v));
      });
    }
  }
  num? _total;
  List<ComponentData>? _rows;
Components copyWith({  num? total,
  List<ComponentData>? rows,
}) => Components(  total: total ?? _total,
  rows: rows ?? _rows,
);
  num? get total => _total;
  List<ComponentData>? get rows => _rows;

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
/// name : "SMPS"
/// image : null
/// serial : "98201"
/// location : {"id":16,"name":"ETP Area "}
/// qty : 50
/// min_amt : 10
/// category : null
/// order_number : "1354"
/// purchase_date : {"diff_for_human":"6 months ago","date":"2022-03-15","formatted":"15 Mar, 2022"}
/// purchase_cost : "20,000.00"
/// remaining : 40
/// company : {"id":3,"name":"Uat limited "}
/// notes : null
/// created_at : {"diff_for_human":"2 months ago","datetime":"2022-07-27 10:19:31","formatted":"27 Jul, 2022 10:19AM"}
/// updated_at : {"diff_for_human":"2 months ago","datetime":"2022-07-27 10:19:31","formatted":"27 Jul, 2022 10:19AM"}
/// user_can_checkout : 1
/// available_actions : {"checkout":true,"checkin":true,"update":true,"delete":true}

ComponentData rowsFromJson(String str) => ComponentData.fromJson(json.decode(str));
String rowsToJson(ComponentData data) => json.encode(data.toJson());
class ComponentData {
  ComponentData({
      num? id, 
      String? name, 
      dynamic image, 
      String? serial, 
      Location? location, 
      num? qty, 
      num? minAmt, 
      dynamic category, 
      String? orderNumber, 
      PurchaseDate? purchaseDate, 
      String? purchaseCost, 
      num? remaining, 
      Company? company, 
      dynamic notes, 
      CreatedAt? createdAt, 
      UpdatedAt? updatedAt, 
      num? userCanCheckout, 
      AvailableActions? availableActions,}){
    _id = id;
    _name = name;
    _image = image;
    _serial = serial;
    _location = location;
    _qty = qty;
    _minAmt = minAmt;
    _category = category;
    _orderNumber = orderNumber;
    _purchaseDate = purchaseDate;
    _purchaseCost = purchaseCost;
    _remaining = remaining;
    _company = company;
    _notes = notes;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userCanCheckout = userCanCheckout;
    _availableActions = availableActions;
}

  ComponentData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _serial = json['serial'];
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _qty = json['qty'];
    _minAmt = json['min_amt'];
    _category = json['category'];
    _orderNumber = json['order_number'];
    _purchaseDate = json['purchase_date'] != null ? PurchaseDate.fromJson(json['purchase_date']) : null;
    _purchaseCost = json['purchase_cost'];
    _remaining = json['remaining'];
    _company = json['company'] != null ? Company.fromJson(json['company']) : null;
    _notes = json['notes'];
    _createdAt = json['created_at'] != null ? CreatedAt.fromJson(json['created_at']) : null;
    _updatedAt = json['updated_at'] != null ? UpdatedAt.fromJson(json['updated_at']) : null;
    _userCanCheckout = json['user_can_checkout'];
    _availableActions = json['available_actions'] != null ? AvailableActions.fromJson(json['available_actions']) : null;
  }
  num? _id;
  String? _name;
  dynamic _image;
  String? _serial;
  Location? _location;
  num? _qty;
  num? _minAmt;
  dynamic _category;
  String? _orderNumber;
  PurchaseDate? _purchaseDate;
  String? _purchaseCost;
  num? _remaining;
  Company? _company;
  dynamic _notes;
  CreatedAt? _createdAt;
  UpdatedAt? _updatedAt;
  num? _userCanCheckout;
  AvailableActions? _availableActions;
  ComponentData copyWith({  num? id,
  String? name,
  dynamic image,
  String? serial,
  Location? location,
  num? qty,
  num? minAmt,
  dynamic category,
  String? orderNumber,
  PurchaseDate? purchaseDate,
  String? purchaseCost,
  num? remaining,
  Company? company,
  dynamic notes,
  CreatedAt? createdAt,
  UpdatedAt? updatedAt,
  num? userCanCheckout,
  AvailableActions? availableActions,
}) => ComponentData(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  serial: serial ?? _serial,
  location: location ?? _location,
  qty: qty ?? _qty,
  minAmt: minAmt ?? _minAmt,
  category: category ?? _category,
  orderNumber: orderNumber ?? _orderNumber,
  purchaseDate: purchaseDate ?? _purchaseDate,
  purchaseCost: purchaseCost ?? _purchaseCost,
  remaining: remaining ?? _remaining,
  company: company ?? _company,
  notes: notes ?? _notes,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  userCanCheckout: userCanCheckout ?? _userCanCheckout,
  availableActions: availableActions ?? _availableActions,
);
  num? get id => _id;
  String? get name => _name;
  dynamic get image => _image;
  String? get serial => _serial;
  Location? get location => _location;
  num? get qty => _qty;
  num? get minAmt => _minAmt;
  dynamic get category => _category;
  String? get orderNumber => _orderNumber;
  PurchaseDate? get purchaseDate => _purchaseDate;
  String? get purchaseCost => _purchaseCost;
  num? get remaining => _remaining;
  Company? get company => _company;
  dynamic get notes => _notes;
  CreatedAt? get createdAt => _createdAt;
  UpdatedAt? get updatedAt => _updatedAt;
  num? get userCanCheckout => _userCanCheckout;
  AvailableActions? get availableActions => _availableActions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['serial'] = _serial;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['qty'] = _qty;
    map['min_amt'] = _minAmt;
    map['category'] = _category;
    map['order_number'] = _orderNumber;
    if (_purchaseDate != null) {
      map['purchase_date'] = _purchaseDate?.toJson();
    }
    map['purchase_cost'] = _purchaseCost;
    map['remaining'] = _remaining;
    if (_company != null) {
      map['company'] = _company?.toJson();
    }
    map['notes'] = _notes;
    if (_createdAt != null) {
      map['created_at'] = _createdAt?.toJson();
    }
    if (_updatedAt != null) {
      map['updated_at'] = _updatedAt?.toJson();
    }
    map['user_can_checkout'] = _userCanCheckout;
    if (_availableActions != null) {
      map['available_actions'] = _availableActions?.toJson();
    }
    return map;
  }

}

/// checkout : true
/// checkin : true
/// update : true
/// delete : true

AvailableActions availableActionsFromJson(String str) => AvailableActions.fromJson(json.decode(str));
String availableActionsToJson(AvailableActions data) => json.encode(data.toJson());
class AvailableActions {
  AvailableActions({
      bool? checkout, 
      bool? checkin, 
      bool? update, 
      bool? delete,}){
    _checkout = checkout;
    _checkin = checkin;
    _update = update;
    _delete = delete;
}

  AvailableActions.fromJson(dynamic json) {
    _checkout = json['checkout'];
    _checkin = json['checkin'];
    _update = json['update'];
    _delete = json['delete'];
  }
  bool? _checkout;
  bool? _checkin;
  bool? _update;
  bool? _delete;
AvailableActions copyWith({  bool? checkout,
  bool? checkin,
  bool? update,
  bool? delete,
}) => AvailableActions(  checkout: checkout ?? _checkout,
  checkin: checkin ?? _checkin,
  update: update ?? _update,
  delete: delete ?? _delete,
);
  bool? get checkout => _checkout;
  bool? get checkin => _checkin;
  bool? get update => _update;
  bool? get delete => _delete;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['checkout'] = _checkout;
    map['checkin'] = _checkin;
    map['update'] = _update;
    map['delete'] = _delete;
    return map;
  }

}

/// diff_for_human : "2 months ago"
/// datetime : "2022-07-27 10:19:31"
/// formatted : "27 Jul, 2022 10:19AM"

UpdatedAt updatedAtFromJson(String str) => UpdatedAt.fromJson(json.decode(str));
String updatedAtToJson(UpdatedAt data) => json.encode(data.toJson());
class UpdatedAt {
  UpdatedAt({
      String? diffForHuman, 
      String? datetime, 
      String? formatted,}){
    _diffForHuman = diffForHuman;
    _datetime = datetime;
    _formatted = formatted;
}

  UpdatedAt.fromJson(dynamic json) {
    _diffForHuman = json['diff_for_human'];
    _datetime = json['datetime'];
    _formatted = json['formatted'];
  }
  String? _diffForHuman;
  String? _datetime;
  String? _formatted;
UpdatedAt copyWith({  String? diffForHuman,
  String? datetime,
  String? formatted,
}) => UpdatedAt(  diffForHuman: diffForHuman ?? _diffForHuman,
  datetime: datetime ?? _datetime,
  formatted: formatted ?? _formatted,
);
  String? get diffForHuman => _diffForHuman;
  String? get datetime => _datetime;
  String? get formatted => _formatted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['diff_for_human'] = _diffForHuman;
    map['datetime'] = _datetime;
    map['formatted'] = _formatted;
    return map;
  }

}

/// diff_for_human : "2 months ago"
/// datetime : "2022-07-27 10:19:31"
/// formatted : "27 Jul, 2022 10:19AM"

CreatedAt createdAtFromJson(String str) => CreatedAt.fromJson(json.decode(str));
String createdAtToJson(CreatedAt data) => json.encode(data.toJson());
class CreatedAt {
  CreatedAt({
      String? diffForHuman, 
      String? datetime, 
      String? formatted,}){
    _diffForHuman = diffForHuman;
    _datetime = datetime;
    _formatted = formatted;
}

  CreatedAt.fromJson(dynamic json) {
    _diffForHuman = json['diff_for_human'];
    _datetime = json['datetime'];
    _formatted = json['formatted'];
  }
  String? _diffForHuman;
  String? _datetime;
  String? _formatted;
CreatedAt copyWith({  String? diffForHuman,
  String? datetime,
  String? formatted,
}) => CreatedAt(  diffForHuman: diffForHuman ?? _diffForHuman,
  datetime: datetime ?? _datetime,
  formatted: formatted ?? _formatted,
);
  String? get diffForHuman => _diffForHuman;
  String? get datetime => _datetime;
  String? get formatted => _formatted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['diff_for_human'] = _diffForHuman;
    map['datetime'] = _datetime;
    map['formatted'] = _formatted;
    return map;
  }

}

/// id : 3
/// name : "Uat limited "

Company companyFromJson(String str) => Company.fromJson(json.decode(str));
String companyToJson(Company data) => json.encode(data.toJson());
class Company {
  Company({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Company.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Company copyWith({  num? id,
  String? name,
}) => Company(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

/// diff_for_human : "6 months ago"
/// date : "2022-03-15"
/// formatted : "15 Mar, 2022"

PurchaseDate purchaseDateFromJson(String str) => PurchaseDate.fromJson(json.decode(str));
String purchaseDateToJson(PurchaseDate data) => json.encode(data.toJson());
class PurchaseDate {
  PurchaseDate({
      String? diffForHuman, 
      String? date, 
      String? formatted,}){
    _diffForHuman = diffForHuman;
    _date = date;
    _formatted = formatted;
}

  PurchaseDate.fromJson(dynamic json) {
    _diffForHuman = json['diff_for_human'];
    _date = json['date'];
    _formatted = json['formatted'];
  }
  String? _diffForHuman;
  String? _date;
  String? _formatted;
PurchaseDate copyWith({  String? diffForHuman,
  String? date,
  String? formatted,
}) => PurchaseDate(  diffForHuman: diffForHuman ?? _diffForHuman,
  date: date ?? _date,
  formatted: formatted ?? _formatted,
);
  String? get diffForHuman => _diffForHuman;
  String? get date => _date;
  String? get formatted => _formatted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['diff_for_human'] = _diffForHuman;
    map['date'] = _date;
    map['formatted'] = _formatted;
    return map;
  }

}

/// id : 16
/// name : "ETP Area "

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());
class Location {
  Location({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Location.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Location copyWith({  num? id,
  String? name,
}) => Location(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}