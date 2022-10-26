import 'package:flutter/material.dart';
import '../homepage.dart';
import 'Drawer_widget.dart';
import 'package:flutter/services.dart';

class HidenDrawer extends StatefulWidget {
  double animationtime;
  HidenDrawer({Key? key, required this.animationtime}) : super(key: key);

  @override
  State<HidenDrawer> createState() => _HidenDrawerState();
}
class _HidenDrawerState extends State<HidenDrawer> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawingOpen;
  // int dely = 300;
  bool isDragging = false;

  void onpenDrawer() {
    setState(() {
      xOffset = 300;
      yOffset = 70;
      scaleFactor = 0.85;
      isDrawingOpen = false;
    });
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawingOpen = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    closeDrawer();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xFF04123F),
      body: Stack(children: [
        DrawerWidget(
          closdDrawer: closeDrawer,
        ),
        buildpage()
      ]));

  Widget buildpage() {
    return MyHomePage(
      animationtime: widget.animationtime,
    );
  }
}
