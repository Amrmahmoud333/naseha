part of 'naseha_cubit.dart';

@immutable
abstract class NasehaState {}

class NasehaInitial extends NasehaState {}

class AddTagState extends NasehaState {}

class AddNasehaLoading extends NasehaState {}

class AddNasehaSuccess extends NasehaState {}
