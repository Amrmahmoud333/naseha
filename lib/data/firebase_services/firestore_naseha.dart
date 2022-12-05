import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naseha/data/models/naseha_model.dart';
import 'package:naseha/data/repositories/naseha_repo.dart';

class FirestoreNaseha extends NasehaRepo {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('naseha');
  @override
  Future<int> addNaseha(
      {required date,
      required posterEmail,
      required text,
      required upVote,
      required downVote,
      required tags}) async {
    int? code;

    DocumentReference documentReference = collection.doc();
    NasehaModel nasehaModel = NasehaModel(
        date: date,
        posterEmail: posterEmail,
        text: text,
        upVote: upVote,
        downVote: downVote,
        tags: tags);
    final data = nasehaModel.toJson();

    await documentReference.set(data).whenComplete(() {
      code = 200;
    }).catchError((error) {
      code = 500;
    });
    return code!;
  }

  @override
  Future<void> deleteNaseha() {
    throw UnimplementedError();
  }

  @override
  Future<void> getNaseha() {
    throw UnimplementedError();
  }
}
