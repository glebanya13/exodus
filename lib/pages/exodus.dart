import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exodus/api/verse.dart';
import 'package:exodus/notifier/verse.dart';
import 'package:exodus/pages/exodus-details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExodusPage extends StatefulWidget {
  const ExodusPage({Key? key}) : super(key: key);

  @override
  _ExodusPageState createState() => _ExodusPageState();
}

class _ExodusPageState extends State<ExodusPage> {
  @override
  void initState() {
    VerseNotifier verseNotifier =
        Provider.of<VerseNotifier>(context, listen: false);
    getVerse(verseNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    VerseNotifier verseNotifier = Provider.of<VerseNotifier>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Exodus", style: TextStyle(color: Theme.of(context).primaryColor, fontFamily: "Raleway", fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor, //change your color here
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('days').orderBy('number').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text("")
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  elevation: 2.0,
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Container(
                      decoration:
                      BoxDecoration(color: Theme.of(context).cardColor),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                        title: Text(
                            'Дзень ' +
                                snapshot.data!.docs[index].get('number').toString() +
                                ' —  ' +
                                '"' +
                                snapshot.data!.docs[index].get('title') +
                                '"',
                            style: TextStyle(
                                fontFamily: "Raleway",
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold)),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Theme.of(context).primaryColor),
                        onTap: () {
                          verseNotifier.currentVerse =
                          verseNotifier.verseList[index];
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                                return DayDetailsPage();
                              }));
                        },
                      )));
            },
          );
        },
      )
    );
  }
}