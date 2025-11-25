import 'package:flutter/material.dart';
import 'facebook_event_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook Event SDK Demo',
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
  final FacebookEventSDK _sdk = FacebookEventSDK.instance;

  @override
  void initState() {
    super.initState();
    _sdk.initialize();
  }

  Future<void> _trackRegistration() async {
    await _sdk.trackRegistration();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration event sent')),
      );
    }
  }

  Future<void> _trackMoneyTransfer() async {
    await _sdk.trackMoneyTransfer();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Money transfer event sent')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FB SDK Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _trackRegistration,
              child: const Text('Track Registration Event'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _trackMoneyTransfer,
              child: const Text('Track Money Transfer Event'),
            ),
          ],
        ),
      ),
    );
  }
}
