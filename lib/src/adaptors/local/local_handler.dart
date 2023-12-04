import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../constants/categories/local_category.dart';
export '../../constants/categories/local_category.dart';

class LocalHandler {
  LocalHandler() {
    saveKey();
  }

  //one secure key is generated to use
  late final String _secureKey;

  Future<void> saveKey() async {
    await Hive.initFlutter();
    const secureStorage = FlutterSecureStorage();
    if (await secureStorage.read(
          key: LocalCategory.secureKey,
        ) ==
        null) {
      _secureKey = json.encode(Hive.generateSecureKey());
      await secureStorage.write(
        key: LocalCategory.secureKey,
        value: _secureKey,
      );
    } else {
      _secureKey = await secureStorage.read(
            key: LocalCategory.secureKey,
          ) ??
          '';
    }
  }

  Future<void> write({
    required String key,
    required dynamic value,
  }) async {
    try {
      List<int> encryptionKey = (json.decode(
        _secureKey,
      ) as List<dynamic>)
          .cast<int>();
      final encryptedBox = await Hive.openBox(
        LocalCategory.secureBox,
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
      if (encryptedBox.isOpen) {
        await encryptedBox.put(key, value);
        await encryptedBox.close();
      }
    } on Exception catch (e) {
      Logger().e(e.toString());
    }
  }

  Future<dynamic> read({
    required String key,
  }) async {
    try {
      List<int> encryptionKey =
          (json.decode(_secureKey) as List<dynamic>).cast<int>();
      //use secure key to open the box
      final encryptedBox = await Hive.openBox(
        LocalCategory.secureBox,
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
      //get data and return
      if (encryptedBox.isOpen) {
        dynamic value = await encryptedBox.get(key);
        await encryptedBox.close();
        return value;
      } else {
        return null;
      }
    } on Exception catch (e) {
      Logger().e(e.toString());
      return null;
    }
  }

  Future<void> delete({
    required String key,
  }) async {
    try {
      List<int> encryptionKey =
          (json.decode(_secureKey) as List<dynamic>).cast<int>();
      //use secure key to open the box
      final encryptedBox = await Hive.openBox(
        LocalCategory.secureBox,
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
      if (encryptedBox.isOpen) {
        await encryptedBox.delete(key);
        await encryptedBox.close();
      }
    } on Exception catch (e) {
      Logger().e(e.toString());
    }
  }
}
