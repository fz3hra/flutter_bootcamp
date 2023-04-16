import 'package:flutter/material.dart';

import 'package:flutter_bootcamp/repository/add_todo_repository.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7CB59C),
        title: const Text(
          "Add Tasks List",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 48,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/addTask.png",
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'To do',
                  filled: true,
                  fillColor: const Color(0xFFD6F1E2),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    AddTodoRepository.createTodos(controller.text, false);
                    controller.clear();
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(24),
                  backgroundColor: const Color(0xFF7CB59C),
                ),
                child: const Text("Add Task"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
