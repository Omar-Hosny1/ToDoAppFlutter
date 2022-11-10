import 'package:flutter/material.dart';

class NewToDo extends StatefulWidget {
  final Function onAddTodo;

  NewToDo({super.key, required this.onAddTodo});

  @override
  State<NewToDo> createState() => _NewToDoState();
}

class _NewToDoState extends State<NewToDo> {
  final todoTitleController = TextEditingController();

  void onSubmitToAddTodo() {
    String textField = todoTitleController.text;
    if (textField == "") return;
    widget.onAddTodo(textField);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            bottom: isLandscape
                ? mediaQuery.viewInsets.bottom + 10
                : mediaQuery.viewInsets.bottom + 10),
        child: Column(
          children: [
            Container(
              margin:
                  const EdgeInsets.only(right: 7, left: 7, top: 13, bottom: 5),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 228, 228),
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: todoTitleController,
                style: const TextStyle(color: Color.fromARGB(255, 97, 97, 97)),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.add,
                    color: Color.fromARGB(255, 149, 149, 149),
                    size: 20,
                  ),
                  prefixIconConstraints:
                      BoxConstraints(maxHeight: 20, minWidth: 25),
                  border: InputBorder.none,
                  hintText: "Add To Do",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 99, 99, 99)),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 7),
              child: ElevatedButton(
                onPressed: onSubmitToAddTodo,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "ADD TO DO",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
