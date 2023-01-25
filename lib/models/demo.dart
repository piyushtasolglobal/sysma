import 'dart:convert';
/// data : ""
/// images : ""
/// assetImage : ""

Demo demoFromJson(String str) => Demo.fromJson(json.decode(str));
String demoToJson(Demo data) => json.encode(data.toJson());
class Demo {
  Demo({
      String? data, 
      String? images, 
      String? assetImage,}){
    _data = data;
    _images = images;
    _assetImage = assetImage;
}

  Demo.fromJson(dynamic json) {
    _data = json['data'];
    _images = json['images'];
    _assetImage = json['assetImage'];
  }
  String? _data;
  String? _images;
  String? _assetImage;
Demo copyWith({  String? data,
  String? images,
  String? assetImage,
}) => Demo(  data: data ?? _data,
  images: images ?? _images,
  assetImage: assetImage ?? _assetImage,
);
  String? get data => _data;
  String? get images => _images;
  String? get assetImage => _assetImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = _data;
    map['images'] = _images;
    map['assetImage'] = _assetImage;
    return map;
  }

}