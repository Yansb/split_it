class BaseModel {
  String collection;
  BaseModel({
    required this.collection,
  });
  Map<String, dynamic> toMap() {
    throw "Not implemented";
  }

  factory BaseModel.fromMap(Map<String, dynamic> map) {
    throw "Not implemented";
  }
}
