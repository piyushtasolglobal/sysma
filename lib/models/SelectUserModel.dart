import 'dart:convert';
/// results : [{"id":1,"text":"Jangir, Rakesh (admin.zrc)","image":"//gravatar.com/avatar/d193a452915a77f51d1267c82ff78952"},{"id":3,"text":"Tanna, Goonjan (GoonjanTanna)","image":"//gravatar.com/avatar/6a7c526cc7fc8c30f94a8389b5f6f5a6"},{"id":2,"text":"Vyas, Kamlesh (Kamlesh)","image":"http://zrcuat.sysmatech.com/public/img/default-sm.png"}]
/// pagination : {"more":false,"per_page":50}
/// total_count : 3
/// page : 1
/// page_count : 1

SelectUserModel selectUserModelFromJson(String str) => SelectUserModel.fromJson(json.decode(str));
String selectUserModelToJson(SelectUserModel data) => json.encode(data.toJson());
class SelectUserModel {
  SelectUserModel({
      List<UserData>? results,
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

  SelectUserModel.fromJson(dynamic json) {
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(UserData.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    _totalCount = json['total_count'];
    _page = json['page'];
    _pageCount = json['page_count'];
  }
  List<UserData>? _results;
  Pagination? _pagination;
  num? _totalCount;
  num? _page;
  num? _pageCount;
SelectUserModel copyWith({  List<UserData>? results,
  Pagination? pagination,
  num? totalCount,
  num? page,
  num? pageCount,
}) => SelectUserModel(  results: results ?? _results,
  pagination: pagination ?? _pagination,
  totalCount: totalCount ?? _totalCount,
  page: page ?? _page,
  pageCount: pageCount ?? _pageCount,
);
  List<UserData>? get results => _results;
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

/// more : false
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

/// id : 1
/// text : "Jangir, Rakesh (admin.zrc)"
/// image : "//gravatar.com/avatar/d193a452915a77f51d1267c82ff78952"

UserData resultsFromJson(String str) => UserData.fromJson(json.decode(str));
String resultsToJson(UserData data) => json.encode(data.toJson());
class UserData {
  UserData({
      num? id, 
      String? text, 
      String? image,}){
    _id = id;
    _text = text;
    _image = image;
}

  UserData.fromJson(dynamic json) {
    _id = json['id'];
    _text = json['text'];
    _image = json['image'];
  }
  num? _id;
  String? _text;
  String? _image;
UserData copyWith({  num? id,
  String? text,
  String? image,
}) => UserData(  id: id ?? _id,
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