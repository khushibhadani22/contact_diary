import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'global.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  GlobalKey<FormState> pageKey = GlobalKey<FormState>();
  TextEditingController fNAME = TextEditingController();
  TextEditingController lNAME = TextEditingController();
  TextEditingController pNAME = TextEditingController();
  TextEditingController eNAME = TextEditingController();

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
            "Add",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Global.contact.add({
                    'pic': Global.pic,
                    'fName': Global.fName,
                    'lName': Global.lName,
                    'phone': Global.phone,
                    'email': Global.email,
                  });
                  Global.pic = photo;

                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                },
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
                                        Navigator.of(context).pop();
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
                                        Navigator.of(context).pop();
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
                Form(
                  key: pageKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "First Name",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 5)),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter Your First Name.....";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.fName = fNAME.text;
                                });
                              },
                              controller: fNAME,
                              onChanged: (val) {
                                setState(() {
                                  Global.fName = val;
                                });
                              },
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 5)),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter Your Last Name.....";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.lName = lNAME.text;
                                });
                              },
                              controller: lNAME,
                              onChanged: (val) {
                                setState(() {
                                  Global.lName = val;
                                });
                              },
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 5)),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter Your Phone Number.....";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.phone = pNAME.text;
                                });
                              },
                              controller: pNAME,
                              keyboardType: TextInputType.number,
                              onChanged: (val) {
                                setState(() {
                                  Global.phone = val;
                                });
                              },
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                            ),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter Your Email.....";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.email = eNAME.text;
                                });
                              },
                              controller: eNAME,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (val) {
                                setState(() {
                                  Global.email = val;
                                });
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
