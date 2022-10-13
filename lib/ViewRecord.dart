import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:list_screen/List.dart';
import 'package:list_screen/colors.dart';
import 'package:list_screen/providers/saleRecordProvider.dart';
import 'package:list_screen/widgets/CustomDatePicker.dart';
import 'package:provider/provider.dart';

class ViewRecord extends StatefulWidget {
  var data;
  ViewRecord({Key? key, required this.data}) : super(key: key);

  @override
  State<ViewRecord> createState() => _ViewRecordState();
}

class _ViewRecordState extends State<ViewRecord> {
  bool _actionLoading = false;
  Map<String, String> _formData = {};
  var inputFormat = DateFormat('dd/MM/yyyy');
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          title: const Text('View Record'),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () async {
                  await Provider.of<SaleRecordProvider>(context, listen: false)
                      .delete(widget.data["id"]);
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
        body: Center(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    readOnly: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Product is required';
                      }
                      return null;
                    },
                    initialValue: widget.data["product"],
                    onChanged: (value) => _formData['product'] = value,
                    decoration: InputDecoration(
                        labelText: 'Product',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  TextFormField(
                    readOnly: true,
                    initialValue: widget.data["price"].toString(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Price is required';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    onChanged: (value) => _formData['price'] = value,
                    decoration: InputDecoration(
                        labelText: 'Price',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  TextFormField(
                    initialValue: widget.data["qty"].toString(),
                    readOnly: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Qty is required';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    onChanged: (value) => _formData['qty'] = value,
                    decoration: InputDecoration(
                        labelText: 'Qty',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  TextFormField(
                    initialValue:
                        (widget.data["price"] * widget.data["qty"]).toString(),
                    readOnly: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Total is required';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    onChanged: (value) => _formData['qty'] = value,
                    decoration: InputDecoration(
                        labelText: 'Total',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  TextFormField(
                    initialValue: widget.data["profit"].toString(),
                    readOnly: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Profit is required';
                      }
                      return null;
                    },
                    onChanged: (value) => _formData['profit'] = value,
                    decoration: InputDecoration(
                        labelText: 'Profit',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  TextFormField(
                    initialValue: widget.data["transfer"].toString(),
                    readOnly: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Transfer is required';
                      }
                      return null;
                    },
                    onChanged: (value) => _formData['transfer'] = value,
                    decoration: InputDecoration(
                        labelText: 'Transfer',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  Text(
                    "Date : " + widget.data["date"] != null
                        ? inputFormat
                            .format(DateTime.parse(widget.data["date"]))
                        : "",
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
