import '../models/maintenance_task.dart';
import 'notification_service.dart';

class SchedulerService {
  final NotificationService notifications;

  SchedulerService(this.notifications);

  Future<void> scheduleTasks(List<MaintenanceTask> tasks) async {
    // TODO: schedule notifications based on task due dates
  }
}
