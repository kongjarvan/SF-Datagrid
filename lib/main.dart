import 'package:flutter/material.dart';
import 'package:sfdatagrid/sf_data_grid_1.dart';
import 'package:sfdatagrid/sf_data_grid_2.dart';

void main() {
  runApp(MyApp());
}

/// The application that contains datagrid on it.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syncfusion DataGrid Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

/// The home page of the application which hosts the datagrid.
class MyHomePage extends StatelessWidget {
  /// Creates the home page.
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            child: SfDataGrid1(),
          ),
          Expanded(
            child: Column(
              children: const [
                SizedBox(
                  height: 30,
                  child: Center(
                    child: Text('salary'),
                  ),
                ),
                Expanded(
                  child: SfDataGrid2(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
