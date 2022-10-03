import 'package:flutter/material.dart';
import 'package:list_screen/List.dart';

class AddNewScreen extends StatefulWidget {
  AddNewScreen({Key? key}) : super(key: key);

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(22, 4, 5, 255),
          foregroundColor: Colors.white,
          title: const Text('Add New Item'),
        ),
        body: Center(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: key,
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'No',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Product',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Price',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Qty',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'total',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Profit',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Transfer',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  OutlinedButton(
                      onPressed: () {
                        if (key.currentState!.validate()) ;
                      },
                      child: const Text("Sales"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
