import 'package:fk_toggle/fk_toggle.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wish_i_sent/presentation/widget/custom_app_bar.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  late Color screenPickerColor;
  String categoryName = 'Lover';

  @override
  void initState() {
    super.initState();
    screenPickerColor = Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      backgroundColor: Colors.white,
                      width: 80,
                      onSelected: (idx, instance) {
                        setState(() {
                          categoryName = instance.labels[idx];
                        });
                      },
                      height: 50,
                      selectedColor: Colors.blue,
                      labels: const ['Lover', 'Parent', 'Relative', 'Friend']),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  ListTile(
                      title: Text(
                        'Select color below to change this color',
                        style: GoogleFonts.caveat(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      trailing: ColorIndicator(
                        width: 44,
                        height: 44,
                        borderRadius: 22,
                        color: screenPickerColor,
                      )),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Card(
                        elevation: 2,
                        child: ColorPicker(
                          color: screenPickerColor,
                          onColorChanged: (Color color) =>
                              setState(() => screenPickerColor = color),
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
                    child: Container(
                      width: 200,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.lightBlue,
                      ),
                      child: const Center(
                        child: Text(
                          'Post',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
