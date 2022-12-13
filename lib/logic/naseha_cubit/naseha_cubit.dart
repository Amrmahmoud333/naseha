import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:naseha/data/repositories/naseha_repo.dart';

part 'naseha_state.dart';

class NasehaCubit extends Cubit<NasehaState> {
  final NasehaRepo _nasehaRepo;
  NasehaCubit(this._nasehaRepo) : super(NasehaInitial());

  Future<void> addNaseha(
      {required date,
      required posterEmail,
      required text,
      required upVote,
      required downVote,
      required tags}) async {
    emit(AddNasehaLoading());
    int responseCode = await _nasehaRepo.addNaseha(
        date: date,
        posterEmail: posterEmail,
        text: text,
        upVote: upVote,
        downVote: downVote,
        tags: tags);
    if (responseCode == 200) {
      // clear tags

      emit(AddNasehaSuccess());
    }
  }

// naseha text
  String text = "";
  setText(String text) {
    this.text = text;
  }

  // add tags to naseha
  List<String>? tags = [];
  bool numberOfTags = true;
  chooseTags(String tag) {
    if (tags!.contains(tag)) {
      tags!.remove(tag);
      numberOfTags = true;
    } else {
      if (tags!.length < 3) {
        tags!.add(tag);
        numberOfTags = true;
      } else {
        numberOfTags = false;
      }
    }
    emit(AddTagState());
  }

  String? addNewTag;
  setNewTag({required String text}) {
    addNewTag = text;
  }

  bool valid = true;
}
