part of 'naseha_cubit.dart';

@immutable
abstract class NasehaState {}

class NasehaInitial extends NasehaState {}

class AddTagState extends NasehaState {}

class AddNasehaLoading extends NasehaState {}

class AddNasehaSuccess extends NasehaState {}

class GetNasehaLoading extends NasehaState {}

class GetNasehaSuccess extends NasehaState {}

class GetNasehaEmpty extends NasehaState {}

class GetNasehaError extends NasehaState {}

class GetMoreNasehaLoading extends NasehaState {}

class GetMoreNasehaSuccess extends NasehaState {}

class GetMoreNasehaError extends NasehaState {}

class HasNotMoreNaseha extends NasehaState {}

class UpIconClickState extends NasehaState {}
