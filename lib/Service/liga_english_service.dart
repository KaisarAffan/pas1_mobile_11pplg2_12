import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg2_12/Models/liga_english_model.dart';

class LigaEnglishApiService {
  final String baseUrl = 'https://www.thesportsdb.com';

  Future<List<LigaEnglishModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(
        '$baseUrl/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League'));

    if (response.statusCode == 200) {
      List data = json.decode(response.body)['teams'];
      return data.map((json) => LigaEnglishModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
