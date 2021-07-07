abstract class BaseModel {
  String collection;
  BaseModel({required this.collection});

  factory BaseModel.fromMap(Map<String, dynamic> map) {
    throw "NOT IMPLEMETED";
  }

  Map<String, dynamic> toMap();
}
