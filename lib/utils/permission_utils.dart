import 'package:permission_handler/permission_handler.dart';

class TmPermissionUtils {
  static Future<bool> requestStoragePermission() async {
    return await Permission.storage.request() == PermissionStatus.granted;
  }

  static Future<bool> requestCameraPermission() async {
    return await Permission.camera.request() == PermissionStatus.granted;
  }

  /// We will add in the future methods to help show errors ou warnings about permissions, as soon as the designs are available it will be added here

}
