import 'dart:convert';
/// results : [{"id":6,"text":"Fire Ext/ABC/6KG/President Office/8281 (ZRC/6) - ABC → Rakesh Jangir(pending)","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-RmIh79v0ts.jpg"},{"id":26,"text":"Fire Ext/ABC/6KG/Bio-analytical Research/264 (ZRC/26) - ABC → Kamlesh Vyas(pending)","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-RmIh79v0ts.jpg"},{"id":654,"text":" (ZRC/654) - SS(pending)","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-vTuX4VlSIf.jpg"},{"id":655,"text":" (ZRC/655) - SS(pending)","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-vTuX4VlSIf.jpg"},{"id":657,"text":"Safety Shower /GF/ZRC/657 (ZRC/657) - SS → Rakesh Jangir(pending)","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-vTuX4VlSIf.jpg"},{"id":658,"text":" (ZRC/658) - SS(pending)","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-vTuX4VlSIf.jpg"},{"id":803,"text":" (ZRC/803) - HR(pending)","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-kve5czrZzn.webp"},{"id":814,"text":" (00814) - ABC(pending)","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-qgypEislx1.jpg"},{"id":1,"text":"Fire Ext/ABC/4KG/Clinical Research/2733 (ZRC/1) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-OQNhALND4a.jpg"},{"id":2,"text":"Fire Ext/ABC/4KG/Clinical Research/10685 (ZRC/2) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-OQNhALND4a.jpg"},{"id":3,"text":"Fire Ext/ABC/4KG/Clinical Research/10671 (ZRC/3) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-OQNhALND4a.jpg"},{"id":4,"text":"Fire Ext/ABC/4KG/Clinical Research/10715 (ZRC/4) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-OQNhALND4a.jpg"},{"id":5,"text":"Fire Ext/ABC/4KG/Clinical Research/10428 (ZRC/5) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-OQNhALND4a.jpg"},{"id":7,"text":"Fire Ext/ABC/6KG/Archieve Room/0 (ZRC/7) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-RmIh79v0ts.jpg"},{"id":8,"text":"Fire Ext/ABC/2KG/President Office/209 (ZRC/8) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-qgypEislx1.jpg"},{"id":9,"text":"Fire Ext/ABC/2KG/President Office/200 (ZRC/9) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-qgypEislx1.jpg"},{"id":10,"text":"Fire Ext/ABC/2KG/President Office/179 (ZRC/10) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-qgypEislx1.jpg"},{"id":11,"text":"Fire Ext/ABC/2KG/President Office/180 (ZRC/11) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-qgypEislx1.jpg"},{"id":12,"text":"Fire Ext/ABC/6KG/NDDS/26466 (ZRC/12) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-RmIh79v0ts.jpg"},{"id":13,"text":"Fire Ext/ABC/4KG/NDDS/10676 (ZRC/13) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-OQNhALND4a.jpg"},{"id":14,"text":"Fire Ext/ABC/4KG/NDDS/10418 (ZRC/14) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-OQNhALND4a.jpg"},{"id":15,"text":"Fire Ext/ABC/2KG/NDDS/187 (ZRC/15) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-qgypEislx1.jpg"},{"id":16,"text":"Fire Ext/CA/2KG/Discovery DMPK/11580 (ZRC/16) - CA","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-Lucq7tMOXt.jpg"},{"id":17,"text":"Fire Ext/CA/2KG/Discovery DMPK/11534 (ZRC/17) - CA","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-Lucq7tMOXt.jpg"},{"id":18,"text":"Fire Ext/CA/2KG/Discovery DMPK/12181 (ZRC/18) - CA","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-Lucq7tMOXt.jpg"},{"id":19,"text":"Fire Ext/CA/2KG/Discovery DMPK/11524 (ZRC/19) - CA","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-Lucq7tMOXt.jpg"},{"id":20,"text":"Fire Ext/CO2/4.5KG/Discovery DMPK/5283 (ZRC/20) - CO2","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-jHrn9GJ6Jc.jpg"},{"id":21,"text":"Fire Ext/ABC/6KG/Cell Biology/8266 (ZRC/21) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-RmIh79v0ts.jpg"},{"id":22,"text":"Fire Ext/ABC/2KG/Cell Biology/0 (ZRC/22) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-qgypEislx1.jpg"},{"id":23,"text":"Fire Ext/ABC/6KG/Cell Biology/1006 (ZRC/23) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-RmIh79v0ts.jpg"},{"id":24,"text":"Fire Ext/ABC/4KG/Cell Biology/10403 (ZRC/24) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-OQNhALND4a.jpg"},{"id":25,"text":"Fire Ext/ABC/2KG/Cell Biology/188 (ZRC/25) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-qgypEislx1.jpg"},{"id":27,"text":"Fire Ext/ABC/4KG/Bio-analytical Research/10397 (ZRC/27) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-OQNhALND4a.jpg"},{"id":28,"text":"Fire Ext/ABC/4KG/Bio-analytical Research/10409 (ZRC/28) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-OQNhALND4a.jpg"},{"id":29,"text":"Fire Ext/CO2/4.5KG/Bio-analytical Research/5288 (ZRC/29) - CO2","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-jHrn9GJ6Jc.jpg"},{"id":30,"text":"Fire Ext/ABC/6KG/Protein Purification/8270 (ZRC/30) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-RmIh79v0ts.jpg"},{"id":31,"text":"Fire Ext/ABC/6KG/Protein Purification/965 (ZRC/31) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-RmIh79v0ts.jpg"},{"id":32,"text":"Fire Ext/ABC/6KG/Protein Purification/942 (ZRC/32) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-RmIh79v0ts.jpg"},{"id":33,"text":"Fire Ext/ABC/2KG/Protein Purification/3325 (ZRC/33) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-qgypEislx1.jpg"},{"id":34,"text":"Fire Ext/ABC/6KG/Passage-1 Genomics/8267 (ZRC/34) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-RmIh79v0ts.jpg"},{"id":35,"text":"Fire Ext/ABC/6KG/Passage-1 Genomics/1005 (ZRC/35) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-RmIh79v0ts.jpg"},{"id":36,"text":"Fire Ext/ABC/6KG/Passage-1 Genomics/182 (ZRC/36) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-RmIh79v0ts.jpg"},{"id":37,"text":"Fire Ext/ABC/2KG/Passage-1 Genomics/944 (ZRC/37) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-qgypEislx1.jpg"},{"id":38,"text":"Fire Ext/ABC/4KG/Passage-1 Genomics/10677 (ZRC/38) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-OQNhALND4a.jpg"},{"id":39,"text":"Fire Ext/CO2/4.5KG/Passage-2 Genomics/5318 (ZRC/39) - CO2","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-jHrn9GJ6Jc.jpg"},{"id":40,"text":"Fire Ext/CO2/3KG/Passage-2 Genomics/32 (ZRC/40) - CO2","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-Q5rJ9KTYRw.jpg"},{"id":41,"text":"Fire Ext/CO2/4.5KG/Passage-2 Genomics/29043 (ZRC/41) - CO2","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-jHrn9GJ6Jc.jpg"},{"id":42,"text":"Fire Ext/ABC/6KG/Passage-2 Genomics/10684 (ZRC/42) - ABC","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-RmIh79v0ts.jpg"},{"id":43,"text":"Fire Ext/CO2/3KG/Auditorium/38 (ZRC/43) - CO2","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-Q5rJ9KTYRw.jpg"},{"id":44,"text":"Fire Ext/CO2/4.5KG/Auditorium/5300 (ZRC/44) - CO2","image":"https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-jHrn9GJ6Jc.jpg"}]
/// pagination : {"more":true,"per_page":50}
/// total_count : 810
/// page : 1
/// page_count : 17

SelectAssetModel selectAssetModelFromJson(String str) => SelectAssetModel.fromJson(json.decode(str));
String selectAssetModelToJson(SelectAssetModel data) => json.encode(data.toJson());
class SelectAssetModel {
  SelectAssetModel({
      List<AssetsData>? results,
      Pagination? pagination, 
      num? totalCount, 
      num? page, 
      num? pageCount,}){
    _results = results;
    _pagination = pagination;
    _totalCount = totalCount;
    _page = page;
    _pageCount = pageCount;
}

  SelectAssetModel.fromJson(dynamic json) {
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(AssetsData.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    _totalCount = json['total_count'];
    _page = json['page'];
    _pageCount = json['page_count'];
  }
  List<AssetsData>? _results;
  Pagination? _pagination;
  num? _totalCount;
  num? _page;
  num? _pageCount;
SelectAssetModel copyWith({  List<AssetsData>? results,
  Pagination? pagination,
  num? totalCount,
  num? page,
  num? pageCount,
}) => SelectAssetModel(  results: results ?? _results,
  pagination: pagination ?? _pagination,
  totalCount: totalCount ?? _totalCount,
  page: page ?? _page,
  pageCount: pageCount ?? _pageCount,
);
  List<AssetsData>? get results => _results;
  Pagination? get pagination => _pagination;
  num? get totalCount => _totalCount;
  num? get page => _page;
  num? get pageCount => _pageCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    map['total_count'] = _totalCount;
    map['page'] = _page;
    map['page_count'] = _pageCount;
    return map;
  }

}

/// more : true
/// per_page : 50

Pagination paginationFromJson(String str) => Pagination.fromJson(json.decode(str));
String paginationToJson(Pagination data) => json.encode(data.toJson());
class Pagination {
  Pagination({
      bool? more, 
      num? perPage,}){
    _more = more;
    _perPage = perPage;
}

  Pagination.fromJson(dynamic json) {
    _more = json['more'];
    _perPage = json['per_page'];
  }
  bool? _more;
  num? _perPage;
Pagination copyWith({  bool? more,
  num? perPage,
}) => Pagination(  more: more ?? _more,
  perPage: perPage ?? _perPage,
);
  bool? get more => _more;
  num? get perPage => _perPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['more'] = _more;
    map['per_page'] = _perPage;
    return map;
  }

}

/// id : 6
/// text : "Fire Ext/ABC/6KG/President Office/8281 (ZRC/6) - ABC → Rakesh Jangir(pending)"
/// image : "https://zrcuat.sysmatech.com/public/uploads/models/assetmodel-image-RmIh79v0ts.jpg"

AssetsData resultsFromJson(String str) => AssetsData.fromJson(json.decode(str));
String resultsToJson(AssetsData data) => json.encode(data.toJson());
class AssetsData {
  AssetsData({
      num? id, 
      String? text, 
      String? image,}){
    _id = id;
    _text = text;
    _image = image;
}

  AssetsData.fromJson(dynamic json) {
    _id = json['id'];
    _text = json['text'];
    _image = json['image'];
  }
  num? _id;
  String? _text;
  String? _image;
AssetsData copyWith({  num? id,
  String? text,
  String? image,
}) => AssetsData(  id: id ?? _id,
  text: text ?? _text,
  image: image ?? _image,
);
  num? get id => _id;
  String? get text => _text;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['text'] = _text;
    map['image'] = _image;
    return map;
  }

}