import 'package:flutter/material.dart';
import 'package:food_app/widgets/recipe_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Food Delivery App'),
          ],
        ),
      ),
      body: RecipeCard(
          title: 'Tacos',
          cookTime: '12 minuttes',
          rating: '3',
          thumbnailUrl:
              'https://res.cloudinary.com/dqaerysgb/image/upload/v1635360680/mexico_h9dcjv.jpg'),
    );
  }
}
