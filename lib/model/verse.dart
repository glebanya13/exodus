class Verse {
  String title;
  String number;
  String exercises;
  String comment;
  String verse;
  String verseText;

  Verse.fromMap(Map<String, dynamic> data)
      : title = data['title'].toString(),
        number = data['number'].toString(),
        exercises = data['exercises'].toString(),
        comment = data['comment'].toString(),
        verse = data['verse'].toString(),
        verseText = data['verseText'].toString();

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'number': number,
      'exercises': exercises,
      'comment': comment,
      'verse': verse,
      'verseText': verseText
    };
  }
}
