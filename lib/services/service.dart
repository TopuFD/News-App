import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/model.dart';

const all_news_url =
    "https://newsapi.org/v2/everything?q=bitcoin&apiKey=aff096f7ab1b4d88b3578b87b65b160b";

const breakingNews_url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=aff096f7ab1b4d88b3578b87b65b160b";

class ComentHelper {
  Future getAllNews() async {
    var respons = await http.get(Uri.parse(all_news_url));
    try {
      if (respons.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(respons.body);
        List<dynamic> body = json["articles"];
        List<Newsmodel> airticlelist =
            body.map((item) => Newsmodel.fromJson(item)).toList();
        return airticlelist;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future getBreakingNews() async {
    var respons = await http.get(Uri.parse(breakingNews_url));
    try {
      if (respons.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(respons.body);
        List<dynamic> body = json["articles"];
        List<Newsmodel> airticlelist =
            body.map((item) => Newsmodel.fromJson(item)).toList();
        return airticlelist;
      }
    } catch (e) {
      rethrow;
    }
  }
}
