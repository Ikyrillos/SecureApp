import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';
import 'package:pointycastle/pointycastle.dart';

class CryptoKeys {
  static Future<RSAPublicKey> parsePublicKey() async {
    final publicPem = await rootBundle.loadString('assets/secure/pk.pem');
    final publicKey = RSAKeyParser().parse(publicPem) as RSAPublicKey;
    return publicKey;
  }

  /// function to read the private key from the assets folder
  static Future<RSAPrivateKey> parsePrivateKey() async {
    final privatePem = await rootBundle.loadString('assets/secure/pvk.pem');
    final privateKey = RSAKeyParser().parse(privatePem) as RSAPrivateKey;
    return privateKey;
  }
}
