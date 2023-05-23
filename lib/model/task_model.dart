class TaskModel {
  String title;
  bool completed;

  TaskModel({required this.title, this.completed = false});

  TaskModel copyWith({String? title, bool? completed}) {
    return TaskModel(
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}
