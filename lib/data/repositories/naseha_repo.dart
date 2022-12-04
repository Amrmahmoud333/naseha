abstract class NasehaRepo {
  Future<void> addNaseha(
      {required date,
      required posterEmail,
      required text,
      required upVote,
      required downVote,
      required tags});
  Future<void> getNaseha();
  Future<void> deleteNaseha();
}
