import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoItem extends StatefulWidget {
  final String todoTitle;
  final String id;
  final Function onRemoveItem;
  bool isCompeleted = false;
  ToDoItem({
    super.key,
    required this.todoTitle,
    required this.id,
    required this.onRemoveItem,
  });

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.isCompeleted ? Colors.grey : Colors.white,
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.todoTitle,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    widget.onRemoveItem(widget.id);
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.delete),
                  iconSize: 25,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.isCompeleted = true;
                    });
                  },
                  padding: EdgeInsets.zero,
                  iconSize: 28,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.task_alt_outlined),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
