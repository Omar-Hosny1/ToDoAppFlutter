import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  final String todoTitle;
  final String id;
  final Function onRemoveItem;
  const ToDoItem(
      {super.key,
      required this.todoTitle,
      required this.id,
      required this.onRemoveItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            todoTitle,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          IconButton(
              onPressed: () {
                onRemoveItem(id);
              },
              icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
