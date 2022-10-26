class VerseCopy {
  String title;
  String number;
  String verseText;

  VerseCopy.fromMap(Map<String, dynamic> data)
      : title = data['title'].toString(),
        number = data['number'].toString(),
        verseText = data['verseText'].toString();

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'number': number,
      'verseText': verseText
    };
  }
}
