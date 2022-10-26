import 'package:exodus/notifier/verse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DayDetailsPage extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Text('Дзень ' + verseNotifier.currentVerse.number,
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 22,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(
                ' "' + verseNotifier.currentVerse.title + '" ',
                style: TextStyle(
                    fontFamily: "Raleway",
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Text('Зыход ' + verseNotifier.currentVerse.verse,
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 22,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Padding(
                  padding: const EdgeInsets.all(9),
                  child: Text(verseNotifier.currentVerse.verseText.trim().replaceAll("\\n","\n"),
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold))),
              const SizedBox(height: 30),
              Text('Каментарый',
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 22,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Padding(
                  padding: const EdgeInsets.all(9),
                  child: Text(verseNotifier.currentVerse.comment.trim().replaceAll("\\n","\n"),
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold))),
              Text('Практыкаваннi',
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 22,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold)),
              Padding(
                  padding: const EdgeInsets.all(9),
                  child: Text(verseNotifier.currentVerse.exercises,
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold))),
            ],
          ),
        ),
      ),
    );
  }
}