class Employee {
  /// Creates the employee class with required details.
  Employee(this.id, this.name, this.designation, this.salary);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final List<int> salary;
}

List<Employee> getEmployeeData() {
  return [
    Employee(10001, 'James', 'Project Lead', [20, 10, 8]),
    Employee(10002, 'Kathryn', 'Manager', [20, 10, 8]),
    Employee(10003, 'Lara', 'Developer', [20, 10, 8]),
    Employee(10004, 'Michael', 'Designer', [20, 10, 8]),
    Employee(10005, 'Martin', 'Developer', [20, 10, 8]),
    Employee(10006, 'Newberry', 'Developer', [20, 10, 8]),
    Employee(10007, 'Balnc', 'Developer', [20, 10, 8]),
    Employee(10008, 'Perry', 'Developer', [20, 10, 8]),
    Employee(10010, 'Grimes', 'Developer', [20, 10, 8])
  ];
}
