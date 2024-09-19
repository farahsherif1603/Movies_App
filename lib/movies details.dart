import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  static const String routename = "moviesdetails";  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Title',style: TextStyle(color: Colors.white38),),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/sample_movie.jpg', fit: BoxFit.cover),
              SizedBox(height: 16),
              Text(
                'Movie Title',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Release Date: 2023-09-01',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Description of the movie goes here. This can be a long paragraph explaining the movie plot and other details.',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
