import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper {
  FlutterSecureStorage storage = FlutterSecureStorage();
  static final instance = StorageHelper();

  Future<void> saveToken(token) async {
    await storage.write(key: "token", value: token);
  }

  Future getToken() async {
    var token = await storage.read(key: "token");
    return token;
  }

  Future<void> saveId(id) async {
    await storage.write(key: "id", value: id.toString());
  }

  Future getId() async {
    var id = await storage.read(key: "id");
    return id;
  }

  Future<void> savePhone(userphone) async {
    var phone = await storage.write(key: "phone", value: userphone);
    return phone;
  }

  Future getPhone() async {
    var phone = await storage.read(key: "phone");
    return phone;
  }

  Future<void> saveNotifi(notifiList) async {
    var phone =
        await storage.write(key: "notifi", value: json.encode(notifiList));
    return phone;
  }

  Future getNotifi() async {
    var phone = await storage.read(key: "notifi");
    return phone;
  }

  Future<void> deleteStorage() async {
    await storage.deleteAll();
  }
}
