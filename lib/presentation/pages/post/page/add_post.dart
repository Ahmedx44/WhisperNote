import 'package:WhisperNote/data/model/post/post_model.dart';
import 'package:WhisperNote/domain/usecase/post/post_usecase.dart';
import 'package:WhisperNote/presentation/widget/custom_app_bar.dart';
import 'package:WhisperNote/service_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fk_toggle/fk_toggle.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  Color screenPickerColor = Colors.black;
  String categoryName = 'Lover';
  final userId = FirebaseAuth.instance.currentUser!.uid.toString();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _messageController = TextEditingController();
  TextEditingController _keyController = TextEditingController();
  TextEditingController _typeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    screenPickerColor = Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  const MyAppBar(
                    showBackButton: true,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / (10 * 5),
                  ),
                  Text(
                    'Write your letter',
                    style: GoogleFonts.caveat(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      border: Border.all(width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              CupertinoIcons.text_aligncenter,
                              weight: 100,
                            ),
                            Text(
                              'To My ${categoryName}:',
                              style: GoogleFonts.caveat(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 25,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _nameController,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 22),
                                decoration: InputDecoration(
                                    fillColor: screenPickerColor,
                                    hintText: 'Persons name',
                                    hintStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    filled: true,
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide.none)),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 25,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        TextField(
                          controller: _messageController,
                          maxLines: 8,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 24),
                          decoration: InputDecoration(
                              hintText: 'Type your message here',
                              hintStyle: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                              fillColor: screenPickerColor,
                              filled: true,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  Text(
                    'Person Type',
                    style: GoogleFonts.caveat(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  FkToggle(
                      backgroundColor: const Color.fromARGB(255, 54, 54, 54),
                      width: 80,
                      onSelected: (idx, instance) {
                        setState(() {
                          categoryName = instance.labels[idx];
                        });
                      },
                      height: 50,
                      disabledElementColor: Colors.white,
                      selectedColor: Theme.of(context).colorScheme.primary,
                      labels: const ['Lover', 'Parent', 'Relative', 'Friend']),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  Text(
                    'Add Key(optinal)',
                    style: GoogleFonts.caveat(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _keyController,
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                    decoration: const InputDecoration(
                        fillColor: Color.fromARGB(255, 54, 54, 54),
                        hintText: 'key',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Card(
                        color: Theme.of(context).colorScheme.secondary,
                        elevation: 2,
                        child: ColorPicker(
                          color: screenPickerColor,
                          onColorChanged: (Color color) => setState(
                            () {
                              screenPickerColor = color;
                            },
                          ),
                          width: 44,
                          height: 44,
                          borderRadius: 22,
                          heading: Text('Select Background color',
                              style: GoogleFonts.caveat(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              )),
                          subheading: Text(
                            'Select color shade',
                            style: GoogleFonts.caveat(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        if (_nameController.text.isEmpty ||
                            _messageController.text.isEmpty) {
                          return Future.delayed(
                              const Duration(milliseconds: 100), () {
                            showToast(
                              'please fill the persons name and message ',
                              backgroundColor: Colors.red,
                              context: context,
                              animation: StyledToastAnimation.slideFromTop,
                              reverseAnimation: StyledToastAnimation.fade,
                              position: StyledToastPosition.top,
                              animDuration: const Duration(seconds: 1),
                              duration: const Duration(seconds: 4),
                              curve: Curves.elasticOut,
                              reverseCurve: Curves.linear,
                            );
                          });
                        }
                        showDialog(
                          context: context,
                          builder: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        );

                        final result = await sl<PostUsecase>().call(PostModel(
                          userId: userId,
                          color: screenPickerColor.value.toRadixString(16),
                          name: _nameController.text,
                          category: categoryName,
                          message: _messageController.text,
                          type: _typeController.text,
                          key: _keyController.text,
                          messages: [],
                        ));

                        result.fold(
                          (ifLeft) {
                            Navigator.pop(context);
                            showToast(
                              ifLeft,
                              backgroundColor: Colors.green,
                              context: context,
                              animation: StyledToastAnimation.slideFromTop,
                              reverseAnimation: StyledToastAnimation.fade,
                              position: StyledToastPosition.top,
                              animDuration: const Duration(seconds: 1),
                              duration: const Duration(seconds: 4),
                              curve: Curves.elasticOut,
                              reverseCurve: Curves.linear,
                            );
                          },
                          (ifRight) {
                            Navigator.pop(context);
                            showToast(
                              ifRight,
                              backgroundColor: Colors.green,
                              context: context,
                              animation: StyledToastAnimation.slideFromTop,
                              reverseAnimation: StyledToastAnimation.fade,
                              position: StyledToastPosition.top,
                              animDuration: const Duration(seconds: 1),
                              duration: const Duration(seconds: 4),
                              curve: Curves.elasticOut,
                              reverseCurve: Curves.linear,
                            );
                          },
                        );
                      },
                      child: Container(
                        width: 200,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Center(
                          child: Text(
                            'Submit',
                            style: GoogleFonts.caveat(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
