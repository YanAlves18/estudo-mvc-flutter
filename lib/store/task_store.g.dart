// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStore, Store {
  Computed<List<TaskModel>>? _$visibleTasksComputed;

  @override
  List<TaskModel> get visibleTasks => (_$visibleTasksComputed ??=
          Computed<List<TaskModel>>(() => super.visibleTasks,
              name: '_TaskStore.visibleTasks'))
      .value;
  Computed<bool>? _$hasCompletedTasksComputed;

  @override
  bool get hasCompletedTasks => (_$hasCompletedTasksComputed ??= Computed<bool>(
          () => super.hasCompletedTasks,
          name: '_TaskStore.hasCompletedTasks'))
      .value;

  late final _$tasksAtom = Atom(name: '_TaskStore.tasks', context: context);

  @override
  ObservableList<TaskModel> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<TaskModel> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$showCompletedTasksAtom =
      Atom(name: '_TaskStore.showCompletedTasks', context: context);

  @override
  bool get showCompletedTasks {
    _$showCompletedTasksAtom.reportRead();
    return super.showCompletedTasks;
  }

  @override
  set showCompletedTasks(bool value) {
    _$showCompletedTasksAtom.reportWrite(value, super.showCompletedTasks, () {
      super.showCompletedTasks = value;
    });
  }

  late final _$_TaskStoreActionController =
      ActionController(name: '_TaskStore', context: context);

  @override
  void addTask(String title) {
    final _$actionInfo =
        _$_TaskStoreActionController.startAction(name: '_TaskStore.addTask');
    try {
      return super.addTask(title);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTaskCompletion(TaskModel task) {
    final _$actionInfo = _$_TaskStoreActionController.startAction(
        name: '_TaskStore.toggleTaskCompletion');
    try {
      return super.toggleTaskCompletion(task);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleShowCompletedTasks() {
    final _$actionInfo = _$_TaskStoreActionController.startAction(
        name: '_TaskStore.toggleShowCompletedTasks');
    try {
      return super.toggleShowCompletedTasks();
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
showCompletedTasks: ${showCompletedTasks},
visibleTasks: ${visibleTasks},
hasCompletedTasks: ${hasCompletedTasks}
    ''';
  }
}
