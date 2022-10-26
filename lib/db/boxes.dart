import 'package:exodus/db/noted.dart';
import 'package:hive_flutter/adapters.dart';

class Boxes {
  static Box<Notes> getNote() => Hive.box<Notes>('notes');
}
