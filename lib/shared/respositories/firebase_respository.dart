import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:split_it/shared/models/base_model.dart';

class FirebaseRespository<T extends BaseModel> {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  Future<String> create(T data) async {
    try {
      final response = await firestore.collection(data.collection).add(
            data.toMap(),
          );
      return response.id;
    } catch (e) {
      throw e;
    }
  }

  update() {}
  get() {}
  delete() {}
  where() {}
  firstWhere() {}
}
