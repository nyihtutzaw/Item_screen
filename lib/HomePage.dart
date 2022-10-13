import 'package:flutter/material.dart';
import 'package:list_screen/Add%20new%20screen.dart';
import 'package:list_screen/List.dart';
import 'package:list_screen/colors.dart';

import 'ProfitScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sale Recording System",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => AddNewScreen(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Icon(
                      Icons.add,
                      color: kPrimaryColor,
                      size: 35,
                    ),
                    Text(
                      "Add New",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => ListScreen(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Icon(
                      Icons.list,
                      color: kPrimaryColor,
                      size: 35,
                    ),
                    Text(
                      "View Records",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => ProfitScreen(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Icon(
                      Icons.money,
                      color: kPrimaryColor,
                      size: 35,
                    ),
                    Text(
                      "View Profit",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
