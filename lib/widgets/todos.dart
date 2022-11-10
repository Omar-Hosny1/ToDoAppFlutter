import 'package:flutter/material.dart';

class Todos extends StatefulWidget {
  final List todoList;
  const Todos({super.key, required this.todoList});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  @override
  Widget build(BuildContext context) {
    return widget.todoList.isEmpty
        ? const Center(
            child: Text(
              "NO ITEMS YET",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          )
        : Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return widget.todoList[index];
              }),
              itemCount: widget.todoList.length,
            ),
          );
  }
}
