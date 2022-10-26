import 'package:flutter/material.dart';
import 'package:exodus/Animation/fadeAnimation.dart';
import 'package:exodus/main.dart';
import 'package:exodus/db/boxes.dart';
import 'package:exodus/db/noted.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/tasks.dart';
import '../data/time_say.dart';
import 'button_change_them.dart';

class MyHomePage extends StatefulWidget {
  double animationtime;
  MyHomePage({Key? key, required this.animationtime}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int Business = 0;
  int Personal = 0;

  bool isLoading = false;
  final noted = box.values.toList().cast<Notes>();

  void cheakTag() {
    noted.forEach((element) {
      if (element.title == "Exodus") {
        setState(() {
          Business++;
        });
      } else if (element.title == "Уводзiны Exodus") {
        setState(() {
          Personal++;
        });
      } else {
        Business = 0;
        Personal = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ValueListenableBuilder<Box<Notes>>(
          valueListenable: Boxes.getNote().listenable(),
          builder: (context, box, _) {
            return SafeArea(
              child: SizedBox(
                  width: we,
                  height: he,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: we * 0.12,
                        ),
                        SizedBox(
                          width: we * 0.7,
                        ),
                        SizedBox(
                          width: we * 0.01,
                        ),
                        ChangeThembutton(),
                        SizedBox(
                          width: we * 0.02,
                        ),
                      ],
                    ),
                    FadeAnimation(
                      delay: widget.animationtime,
                      child: Container(
                        margin: EdgeInsets.only(top: he * 0.02),
                        width: we * 0.9,
                        height: he * 0.15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Timecall(),
                            SizedBox(
                              height: he * 0.06,
                            ),
                            Text(
                              "Планы",
                              style: TextStyle(
                                  fontFamily: "Raleway",
                                  letterSpacing: 1,
                                  color: Colors.grey.withOpacity(0.8),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FadeAnimation(
                      delay: widget.animationtime,
                      child: SizedBox(
                        width: we * 2,
                        height: he * 0.16,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildCategories(context, tasklist[0].title,
                                tasklist[0].progresscolor, Business),
                            _buildCategories(context, tasklist[1].title,
                                tasklist[1].progresscolor, Personal)
                          ],
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                  ])),
            );
          }),
    );
  }

  Widget _buildCategories(
      context, String title, Color lineProgress, int numbertask) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Card(
      margin: const EdgeInsets.only(left: 23),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.2),
      child: Container(
        width: we * 0.5,
        height: he * 0.1,
        margin: const EdgeInsets.only(
          top: 25,
          left: 14,
        ),
        child: GestureDetector(
          onTap: () => {
            Navigator.pushNamed(context, '/$title')
          },
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 24,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: he * 0.03),
            ],
          ),
        )
      ),
    );
  }
}
