import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sqflite/widgets/add_student.dart';
import 'package:flutter_sqflite/widgets/display_student.dart';

import 'package:flutter_sqflite/db/functions/db_functions.dart';


class ScreenHome1 extends StatelessWidget {
  const ScreenHome1({super.key});
 @override
  Widget build(BuildContext context) {
     getAllStudents();

    return Scaffold(
      body:SafeArea(child: Column(children: [
        AddStudentWidget(),
        const Expanded(child: ListStudentWidget())
      ],),)
    );
  }
}