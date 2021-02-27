import 'dart:convert';
import 'package:network_api_2/model/movies_model.dart';
import 'package:http/http.dart' as http;

class FetchAPI {
  String _Base_API = 'https://api.themoviedb.org/3/movie';
  String _api_Key = 'aaf3decbaecbf5d170b7b6344cc2f5cf';

  ///   https://api.themoviedb.org/3/movie/popular?api_key=aaf3decbaecbf5d170b7b6344cc2f5cf
  List<MoviesModel> movieList = [];
  String type = 'popular';
  Future<List<MoviesModel>> getMovie(String type) async {


    String _url = '$_Base_API/$type?api_key=$_api_Key';

    final http.Response response = await http.get(_url);
movieList.clear();
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var item in body["results"]) {
        movieList.add(MoviesModel.fromJson(item));
      }
      print("bodyyy $body");
      print("type is ; $type");
      print(movieList[3].title);
      return movieList;
    } else {
      print('error');
    }

    return null;
  }

  Future<List<MoviesModel>> getInfoMovie() async {
    String _url = '$_Base_API/$type?api_key=$_api_Key';

    final http.Response response = await http.get(_url);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var item in body["results"]) {
        movieList.add(MoviesModel.fromJson(item));
      }
      return movieList;
    } else {
      print('error');
    }

    return null;
  }
}
