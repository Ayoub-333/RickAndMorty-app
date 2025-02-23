import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/constants/strings.dart';

class EpisodeApi {
  late Dio dio;

  EpisodeApi() {
    BaseOptions options = new BaseOptions(
      baseUrl: BaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllEpisodes() async {
    try {
      Response response = await dio.get("episode");
      return response.data["results"];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
