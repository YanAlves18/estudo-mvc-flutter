import 'package:mobx/mobx.dart';
import '../model/task_model.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  @observable
  ObservableList<TaskModel> tasks = ObservableList<TaskModel>();

  @observable
  bool showCompletedTasks = false;

  @action
  void addTask(String title) {
    final task = TaskModel(title: title);
    tasks.add(task);
  }

  @action
  void toggleTaskCompletion(TaskModel task) {
    final index = tasks.indexOf(task);
    if (index != -1) {
      tasks[index] = task.copyWith(completed: !task.completed);
    }
  }

  @action
  void toggleShowCompletedTasks() {
    showCompletedTasks = !showCompletedTasks;
  }

  @computed
  List<TaskModel> get visibleTasks {
    if (showCompletedTasks) {
      return tasks.toList();
    } else {
      return tasks.where((task) => !task.completed).toList();
    }
  }

  @computed
  bool get hasCompletedTasks => tasks.any((task) => task.completed);
}