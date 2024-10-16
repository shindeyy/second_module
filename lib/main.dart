import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondModuleScreen extends StatelessWidget {
  const SecondModuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the 'fromRoute' argument passed during navigation
    final bool fromRoute = ModalRoute.of(context)?.settings.arguments as bool? ?? false;

    return WillPopScope(
      onWillPop: () async {
        if (fromRoute) {
          // Close Flutter Activity if opened through a route
          SystemNavigator.pop();
        } else {
          // Navigate back to the ThirdModuleScreen if opened from it
          Navigator.pop(context);
        }
        return false; // Prevent default back navigation
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Second Module')),
        body: Center(child: const Text('This is the Second Module Screen')),
      ),
    );
  }
}
