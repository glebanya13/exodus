import 'package:flutter/material.dart';

class Task {
  String tasknumber;
  String title;
  Color progresscolor;
  double value;

  Task(
      {required this.tasknumber,
      required this.title,
      required this.progresscolor,
      required this.value});
}

List<Task> tasklist = [
  Task(
      tasknumber: "16 tasks",
      title: "Уводзiны Exodus",
      progresscolor: Colors.blue,
      value: 0.1),
  Task(
      tasknumber: "40 tasks",
      title: "Exodus",
      progresscolor: Colors.blue,
      value: 0.5),
];
