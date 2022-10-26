import 'dart:collection';
import 'package:exodus/model/verse_copy.dart';
import 'package:flutter/material.dart';

class VerseCopyNotifier with ChangeNotifier {
  List<VerseCopy> _verseCopyList = [];
  late VerseCopy _currentCopyVerse;

  UnmodifiableListView<VerseCopy> get verseCopyList => UnmodifiableListView(_verseCopyList);

  VerseCopy get currentVerseCopy => _currentCopyVerse;

  set verseCopyList(List<VerseCopy> verseCopyList) {
    _verseCopyList = verseCopyList;
    notifyListeners();
  }

  set currentCopyVerse(VerseCopy verseCopy) {
    _currentCopyVerse = verseCopy;
    notifyListeners();
  }
}
