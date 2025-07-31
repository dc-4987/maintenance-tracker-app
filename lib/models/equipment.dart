class Equipment {
  final int? id;
  final String name;
  final String type;
  final String serialNumber;
  final int hourMeter;

  Equipment({
    this.id,
    required this.name,
    required this.type,
    required this.serialNumber,
    required this.hourMeter,
  });
}
