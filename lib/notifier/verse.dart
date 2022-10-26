import 'dart:collection';
import 'package:exodus/model/verse.dart';
import 'package:flutter/material.dart';

class VerseNotifier with ChangeNotifier {
  List<Verse> _verseList = [];
  late Verse _currentVerse;

  UnmodifiableListView<Verse> get verseList => UnmodifiableListView(_verseList);

  Verse get currentVerse => _currentVerse;

  set verseList(List<Verse> verseList) {
    _verseList = verseList;
    notifyListeners();
  }

  set currentVerse(Verse verse) {
    _currentVerse = verse;
    notifyListeners();
  }
}
