import 'package:flutter/material.dart';
import 'package:facebook_app_events/facebook_app_events.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook SDK Demo',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final facebookAppEvents = FacebookAppEvents();

  @override
  void initState() {
    super.initState();
    // Log app install/open event
    facebookAppEvents.logEvent(name: 'fb_mobile_activate_app');
  }

  void _logSignup() {
    facebookAppEvents.logEvent(name: 'fb_mobile_complete_registration');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Signup event sent')),
    );
  }

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      appBar: AppBar(title: const Text('FB SDK Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: _logSignup,
          child: const Text('Log Signup Event'),
        ),
      ),
    );
  }
}
