import 'package:dartz/dartz.dart';
import 'package:marvels/app/detail/data/models/character_data.dart';
import 'package:marvels/app/detail/data/models/result_model.dart';
import 'package:marvels/app/detail/domain/repositories/detail_repository.dart';
import 'package:marvels/helper/http_crypto_utils.dart';
import 'package:http/http.dart' as http;

class DetailRepositoryImp extends DetailRepository {
  var uri = "gateway.marvel.com:443";

  @override
  Future<Either<CharacterData, String>> getCharacterComics(String id) async {
    try {
      var crpto = HttpCryptoUtils.getHashMd5AndTs();
      var url = Uri.https(uri, "v1/public/characters/$id/comics", {
        'apikey': HttpCryptoUtils.primary,
        'hash': crpto[0],
        'ts': crpto[1],
      });

      var response = await http.get(url);
      if ([200].contains(response.statusCode)) {
        var ret = resultModelFromJson(response.body);
        return Left(ret.data!);
      } else {
        return const Right("Error :: ");
      }
    } catch (e) {
      print('Response Error: ${e.toString()}');
      return const Right("Error :: ");
    }
  }

  @override
  Future<Either<CharacterData, String>> getCharacterEvents(String id) async {
    try {
      var crpto = HttpCryptoUtils.getHashMd5AndTs();
      var url = Uri.https(uri, "v1/public/characters/$id/events", {
        'apikey': HttpCryptoUtils.primary,
        'hash': crpto[0],
        'ts': crpto[1],
      });

      var response = await http.get(url);
      if ([200].contains(response.statusCode)) {
        var ret = resultModelFromJson(response.body);
        return Left(ret.data!);
      } else {
        return const Right("Error :: ");
      }
    } catch (e) {
      print('Response Error: ${e.toString()}');
      return const Right("Error :: ");
    }
  }

  @override
  Future<Either<CharacterData, String>> getCharacterSeries(String id) async {
    try {
      var crpto = HttpCryptoUtils.getHashMd5AndTs();
      var url = Uri.https(uri, "v1/public/characters/$id/series", {
        'apikey': HttpCryptoUtils.primary,
        'hash': crpto[0],
        'ts': crpto[1],
      });

      var response = await http.get(url);
      if ([200].contains(response.statusCode)) {
        var ret = resultModelFromJson(response.body);
        return Left(ret.data!);
      } else {
        return const Right("Error :: ");
      }
    } catch (e) {
      print('Response Error: ${e.toString()}');
      return const Right("Error :: ");
    }
  }

  @override
  Future<Either<CharacterData, String>> getCharacterStories(String id) async {
    try {
      var crpto = HttpCryptoUtils.getHashMd5AndTs();
      var url = Uri.https(uri, "v1/public/characters/$id/stories", {
        'apikey': HttpCryptoUtils.primary,
        'hash': crpto[0],
        'ts': crpto[1],
      });

      var response = await http.get(url);
      if ([200].contains(response.statusCode)) {
        var ret = resultModelFromJson(response.body);
        return Left(ret.data!);
      } else {
        return const Right("Error :: ");
      }
    } catch (e) {
      print('Response Error: ${e.toString()}');
      return const Right("Error :: ");
    }
  }
}
