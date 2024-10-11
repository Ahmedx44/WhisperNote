import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wish_i_sent/data/model/auth/signin_model.dart';
import 'package:wish_i_sent/data/model/auth/signup_model.dart';

abstract class AuthFirebaseService {
  Future<Either<String, String>> signin(SigninModel signinModel);
  Future<Either<String, String>> signup(SignupModel signupModel);
  Future<Either<String, DocumentSnapshot<Map<String, dynamic>>>> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either<String, String>> signin(SigninModel signinModel) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinModel.email, password: signinModel.password);
      return const Right('User Succefully Loged in');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'wrong-password') {
        message = 'Wrong password';
      } else if (e.code == 'user-not-found') {
        message = 'User with tha email not found';
      } else {
        message = 'Something went wrong';
      }
      return Left(message);
    }
  }

  @override
  Future<Either<String, String>> signup(SignupModel signupModel) async {
    try {
      final UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: signupModel.email, password: signupModel.password);

      await FirebaseFirestore.instance
          .collection('User')
          .doc(user.user!.uid)
          .set({
        'email': signupModel.email,
        'username': signupModel.username,
      });

      return const Right('User Account Successfully Created!');
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

  @override
  Future<Either<String, DocumentSnapshot<Map<String, dynamic>>>>
      getUser() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    try {
      final result = await FirebaseFirestore.instance
          .collection('User')
          .doc(userId.toString())
          .get();

      return Right(result);
    } catch (e) {
      return Left('Some error occured');
    }
  }
}
