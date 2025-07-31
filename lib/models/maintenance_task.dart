class MaintenanceTask {
  final int? id;
  final int equipmentId;
  final String title;
  final String? description;
  final int? intervalHours;
  final int? intervalDays;
  final DateTime? lastCompleted;

  MaintenanceTask({
    this.id,
    required this.equipmentId,
    required this.title,
    this.description,
    this.intervalHours,
    this.intervalDays,
    this.lastCompleted,
  });

  DateTime? get dueDate {
    if (lastCompleted == null) return null;
    if (intervalDays != null) {
      return lastCompleted!.add(Duration(days: intervalDays!));
    }
    if (intervalHours != null) {
      return lastCompleted!.add(Duration(hours: intervalHours!));
    }
    return null;
  }
}
