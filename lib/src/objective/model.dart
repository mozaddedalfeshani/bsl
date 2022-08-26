class TableData {
  TableData(this.machineType, this.brand, this.quantity);
  final String machineType;
  final String brand;
  final String quantity;
}

List<TableData> tableInformation = [
  TableData("Machine Type", "Brand", "Quantity"),
  TableData("Single needle locksticth", "Juki", "420"),
];
