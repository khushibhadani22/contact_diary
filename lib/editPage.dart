import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  File? photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: (IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          )),
          title: const Text(
            "Edit Contact",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.done,
                  size: 30,
                  color: Colors.black,
                )),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage:
                            (photo == null) ? null : FileImage(photo!),
                      ),
                      FloatingActionButton(
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: const Text("Pick Image"),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () async {
                                        image = await _picker.pickImage(
                                            source: ImageSource.camera);
                                        setState(() {
                                          photo = File(image!.path);
                                        });
                                      },
                                      child: Icon(Icons.camera_alt),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        image = await _picker.pickImage(
                                            source: ImageSource.gallery);
                                        setState(() {
                                          photo = File(image!.path);
                                        });
                                      },
                                      child: Icon(Icons.photo),
                                    ),
                                  ],
                                );
                              });
                        },
                        mini: true,
                        child: const Icon(
                          Icons.add,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "First Name",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Last Name",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Phone Number",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "E-mail",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
