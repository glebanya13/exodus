import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Timecall extends StatelessWidget {
  String text = "";
  int nowtime = DateTime.now().hour;
  String time_call() {
    if (nowtime <= 11) {
      text = "Добрага ранку  ☀️";
    }
    if (nowtime > 11) {
      text = "Добры дзень  🌞";
    } if (nowtime >= 16){
      text = "Добры вечар  🌆";
    } if (nowtime >= 18) {
      text = "Добрай ночы  🌙";
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      time_call(),
      style: TextStyle(
        fontFamily: "Raleway",
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 29,
      ),
    ));
  }
}
