import 'package:flutter/material.dart';

class RunTest extends StatefulWidget {
  const RunTest({super.key});

  @override
  State<RunTest> createState() => _RunTestState();
}

class _RunTestState extends State<RunTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7CB59C),
        title: const Text(
          "Simple Tasks List",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tasks List",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 280,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFD6F1E2),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 12,
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddTask(),
                          ),
                        ),
                        child: Icon(
                          Icons.add_circle_outline_rounded,
                          color: Color(0xFF7CB59C),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: TaskModel.lists.length,
                      itemBuilder: (context, index) {
                        var item = TaskModel.lists[index];
                        return Row(
                          children: [
                            Checkbox(
                              activeColor: const Color(0xFF7CB59C),
                              value: item.isChecked,
                              onChanged: (val) {
                                setState(() {
                                  item.isChecked = val!;
                                });
                                // if (isChecked == true) {
                                //   TaskModel.lists.removeAt(index);
                                // }
                              },
                            ),
                            Text(
                              item.task,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: item.isChecked == true
                                    ? Colors.red
                                    : Colors.black,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    // child: ListView(
                    //   shrinkWrap: true,
                    //   children: [
                    // Row(
                    //   children: [
                    //     Checkbox(
                    //       value: false,
                    //       onChanged: (val) {},
                    //     ),
                    //     Text(
                    //       "Daily Tasks",
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    //   ],
                    // ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskModel {
  bool isChecked;
  String task;
  TaskModel({
    required this.isChecked,
    required this.task,
  });
  static List<TaskModel> lists = [
    TaskModel(isChecked: false, task: "Need to cleann up code"),
    TaskModel(isChecked: false, task: "Need to learn Angular"),
    TaskModel(isChecked: false, task: "Play the division 2"),
    TaskModel(isChecked: false, task: "Mentor people"),
    TaskModel(isChecked: false, task: "Write technical content"),
  ];
}

class AddTask extends StatelessWidget {
  const AddTask({super.key});

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
                onPressed: () {},
                child: Text("Add Task"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(24),
                  backgroundColor: Color(0xFF7CB59C),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
