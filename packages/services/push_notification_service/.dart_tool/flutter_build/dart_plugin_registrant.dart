//
// Generated file. Do not edit.
// This file is generated from template in file `flutter_tools/lib/src/flutter_plugins.dart`.
//

// @dart = 3.10

import 'dart:io'; // flutter_ignore: dart_io_import.
import 'package:flutter_local_notifications/flutter_local_notifications.dart' as flutter_local_notifications;
import 'package:flutter_local_notifications/flutter_local_notifications.dart' as flutter_local_notifications;
import 'package:flutter_local_notifications_linux/flutter_local_notifications_linux.dart' as flutter_local_notifications_linux;
import 'package:flutter_local_notifications/flutter_local_notifications.dart' as flutter_local_notifications;

@pragma('vm:entry-point')
class _PluginRegistrant {

  @pragma('vm:entry-point')
  static void register() {
    if (Platform.isAndroid) {
      try {
        flutter_local_notifications.AndroidFlutterLocalNotificationsPlugin.registerWith();
      } catch (err) {
        print(
          '`flutter_local_notifications` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isIOS) {
      try {
        flutter_local_notifications.IOSFlutterLocalNotificationsPlugin.registerWith();
      } catch (err) {
        print(
          '`flutter_local_notifications` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isLinux) {
      try {
        flutter_local_notifications_linux.LinuxFlutterLocalNotificationsPlugin.registerWith();
      } catch (err) {
        print(
          '`flutter_local_notifications_linux` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isMacOS) {
      try {
        flutter_local_notifications.MacOSFlutterLocalNotificationsPlugin.registerWith();
      } catch (err) {
        print(
          '`flutter_local_notifications` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isWindows) {
    }
  }
}
