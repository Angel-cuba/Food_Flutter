import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/models/recipe.dart';
import 'package:food_app/widgets/recipe_card.dart';

import '../database/api.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> results = [];

  Future<Weather> getWeatherData() async {
    const api = '7bc304ae3b46715416aeaba2f60e8ddd';
    final response = await http.get(Uri.parse(
        'http://api.openweathermap.org/geo/1.0/direct?q=London&limit=5&appid=$api'));
    if (response.statusCode == 200) {
      results = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      return Weather.fromJson(results[0]);
    } else {
      throw Exception('Failed to load weather');
    }
  }

  late Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent.shade200,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              SafeArea(
                  top: true,
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                                'https://res.cloudinary.com/dqaerysgb/image/upload/v1635399087/Cuban-Food-1_mydd1f.jpg'),
                          ),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'What would you like to cook today?',
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    FutureBuilder<Weather>(
                      future: futureWeather,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(snapshot.data!.name!),
                              // Text(snapshot.data!.main!),
                              const SizedBox(height: 2),
                              const Text('Fetching data'),
                              // Text(snapshot.data!.wind!),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                  ]))
            ],
          ),
        ));
  }
}
