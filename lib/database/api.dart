import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:food_app/models/recipe.dart';

class RecipeApi {
  // static Future<List<Recipe>> getRecipe() async {
  //   final uri = Uri.https("https://yummly2.p.rapidapi.com", "/feeds/list", {
  //     "limit": "24",
  //     "start": "0",
  //   });
  //   final response = await http.get(uri, headers: {
  //     'X-RapidAPI-Key': 'bae6f426f5msh285e366f58bc062p1884cdjsn719f1d588f94',
  //     'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
  //   });
  //   if (response.statusCode == 200) {
  //     Map result = jsonDecode(response.body);
  //     List recipes = [];
  //     for (var recipe in result['feed']) {
  //       recipes.add(recipe['content']['details']);
  //     }
  //     // return Recipe.recipesFromSnapshot(recipes);
  //   } else {
  //     throw Exception('Failed to load recipe');
  //   }
  // }
}
