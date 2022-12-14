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
  upIconCilck({required int index}) {
    QueryDocumentSnapshot<Object?> docId =
        collectionState!.docs[index]; // dox id

    var item = listDocument![index];
    if (item.isDownCLicked) {
      item.isDownCLicked = false;
      item.downColor = Colors.grey;
      item.downVote = item.downVote! - 1;
      FirebaseFirestore.instance
          .collection('naseha')
          .doc(docId.id)
          .update({'downVote': item.downVote}).then((value) {
        emit(DownVoteUdatedSuccess());
      }).catchError((error) {
        emit(DownVoteUdatedError());
        log(error.toString());
      });
    }
    item.isUpCLicked = !item.isUpCLicked;

    item.isUpCLicked
        ? item.upVote = item.upVote! + 1
        : item.upVote = item.upVote! - 1;

    item.isUpCLicked ? item.upColor = Colors.black : item.upColor = Colors.grey;
    emit(UpIconClickState());

    // udate firebase

    FirebaseFirestore.instance
        .collection('naseha')
        .doc(docId.id)
        .update({'upVote': item.upVote}).then((value) {
      emit(UpVoteUdatedSuccess());
    }).catchError((error) {
      emit(UpVoteUdatedError());
      log(error.toString());
    });
  }

  downIconCilck({required int index}) {
    QueryDocumentSnapshot<Object?> docId =
        collectionState!.docs[index]; // dox id
    var item = listDocument![index];
    if (item.isUpCLicked) {
      item.isUpCLicked = false;
      item.upColor = Colors.grey;
      item.upVote = item.upVote! - 1;
      FirebaseFirestore.instance
          .collection('naseha')
          .doc(docId.id)
          .update({'upVote': item.upVote}).then((value) {
        emit(UpVoteUdatedSuccess());
      }).catchError((error) {
        emit(UpVoteUdatedError());
        log(error.toString());
      });
    }
    item.isDownCLicked = !item.isDownCLicked;

    item.isDownCLicked
        ? item.downVote = item.downVote! + 1
        : item.downVote = item.downVote! - 1;

    item.isDownCLicked
        ? item.downColor = Colors.black
        : item.downColor = Colors.grey;
    emit(DownIconClickStete());

    // udate firebase

    FirebaseFirestore.instance
        .collection('naseha')
        .doc(docId.id)
        .update({'downVote': item.downVote}).then((value) {
      emit(DownVoteUdatedSuccess());
    }).catchError((error) {
      emit(DownVoteUdatedError());
      log(error.toString());
    });
  }
}
