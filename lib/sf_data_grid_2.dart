import 'package:flutter/material.dart';
import 'package:sfdatagrid/employee.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SfDataGrid2 extends StatefulWidget {
  const SfDataGrid2({Key? key}) : super(key: key);

  @override
  State<SfDataGrid2> createState() => _SfDataGrid2State();
}

class _SfDataGrid2State extends State<SfDataGrid2> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      headerRowHeight: 30,
      source: employeeDataSource,
      columnWidthMode: ColumnWidthMode.fill,
      columns: [
        GridColumn(
          columnName: 'salary1',
          label: const Center(
            child: Text(
              'sal1',
            ),
          ),
        ),
        GridColumn(
          columnName: 'salary2',
          label: const Center(
            child: Text('sal2'),
          ),
        ),
        GridColumn(
          columnName: 'salary3',
          label: const Center(
            child: Text(
              'sal3',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'salary1', value: e.salary[0]),
              DataGridCell<int>(columnName: 'salary2', value: e.salary[1]),
              DataGridCell<int>(columnName: 'salary3', value: e.salary[2]),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
