import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wish_i_sent/domain/entity/auth/signin_entity.dart';
import 'package:wish_i_sent/domain/entity/auth/signup_entity.dart';

abstract class AuthService {
  Future<Either<String, String>> signin(UserSignInEntity userSignInEntity);
  Future<Either<String, String>> signup(UserSignupEntity userSignupEntity);
}

class AuthSericeImpl extends AuthService {
  @override
  Future<Either<String, String>> signin(
      UserSignInEntity userSignInEntity) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userSignInEntity.email, password: userSignInEntity.password);
      return const Right('User Succefully Loged in');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'wrong-password') {
        message = 'Wrong password';
      } else if (e.code == 'user-not-found') {
        message = 'User with tha email not found';
      }
      return Left(message);
    }
  }

  @override
  Future<Either<String, String>> signup(
      UserSignupEntity userSignupEntity) async {
    try {
      final UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userSignupEntity.email,
              password: userSignupEntity.password);

      await FirebaseFirestore.instance
          .collection('User')
          .doc(user.user!.uid)
          .set({
        'email': userSignupEntity.email,
        'username': userSignupEntity.username,
      });

      return Right('User Account Successfully Created!');
    } on FirebaseAuthException catch (e) {
      String message = '';
      // Handle Firebase authentication errors
      if (e.code == 'weak-password') {
        message = 'Your password is very weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with this email';
      } else {
        message = 'There was an error';
      }

      return Left(message);
    }
  }
}
