import 'package:cloud_firestore/cloud_firestore.dart';

abstract class NasehaRepo {
  Future<int> addNaseha(
      {required date,
      required posterEmail,
      required text,
      required upVote,
      required downVote,
      required tags});
  Stream<QuerySnapshot> getNaseha();
  Stream<QuerySnapshot> getNasehaPage(DocumentSnapshot lastDoc);
  Future<void> deleteNaseha();
}
