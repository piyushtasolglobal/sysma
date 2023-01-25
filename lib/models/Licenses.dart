import 'dart:convert';
/// total : 1
/// rows : [{"id":1,"name":"Microsoft Office","company":{"id":3,"name":"Uat limited "},"manufacturer":{"id":27,"name":"Kanex"},"product_key":"XSUFWSNKKBVDAK968183","order_number":"974632","purchase_order":"","purchase_date":{"diff_for_human":"6 months ago","date":"2022-03-01","formatted":"01 Mar, 2022"},"termination_date":null,"depreciation":null,"purchase_cost":"10,000.00","purchase_cost_numeric":"10000.00","notes":"Microsoft Office License","expiration_date":{"diff_for_human":"7 years from now","date":"2030-03-01","formatted":"01 Mar, 2030"},"seats":5,"free_seats_count":3,"license_name":"UAT Automation","license_email":"kanchan@tasolglobal.com","reassignable":true,"maintained":false,"supplier":{"id":5,"name":"uat -1"},"category":{"id":50,"name":"License Category"},"created_at":{"diff_for_human":"2 months ago","datetime":"2022-07-27 07:37:04","formatted":"27 Jul, 2022 7:37AM"},"updated_at":{"diff_for_human":"2 months ago","datetime":"2022-07-27 07:55:19","formatted":"27 Jul, 2022 7:55AM"},"deleted_at":null,"user_can_checkout":true,"available_actions":{"checkout":true,"checkin":true,"clone":true,"update":true,"delete":true}}]

Licenses licensesFromJson(String str) => Licenses.fromJson(json.decode(str));
String licensesToJson(Licenses data) => json.encode(data.toJson());
class Licenses {
  Licenses({
      num? total, 
      List<LicensesData>? rows,}){
    _total = total;
    _rows = rows;
}

  Licenses.fromJson(dynamic json) {
    _total = json['total'];
    if (json['rows'] != null) {
      _rows = [];
      json['rows'].forEach((v) {
        _rows?.add(LicensesData.fromJson(v));
      });
    }
  }
  num? _total;
  List<LicensesData>? _rows;
Licenses copyWith({  num? total,
  List<LicensesData>? rows,
}) => Licenses(  total: total ?? _total,
  rows: rows ?? _rows,
);
  num? get total => _total;
  List<LicensesData>? get rows => _rows;

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
/// name : "Microsoft Office"
/// company : {"id":3,"name":"Uat limited "}
/// manufacturer : {"id":27,"name":"Kanex"}
/// product_key : "XSUFWSNKKBVDAK968183"
/// order_number : "974632"
/// purchase_order : ""
/// purchase_date : {"diff_for_human":"6 months ago","date":"2022-03-01","formatted":"01 Mar, 2022"}
/// termination_date : null
/// depreciation : null
/// purchase_cost : "10,000.00"
/// purchase_cost_numeric : "10000.00"
/// notes : "Microsoft Office License"
/// expiration_date : {"diff_for_human":"7 years from now","date":"2030-03-01","formatted":"01 Mar, 2030"}
/// seats : 5
/// free_seats_count : 3
/// license_name : "UAT Automation"
/// license_email : "kanchan@tasolglobal.com"
/// reassignable : true
/// maintained : false
/// supplier : {"id":5,"name":"uat -1"}
/// category : {"id":50,"name":"License Category"}
/// created_at : {"diff_for_human":"2 months ago","datetime":"2022-07-27 07:37:04","formatted":"27 Jul, 2022 7:37AM"}
/// updated_at : {"diff_for_human":"2 months ago","datetime":"2022-07-27 07:55:19","formatted":"27 Jul, 2022 7:55AM"}
/// deleted_at : null
/// user_can_checkout : true
/// available_actions : {"checkout":true,"checkin":true,"clone":true,"update":true,"delete":true}

LicensesData rowsFromJson(String str) => LicensesData.fromJson(json.decode(str));
String rowsToJson(LicensesData data) => json.encode(data.toJson());
class LicensesData {
  LicensesData({
      num? id, 
      String? name, 
      Company? company, 
      Manufacturer? manufacturer, 
      String? productKey, 
      String? orderNumber, 
      String? purchaseOrder, 
      PurchaseDate? purchaseDate, 
      dynamic terminationDate, 
      dynamic depreciation, 
      String? purchaseCost, 
      String? purchaseCostNumeric, 
      String? notes, 
      ExpirationDate? expirationDate, 
      num? seats, 
      num? freeSeatsCount, 
      String? licenseName, 
      String? licenseEmail, 
      bool? reassignable, 
      bool? maintained, 
      Supplier? supplier, 
      Category? category, 
      CreatedAt? createdAt, 
      UpdatedAt? updatedAt, 
      dynamic deletedAt, 
      bool? userCanCheckout, 
      AvailableActions? availableActions,}){
    _id = id;
    _name = name;
    _company = company;
    _manufacturer = manufacturer;
    _productKey = productKey;
    _orderNumber = orderNumber;
    _purchaseOrder = purchaseOrder;
    _purchaseDate = purchaseDate;
    _terminationDate = terminationDate;
    _depreciation = depreciation;
    _purchaseCost = purchaseCost;
    _purchaseCostNumeric = purchaseCostNumeric;
    _notes = notes;
    _expirationDate = expirationDate;
    _seats = seats;
    _freeSeatsCount = freeSeatsCount;
    _licenseName = licenseName;
    _licenseEmail = licenseEmail;
    _reassignable = reassignable;
    _maintained = maintained;
    _supplier = supplier;
    _category = category;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _userCanCheckout = userCanCheckout;
    _availableActions = availableActions;
}

  LicensesData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _company = json['company'] != null ? Company.fromJson(json['company']) : null;
    _manufacturer = json['manufacturer'] != null ? Manufacturer.fromJson(json['manufacturer']) : null;
    _productKey = json['product_key'];
    _orderNumber = json['order_number'];
    _purchaseOrder = json['purchase_order'];
    _purchaseDate = json['purchase_date'] != null ? PurchaseDate.fromJson(json['purchase_date']) : null;
    _terminationDate = json['termination_date'];
    _depreciation = json['depreciation'];
    _purchaseCost = json['purchase_cost'];
    _purchaseCostNumeric = json['purchase_cost_numeric'];
    _notes = json['notes'];
    _expirationDate = json['expiration_date'] != null ? ExpirationDate.fromJson(json['expiration_date']) : null;
    _seats = json['seats'];
    _freeSeatsCount = json['free_seats_count'];
    _licenseName = json['license_name'];
    _licenseEmail = json['license_email'];
    _reassignable = json['reassignable'];
    _maintained = json['maintained'];
    _supplier = json['supplier'] != null ? Supplier.fromJson(json['supplier']) : null;
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
    _createdAt = json['created_at'] != null ? CreatedAt.fromJson(json['created_at']) : null;
    _updatedAt = json['updated_at'] != null ? UpdatedAt.fromJson(json['updated_at']) : null;
    _deletedAt = json['deleted_at'];
    _userCanCheckout = json['user_can_checkout'];
    _availableActions = json['available_actions'] != null ? AvailableActions.fromJson(json['available_actions']) : null;
  }
  num? _id;
  String? _name;
  Company? _company;
  Manufacturer? _manufacturer;
  String? _productKey;
  String? _orderNumber;
  String? _purchaseOrder;
  PurchaseDate? _purchaseDate;
  dynamic _terminationDate;
  dynamic _depreciation;
  String? _purchaseCost;
  String? _purchaseCostNumeric;
  String? _notes;
  ExpirationDate? _expirationDate;
  num? _seats;
  num? _freeSeatsCount;
  String? _licenseName;
  String? _licenseEmail;
  bool? _reassignable;
  bool? _maintained;
  Supplier? _supplier;
  Category? _category;
  CreatedAt? _createdAt;
  UpdatedAt? _updatedAt;
  dynamic _deletedAt;
  bool? _userCanCheckout;
  AvailableActions? _availableActions;
  LicensesData copyWith({  num? id,
  String? name,
  Company? company,
  Manufacturer? manufacturer,
  String? productKey,
  String? orderNumber,
  String? purchaseOrder,
  PurchaseDate? purchaseDate,
  dynamic terminationDate,
  dynamic depreciation,
  String? purchaseCost,
  String? purchaseCostNumeric,
  String? notes,
  ExpirationDate? expirationDate,
  num? seats,
  num? freeSeatsCount,
  String? licenseName,
  String? licenseEmail,
  bool? reassignable,
  bool? maintained,
  Supplier? supplier,
  Category? category,
  CreatedAt? createdAt,
  UpdatedAt? updatedAt,
  dynamic deletedAt,
  bool? userCanCheckout,
  AvailableActions? availableActions,
}) => LicensesData(  id: id ?? _id,
  name: name ?? _name,
  company: company ?? _company,
  manufacturer: manufacturer ?? _manufacturer,
  productKey: productKey ?? _productKey,
  orderNumber: orderNumber ?? _orderNumber,
  purchaseOrder: purchaseOrder ?? _purchaseOrder,
  purchaseDate: purchaseDate ?? _purchaseDate,
  terminationDate: terminationDate ?? _terminationDate,
  depreciation: depreciation ?? _depreciation,
  purchaseCost: purchaseCost ?? _purchaseCost,
  purchaseCostNumeric: purchaseCostNumeric ?? _purchaseCostNumeric,
  notes: notes ?? _notes,
  expirationDate: expirationDate ?? _expirationDate,
  seats: seats ?? _seats,
  freeSeatsCount: freeSeatsCount ?? _freeSeatsCount,
  licenseName: licenseName ?? _licenseName,
  licenseEmail: licenseEmail ?? _licenseEmail,
  reassignable: reassignable ?? _reassignable,
  maintained: maintained ?? _maintained,
  supplier: supplier ?? _supplier,
  category: category ?? _category,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
  userCanCheckout: userCanCheckout ?? _userCanCheckout,
  availableActions: availableActions ?? _availableActions,
);
  num? get id => _id;
  String? get name => _name;
  Company? get company => _company;
  Manufacturer? get manufacturer => _manufacturer;
  String? get productKey => _productKey;
  String? get orderNumber => _orderNumber;
  String? get purchaseOrder => _purchaseOrder;
  PurchaseDate? get purchaseDate => _purchaseDate;
  dynamic get terminationDate => _terminationDate;
  dynamic get depreciation => _depreciation;
  String? get purchaseCost => _purchaseCost;
  String? get purchaseCostNumeric => _purchaseCostNumeric;
  String? get notes => _notes;
  ExpirationDate? get expirationDate => _expirationDate;
  num? get seats => _seats;
  num? get freeSeatsCount => _freeSeatsCount;
  String? get licenseName => _licenseName;
  String? get licenseEmail => _licenseEmail;
  bool? get reassignable => _reassignable;
  bool? get maintained => _maintained;
  Supplier? get supplier => _supplier;
  Category? get category => _category;
  CreatedAt? get createdAt => _createdAt;
  UpdatedAt? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  bool? get userCanCheckout => _userCanCheckout;
  AvailableActions? get availableActions => _availableActions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_company != null) {
      map['company'] = _company?.toJson();
    }
    if (_manufacturer != null) {
      map['manufacturer'] = _manufacturer?.toJson();
    }
    map['product_key'] = _productKey;
    map['order_number'] = _orderNumber;
    map['purchase_order'] = _purchaseOrder;
    if (_purchaseDate != null) {
      map['purchase_date'] = _purchaseDate?.toJson();
    }
    map['termination_date'] = _terminationDate;
    map['depreciation'] = _depreciation;
    map['purchase_cost'] = _purchaseCost;
    map['purchase_cost_numeric'] = _purchaseCostNumeric;
    map['notes'] = _notes;
    if (_expirationDate != null) {
      map['expiration_date'] = _expirationDate?.toJson();
    }
    map['seats'] = _seats;
    map['free_seats_count'] = _freeSeatsCount;
    map['license_name'] = _licenseName;
    map['license_email'] = _licenseEmail;
    map['reassignable'] = _reassignable;
    map['maintained'] = _maintained;
    if (_supplier != null) {
      map['supplier'] = _supplier?.toJson();
    }
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    if (_createdAt != null) {
      map['created_at'] = _createdAt?.toJson();
    }
    if (_updatedAt != null) {
      map['updated_at'] = _updatedAt?.toJson();
    }
    map['deleted_at'] = _deletedAt;
    map['user_can_checkout'] = _userCanCheckout;
    if (_availableActions != null) {
      map['available_actions'] = _availableActions?.toJson();
    }
    return map;
  }

}

/// checkout : true
/// checkin : true
/// clone : true
/// update : true
/// delete : true

AvailableActions availableActionsFromJson(String str) => AvailableActions.fromJson(json.decode(str));
String availableActionsToJson(AvailableActions data) => json.encode(data.toJson());
class AvailableActions {
  AvailableActions({
      bool? checkout, 
      bool? checkin, 
      bool? clone, 
      bool? update, 
      bool? delete,}){
    _checkout = checkout;
    _checkin = checkin;
    _clone = clone;
    _update = update;
    _delete = delete;
}

  AvailableActions.fromJson(dynamic json) {
    _checkout = json['checkout'];
    _checkin = json['checkin'];
    _clone = json['clone'];
    _update = json['update'];
    _delete = json['delete'];
  }
  bool? _checkout;
  bool? _checkin;
  bool? _clone;
  bool? _update;
  bool? _delete;
AvailableActions copyWith({  bool? checkout,
  bool? checkin,
  bool? clone,
  bool? update,
  bool? delete,
}) => AvailableActions(  checkout: checkout ?? _checkout,
  checkin: checkin ?? _checkin,
  clone: clone ?? _clone,
  update: update ?? _update,
  delete: delete ?? _delete,
);
  bool? get checkout => _checkout;
  bool? get checkin => _checkin;
  bool? get clone => _clone;
  bool? get update => _update;
  bool? get delete => _delete;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['checkout'] = _checkout;
    map['checkin'] = _checkin;
    map['clone'] = _clone;
    map['update'] = _update;
    map['delete'] = _delete;
    return map;
  }

}

/// diff_for_human : "2 months ago"
/// datetime : "2022-07-27 07:55:19"
/// formatted : "27 Jul, 2022 7:55AM"

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
/// datetime : "2022-07-27 07:37:04"
/// formatted : "27 Jul, 2022 7:37AM"

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

/// id : 50
/// name : "License Category"

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));
String categoryToJson(Category data) => json.encode(data.toJson());
class Category {
  Category({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Category copyWith({  num? id,
  String? name,
}) => Category(  id: id ?? _id,
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

/// id : 5
/// name : "uat -1"

Supplier supplierFromJson(String str) => Supplier.fromJson(json.decode(str));
String supplierToJson(Supplier data) => json.encode(data.toJson());
class Supplier {
  Supplier({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Supplier.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Supplier copyWith({  num? id,
  String? name,
}) => Supplier(  id: id ?? _id,
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

/// diff_for_human : "7 years from now"
/// date : "2030-03-01"
/// formatted : "01 Mar, 2030"

ExpirationDate expirationDateFromJson(String str) => ExpirationDate.fromJson(json.decode(str));
String expirationDateToJson(ExpirationDate data) => json.encode(data.toJson());
class ExpirationDate {
  ExpirationDate({
      String? diffForHuman, 
      String? date, 
      String? formatted,}){
    _diffForHuman = diffForHuman;
    _date = date;
    _formatted = formatted;
}

  ExpirationDate.fromJson(dynamic json) {
    _diffForHuman = json['diff_for_human'];
    _date = json['date'];
    _formatted = json['formatted'];
  }
  String? _diffForHuman;
  String? _date;
  String? _formatted;
ExpirationDate copyWith({  String? diffForHuman,
  String? date,
  String? formatted,
}) => ExpirationDate(  diffForHuman: diffForHuman ?? _diffForHuman,
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

/// diff_for_human : "6 months ago"
/// date : "2022-03-01"
/// formatted : "01 Mar, 2022"

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

/// id : 27
/// name : "Kanex"

Manufacturer manufacturerFromJson(String str) => Manufacturer.fromJson(json.decode(str));
String manufacturerToJson(Manufacturer data) => json.encode(data.toJson());
class Manufacturer {
  Manufacturer({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Manufacturer.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Manufacturer copyWith({  num? id,
  String? name,
}) => Manufacturer(  id: id ?? _id,
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