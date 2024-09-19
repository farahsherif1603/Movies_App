import 'package:flutter/material.dart';

class BrowseScreen extends StatelessWidget {
  static const routeName = '/browse';

  final List<String> categories = [
    'Action',
    'Adventure',
    'Comedy',
    'Drama',
    'Horror',
    'Sci-Fi',
    'Thriller',
    'Fantasy',
    'Horror',
    'Sci-Fi',
    'Thriller',
    'Fantasy',
    'Horror',
    'Sci-Fi',
    'Thriller',
    'Fantasy',
    'Horror',
    'Sci-Fi',
    'Thriller',
    'Fantasy',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Browse Category',style: TextStyle(color:Colors.white ),),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            childAspectRatio: 1.5, // Adjust aspect ratio if needed
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categories[index],
              imagePath: 'assets/images/2.jpg', // Path to your image
            );
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String category;
  final String imagePath;

  CategoryCard({required this.category, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.black.withOpacity(0.5),
          child: Text(
            category,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}