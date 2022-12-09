import 'dart:ui';

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
    int responseCode = await _nasehaRepo.addNaseha(
        date: date,
        posterEmail: posterEmail,
        text: text,
        upVote: upVote,
        downVote: downVote,
        tags: tags);
    if (responseCode == 200) {
      print('sccusse');
    }
  }

  String? text;
  setText(String text) {
    this.text = text;
  }

  // add tags to naseha
  int numberOfTags = 0;
  List<String>? tags = [];
  bool choosen = false;

  chooseTags(String tag) {
    choosen = !choosen;
    choosen ? tags!.add(tag) : tags!.remove(tag);
    choosen ? numberOfTags++ : numberOfTags--;

    emit(AddTagState());
  }
}
