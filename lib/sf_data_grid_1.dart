import 'package:flutter/material.dart';
import 'package:sfdatagrid/employee.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SfDataGrid1 extends StatefulWidget {
  const SfDataGrid1({Key? key}) : super(key: key);

  @override
  State<SfDataGrid1> createState() => _SfDataGrid1State();
}

class _SfDataGrid1State extends State<SfDataGrid1> {
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
    return SfDataGridTheme(
      data: SfDataGridThemeData(
        headerColor: Colors.grey[200], // header 배경색
        selectionColor: Colors.blueAccent, // 선택한 항목의 색
      ),
      child: SfDataGrid(
        stackedHeaderRows: [
          StackedHeaderRow(
            cells: [
              StackedHeaderCell(
                columnNames: ['salary1', 'salary2', 'salary3'],
                child: const Center(
                  child: Text(
                    'salary',
                  ),
                ),
              ),
            ],
          ),
        ],
        headerGridLinesVisibility: GridLinesVisibility.both,
        // 표 구분선, both: 가로세로 모두 구분선 생김, horizontal, vertical, none
        headerRowHeight: 30,
        source: employeeDataSource,
        // 표에 나타낼 데이터 소스
        columnWidthMode: ColumnWidthMode.fill,
        selectionMode: SelectionMode.single,
        // 항목 클릭 시 해당행이 전체 선택됨
        columns: [
          GridColumn(
            // 각 GridColumn은 하나의 열을 정의 함.
            columnName: 'id',
            label: const Center(
              child: Text(
                'ID',
              ),
            ),
          ),
          GridColumn(
            columnName: 'name',
            label: const Center(
              child: Text('Name'),
            ),
          ),
          GridColumn(
            columnName: 'designation',
            label: const Center(
              child: Text(
                'Designation',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          GridColumn(
            columnName: 'salary1',
            label: const Center(
              child: Text(
                'salary1',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          GridColumn(
            columnName: 'salary2',
            label: const Center(
              child: Text(
                'salary2',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          GridColumn(
            columnName: 'salary3',
            label: const Center(
              child: Text(
                'salary3',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  // 열의 갯수만큼 데이터를 매핑 해야 함
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              // 1열에는 id를 표시
              DataGridCell<String>(columnName: 'name', value: e.name),
              // 2열에는 name을 표시
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'salary1', value: e.salary[0]),
              DataGridCell<int>(columnName: 'salary2', value: e.salary[1]),
              DataGridCell<int>(columnName: 'salary3', value: e.salary[2]),
              // 3열에는 designation을 표시
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    // 매핑된 각 데이터를 아래의 위젯으로 그림
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
