import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maintenance_tracker_app/screens/dashboard/dashboard_screen.dart';
import 'package:maintenance_tracker_app/screens/fab/equipment_onboarding_form_screen.dart';
import 'package:maintenance_tracker_app/screens/garage/garage_screen.dart';
import 'package:maintenance_tracker_app/screens/tasks/maintenance_tasks_screen.dart';
import 'package:maintenance_tracker_app/utils/constants.dart';
import 'package:path/path.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        platform: TargetPlatform.iOS,
        fontFamily: "WorkSans",
        scaffoldBackgroundColor: Colors.lime.shade400,
        appBarTheme: AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Theme.of(
            context,
          ).colorScheme.surface.withValues(alpha: 0.2),
          foregroundColor: Theme.of(context).colorScheme.onSurface,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 34),
          displayMedium: TextStyle(fontSize: 28),
          displaySmall: TextStyle(fontSize: 20),
          titleLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
          titleMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          labelLarge: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          labelMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          labelSmall: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        dividerTheme: DividerThemeData(
          color: Theme.of(context).colorScheme.primary,
          thickness: 1.5,
          space: 15,
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Colors.transparent, // disable M3 tint if you like
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          elevation: 4,
        ),
        cardTheme: CardThemeData(
          color: Colors.lime.shade400,
          shadowColor: Colors.grey,
          surfaceTintColor: Theme.of(context).colorScheme.surface,
          elevation: 1.0,
        ),
        navigationBarTheme: NavigationBarThemeData(
          elevation: 0,
          backgroundColor: Theme.of(
            context,
          ).colorScheme.surface.withValues(alpha: 0.2),
          surfaceTintColor: Colors.transparent,
          indicatorColor: Colors.lime.shade400,
          iconTheme: WidgetStatePropertyAll(IconThemeData()),
          labelTextStyle: WidgetStatePropertyAll(
            TextStyle(color: Colors.black),
          ),
        ),
        // TODO: set themes for other widgets
      ),
      home: const MyHomePage(title: appTitle),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// Returns the widget for the currently‑selected tab.
  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return const GarageScreen();
      case 1:
        return DashboardScreen(); // existing dashboard content
      case 2:
        return const MaintenanceTasksScreen();
      default:
        return DashboardScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    void showAddEquipmentForm() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.7,
          maxChildSize: 0.95,
          minChildSize: 0.4,
          builder: (context, scrollController) {
            return Material(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              color: Theme.of(context).colorScheme.primaryFixed,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              child: SingleChildScrollView(
                controller: scrollController, // ← key line
                padding: EdgeInsets.fromLTRB(
                  16,
                  16,
                  16,
                  MediaQuery.of(context).viewInsets.bottom + 16,
                ),
                child:
                    const EquipmentOnboardingFormScreen(), // just the fields & buttons
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: SizedBox.expand(),
          ),
        ),
        leading: IconButton(
          onPressed: null,
          icon: Icon(Icons.account_circle_sharp),
          iconSize: 35,
          // color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: null,
            icon: IconButton(
              onPressed: null,
              icon: Icon(Icons.settings),
              iconSize: 35,
              // color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
      body: _getBody(),
      bottomNavigationBar: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.surface.withValues(alpha: 0.2),
              border: Border(
                top: BorderSide(
                  color: Theme.of(
                    context,
                  ).colorScheme.surface.withValues(alpha: 0.2),
                ),
              ),
            ),
            child: NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onDestinationSelected,
              height: 56,
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.warehouse_sharp),
                  label: "Garage",
                ),
                NavigationDestination(
                  icon: Icon(Icons.dashboard_sharp),
                  label: "Dashboard",
                ),
                NavigationDestination(
                  icon: Icon(Icons.assignment_sharp),
                  label: "Tasks",
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.home_repair_service_sharp,
        activeIcon: Icons.close,
        spacing: 6,
        spaceBetweenChildren: 6,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.add_box_outlined),
            label: 'Add equipment',
            onTap: showAddEquipmentForm,
          ),
          SpeedDialChild(
            child: const Icon(Icons.timer_outlined),
            label: 'Log usage',
            onTap: () {
              // TODO: implement usage logger
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.check_circle_outline),
            label: 'Complete task',
            onTap: () {
              // TODO: implement quick-complete
            },
          ),
        ],
      ),
    );
  }
}
