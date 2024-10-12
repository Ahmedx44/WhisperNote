import 'package:WhisperNote/domain/usecase/auth/get_user.dart';
import 'package:WhisperNote/presentation/pages/Profile/bloc/profile_cubit.dart';
import 'package:WhisperNote/presentation/pages/Profile/bloc/profile_state.dart';
import 'package:WhisperNote/service_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(key);
    return BlocProvider(
      create: (context) => ProfileCubit(sl<GetUserUseCase>())..getUserProfile(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProfileStateLoaded) {
                return FutureBuilder<
                    Either<String, DocumentSnapshot<Map<String, dynamic>>>>(
                  future: state.user,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (snapshot.hasData) {
                      return snapshot.data!.fold(
                        (failure) => Center(child: Text(failure)),
                        (userDoc) {
                          final username = userDoc.data()!['username'];
                          return Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                              Center(
                                child: Text(
                                  username,
                                  style: const TextStyle(fontSize: 27),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                              GestureDetector(
                                onTap: () {
                                  FirebaseAuth.instance.signOut();
                                },
                                child: Container(
                                  margin: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                  child: const ListTile(
                                    leading: Text(
                                      'L O G O U T',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    trailing: Icon(
                                      Icons.logout,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    }

                    return const Center(
                      child: Text('No data available'),
                    );
                  },
                );
              } else if (state is ProfileStateError) {
                return const Center(
                  child: Text('An error occurred'),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
