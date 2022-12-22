import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:naseha/data/models/naseha_model.dart';
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

  // get naseha
  List<NasehaModel>? listDocument = [];
  QuerySnapshot? collectionState;
  Future<void> getNaseha() async {
    emit(GetNasehaLoading());
    log('loading');
    try {
      listDocument!.clear();
      var collection =
          FirebaseFirestore.instance.collection('naseha').limit(10);
      await collection.get().then(((value) {
        collectionState = value;
        for (var element in value.docs) {
          listDocument!.add(NasehaModel.fromJson(element.data()));
        }
      }));

      if (listDocument!.isEmpty) {
        emit(GetNasehaEmpty());
      }
      log('success');
      emit(GetNasehaSuccess());
    } catch (e) {
      log('erro');
      emit(GetNasehaError());
    }
  }

  Future<void> getMoreNaseha() async {
    emit(GetMoreNasehaLoading());

    try {
      if (collectionState!.docs.isNotEmpty) {
        QueryDocumentSnapshot<Object?> lastDoc =
            collectionState!.docs[collectionState!.docs.length - 1];

        var collection = FirebaseFirestore.instance
            .collection('naseha')
            .startAfterDocument(lastDoc)
            .limit(10);

        await collection.get().then((value) {
          collectionState = value;

          for (var element in value.docs) {
            listDocument!.add(NasehaModel.fromJson(element.data()));
          }
        });
        emit(GetMoreNasehaSuccess());
      } else {
        emit(HasNotMoreNaseha());
      }
    } catch (e) {
      emit(GetMoreNasehaError());
      log(e.toString());
    }
  }

  // up down logic
  Color upIconColor = Colors.grey;
  Color downIconColor = Colors.grey;
  bool isUpCLicked = false;
  bool isDownClicked = false;
  upIconCilck({required int index}) {
    if (listDocument![index].isDownCLicked) {
      listDocument![index].isDownCLicked = false;
      listDocument![index].downColor = Colors.grey;
    }
    listDocument![index].isUpCLicked = !listDocument![index].isUpCLicked;
    listDocument![index].isUpCLicked
        ? listDocument![index].upColor = Colors.black
        : listDocument![index].upColor = Colors.grey;
    emit(UpIconClickState());
  }

  downIconCilck({required int index}) {
    if (listDocument![index].isUpCLicked) {
      listDocument![index].isUpCLicked = false;
      listDocument![index].upColor = Colors.grey;
    }
    listDocument![index].isDownCLicked = !listDocument![index].isDownCLicked;

    listDocument![index].isDownCLicked
        ? listDocument![index].downColor = Colors.black
        : listDocument![index].downColor = Colors.grey;
    emit(UpIconClickState());
  }
}
