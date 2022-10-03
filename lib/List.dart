import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(21, 1, 1, 34),
          foregroundColor: Colors.white,
          title: const Text('Item List'),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: ListView(
            children: [
              Card(
                  child: ListTile(
                title: Row(
                  children: const [
                    Text('Product :'),
                    SizedBox(
                      width: 23,
                    ),
                    Text('Flutter')
                  ],
                ),
                subtitle: Row(
                  children: const [
                    Text('Total :'),
                    SizedBox(
                      width: 50,
                    ),
                    Text('5')
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
