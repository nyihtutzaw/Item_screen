import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:list_screen/List.dart';
import 'package:list_screen/colors.dart';
import 'package:list_screen/providers/saleRecordProvider.dart';
import 'package:list_screen/widgets/CustomDatePicker.dart';
import 'package:provider/provider.dart';

class AddNewScreen extends StatefulWidget {
  AddNewScreen({Key? key}) : super(key: key);

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  bool _actionLoading = false;
  String total = "";
  Map<String, String> _formData = {};
  final GlobalKey<FormState> _formKey = GlobalKey();

  Future<void> _submit() async {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState?.save();
        try {
          setState(() {
            _actionLoading = true;
          });
          await Provider.of<SaleRecordProvider>(context, listen: false)
              .save(_formData);
          setState(() {
            _actionLoading = false;
          });
          _formKey.currentState!.reset();
          Fluttertoast.showToast(
              msg: "Save",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              fontSize: 16.0);
        } catch (error) {
          setState(() {
            _actionLoading = false;
          });
        }
      } else {
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          title: const Text('Add New Item'),
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Product is required';
                      }
                      return null;
                    },
                    onChanged: (value) => _formData['product'] = value,
                    decoration: InputDecoration(
                        labelText: 'Product',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Price is required';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _formData['price'] = value;
                      setState(() => {
                            total = (int.parse(_formData["price"].toString()) *
                                    int.parse(_formData["qty"].toString()))
                                .toString()
                          });
                    },
                    decoration: InputDecoration(
                        labelText: 'Price',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Qty is required';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _formData['qty'] = value;
                      setState(() => {
                            total = (int.parse(_formData["price"].toString()) *
                                    int.parse(_formData["qty"].toString()))
                                .toString()
                          });
                    },
                    decoration: InputDecoration(
                        labelText: 'Qty',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total =",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(total, style: const TextStyle(fontSize: 16))
                        ]),
                  ),
                  TextFormField(
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Payment is required';
                      }
                      return null;
                    },
                    onChanged: (value) => _formData['transfer'] = value,
                    decoration: InputDecoration(
                        labelText: 'Payment',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                  CustomDatePicker(onChange: (value) {
                    _formData['date'] = value;
                  }),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            if (!_actionLoading) {
                              _submit();
                            }
                          },
                          child: Text(!_actionLoading ? "Save" : "Saving..")))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
