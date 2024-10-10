import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_flip_builder/page_flip_builder.dart';
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
  // A map to store user-entered keys for each post
  final Map<int, String> enteredKeys = {};
  // A map to track whether the key for each post is correct (flip allowed)
  final Map<int, bool> canFlip = {};

  Color parseColor(String colorString) {
    final hexColor = colorString.replaceAll("Color(", "").replaceAll(")", "");
    return Color(int.parse(hexColor));
  }

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
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Search name',
                              focusColor: Colors.lightBlue,
                              hoverColor: Colors.lightBlue,
                              suffixIcon: Icon(CupertinoIcons.search),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: querySnapshot.docs.length,
                            itemBuilder: (context, index) {
                              final postData = querySnapshot.docs[index].data();

                              // Ensure 'key' is present in postData
                              if (postData['key'] != null &&
                                  postData['key'] is String &&
                                  postData['key']!.isNotEmpty) {
                                // Retrieve the entered key and flip status for this post
                                final enteredKey = enteredKeys[index] ?? '';
                                final isFlipAllowed = canFlip[index] ?? false;

                                return Container(
                                  color: Colors.black,
                                  child: isFlipAllowed
                                      ? PageFlipBuilder(
                                          frontBuilder: (_) => Container(
                                            padding: const EdgeInsets.all(16.0),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 5,
                                                  spreadRadius: 2,
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Flip to see the message!',
                                                style: GoogleFonts.caveat(
                                                    fontSize: 24),
                                              ),
                                            ),
                                          ),
                                          backBuilder: (_) => Container(
                                            padding: const EdgeInsets.all(16.0),
                                            decoration: BoxDecoration(
                                              color: Colors.purple,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'To: ${postData['name']}',
                                                  style: GoogleFonts.caveat(
                                                    fontSize: 30,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  'Category: ${postData['category']}',
                                                  style: GoogleFonts.caveat(
                                                    fontSize: 24,
                                                    color: Colors.white70,
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                Text(
                                                  postData['message'],
                                                  style: GoogleFonts.caveat(
                                                    fontSize: 24,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          flipAxis: Axis.horizontal,
                                          maxTilt: 0.003,
                                          maxScale: 0.2,
                                        )
                                      : Container(
                                          padding: const EdgeInsets.all(16.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                blurRadius: 5,
                                                spreadRadius: 2,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Enter the secret key to unlock the message:',
                                                style: GoogleFonts.caveat(
                                                    fontSize: 24),
                                              ),
                                              const SizedBox(height: 16),
                                              TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    enteredKeys[index] = value;
                                                  });
                                                },
                                                decoration: InputDecoration(
                                                  labelText: 'Enter Key',
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Check if entered key matches the post key
                                                  if (enteredKey ==
                                                      postData['key']) {
                                                    setState(() {
                                                      canFlip[index] = true;
                                                    });
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Incorrect key! Try again.'),
                                                    ));
                                                  }
                                                },
                                                child: const Text('Unlock'),
                                              ),
                                            ],
                                          ),
                                        ),
                                );
                              } else {
                                // If key is missing, show the normal message
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(width: 1)),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: parseColor(
                                                        postData['color'])),
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
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        height: 200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color:
                                                parseColor(postData['color'])),
                                      )
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
