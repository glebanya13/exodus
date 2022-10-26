import 'package:exodus/model/verse.dart';
import 'package:exodus/notifier/verse.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

getVerse(VerseNotifier verseNotifier) async {

  List<Verse> _verseList = [];

  FirebaseFirestore.instance
       .collection('days').orderBy('number')
       .get()
       .then((QuerySnapshot querySnapshot) {
     for (var doc in querySnapshot.docs) {
       Verse verse = Verse.fromMap(doc.data() as Map<String, dynamic>);
       _verseList.add(verse);
     }
   });

  verseNotifier.verseList = _verseList;
}