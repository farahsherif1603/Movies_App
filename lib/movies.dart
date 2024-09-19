import 'package:flutter/material.dart';

class Movie {
  final String title;
  final String imagePath;
  final String year;

  Movie({required this.title, required this.imagePath, required this.year});
}

// Dummy data

List<Movie> newReleases = [
  Movie(title: 'Narcos', imagePath: 'assets/images/2.jpg', year: '2018'),
  Movie(title: 'Deadpool 2', imagePath: 'assets/images/f8b938401308eabc48c30669869eeac8.jpg', year: '2018'),
  Movie(title: 'Annabelle', imagePath: 'assets/images/Annabelle.jpg', year: '2019'),
  Movie(title: 'Toy Story 4', imagePath: 'assets/images/4.jpg', year: '2019'),
];

List<Movie> recommended = [
  Movie(title: 'Deadpool 2', imagePath: 'assets/images/2.jpg', year: '2018'),
  Movie(title: 'Amir 2', imagePath: 'assets/images/2.jpg', year: '2018'),
  Movie(title: 'Deadpool 2', imagePath: 'assets/images/2.jpg', year: '2018'),
  Movie(title: 'Deadpool 2', imagePath: 'assets/images/2.jpg', year: '2018'),
  Movie(title: 'Deadpool 2', imagePath: 'assets/images/2.jpg', year: '2018'),
];