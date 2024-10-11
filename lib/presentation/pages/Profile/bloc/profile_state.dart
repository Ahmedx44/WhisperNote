import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class ProfileState {}

class ProfileStateInitial extends ProfileState {}

class ProfileStateLoading extends ProfileState {}

class ProfileStateLoaded extends ProfileState {
  final Future<Either<String, DocumentSnapshot<Map<String, dynamic>>>> user;

  ProfileStateLoaded({required this.user});
}

class ProfileStateError extends ProfileState {}
