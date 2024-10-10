import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class PostState {}

class PostStateIntit extends PostState {}

class PostStateLoading extends PostState {}

class PostStateLoaded extends PostState {
  final Either<String, QuerySnapshot<Map<String, dynamic>>> posts;

  PostStateLoaded({required this.posts});
}
