import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/data/model/searchReponse.dart';

class ApiManager {
  static final String _baseUrl = 'api.themoviedb.org';
  static final String _apiKey = '1b257db8dc3e1cdcf56da88d4ea73060';

  Future<Map<String, dynamic>> getMovieDetails(int movieId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/$movieId?api_key=$_apiKey'),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  Future<List<dynamic>> getSimilarMovies(int movieId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/movie/$movieId/similar?api_key=$_apiKey'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load similar movies');
    }
  }

  static Future<SearchResponse> searchMovies(String query) async {
    var headers = {
      'accept': 'application/json',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlN2MzOGFjMmFkNDZlMTNjZWRkZmJkODY4MWVmMDljNiIsIm5iZiI6MTcyNjU4MzMwMi4zMzU0NDEsInN1YiI6IjY2ZTk5MDEyMWJlY2E4Y2UwN2QyZTliYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.yfWSVG40lcpxu1MYOZOUEwY_15NdwS7JvIfDrFsEMhs'
    };
    try {
      Uri url = Uri.https(
          '${_baseUrl}', "3/search/movie", {'query':query});

      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200 && response.statusCode < 300) {
        return SearchResponse.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('Failed to load movie details: ${response.statusCode}');
      }

    } catch (e) {
      throw e;
    }
  }


  Future<List<dynamic>> getGenresList() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/genre/movie/list?api_key=$_apiKey'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['genres'];
    } else {
      throw Exception('Failed to load genres list');
    }
  }

  Future<List<dynamic>> getMoviesByGenre(int genreId) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl/discover/movie?api_key=$_apiKey&with_genres=$genreId'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load movies by genre');
    }
  }

}
