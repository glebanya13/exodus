import 'package:exodus/notifier/verse_copy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroductionDetailsPage extends StatelessWidget {
  const IntroductionDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerseCopyNotifier verseNotifier = Provider.of<VerseCopyNotifier>(context);

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
              Text(verseNotifier.currentVerseCopy.number,
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 22,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(
                ' "' + verseNotifier.currentVerseCopy.title + '" ',
                style: TextStyle(
                    fontFamily: "Raleway",
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Padding(
                  padding: const EdgeInsets.all(9),
                  child: Text(verseNotifier.currentVerseCopy.verseText.trim().replaceAll("\\n","\n"),
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 17,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold))),
            ],
          ),
        ),
      ),
    );
  }
}