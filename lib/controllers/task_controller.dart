import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/task_provider.dart';
import 'package:flutter_provider/views/add_task_view.dart';
import 'package:flutter_provider/views/task_view.dart';
import 'package:provider/provider.dart';

class TaskController extends StatelessWidget {
  const TaskController({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskProvider>(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Task App',
        initialRoute: '/',
        routes: {
          '/': (context) => const TaskView(),
          '/add-task': (context) => AddTaskView(),
        },
      ),
    );
  }
}
