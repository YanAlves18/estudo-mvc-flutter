import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'view/task_list_view.dart';
import 'view/login_view.dart';
import 'store/task_store.dart';
import 'store/login_store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TaskStore>(create: (_) => TaskStore()),
        Provider<LoginStore>(create: (_) => LoginStore()),
      ],
      child: Consumer<LoginStore>(
        builder: (_, loginStore, __) => MaterialApp(
          home: Observer(
            builder: (_) {
              if (loginStore.isLoggedIn) {
                return const TaskListView();
              } else {
                return const LoginView();
              }
            },
          ),
        ),
      ),
    );
  }
}