import 'package:flutter_secure_storage/flutter_secure_storage.dart';

FlutterSecureStorage? storage;
 String? token;
Future<void> initStorageToken() async {
  // Create storage
  storage = const FlutterSecureStorage();
}

Future<void> setToken({required String token}) async {
  // Write value
  await storage!.write(key: 'token', value: token);
}

Future getToken() async {
  await Future.sync(() async => token = await storage!.read(key: 'token'));
}
