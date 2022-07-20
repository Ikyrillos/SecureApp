import 'dart:convert';
import 'dart:typed_data';
import 'package:basic_utils/basic_utils.dart';
import 'package:pointycastle/asymmetric/pkcs1.dart';
import 'package:pointycastle/asymmetric/rsa.dart';
import 'package:secure/utils/helpers.dart';

class Crypt {
  /// getting public and private keys from the CryptoKeys class
  final publicKey = CryptoKeys.parsePublicKey();
  final privateKey = CryptoKeys.parsePrivateKey();  

  Future<String> encrypt(String plaintext, Future<RSAPublicKey> publicKey) async {
    /// Initializing Cipher
    var cipher =  PKCS1Encoding(RSAEngine());
     cipher.init(true, PublicKeyParameter<RSAPublicKey>(await publicKey));

    /// Converting into a [Unit8List] from List<int>
    /// Then Encoding into Base64
    Uint8List output =
        cipher.process(Uint8List.fromList(utf8.encode(plaintext)));
    var base64EncodedText = base64Encode(output);
    return base64EncodedText;
  }

  // Future<String> text(String text) async {
  //   return encrypt(text, publicKey);
  // }

  Future<String> decrypt(Object? cipherText, Future<RSAPrivateKey> privateKey)  async {
    /// Initializing Cipher
    var cipher = PKCS1Encoding(RSAEngine());
    cipher.init(false, PrivateKeyParameter<RSAPrivateKey>(await privateKey));

    /// Converting into a [Unit8List] from List<int>
    /// Then Decoding into Base64
    Uint8List output =
        cipher.process(Uint8List.fromList(base64Decode(cipherText as String)));
    var base64EncodedText = utf8.decode(output);
    return base64EncodedText;
  }
}
