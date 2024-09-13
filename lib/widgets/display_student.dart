import 'package:flutter/material.dart';
import 'package:flutter_sqflite/db/functions/db_functions.dart';
import 'package:flutter_sqflite/model/data_model.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<StudentModel>>(
      valueListenable: studentListNotifier,
      builder: (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            return ListTile(
              title: Text(data.name),
              subtitle: Text(data.age),
              trailing: IconButton(
                onPressed: () {
                  if (data.id != null) {
                    deleteStudent(data.id!);
                  } else {
                    print("Student id is null");
                  }
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            );
          },
          separatorBuilder: (ctx, index) => const Divider(),
          itemCount: studentList.length,
        );
      },
    );
  }
}
