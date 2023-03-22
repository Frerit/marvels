import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:marvels/app/list/data/models/response_list.dart';
import 'package:marvels/app/list/domain/entities/characters_data.dart';
import 'package:marvels/app/list/domain/repositories/list_characters_repository.dart';
import 'package:marvels/helper/http_crypto_utils.dart';

class ListCharactersRepositoryImp extends ListCharactersRepository {
  @override
  Future<Either<CharactersData, String>> getCharacters(int page) async {
    var uri = "gateway.marvel.com:443";
    try {
      const limit = 20;
      var crpto = HttpCryptoUtils.getHashMd5AndTs();
      var url = Uri.https(uri, "/v1/public/characters", {
        'offset': '${page * limit}',
        'limit': '$limit',
        'apikey': HttpCryptoUtils.primary,
        'hash': crpto[0],
        'ts': crpto[1],
      });

      var response = await http.get(url);
      if ([200].contains(response.statusCode)) {
        var ret = resultChraracterFromJson(response.body);
        return Left(ret.data);
      } else {
        return const Right("Error :: ");
      }
    } catch (e) {
      print('Response Error: ${e.toString()}');
      return const Right("Error :: ");
    }
  }
}
