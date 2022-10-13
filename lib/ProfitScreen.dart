import 'package:flutter/material.dart';
import 'package:list_screen/ViewRecord.dart';
import 'package:list_screen/colors.dart';
import 'package:list_screen/providers/saleRecordProvider.dart';
import 'package:provider/provider.dart';

import 'Add new screen.dart';

class ProfitScreen extends StatefulWidget {
  ProfitScreen({Key? key}) : super(key: key);

  @override
  State<ProfitScreen> createState() => _ProfitScreenState();
}

class _ProfitScreenState extends State<ProfitScreen> {
  bool _isInit = false;
  bool _isPreloading = false;

  void loadData() async {
    setState(() {
      _isPreloading = true;
    });

    await Provider.of<SaleRecordProvider>(context, listen: false).getProfit();

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
          DataCell(Text(i["month"].toString())),
          DataCell(Text(i["year"].toString())),
          DataCell(Text(i["profit"].toString())),
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
            title: const Text('Item List'),
          ),
          body: Consumer<SaleRecordProvider>(
              builder: (context, saleRecordState, child) {
            if (_isPreloading) {
              return CircularProgressIndicator();
            } else {
              return Container(
                  margin: const EdgeInsets.all(8),
                  child: DataTable(
                    columnSpacing: MediaQuery.of(context).size.width * 0.2,
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Month',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Year',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Total Profit',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                    rows: getRows(saleRecordState.profit),
                  ));
            }
          })),
    );
  }
}
