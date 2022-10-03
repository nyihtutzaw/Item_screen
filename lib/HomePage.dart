import 'package:flutter/material.dart';
import 'package:list_screen/Add%20new%20screen.dart';
import 'package:list_screen/List.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(22, 4, 5, 255),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => AddNewScreen(),
                    ),
                  );
                },
                child: const Text("Add ")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => ListScreen(),
                    ),
                  );
                },
                child: const Text("List"))
          ],
        ),
      ),
    );
  }
}
