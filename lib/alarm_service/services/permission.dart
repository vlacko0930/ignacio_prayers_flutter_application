import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';

class AlarmPermissions {
  static final _log = Logger('AlarmPermissions');

  static Future<void> checkNotificationPermission() async {
    final status = await Permission.notification.status;
    if (status.isDenied) {
      _log.info('Requesting notification permission...');
      final res = await Permission.notification.request();
      _log.info(
        'Notification permission ${res.isGranted ? '' : 'not '}granted',
      );
    }
  }

  static Future<void> checkAndroidExternalStoragePermission() async {
    final status = await Permission.storage.status;
    if (status.isDenied) {
      _log.info('Requesting external storage permission...');
      final res = await Permission.storage.request();
      _log.info(
        'External storage permission ${res.isGranted ? '' : 'not'} granted',
      );
    }
  }

  static Future<void> checkAndroidPhotosPermission() async {
    final status = await Permission.photos.status;
    if (status.isDenied) {
      _log.info('Requesting external photos permission...');
      final res = await Permission.photos.request();
      _log.info(
        'External photos permission ${res.isGranted ? '' : 'not'} granted',
      );
    }
  }

  static Future<void> checkAndroidExternalAudioPermission() async {
    final status = await Permission.audio.status;
    if (status.isDenied) {
      _log.info('Requesting external audio permission...');
      final res = await Permission.audio.request();
      _log.info(
        'External audio permission ${res.isGranted ? '' : 'not'} granted',
      );
    }
  }

  static Future<void> checkAndroidExternalVideosPermission() async {
    final status = await Permission.videos.status;
    if (status.isDenied) {
      _log.info('Requesting external videos permission...');
      final res = await Permission.videos.request();
      _log.info(
        'External videos permission ${res.isGranted ? '' : 'not'} granted',
      );
    }
  }

  static Future<void> checkAndroidScheduleExactAlarmPermission() async {
    final status = await Permission.scheduleExactAlarm.status;
    _log.info('Schedule exact alarm permission: $status.');
    if (status.isDenied) {
      _log.info('Requesting schedule exact alarm permission...');
      final res = await Permission.scheduleExactAlarm.request();
      _log.info(
        'Schedule exact alarm permission ${res.isGranted ? '' : 'not'} granted',
      );
    }
  }
}
