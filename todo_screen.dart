import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

bool? isChecked = false;

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "12",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                    color: Color.fromARGB(255, 96, 96, 96)),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    "JAN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "2016",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ],
              ),
              Spacer(),
              Text(
                "TUESDAY",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 112, 112, 112)),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              const Text(
                "Buy new Sweatshirt",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(255, 193, 191, 191),
                ),
              ),
              const Spacer(),
              Checkbox(
                value: isChecked,
                activeColor: Colors.greenAccent,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}