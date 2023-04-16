import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/repository/get_todo_repository.dart';
import 'package:flutter_bootcamp/screens/add_todo_screen.dart';
import 'package:flutter_bootcamp/utils/color_constants.dart';
import 'package:flutter_bootcamp/utils/extension_utils.dart';
import 'package:flutter_bootcamp/widgets/text_widget.dart';
import 'package:flutter_bootcamp/widgets/todo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        title: const Text(
          'Simple Tasks List',
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              height: 280,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xFFD6F1E2),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 16,
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Daily Tasks",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddTodoScreen(),
                          ),
                        ),
                        child: Icon(
                          Icons.add_circle_outline_rounded,
                          color: ColorConstants.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder(
                      future: GetTodoRepository.getTodosRepository(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var items = snapshot.data;
                          return Expanded(
                            child: ListView.builder(
                              itemCount: items!.length,
                              itemBuilder: (context, index) {
                                var item = items[index];
                                print("index $index");
                                return TodoWidget(
                                  todoTitle: item.title!,
                                  isChecked: item.isChecked,
                                  id: item.id!,
                                  check: (check) {},
                                  isIndex: (isIndex) {
                                    setState(() {
                                      isIndex = index;
                                    });
                                  },
                                );
                              },
                            ),
                          );
                        }
                        return Container();
                      })
                ],
              ),
            ),
          ],
        ),
      ).addPadding(),
    );
  }
}
