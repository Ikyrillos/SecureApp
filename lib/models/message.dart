// import 'package:secure/utils/crypto.dart';
// import 'package:secure/utils/helpers.dart';

import 'package:secure/utils/crypto.dart';
import 'package:secure/utils/helpers.dart';

class Message {
  String message;
  String id;
 late String decryptedMsg;
  Message({required this.message, required this.id}) {
    decryptedMessage(message);
  }

  factory Message.fromJson(json) {
    return Message(
      message: json["message"],
      id: json['id'],
    );
  }

  Future<String> decryptedMessageAlgorithm(msg) async {
    var dycrptor = await Crypt().decrypt(msg, CryptoKeys.parsePrivateKey());

    return dycrptor;
  }

  Future<String?> decryptedMessage(msg) async {
    decryptedMsg = await decryptedMessageAlgorithm(msg);
    return decryptedMsg;
  }
}
