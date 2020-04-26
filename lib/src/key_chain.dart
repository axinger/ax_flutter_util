import 'dart:async';
import 'util_const.dart';

class KeyChain {
  static Future<dynamic> get(
    String key,
  ) async {
    dynamic result = await commonMethodChannel.invokeMethod<dynamic>(
      'key_chain_get',
      <String, dynamic>{
        'key': key,
      },
    );
    return result;
  }

  static Future set(String key, dynamic value) async {
    bool result = await commonMethodChannel.invokeMethod<bool>(
      'key_chain_set',
      <String, dynamic>{
        'key': key,
        'value': value,
      },
    );
    return result;
  }

  static Future<dynamic> remove(
    String key,
  ) async {
    dynamic result = await commonMethodChannel.invokeMethod<dynamic>(
      'key_chain_remove',
      <String, dynamic>{
        'key': key,
      },
    );
    return result;
  }
}
