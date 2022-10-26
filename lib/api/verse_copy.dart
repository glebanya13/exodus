import 'package:exodus/model/verse_copy.dart';
import 'package:exodus/notifier/verse_copy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

getVerseCopy(VerseCopyNotifier verseCopyNotifier) async {

  List<VerseCopy> _verseCopyList = [];

  FirebaseFirestore.instance
       .collection('introduction').orderBy('number')
       .get()
       .then((QuerySnapshot querySnapshot) {
     for (var doc in querySnapshot.docs) {
       VerseCopy verseCopy = VerseCopy.fromMap(doc.data() as Map<String, dynamic>);
       _verseCopyList.add(verseCopy);
     }
   });

  verseCopyNotifier.verseCopyList = _verseCopyList;
}