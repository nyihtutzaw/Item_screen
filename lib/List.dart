import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_screen/ViewRecord.dart';
import 'package:list_screen/colors.dart';
import 'package:list_screen/providers/saleRecordProvider.dart';
import 'package:provider/provider.dart';

import 'Add new screen.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool _isInit = false;
  bool _isPreloading = false;

  void loadData() async {
    setState(() {
      _isPreloading = true;
    });

    await Provider.of<SaleRecordProvider>(context, listen: false).getAll();

    setState(() {
      _isPreloading = false;
    });
  }

  void didChangeDependencies() {
    if (!_isInit) {
      loadData();
      _isInit = true;
    }
    super.didChangeDependencies();
  }

  var inputFormat = DateFormat('dd/MM/yyyy');

  List<DataRow> getRows(data) {
    List<DataRow> rows = [];
    for (var i in data) {
      rows.add(DataRow(
        onLongPress: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => ViewRecord(data: i),
            ),
          );
        },
        cells: <DataCell>[
          DataCell(Text(i["product"])),
          DataCell(Text(i["price"].toString())),
          DataCell(Text(i["qty"].toString())),
          DataCell(Text(i["total"].toString())),
          DataCell(Text(i["date"] != null
              ? inputFormat.format(DateTime.parse(i["date"]))
              : "")),
        ],
      ));
    }

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            foregroundColor: Colors.white,
            title: const Text('Records'),
          ),
          body: Consumer<SaleRecordProvider>(
              builder: (context, saleRecordState, child) {
            if (_isPreloading) {
              return CircularProgressIndicator();
            } else {
              return Container(
                  margin: const EdgeInsets.all(8),
                  child: DataTable(
                    columnSpacing: MediaQuery.of(context).size.width * 0.05,
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Qty',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Price',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Total',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Date',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                    rows: getRows(saleRecordState.data),
                  ));
            }
          })),
    );
  }
}
