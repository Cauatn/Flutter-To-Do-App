import 'package:flutter/material.dart';
import 'package:flutter_alura/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task('Rezar', 'assets/images/reza.jpg', 1),
    Task('Sofrimento', 'assets/images/inferno.png', 4),
    Task('Fé', 'assets/images/leao.jpg', 3),
  ];

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  void addTask(String name, String photo, int difficulty) {
    taskList.add(
      Task(name, photo, difficulty),
    );
  }

  void removeTask(String name, String photo, int difficulty) {
    taskList.remove(
      Task(name, photo, difficulty),
    );
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
