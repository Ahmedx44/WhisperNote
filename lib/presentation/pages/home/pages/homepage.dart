import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wish_i_sent/domain/usecase/post/get_post_usecase.dart';
import 'package:wish_i_sent/presentation/pages/home/bloc/post_bloc/post_cubit.dart';
import 'package:wish_i_sent/presentation/pages/home/bloc/post_bloc/post_state.dart';
import 'package:wish_i_sent/service_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostCubit(sl<GetPostUsecase>())..getAllPost(),
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostStateLoaded) {
            return state.posts.fold(
              (failure) => Center(child: Text(failure)),
              (querySnapshot) {
                if (querySnapshot.docs.isEmpty) {
                  return const Center(
                    child: Text('No messages found'),
                  );
                }

                return SafeArea(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.02,
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: Column(
                      children: [
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'search name',
                            focusColor: Colors.lightBlue,
                            hoverColor: Colors.lightBlue,
                            suffixIcon: Icon(CupertinoIcons.search),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: querySnapshot.docs.length,
                            itemBuilder: (context, index) {
                              final postData = querySnapshot.docs[index].data();

                              // Check if 'key' exists and if it's empty or not
                              if (postData['key'] != null &&
                                  postData['key'] is String &&
                                  postData['key']!.isNotEmpty) {
                                // If key is not empty, show something else
                                return Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1)),
                                  margin: const EdgeInsets.all(20),
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                              CupertinoIcons.text_aligncenter),
                                          Text(
                                            'To ',
                                            style: GoogleFonts.caveat(
                                                fontSize: 25),
                                          ),
                                          Text(
                                            postData['category'],
                                            style: GoogleFonts.caveat(
                                                fontSize: 25),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                          ),
                                          Expanded(
                                            child: Stack(children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05,
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: const BoxDecoration(
                                                    color: Colors.black),
                                              ),
                                              Positioned(
                                                left: 10,
                                                child: Text(
                                                  '${postData['name']}',
                                                  style: GoogleFonts.caveat(
                                                      color: Colors.white,
                                                      fontSize: 25),
                                                ),
                                              )
                                            ]),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                // If key is empty or doesn't exist
                                return Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                              CupertinoIcons.text_aligncenter),
                                          const SizedBox(width: 8),
                                          Text(
                                              'To ${postData['category'] ?? 'Unknown'}'),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        'Message: No Key Provided',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const Center(child: Text('No data'));
        },
      ),
    );
  }
}
