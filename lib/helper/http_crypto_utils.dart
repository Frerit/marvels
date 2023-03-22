import 'dart:convert';
import 'package:crypto/crypto.dart';

class HttpCryptoUtils {
  static String primary = "fea4ddbf370376865724c2b03db5ffef";

  static String getTs() {
    final timesTamp = DateTime.now().millisecondsSinceEpoch;
    return timesTamp.toString();
  }

  static List<String> getHashMd5AndTs() {
    // Por seguridad esta la guarde en una variable de entorno solo que para esta
    // prueba solo la deje aqui para que pudieran compilar
    // final secundary = dotenv.env['API_KEY'],
    const secundary = "dcca949708ec8a3a3b97cf51cacf65cd98a314c4";
    final timesTamp = getTs();
    final cryp = md5
        .convert(
          utf8.encode("$timesTamp$secundary$primary"),
        )
        .toString();
    return [cryp, timesTamp];
  }
}
