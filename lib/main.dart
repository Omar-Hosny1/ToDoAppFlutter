import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/new_todo.dart';
import './widgets/todos.dart';
import './models/Todos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodosProvider(),
        )
      ],
      child: MaterialApp(
        title: 'To Do App',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 45, 54, 62),
        ),
        home: const MyHomePage(title: 'TO DO APP'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: non_constant_identifier_names
  // List<ToDoItem> todoList = [];

  // void _onRemoveItem(String id) {
  //   setState(() {
  //     todoList.removeWhere((element) => element.id == id);
  //   });
  // }

  // void _onAddTodo(String text) {
  //   setState(() {
  //     todoList.add(ToDoItem(
  //       todoTitle: text,
  //       id: DateTime.now().toString(),
  //       onRemoveItem: _onRemoveItem,
  //       key: ValueKey(
  //         DateTime.now().toString(),
  //       ),
  //     ));
  //   });
  // }

  void _startAddNewItem(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: Container(
              color: const Color.fromARGB(255, 55, 66, 73), child: NewToDo()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Center(
        child: Text(widget.title),
      ),
      backgroundColor: const Color.fromARGB(255, 62, 73, 82),
    );
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: appBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 80, 94, 106),
        child: const Icon(Icons.add),
        onPressed: () => _startAddNewItem(context),
      ),
      body: SizedBox(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.98,
        child: const Todos(),
      ),
    );
  }
}
