import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/Todo.dart';
import 'package:to_do_app/models/Todos.dart';

// ignore: must_be_immutable
class ToDoItemWidget extends StatefulWidget {
  const ToDoItemWidget({super.key});

  // final String todoTitle;
  // final String id;
  // final Function onRemoveItem;
  // bool isCompeleted = false;
  // ToDoItemWidget({
  //   super.key,
  //   required this.todoTitle,
  //   required this.id,
  //   required this.onRemoveItem,
  // });

  @override
  State<ToDoItemWidget> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItemWidget> {
  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<TodoItem>(context);
    final todosData = Provider.of<TodosProvider>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
          color: todo.isCompeleted ? Colors.grey : Colors.white,
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            todo.text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  todosData.onRemoveTodo(id: todo.id);
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.delete),
                iconSize: 25,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    todo.toggleFavorite();
                  });
                },
                padding: EdgeInsets.zero,
                iconSize: 28,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.task_alt_outlined),
              )
            ],
          ),
        ],
      ),
    );
  }
}
