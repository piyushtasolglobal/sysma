import 'dart:convert';
/// api_status : 1
/// status_code : 200
/// categorylist : [{"cat_id":41,"cat_name":"Extinguisher"},{"cat_id":42,"cat_name":"Extinguisher- 2"},{"cat_id":43,"cat_name":"ggg"},{"cat_id":44,"cat_name":"Fire Extinguishers"},{"cat_id":45,"cat_name":"quam"},{"cat_id":46,"cat_name":"justo"},{"cat_id":47,"cat_name":"Fire Extinguishers"},{"cat_id":48,"cat_name":"Accessories"},{"cat_id":49,"cat_name":"Consumables"},{"cat_id":50,"cat_name":"License Category"},{"cat_id":51,"cat_name":"License Category 2"},{"cat_id":52,"cat_name":"Fire Hydrant System"},{"cat_id":53,"cat_name":"Clean Agent"},{"cat_id":54,"cat_name":"F Class"},{"cat_id":55,"cat_name":"Achuk"},{"cat_id":56,"cat_name":"Fire Extinguishers NASA"}]
/// modelslist : [{"model_id":64,"model_name":"2 kg ","cat_id":41,"cat_name":"Extinguisher"},{"model_id":65,"model_name":"5 kg","cat_id":41,"cat_name":"Extinguisher"},{"model_id":66,"model_name":"300 HP","cat_id":41,"cat_name":"Extinguisher"},{"model_id":67,"model_name":"4 kg","cat_id":41,"cat_name":"Extinguisher"},{"model_id":68,"model_name":"200 HP","cat_id":41,"cat_name":"Extinguisher"},{"model_id":69,"model_name":"1 kg","cat_id":42,"cat_name":"Extinguisher- 2"},{"model_id":70,"model_name":"500 HP","cat_id":42,"cat_name":"Extinguisher- 2"},{"model_id":71,"model_name":"100 LTR","cat_id":42,"cat_name":"Extinguisher- 2"},{"model_id":72,"model_name":"6 KG","cat_id":42,"cat_name":"Extinguisher- 2"},{"model_id":73,"model_name":"50 RTS","cat_id":42,"cat_name":"Extinguisher- 2"},{"model_id":74,"model_name":"TestDemo","cat_id":45,"cat_name":"quam"},{"model_id":95,"model_name":"Main Fire Pump -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":96,"model_name":"Control Panel -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":97,"model_name":"Pressure Gauge -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":98,"model_name":"Hydrant Valve -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":108,"model_name":"Hose Reel Drum -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":109,"model_name":"Hose Reel Pipe -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":110,"model_name":"Ball Valve -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":111,"model_name":"Shut Off Nozzle -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":112,"model_name":"Hose Box -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":113,"model_name":"RRL Hose Pipe -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":114,"model_name":"Branch Pipe -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":115,"model_name":"MCP -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":116,"model_name":"Hooter -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":117,"model_name":"On/Off Switch -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":118,"model_name":"Alarm Panel -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":119,"model_name":"CO2 -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":120,"model_name":"ABC/DCP -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":121,"model_name":"Butterfly Valve -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":122,"model_name":"Fire Hydrant System -","cat_id":52,"cat_name":"Fire Hydrant System"},{"model_id":123,"model_name":"CO/2  -","cat_id":47,"cat_name":"Fire Extinguishers"},{"model_id":124,"model_name":"Portable Fire Ext - CA - 2 KG","cat_id":56,"cat_name":"Fire Extinguishers NASA"},{"model_id":125,"model_name":"Portable Fire Ext - F Class - 6 Ltr","cat_id":56,"cat_name":"Fire Extinguishers NASA"},{"model_id":126,"model_name":"Portable Fire Ext - Achuk - 6 Ltr","cat_id":56,"cat_name":"Fire Extinguishers NASA"},{"model_id":127,"model_name":"Modular Fire Ext - CA - 350 Grams","cat_id":56,"cat_name":"Fire Extinguishers NASA"},{"model_id":128,"model_name":"Modular Fire Ext - CA - 750 Grams","cat_id":56,"cat_name":"Fire Extinguishers NASA"},{"model_id":129,"model_name":"Trolley Mounted Fire Ext - Achuk - 45 Ltr","cat_id":56,"cat_name":"Fire Extinguishers NASA"},{"model_id":130,"model_name":"Tubing based Suppression System - CA - 2 Kg 5 Mtr","cat_id":56,"cat_name":"Fire Extinguishers NASA"},{"model_id":131,"model_name":"Trolley Mounted Fire Ext - CA - 10 KG","cat_id":56,"cat_name":"Fire Extinguishers NASA"}]

CategoryModels categoryModelsFromJson(String str) => CategoryModels.fromJson(json.decode(str));
String categoryModelsToJson(CategoryModels data) => json.encode(data.toJson());
class CategoryModels {
  CategoryModels({
      num? apiStatus, 
      num? statusCode, 
      List<Categorylist>? categorylist, 
      List<Modelslist>? modelslist,}){
    _apiStatus = apiStatus;
    _statusCode = statusCode;
    _categorylist = categorylist;
    _modelslist = modelslist;
}

  CategoryModels.fromJson(dynamic json) {
    _apiStatus = json['api_status'];
    _statusCode = json['status_code'];
    if (json['categorylist'] != null) {
      _categorylist = [];
      json['categorylist'].forEach((v) {
        _categorylist?.add(Categorylist.fromJson(v));
      });
    }
    if (json['modelslist'] != null) {
      _modelslist = [];
      json['modelslist'].forEach((v) {
        _modelslist?.add(Modelslist.fromJson(v));
      });
    }
  }
  num? _apiStatus;
  num? _statusCode;
  List<Categorylist>? _categorylist;
  List<Modelslist>? _modelslist;
CategoryModels copyWith({  num? apiStatus,
  num? statusCode,
  List<Categorylist>? categorylist,
  List<Modelslist>? modelslist,
}) => CategoryModels(  apiStatus: apiStatus ?? _apiStatus,
  statusCode: statusCode ?? _statusCode,
  categorylist: categorylist ?? _categorylist,
  modelslist: modelslist ?? _modelslist,
);
  num? get apiStatus => _apiStatus;
  num? get statusCode => _statusCode;
  List<Categorylist>? get categorylist => _categorylist;
  List<Modelslist>? get modelslist => _modelslist;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['api_status'] = _apiStatus;
    map['status_code'] = _statusCode;
    if (_categorylist != null) {
      map['categorylist'] = _categorylist?.map((v) => v.toJson()).toList();
    }
    if (_modelslist != null) {
      map['modelslist'] = _modelslist?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// model_id : 64
/// model_name : "2 kg "
/// cat_id : 41
/// cat_name : "Extinguisher"

Modelslist modelslistFromJson(String str) => Modelslist.fromJson(json.decode(str));
String modelslistToJson(Modelslist data) => json.encode(data.toJson());
class Modelslist {
  Modelslist({
      num? modelId, 
      String? modelName, 
      num? catId, 
      String? catName,}){
    _modelId = modelId;
    _modelName = modelName;
    _catId = catId;
    _catName = catName;
}

  Modelslist.fromJson(dynamic json) {
    _modelId = json['model_id'];
    _modelName = json['model_name'];
    _catId = json['cat_id'];
    _catName = json['cat_name'];
  }
  num? _modelId;
  String? _modelName;
  num? _catId;
  String? _catName;
Modelslist copyWith({  num? modelId,
  String? modelName,
  num? catId,
  String? catName,
}) => Modelslist(  modelId: modelId ?? _modelId,
  modelName: modelName ?? _modelName,
  catId: catId ?? _catId,
  catName: catName ?? _catName,
);
  num? get modelId => _modelId;
  String? get modelName => _modelName;
  num? get catId => _catId;
  String? get catName => _catName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['model_id'] = _modelId;
    map['model_name'] = _modelName;
    map['cat_id'] = _catId;
    map['cat_name'] = _catName;
    return map;
  }

}

/// cat_id : 41
/// cat_name : "Extinguisher"

Categorylist categorylistFromJson(String str) => Categorylist.fromJson(json.decode(str));
String categorylistToJson(Categorylist data) => json.encode(data.toJson());
class Categorylist {
  Categorylist({
      num? catId, 
      String? catName,}){
    _catId = catId;
    _catName = catName;
}

  Categorylist.fromJson(dynamic json) {
    _catId = json['cat_id'];
    _catName = json['cat_name'];
  }
  num? _catId;
  String? _catName;
Categorylist copyWith({  num? catId,
  String? catName,
}) => Categorylist(  catId: catId ?? _catId,
  catName: catName ?? _catName,
);
  num? get catId => _catId;
  String? get catName => _catName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cat_id'] = _catId;
    map['cat_name'] = _catName;
    return map;
  }

}