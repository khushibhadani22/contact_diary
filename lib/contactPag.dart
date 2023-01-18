import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'global.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map;

    final Uri call = Uri.parse('tel:${data['phone']}');
    final Uri msg = Uri.parse('sms:${data['phone']}');
    final Uri mail = Uri.parse(
        'mailto:${data['email']}?subject=LeaveApplication&body=ThisIsLeaveApp');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Contacts",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
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
      body: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        child: Column(
          children: [
            const Spacer(
              flex: 3,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Spacer(
                  flex: 6,
                ),
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.grey,
                  backgroundImage: FileImage(Global.pic!),
                ),
                const Spacer(
                  flex: 2,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                      });
                    },
                    icon: const Icon(Icons.delete)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              ],
            ),
            const Spacer(),
            Text(
              "${data['fName']} ${data['lName']}",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  "+91 ${data['phone']}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                )
              ],
            ),
            const Spacer(),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () {
                    launchUrl(call);
                  },
                  child: Icon(Icons.call),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.orangeAccent,
                  onPressed: () {
                    launchUrl(msg);
                  },
                  child: Icon(Icons.message),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.blue.shade400,
                  onPressed: () {
                    launchUrl(mail);
                  },
                  child: Icon(Icons.email),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.orange,
                  onPressed: () {
                    Share.share(
                        '${data['fName']} ${data['lName']} :- ${data['phone']}');
                  },
                  child: Icon(Icons.share),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black,
            ),
            const Spacer(
              flex: 7,
            ),
          ],
        ),
      ),
    );
  }
}
