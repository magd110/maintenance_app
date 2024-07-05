import 'package:flutter_secure_storage/flutter_secure_storage.dart';

FlutterSecureStorage? storage;

Future<void> initStorageToken() async {
  // Create storage
  storage = const FlutterSecureStorage();
}

Future<void> setToken({required String token}) async{
  // Write value
await storage!.write(key: 'token', value: token);
}
