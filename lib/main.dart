import 'package:exodus/pages/introduction.dart';
import 'package:flutter/material.dart';
import 'package:exodus/db/noted.dart';
import 'package:exodus/pages/exodus.dart';
import 'package:exodus/pages/homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'data/shared/Task_saved.dart';
import 'data/thems.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:exodus/notifier/verse.dart';
import 'package:exodus/notifier/verse_copy.dart';

late Box box;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(NotesAdapter());
  box = await Hive.openBox<Notes>("notes");
  await TaskerPreference.init(); // for initial SharedPerfomance ..
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => VerseNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => VerseCopyNotifier(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemProvider(),
      builder: (context, _) {
        final themProvider = Provider.of<ThemProvider>(context);
        return MaterialApp(
          title: 'Exodus',
          debugShowCheckedModeBanner: false,
          themeMode: themProvider.themeMode,
          darkTheme: Mytheme.darkthem,
          theme: Mytheme.lightthem,
          home: MyHomePage(animationtime: 0.8),
          initialRoute: '/',
          routes: {
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/Exodus': (context) => const ExodusPage(),
            '/Уводзiны Exodus': (context) => const IntroductionPage(),
          },
        );
      });
}
