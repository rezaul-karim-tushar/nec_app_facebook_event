import 'package:facebook_app_events/facebook_app_events.dart';

/// Facebook Event SDK for tracking Registration and Money Transfer events
class FacebookEventSDK {
  static FacebookEventSDK? _instance;
  static FacebookEventSDK get instance {
    _instance ??= FacebookEventSDK._internal();
    return _instance!;
  }

  FacebookEventSDK._internal();

  final FacebookAppEvents _facebookAppEvents = FacebookAppEvents();

  /// Initialize the SDK - logs app activation event
  Future<void> initialize() async {
    try {
      await _facebookAppEvents.logEvent(name: 'fb_mobile_activate_app');
    } catch (e) {
      throw Exception('Failed to initialize Facebook Event SDK: $e');
    }
  }

  /// Track Registration Event (fb_mobile_complete_registration)
  Future<void> trackRegistration() async {
    try {
      await _facebookAppEvents.logEvent(
        name: 'fb_mobile_complete_registration',
      );
    } catch (e) {
      throw Exception('Failed to track registration event: $e');
    }
  }

  /// Track Money Transfer Event (SendMoneyCompleted)
  Future<void> trackMoneyTransfer() async {
    try {
      await _facebookAppEvents.logEvent(
        name: 'SendMoneyCompleted',
      );
    } catch (e) {
      throw Exception('Failed to track money transfer event: $e');
    }
  }
}

