import 'package:dio/dio.dart';
import 'package:learn_bloc/constants/strings.dart';

class CharacterApi {
  late Dio dio;

  CharacterApi() {
    BaseOptions options = new BaseOptions(
      baseUrl: BaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get("character");
      return response.data["results"];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

void main() {
  final characterApi = CharacterApi();
  characterApi.getAllCharacters().then((characters) {
    print(characters);
  });
}

