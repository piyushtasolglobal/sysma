import 'dart:convert';
/// results : [{"id":283,"text":" 4th Floor Left","image":null},{"id":282,"text":" 4th Floor Right","image":null},{"id":219,"text":" Air Compresser Out Side","image":null},{"id":84,"text":" Ambulance","image":null},{"id":126,"text":" Analitical Research Lab","image":null},{"id":22,"text":" Animal House","image":null},{"id":197,"text":" Animal House out Side","image":null},{"id":269,"text":" Animal Procedure Room no 6 (GF)","image":null},{"id":270,"text":" Animal Procedure Room no 7 (GF)","image":null},{"id":161,"text":" Animal Procedure Room no. 6 (Ground Floor)","image":null},{"id":162,"text":" Animal Procedure Room no. 7 (Ground Floor)","image":null},{"id":94,"text":" Anti Room-5 (B-32)","image":null},{"id":3,"text":" Archieve Room","image":null},{"id":24,"text":" Archieve Room-ARF","image":null},{"id":128,"text":" Archieve Room-Primet","image":null},{"id":23,"text":" ARF","image":null},{"id":88,"text":" ARF (Mutagenicity)","image":null},{"id":76,"text":" ARF Basement","image":null},{"id":11,"text":" Auditorium","image":null},{"id":61,"text":" B.M.S","image":null},{"id":157,"text":" B/H Lab.","image":null},{"id":140,"text":" BF-1 Facility","image":null},{"id":257,"text":" Bio analytical area (GF)","image":null},{"id":148,"text":" Bio analytical area (Ground Floor)","image":null},{"id":184,"text":" Bio Medical Waste Storage","image":null},{"id":7,"text":" Bio-analytical Research","image":null},{"id":142,"text":" Bioassay Lab","image":null},{"id":82,"text":" Biotech S/F","image":null},{"id":243,"text":" Biotech SF","image":null},{"id":183,"text":" Boiler Front Side","image":null},{"id":14,"text":" BTAR","image":null},{"id":106,"text":" Cage Storage - 1","image":null},{"id":68,"text":" Canteen","image":null},{"id":196,"text":" Canteen  Garden","image":null},{"id":195,"text":" Canteen Out Side","image":null},{"id":6,"text":" Cell Biology","image":null},{"id":258,"text":" Cell Biology & Clone Development Lab area(GF)","image":null},{"id":149,"text":" Cell Biology & Clone Development Lab area(Ground Floor)","image":null},{"id":62,"text":" Central AC","image":null},{"id":264,"text":" Chagne Room (GF)","image":null},{"id":155,"text":" Chagne Room (Ground Floor)","image":null},{"id":80,"text":" Clinical","image":null},{"id":136,"text":" Clinical Pathology Laboratory","image":null},{"id":198,"text":" Clinical Pethology Lab.","image":null},{"id":1,"text":" Clinical Research","image":null},{"id":19,"text":" CMC","image":null},{"id":203,"text":" CMC 1st Floor","image":null},{"id":202,"text":" CMC 2nd Floor","image":null},{"id":201,"text":" CMC 3rd Floor","image":null},{"id":86,"text":" CMC 3rd Floor Medchem","image":null},{"id":87,"text":" CMC 4'rth Floor Medchem","image":null},{"id":200,"text":" CMC 4th Floor","image":null},{"id":122,"text":" CMC 4th Floor Medchem","image":null},{"id":288,"text":" CMC FF","image":null},{"id":289,"text":" CMC GF","image":null},{"id":204,"text":" CMC Ground Floor","image":null},{"id":193,"text":" CMC Out Side","image":null},{"id":287,"text":" CMC SF","image":null},{"id":286,"text":" CMC TF","image":null},{"id":244,"text":" CMC TF Medchem","image":null},{"id":26,"text":" CMC-In passage","image":null},{"id":114,"text":" Corridor","image":null},{"id":267,"text":" Corridor (FF)","image":null},{"id":159,"text":" Corridor (First Floor)","image":null},{"id":266,"text":" Corridor (GF)","image":null},{"id":158,"text":" Corridor (Ground Floor)","image":null},{"id":160,"text":" Corridor (Second Floor)","image":null},{"id":268,"text":" Corridor (SF)","image":null},{"id":95,"text":" Corridor near  coffee room","image":null},{"id":73,"text":" CPL","image":null},{"id":121,"text":" CPL Lab","image":null},{"id":248,"text":" CPL Lab (GF)","image":null},{"id":132,"text":" CPL Lab (Ground Floor)","image":null},{"id":186,"text":" Creche Area","image":null},{"id":112,"text":" DCL","image":null},{"id":111,"text":" DCL Corridor Area.","image":null},{"id":110,"text":" Dirty Cage Loding Area","image":null},{"id":98,"text":" Dirty Cage Loding Area Corridor","image":null},{"id":5,"text":" Discovery DMPK","image":null},{"id":199,"text":" Distributor","image":null},{"id":189,"text":" Distributor  Entry Gate","image":null},{"id":16,"text":" DMPK","image":null},{"id":260,"text":" DMPK (FF)","image":null},{"id":151,"text":" DMPK (First Floor)","image":null},{"id":92,"text":" DMPK Corridor-3","image":null},{"id":53,"text":" Dog House","image":null},{"id":187,"text":" Dog House Back Side","image":null},{"id":129,"text":" EHS Store","image":null},{"id":101,"text":" Electrical Laboratory","image":null},{"id":182,"text":" Eletrical Back Side","image":null},{"id":137,"text":" Engineering","image":null},{"id":71,"text":" ETP","image":null},{"id":97,"text":" Exprimental Animal Room Area","image":null},{"id":43,"text":" F/F Out Passage","image":null},{"id":37,"text":" F/F-Lab-1","image":null},{"id":38,"text":" F/F-Lab-2","image":null},{"id":39,"text":" F/F-Lab-3","image":null},{"id":40,"text":" F/F-Lab-4","image":null},{"id":41,"text":" F/F-Lab-5","image":null},{"id":42,"text":" F/F-Lab-6","image":null},{"id":13,"text":" Fermentation","image":null},{"id":261,"text":" Fermentation (FF)","image":null},{"id":152,"text":" Fermentation (First Floor)","image":null},{"id":153,"text":" Fermentation Lab (Second Floor)","image":null},{"id":262,"text":" Fermentation Lab (SF)","image":null},{"id":125,"text":" Fermentation Plant","image":null},{"id":285,"text":" FF","image":null},{"id":277,"text":" FF Left","image":null},{"id":233,"text":" FF Out Passage","image":null},{"id":276,"text":" FF Right","image":null},{"id":227,"text":" FF-Lab-1","image":null},{"id":228,"text":" FF-Lab-2","image":null},{"id":229,"text":" FF-Lab-3","image":null},{"id":230,"text":" FF-Lab-4","image":null},{"id":231,"text":" FF-Lab-5","image":null},{"id":232,"text":" FF-Lab-6","image":null},{"id":178,"text":" First Floor","image":null},{"id":169,"text":" First Floor Left","image":null},{"id":168,"text":" First Floor Right","image":null},{"id":175,"text":" Fourth Floor Left","image":null},{"id":174,"text":" Fourth Floor Right","image":null},{"id":254,"text":" Front right side corridor(TF)","image":null},{"id":145,"text":" Front right side corridor(Third Floor)","image":null},{"id":255,"text":" Front Sitting Area(4th Floor)","image":null},{"id":146,"text":" Front Sitting Area(Fourth Floor)","image":null},{"id":252,"text":" Front Sitting Area(GF)","image":null},{"id":143,"text":" Front Sitting Area(Ground Floor)","image":null},{"id":144,"text":" Front Sitting Area(Second Floor)","image":null},{"id":253,"text":" Front Sitting Area(SF)","image":null},{"id":33,"text":" G/F-Out Passage","image":null},{"id":58,"text":" Generator Room","image":null},{"id":77,"text":" Genomic Lab","image":null},{"id":83,"text":" Genomics Lab","image":null},{"id":284,"text":" GF","image":null},{"id":275,"text":" GF Left","image":null},{"id":274,"text":" GF Right","image":null},{"id":226,"text":" GF-Out Passage","image":null},{"id":177,"text":" Ground Floor","image":null},{"id":167,"text":" Ground Floor Left","image":null},{"id":166,"text":" Ground Floor Right","image":null},{"id":250,"text":" Health check up room (FF)","image":null},{"id":134,"text":" Health check up room (First Floor)","image":null},{"id":249,"text":" Health check up room (GF)","image":null},{"id":133,"text":" Health check up room (Ground Floor)","image":null},{"id":135,"text":" Health check up room (Second Floor)","image":null},{"id":251,"text":" Health check up room (SF)","image":null},{"id":120,"text":" Histopathology Lab","image":null},{"id":154,"text":" HR/Admin (Second Floor)","image":null},{"id":263,"text":" HR/Admin (SF)","image":null},{"id":30,"text":" In Passage","image":null},{"id":64,"text":" Incinerator","image":null},{"id":79,"text":" IPM","image":null},{"id":96,"text":" Jenitor Room Corridor","image":null},{"id":117,"text":" Kichan(Safe Storage)","image":null},{"id":181,"text":" Lab area","image":null},{"id":27,"text":" Lab-1","image":null},{"id":28,"text":" Lab-2","image":null},{"id":29,"text":" Lab-3","image":null},{"id":31,"text":" Lab-4","image":null},{"id":32,"text":" Lab-5","image":null},{"id":34,"text":" Lab-6","image":null},{"id":35,"text":" Lab-7","image":null},{"id":36,"text":" Lab-8","image":null},{"id":102,"text":" Laboratory","image":null},{"id":116,"text":" Laundry","image":null},{"id":17,"text":" Library","image":null},{"id":259,"text":" Library-Office (FF)","image":null},{"id":150,"text":" Library-Office (First Floor)","image":null},{"id":90,"text":" Lobby (Enternce)","image":null},{"id":59,"text":" LT Panel","image":null},{"id":215,"text":" Main Building 1st Floor","image":null},{"id":218,"text":" Main Building 2nd Floor","image":null},{"id":294,"text":" Main Building FF","image":null},{"id":214,"text":" Main Building Garden Side","image":null},{"id":216,"text":" Main Building Garden Side 1st floor","image":null},{"id":295,"text":" Main Building Garden Side FF","image":null},{"id":296,"text":" Main Building GF","image":null},{"id":217,"text":" Main Building Ground Floor","image":null},{"id":213,"text":" Main Building Out Side","image":null},{"id":297,"text":" Main Building SF","image":null},{"id":65,"text":" Main Gate - 2","image":null},{"id":211,"text":" Maingate Parking","image":null},{"id":54,"text":" Material Entry Gate","image":null},{"id":139,"text":" Material Gate","image":null},{"id":185,"text":" Moduler","image":null},{"id":188,"text":" Monkey House Back Side","image":null},{"id":192,"text":" Monkey House Out Side","image":null},{"id":190,"text":" Monkey House Parking","image":null},{"id":4,"text":" NDDS","image":null},{"id":104,"text":" Necroscopy corrider","image":null},{"id":81,"text":" New Biotech lab","image":null},{"id":89,"text":" New HR Office S/F","image":null},{"id":245,"text":" New HR Office SF","image":null},{"id":20,"text":" NPR & MABS","image":null},{"id":118,"text":" Nr' Staire","image":null},{"id":246,"text":" Office (GF)","image":null},{"id":165,"text":" Office (Second Floor)","image":null},{"id":273,"text":" Office (SF)","image":null},{"id":115,"text":" Office CCtv Contol Room","image":null},{"id":63,"text":" Oil Tank","image":null},{"id":75,"text":" Old Animal House","image":null},{"id":109,"text":" Operation Theater","image":null},{"id":99,"text":" Operation Theater Corridor","image":null},{"id":176,"text":" Outside","image":null},{"id":100,"text":" Outside Laboratory","image":null},{"id":55,"text":" Panel Room-1","image":null},{"id":57,"text":" Panel Room-2","image":null},{"id":119,"text":" Passage","image":null},{"id":224,"text":" Passage FF","image":null},{"id":225,"text":" Passage SF","image":null},{"id":9,"text":" Passage-1 Genomics","image":null},{"id":10,"text":" Passage-2 Genomics","image":null},{"id":12,"text":" Passage-3","image":null},{"id":105,"text":" Pelleted Feed Store","image":null},{"id":15,"text":" Pharmacology","image":null},{"id":85,"text":" Pilot Fermentation Plant","image":null},{"id":208,"text":" Pilot FMBT 1st Floor","image":null},{"id":209,"text":" Pilot FMBT 2nd Floor","image":null},{"id":292,"text":" Pilot FMBT FF","image":null},{"id":291,"text":" Pilot FMBT GF","image":null},{"id":207,"text":" Pilot FMBT Ground Floor","image":null},{"id":210,"text":" Pilot FMBT Out Side","image":null},{"id":293,"text":" Pilot FMBT SF","image":null},{"id":25,"text":" Pilot Plant","image":null},{"id":206,"text":" Pilot Plant Back Side","image":null},{"id":194,"text":" Pilot Plant Out Side","image":null},{"id":141,"text":" President Area","image":null},{"id":2,"text":" President Office","image":null},{"id":220,"text":" PRF F/F","image":null},{"id":298,"text":" PRF FF","image":null},{"id":221,"text":" PRF G/F","image":null},{"id":290,"text":" PRF GF","image":null},{"id":205,"text":" PRF Ground Floor","image":null},{"id":222,"text":" PRF S/F","image":null},{"id":299,"text":" PRF SF","image":null},{"id":127,"text":" Protein Characterization lab","image":null},{"id":8,"text":" Protein Purification","image":null},{"id":265,"text":" Q.C. Lab (FF)","image":null},{"id":156,"text":" Q.C. Lab (First Floor)","image":null},{"id":72,"text":" QA","image":null},{"id":180,"text":" Quarantine room","image":null},{"id":256,"text":" Reception Area (GF)","image":null},{"id":147,"text":" Reception Area (Ground Floor)","image":null},{"id":51,"text":" S/F","image":null},{"id":46,"text":" S/F –Lab-2","image":null},{"id":47,"text":" S/F –Lab-3","image":null},{"id":48,"text":" S/F –Lab-4","image":null},{"id":49,"text":" S/F –Lab-5","image":null},{"id":50,"text":" S/F –Lab-6","image":null},{"id":52,"text":" S/F Out Passage","image":null},{"id":44,"text":" S/F-Lab-1","image":null},{"id":45,"text":" S/F-Lab-2","image":null},{"id":69,"text":" Safe Storage","image":null},{"id":91,"text":" Sample Preparation","image":null},{"id":107,"text":" Santization Area","image":null},{"id":212,"text":" Screening Area Out Side","image":null},{"id":179,"text":" Second Floor","image":null},{"id":171,"text":" Second Floor Left","image":null},{"id":170,"text":" Second Floor Right","image":null},{"id":138,"text":" Security Gate","image":null},{"id":241,"text":" SF","image":null},{"id":236,"text":" SF –Lab-2","image":null},{"id":237,"text":" SF –Lab-3","image":null},{"id":238,"text":" SF –Lab-4","image":null},{"id":239,"text":" SF –Lab-5","image":null},{"id":240,"text":" SF –Lab-6","image":null},{"id":279,"text":" SF Left","image":null},{"id":242,"text":" SF Out Passage","image":null},{"id":278,"text":" SF Right","image":null},{"id":234,"text":" SF-Lab-1","image":null},{"id":235,"text":" SF-Lab-2","image":null},{"id":74,"text":" Store","image":null},{"id":103,"text":" Store for Insolation Ward Corridor","image":null},{"id":191,"text":" Store Out Side","image":null},{"id":223,"text":" STORE SIDE","image":null},{"id":66,"text":" Stores","image":null},{"id":123,"text":" Tank Farm","image":null},{"id":93,"text":" Telemetry Control Room","image":null},{"id":280,"text":" TF Left","image":null},{"id":281,"text":" TF Right","image":null},{"id":172,"text":" Third Floor Left","image":null},{"id":173,"text":" Third Floor Right","image":null},{"id":271,"text":" Toxicology -Histopathology lab (GF)","image":null},{"id":163,"text":" Toxicology -Histopathology lab (Ground Floor)","image":null},{"id":247,"text":" Toxicology Lab Area (GF)","image":null},{"id":131,"text":" Toxicology Lab Area (Ground Floor)","image":null},{"id":272,"text":" Toxicology-Scientist Room(FF)","image":null},{"id":164,"text":" Toxicology-Scientist Room(First Floor)","image":null},{"id":108,"text":" Treat Store","image":null},{"id":78,"text":" VTC","image":null},{"id":67,"text":" VTC Passage Areia","image":null},{"id":124,"text":" Waste Solvent Shed","image":null},{"id":56,"text":" Water Room","image":null},{"id":60,"text":" Work Shop","image":null},{"id":113,"text":" Work Shop & Store","image":null},{"id":70,"text":" Worker Canteen","image":null}]
/// pagination : {"more":false,"per_page":500}
/// total_count : 296
/// page : 1
/// page_count : 1

LocationModel locationModelFromJson(String str) => LocationModel.fromJson(json.decode(str));
String locationModelToJson(LocationModel data) => json.encode(data.toJson());
class LocationModel {
  LocationModel({
      List<LocationData>? results,
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

  LocationModel.fromJson(dynamic json) {
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(LocationData.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    _totalCount = json['total_count'];
    _page = json['page'];
    _pageCount = json['page_count'];
  }
  List<LocationData>? _results;
  Pagination? _pagination;
  num? _totalCount;
  num? _page;
  num? _pageCount;
LocationModel copyWith({  List<LocationData>? results,
  Pagination? pagination,
  num? totalCount,
  num? page,
  num? pageCount,
}) => LocationModel(  results: results ?? _results,
  pagination: pagination ?? _pagination,
  totalCount: totalCount ?? _totalCount,
  page: page ?? _page,
  pageCount: pageCount ?? _pageCount,
);
  List<LocationData>? get results => _results;
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
/// per_page : 500

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

/// id : 283
/// text : " 4th Floor Left"
/// image : null

LocationData resultsFromJson(String str) => LocationData.fromJson(json.decode(str));
String resultsToJson(LocationData data) => json.encode(data.toJson());
class LocationData {
  LocationData({
      num? id, 
      String? text, 
      dynamic image,}){
    _id = id;
    _text = text;
    _image = image;
}

  LocationData.fromJson(dynamic json) {
    _id = json['id'];
    _text = json['text'];
    _image = json['image'];
  }
  num? _id;
  String? _text;
  dynamic _image;
LocationData copyWith({  num? id,
  String? text,
  dynamic image,
}) => LocationData(  id: id ?? _id,
  text: text ?? _text,
  image: image ?? _image,
);
  num? get id => _id;
  String? get text => _text;
  dynamic get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['text'] = _text;
    map['image'] = _image;
    return map;
  }

}