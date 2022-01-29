import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'router_service.dart';
import 'local_storage.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  final RouterService _routerService = RouterService();
  final LocalStorageService _localStorage = LocalStorageService();
  Future initialise() async {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }
    _fcm.configure(
        onMessage: (Map<String, dynamic> message) async {
          Map<String, dynamic> arguments = {};

          Map<String, dynamic> data = message['data'];
          if (data.containsKey('argument')) {
            if (data.containsKey('value')) {
              arguments[data['argument']] = data['value'];
            }
          }
          _routerService.navigationKey.currentState
              .pushReplacementNamed('${data['route']}', arguments: arguments);
        },
        onLaunch: (Map<String, dynamic> message) async {
          Map<String, dynamic> arguments = {};
          Map<String, dynamic> data = message['data'];
          if (data.containsKey('argument')) {
            if (data.containsKey('value')) {
              arguments[data['argument']] = data['value'];
            }
          }
          _routerService.navigationKey.currentState
              .pushReplacementNamed('${data['route']}', arguments: arguments);
        },
        onResume: (Map<String, dynamic> message) async {
          Map<String, dynamic> arguments = {};

          Map<String, dynamic> data = message['data'];
          if (data.containsKey('argument')) {
            if (data.containsKey('value')) {
              arguments[data['argument']] = data['value'];
            }
          }
          _routerService.navigationKey.currentState
              .pushReplacementNamed('${data['route']}', arguments: arguments);
        },
        onBackgroundMessage: _myBackgroundMessageHandler);
  }

  static Future<dynamic> _myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    final RouterService _routerService = RouterService();
    if (message.containsKey('data')) {
      // Handle data message
      Map<String, dynamic> arguments = {};
      Map<String, dynamic> data = message['data'];
      if (data.containsKey('argument')) {
        if (data.containsKey('value')) {
          arguments[data['argument']] = data['value'];
        }
      }
      _routerService.navigationKey.currentState
          .pushReplacementNamed('${data['route']}', arguments: arguments);
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }
  }

  Future subscribeToTopic({String topic}) async {
    await _fcm.subscribeToTopic(topic);
  }

  Future unsubscribeFromTopic({String topic}) async {
    await _fcm.unsubscribeFromTopic(topic);
  }

  Future<String> getToken() async {
    final String token = await _fcm.getToken();
    return token;
  }
}
