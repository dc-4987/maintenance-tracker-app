# Repository Structure Plan

This document outlines a recommended file and directory structure for implementing a maintenance tracker app with equipment management and scheduled maintenance reminders based on usage hours or elapsed time.

## Overview

```
lib/
  models/
    equipment.dart
    maintenance_task.dart
  data/
    equipment_repository.dart
    maintenance_repository.dart
  services/
    database/
      app_database.dart
      equipment_dao.dart
      maintenance_dao.dart
    notification_service.dart
    scheduler_service.dart
  providers/
    equipment_provider.dart
    maintenance_provider.dart
  screens/
    equipment_list_screen.dart
    equipment_detail_screen.dart
    maintenance_form_screen.dart
  widgets/
    equipment_card.dart
    maintenance_tile.dart
  utils/
    date_time_utils.dart
    constants.dart

assets/
  images/
  translations/

test/
  models/
  data/
  services/
  providers/
  screens/
  widgets/
```

## Directory Details

### `lib/models`
Defines core data structures:
- `equipment.dart` – fields such as `id`, `name`, `type`, `serialNumber`, and `hourMeter`.
- `maintenance_task.dart` – fields like `id`, `equipmentId`, `title`, `description`, `intervalHours`, `intervalDays`, `lastCompleted`, and `dueDate()` logic.

### `lib/data`
Repositories abstract reading and writing to persistent storage:
- `equipment_repository.dart` – CRUD operations for equipment.
- `maintenance_repository.dart` – CRUD and query operations for tasks, including next-due calculations.

### `lib/services`
Infrastructure services:
 - `database/` – sqflite setup and low-level access.
   - `app_database.dart` – opens the local database and handles initialization or migrations.
   - `equipment_dao.dart` – low-level CRUD for equipment table.
   - `maintenance_dao.dart` – low-level CRUD for maintenance tasks.
 - `notification_service.dart` – schedules local notifications using `flutter_local_notifications`.
 - `scheduler_service.dart` – checks upcoming tasks, calculates reminders based on hour meter or time, and calls `notification_service`.

### `lib/providers`
State management using the `provider` package:
- `equipment_provider.dart` – exposes list of equipment and methods to add/update/remove.
- `maintenance_provider.dart` – handles task scheduling, completion, and reminder updates.

### `lib/screens`
User interface screens:
- `equipment_list_screen.dart` – displays all equipment.
- `equipment_detail_screen.dart` – shows details and task list for selected equipment.
- `maintenance_form_screen.dart` – form to add/edit maintenance tasks with hour or date intervals.

### `lib/widgets`
Reusable widgets for UI components like cards, tiles, and forms.

### `lib/utils`
Helper functions and constants used across the app.

### `assets`
Images, icons, and localization files.

### `test`
Mirrors `lib` structure to keep unit and widget tests organized.

## Additional Notes
- Consider using a layered architecture (presentation, domain, data) to keep UI separate from business logic.
- Implement background processing using `Workmanager` or `android_alarm_manager_plus` for periodic checks when the app isn't active.
- Document APIs and models to ease future expansion (e.g., cloud sync).

## Dependencies
Add these packages in `pubspec.yaml` for local persistence and state management:
- `sqflite` – SQLite plugin used by `lib/services/database/` files.
- `path_provider` – obtains a writable directory for the database file.
- `path` – builds cross-platform file paths.
- `provider` – state management via `ChangeNotifier` and widget tree propagation.

