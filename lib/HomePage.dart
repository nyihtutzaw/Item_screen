import 'package:flutter/material.dart';
import 'package:list_screen/Add%20new%20screen.dart';
import 'package:list_screen/List.dart';

import 'ProfitScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sale Recording System",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => AddNewScreen(),
                      ),
                    );
                  },
                  child: const Text("Add ")),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ListScreen(),
                      ),
                    );
                  },
                  child: const Text("List ")),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ProfitScreen(),
                      ),
                    );
                  },
                  child: const Text("Profit ")),
            ),
          ],
        ),
      ),
    );
  }
}
