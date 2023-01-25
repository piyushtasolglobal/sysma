import 'dart:convert';
/// total : 3
/// rows : [{"id":3,"name":"RJ 45 Connector","image":null,"category":{"id":49,"name":"Consumables"},"company":{"id":3,"name":"Uat limited "},"item_no":"","location":{"id":13,"name":"G Floor Mix Section"},"manufacturer":{"id":27,"name":"Kanex"},"min_amt":2,"model_number":"other","remaining":957,"order_number":"2853","purchase_cost":"12,000.00","purchase_date":{"diff_for_human":"6 months ago","date":"2022-04-04","formatted":"04 Apr, 2022"},"qty":974,"notes":null,"created_at":{"diff_for_human":"2 months ago","datetime":"2022-07-27 10:16:15","formatted":"27 Jul, 2022 10:16AM"},"updated_at":{"diff_for_human":"23 hours ago","datetime":"2022-10-06 05:38:22","formatted":"06 Oct, 2022 5:38AM"},"user_can_checkout":true,"available_actions":{"checkout":true,"checkin":true,"update":true,"delete":true}}]

Consumables consumablesFromJson(String str) => Consumables.fromJson(json.decode(str));
String consumablesToJson(Consumables data) => json.encode(data.toJson());
class Consumables {
  Consumables({
      num? total, 
      List<ConsumablesData>? rows,}){
    _total = total;
    _rows = rows;
}

  Consumables.fromJson(dynamic json) {
    _total = json['total'];
    if (json['rows'] != null) {
      _rows = [];
      json['rows'].forEach((v) {
        _rows?.add(ConsumablesData.fromJson(v));
      });
    }
  }
  num? _total;
  List<ConsumablesData>? _rows;
Consumables copyWith({  num? total,
  List<ConsumablesData>? rows,
}) => Consumables(  total: total ?? _total,
  rows: rows ?? _rows,
);
  num? get total => _total;
  List<ConsumablesData>? get rows => _rows;

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
/// name : "RJ 45 Connector"
/// image : null
/// category : {"id":49,"name":"Consumables"}
/// company : {"id":3,"name":"Uat limited "}
/// item_no : ""
/// location : {"id":13,"name":"G Floor Mix Section"}
/// manufacturer : {"id":27,"name":"Kanex"}
/// min_amt : 2
/// model_number : "other"
/// remaining : 957
/// order_number : "2853"
/// purchase_cost : "12,000.00"
/// purchase_date : {"diff_for_human":"6 months ago","date":"2022-04-04","formatted":"04 Apr, 2022"}
/// qty : 974
/// notes : null
/// created_at : {"diff_for_human":"2 months ago","datetime":"2022-07-27 10:16:15","formatted":"27 Jul, 2022 10:16AM"}
/// updated_at : {"diff_for_human":"23 hours ago","datetime":"2022-10-06 05:38:22","formatted":"06 Oct, 2022 5:38AM"}
/// user_can_checkout : true
/// available_actions : {"checkout":true,"checkin":true,"update":true,"delete":true}

ConsumablesData rowsFromJson(String str) => ConsumablesData.fromJson(json.decode(str));
String rowsToJson(ConsumablesData data) => json.encode(data.toJson());
class ConsumablesData {
  ConsumablesData({
      num? id, 
      String? name, 
      dynamic image, 
      Category? category, 
      Company? company, 
      String? itemNo, 
      Location? location, 
      Manufacturer? manufacturer, 
      num? minAmt, 
      String? modelNumber, 
      num? remaining, 
      String? orderNumber, 
      String? purchaseCost, 
      PurchaseDate? purchaseDate, 
      num? qty, 
      dynamic notes, 
      CreatedAt? createdAt, 
      UpdatedAt? updatedAt, 
      bool? userCanCheckout, 
      AvailableActions? availableActions,}){
    _id = id;
    _name = name;
    _image = image;
    _category = category;
    _company = company;
    _itemNo = itemNo;
    _location = location;
    _manufacturer = manufacturer;
    _minAmt = minAmt;
    _modelNumber = modelNumber;
    _remaining = remaining;
    _orderNumber = orderNumber;
    _purchaseCost = purchaseCost;
    _purchaseDate = purchaseDate;
    _qty = qty;
    _notes = notes;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userCanCheckout = userCanCheckout;
    _availableActions = availableActions;
}

  ConsumablesData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
    _company = json['company'] != null ? Company.fromJson(json['company']) : null;
    _itemNo = json['item_no'];
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _manufacturer = json['manufacturer'] != null ? Manufacturer.fromJson(json['manufacturer']) : null;
    _minAmt = json['min_amt'];
    _modelNumber = json['model_number'];
    _remaining = json['remaining'];
    _orderNumber = json['order_number'];
    _purchaseCost = json['purchase_cost'];
    _purchaseDate = json['purchase_date'] != null ? PurchaseDate.fromJson(json['purchase_date']) : null;
    _qty = json['qty'];
    _notes = json['notes'];
    _createdAt = json['created_at'] != null ? CreatedAt.fromJson(json['created_at']) : null;
    _updatedAt = json['updated_at'] != null ? UpdatedAt.fromJson(json['updated_at']) : null;
    _userCanCheckout = json['user_can_checkout'];
    _availableActions = json['available_actions'] != null ? AvailableActions.fromJson(json['available_actions']) : null;
  }
  num? _id;
  String? _name;
  dynamic _image;
  Category? _category;
  Company? _company;
  String? _itemNo;
  Location? _location;
  Manufacturer? _manufacturer;
  num? _minAmt;
  String? _modelNumber;
  num? _remaining;
  String? _orderNumber;
  String? _purchaseCost;
  PurchaseDate? _purchaseDate;
  num? _qty;
  dynamic _notes;
  CreatedAt? _createdAt;
  UpdatedAt? _updatedAt;
  bool? _userCanCheckout;
  AvailableActions? _availableActions;
  ConsumablesData copyWith({  num? id,
  String? name,
  dynamic image,
  Category? category,
  Company? company,
  String? itemNo,
  Location? location,
  Manufacturer? manufacturer,
  num? minAmt,
  String? modelNumber,
  num? remaining,
  String? orderNumber,
  String? purchaseCost,
  PurchaseDate? purchaseDate,
  num? qty,
  dynamic notes,
  CreatedAt? createdAt,
  UpdatedAt? updatedAt,
  bool? userCanCheckout,
  AvailableActions? availableActions,
}) => ConsumablesData(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  category: category ?? _category,
  company: company ?? _company,
  itemNo: itemNo ?? _itemNo,
  location: location ?? _location,
  manufacturer: manufacturer ?? _manufacturer,
  minAmt: minAmt ?? _minAmt,
  modelNumber: modelNumber ?? _modelNumber,
  remaining: remaining ?? _remaining,
  orderNumber: orderNumber ?? _orderNumber,
  purchaseCost: purchaseCost ?? _purchaseCost,
  purchaseDate: purchaseDate ?? _purchaseDate,
  qty: qty ?? _qty,
  notes: notes ?? _notes,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  userCanCheckout: userCanCheckout ?? _userCanCheckout,
  availableActions: availableActions ?? _availableActions,
);
  num? get id => _id;
  String? get name => _name;
  dynamic get image => _image;
  Category? get category => _category;
  Company? get company => _company;
  String? get itemNo => _itemNo;
  Location? get location => _location;
  Manufacturer? get manufacturer => _manufacturer;
  num? get minAmt => _minAmt;
  String? get modelNumber => _modelNumber;
  num? get remaining => _remaining;
  String? get orderNumber => _orderNumber;
  String? get purchaseCost => _purchaseCost;
  PurchaseDate? get purchaseDate => _purchaseDate;
  num? get qty => _qty;
  dynamic get notes => _notes;
  CreatedAt? get createdAt => _createdAt;
  UpdatedAt? get updatedAt => _updatedAt;
  bool? get userCanCheckout => _userCanCheckout;
  AvailableActions? get availableActions => _availableActions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    if (_company != null) {
      map['company'] = _company?.toJson();
    }
    map['item_no'] = _itemNo;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    if (_manufacturer != null) {
      map['manufacturer'] = _manufacturer?.toJson();
    }
    map['min_amt'] = _minAmt;
    map['model_number'] = _modelNumber;
    map['remaining'] = _remaining;
    map['order_number'] = _orderNumber;
    map['purchase_cost'] = _purchaseCost;
    if (_purchaseDate != null) {
      map['purchase_date'] = _purchaseDate?.toJson();
    }
    map['qty'] = _qty;
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

/// diff_for_human : "23 hours ago"
/// datetime : "2022-10-06 05:38:22"
/// formatted : "06 Oct, 2022 5:38AM"

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
/// datetime : "2022-07-27 10:16:15"
/// formatted : "27 Jul, 2022 10:16AM"

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

/// diff_for_human : "6 months ago"
/// date : "2022-04-04"
/// formatted : "04 Apr, 2022"

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

/// id : 13
/// name : "G Floor Mix Section"

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

/// id : 49
/// name : "Consumables"

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