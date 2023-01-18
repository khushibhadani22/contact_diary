import 'package:cdapp/contactPag.dart';
import 'package:cdapp/splash.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'addpage.dart';
import 'editPage.dart';
import 'global.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

bool isDark = false;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.white)),
      themeMode: (isDark == false) ? ThemeMode.light : ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: 'splashScreen',
      routes: {
        '/': (context) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Contacts",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isDark = !isDark;
                        });
                      },
                      icon: const Icon(
                        Icons.circle_rounded,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.black,
                      )),
                ],
              ),
              body: (Global.contact.isEmpty)
                  ? SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/openbox2.jpg',
                            height: 150,
                            width: 150,
                          ),
                          const Text(
                            "You Have no contacts yet",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  : ListView(
                      physics: const BouncingScrollPhysics(),
                      children: Global.contact
                          .map((e) => ListTile(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('ContactPage', arguments: e);
                                },
                                leading: CircleAvatar(
                                  backgroundImage: FileImage(Global.pic!),
                                ),
                                title: Text("${e['fName']} ${e['lName']}"),
                                subtitle: Text(e['phone']),
                                trailing: IconButton(
                                  onPressed: () {
                                    final Uri call =
                                        Uri.parse('tel:${e['phone']}');
                                    launchUrl(call);
                                  },
                                  icon: const Icon(
                                    Icons.call,
                                    color: Colors.green,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('add');
                },
                child: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ),
        'add': (context) => const AddPage(),
        'edit': (context) => const EditPage(),
        'splashScreen': (context) => const Splash(),
        'ContactPage': (context) => const Contact(),
      },
    );
  }
}
