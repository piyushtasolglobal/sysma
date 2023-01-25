import 'dart:convert';
/// total : 12
/// rows : [{"id":6,"name":"Extinguisher Pipes","image":null,"company":{"id":10,"name":"ASAN"},"manufacturer":{"id":32,"name":"ASAN"},"supplier":{"id":9,"name":"ASAN"},"model_number":"47373","category":{"id":48,"name":"Accessories"},"location":{"id":18,"name":"Block A"},"notes":"....","qty":100,"purchase_date":{"diff_for_human":"1 month ago","date":"2022-09-01","formatted":"01 Sep, 2022"},"purchase_cost":"20,000.00","order_number":"88","min_qty":10,"remaining_qty":100,"created_at":{"diff_for_human":"2 weeks ago","datetime":"2022-09-21 08:24:39","formatted":"21 Sep, 2022 8:24AM"},"updated_at":{"diff_for_human":"2 weeks ago","datetime":"2022-09-21 08:24:39","formatted":"21 Sep, 2022 8:24AM"},"available_actions":{"checkout":true,"checkin":false,"update":true,"delete":true},"user_can_checkout":true,"accessories_users":null,"accessory_checkout_log":null}]

Accessories accessoriesFromJson(String str) => Accessories.fromJson(json.decode(str));
String accessoriesToJson(Accessories data) => json.encode(data.toJson());
class Accessories {
  Accessories({
      num? total, 
      List<AccessoriesData>? rows,}){
    _total = total;
    _rows = rows;
}

  Accessories.fromJson(dynamic json) {
    _total = json['total'];
    if (json['rows'] != null) {
      _rows = [];
      json['rows'].forEach((v) {
        _rows?.add(AccessoriesData.fromJson(v));
      });
    }
  }
  num? _total;
  List<AccessoriesData>? _rows;
Accessories copyWith({  num? total,
  List<AccessoriesData>? rows,
}) => Accessories(  total: total ?? _total,
  rows: rows ?? _rows,
);
  num? get total => _total;
  List<AccessoriesData>? get rows => _rows;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    if (_rows != null) {
      map['rows'] = _rows?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 6
/// name : "Extinguisher Pipes"
/// image : null
/// company : {"id":10,"name":"ASAN"}
/// manufacturer : {"id":32,"name":"ASAN"}
/// supplier : {"id":9,"name":"ASAN"}
/// model_number : "47373"
/// category : {"id":48,"name":"Accessories"}
/// location : {"id":18,"name":"Block A"}
/// notes : "...."
/// qty : 100
/// purchase_date : {"diff_for_human":"1 month ago","date":"2022-09-01","formatted":"01 Sep, 2022"}
/// purchase_cost : "20,000.00"
/// order_number : "88"
/// min_qty : 10
/// remaining_qty : 100
/// created_at : {"diff_for_human":"2 weeks ago","datetime":"2022-09-21 08:24:39","formatted":"21 Sep, 2022 8:24AM"}
/// updated_at : {"diff_for_human":"2 weeks ago","datetime":"2022-09-21 08:24:39","formatted":"21 Sep, 2022 8:24AM"}
/// available_actions : {"checkout":true,"checkin":false,"update":true,"delete":true}
/// user_can_checkout : true
/// accessories_users : null
/// accessory_checkout_log : null

AccessoriesData rowsFromJson(String str) => AccessoriesData.fromJson(json.decode(str));
String rowsToJson(AccessoriesData data) => json.encode(data.toJson());
class AccessoriesData {
  AccessoriesData({
      num? id, 
      String? name, 
      dynamic image, 
      Company? company, 
      Manufacturer? manufacturer, 
      Supplier? supplier, 
      String? modelNumber, 
      Category? category,
      Location? location,
      String? notes, 
      num? qty, 
      PurchaseDate? purchaseDate, 
      String? purchaseCost, 
      String? orderNumber, 
      num? minQty, 
      num? remainingQty, 
      CreatedAt? createdAt, 
      UpdatedAt? updatedAt, 
      AvailableActions? availableActions, 
      bool? userCanCheckout, 
      dynamic accessoriesUsers, 
      dynamic accessoryCheckoutLog,}){
    _id = id;
    _name = name;
    _image = image;
    _company = company;
    _manufacturer = manufacturer;
    _supplier = supplier;
    _modelNumber = modelNumber;
    _category = category;
    _location = location;
    _notes = notes;
    _qty = qty;
    _purchaseDate = purchaseDate;
    _purchaseCost = purchaseCost;
    _orderNumber = orderNumber;
    _minQty = minQty;
    _remainingQty = remainingQty;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _availableActions = availableActions;
    _userCanCheckout = userCanCheckout;
    _accessoriesUsers = accessoriesUsers;
    _accessoryCheckoutLog = accessoryCheckoutLog;
}

  AccessoriesData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _company = json['company'] != null ? Company.fromJson(json['company']) : null;
    _manufacturer = json['manufacturer'] != null ? Manufacturer.fromJson(json['manufacturer']) : null;
    _supplier = json['supplier'] != null ? Supplier.fromJson(json['supplier']) : null;
    _modelNumber = json['model_number'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _notes = json['notes'];
    _qty = json['qty'];
    _purchaseDate = json['purchase_date'] != null ? PurchaseDate.fromJson(json['purchase_date']) : null;
    _purchaseCost = json['purchase_cost'];
    _orderNumber = json['order_number'];
    _minQty = json['min_qty'];
    _remainingQty = json['remaining_qty'];
    _createdAt = json['created_at'] != null ? CreatedAt.fromJson(json['created_at']) : null;
    _updatedAt = json['updated_at'] != null ? UpdatedAt.fromJson(json['updated_at']) : null;
    _availableActions = json['available_actions'] != null ? AvailableActions.fromJson(json['available_actions']) : null;
    _userCanCheckout = json['user_can_checkout'];
    _accessoriesUsers = json['accessories_users'];
    _accessoryCheckoutLog = json['accessory_checkout_log'];
  }
  num? _id;
  String? _name;
  dynamic _image;
  Company? _company;
  Manufacturer? _manufacturer;
  Supplier? _supplier;
  String? _modelNumber;
  Category? _category;
  Location? _location;
  String? _notes;
  num? _qty;
  PurchaseDate? _purchaseDate;
  String? _purchaseCost;
  String? _orderNumber;
  num? _minQty;
  num? _remainingQty;
  CreatedAt? _createdAt;
  UpdatedAt? _updatedAt;
  AvailableActions? _availableActions;
  bool? _userCanCheckout;
  dynamic _accessoriesUsers;
  dynamic _accessoryCheckoutLog;
  AccessoriesData copyWith({  num? id,
  String? name,
  dynamic image,
  Company? company,
  Manufacturer? manufacturer,
  Supplier? supplier,
  String? modelNumber,
  Category? category,
  Location? location,
  String? notes,
  num? qty,
  PurchaseDate? purchaseDate,
  String? purchaseCost,
  String? orderNumber,
  num? minQty,
  num? remainingQty,
  CreatedAt? createdAt,
  UpdatedAt? updatedAt,
  AvailableActions? availableActions,
  bool? userCanCheckout,
  dynamic accessoriesUsers,
  dynamic accessoryCheckoutLog,
}) => AccessoriesData(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  company: company ?? _company,
  manufacturer: manufacturer ?? _manufacturer,
  supplier: supplier ?? _supplier,
  modelNumber: modelNumber ?? _modelNumber,
  category: category ?? _category,
  location: location ?? _location,
  notes: notes ?? _notes,
  qty: qty ?? _qty,
  purchaseDate: purchaseDate ?? _purchaseDate,
  purchaseCost: purchaseCost ?? _purchaseCost,
  orderNumber: orderNumber ?? _orderNumber,
  minQty: minQty ?? _minQty,
  remainingQty: remainingQty ?? _remainingQty,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  availableActions: availableActions ?? _availableActions,
  userCanCheckout: userCanCheckout ?? _userCanCheckout,
  accessoriesUsers: accessoriesUsers ?? _accessoriesUsers,
  accessoryCheckoutLog: accessoryCheckoutLog ?? _accessoryCheckoutLog,
);
  num? get id => _id;
  String? get name => _name;
  dynamic get image => _image;
  Company? get company => _company;
  Manufacturer? get manufacturer => _manufacturer;
  Supplier? get supplier => _supplier;
  String? get modelNumber => _modelNumber;
  Category? get category => _category;
  Location? get location => _location;
  String? get notes => _notes;
  num? get qty => _qty;
  PurchaseDate? get purchaseDate => _purchaseDate;
  String? get purchaseCost => _purchaseCost;
  String? get orderNumber => _orderNumber;
  num? get minQty => _minQty;
  num? get remainingQty => _remainingQty;
  CreatedAt? get createdAt => _createdAt;
  UpdatedAt? get updatedAt => _updatedAt;
  AvailableActions? get availableActions => _availableActions;
  bool? get userCanCheckout => _userCanCheckout;
  dynamic get accessoriesUsers => _accessoriesUsers;
  dynamic get accessoryCheckoutLog => _accessoryCheckoutLog;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    if (_company != null) {
      map['company'] = _company?.toJson();
    }
    if (_manufacturer != null) {
      map['manufacturer'] = _manufacturer?.toJson();
    }
    if (_supplier != null) {
      map['supplier'] = _supplier?.toJson();
    }
    map['model_number'] = _modelNumber;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['notes'] = _notes;
    map['qty'] = _qty;
    if (_purchaseDate != null) {
      map['purchase_date'] = _purchaseDate?.toJson();
    }
    map['purchase_cost'] = _purchaseCost;
    map['order_number'] = _orderNumber;
    map['min_qty'] = _minQty;
    map['remaining_qty'] = _remainingQty;
    if (_createdAt != null) {
      map['created_at'] = _createdAt?.toJson();
    }
    if (_updatedAt != null) {
      map['updated_at'] = _updatedAt?.toJson();
    }
    if (_availableActions != null) {
      map['available_actions'] = _availableActions?.toJson();
    }
    map['user_can_checkout'] = _userCanCheckout;
    map['accessories_users'] = _accessoriesUsers;
    map['accessory_checkout_log'] = _accessoryCheckoutLog;
    return map;
  }

}

/// checkout : true
/// checkin : false
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

/// diff_for_human : "2 weeks ago"
/// datetime : "2022-09-21 08:24:39"
/// formatted : "21 Sep, 2022 8:24AM"

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

/// diff_for_human : "2 weeks ago"
/// datetime : "2022-09-21 08:24:39"
/// formatted : "21 Sep, 2022 8:24AM"

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

/// diff_for_human : "1 month ago"
/// date : "2022-09-01"
/// formatted : "01 Sep, 2022"

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

/// id : 18
/// name : "Block A"

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

/// id : 48
/// name : "Accessories"

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

/// id : 9
/// name : "ASAN"

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

/// id : 32
/// name : "ASAN"

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

/// id : 10
/// name : "ASAN"

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