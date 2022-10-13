import 'package:flutter/material.dart';
import 'package:list_screen/HomePage.dart';
import 'package:list_screen/providers/saleRecordProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: SaleRecordProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ));
  }
}
