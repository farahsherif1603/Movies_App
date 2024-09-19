import 'package:flutter/material.dart';

// Movie class definition
class Movie {
  final String title;
  final String imagePath;

  Movie({required this.title, required this.imagePath});
}

class SearchScreen extends StatefulWidget {
  static const String routeName = 'searchPage';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = '';
  List<Movie> filteredMovies = [];
  List<Movie> allMovies = [];

  @override
  void initState() {
    super.initState();
    // Initialize with your list of movies here
    allMovies = [
      Movie(title: 'Inception', imagePath: 'Images/f8b938401308eabc48c30669869eeac8@2x.png'),
      Movie(title: 'Avatar', imagePath: 'Images/f8b938401308eabc48c30669869eeac8@2x.png'),
      // Add more movies as needed
    ];
  }

  void _filterMovies() {
    setState(() {
      filteredMovies = allMovies
          .where((movie) =>
          movie.title.toLowerCase().contains(searchText))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          onChanged: (value) {
            setState(() {
              searchText = value.toLowerCase();
              _filterMovies();
            });
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.white),
            filled: true,
            fillColor: Colors.grey[900],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: searchText.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_movies_rounded,color: Colors.white,
                size: 150),
            SizedBox(height: 20),
            Text(
              'No movies found',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      )
          : filteredMovies.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_movies_sharp,
              color: Colors.white,
              size: 100, // Adjust the size as needed

            ),
              SizedBox(height: 15),

          ],
        ),
      )
          : ListView.builder(
        itemCount: filteredMovies.length,
        itemBuilder: (context, index) {
          final movie = filteredMovies[index];
          return ListTile(
            leading: Image.asset(movie.imagePath),
            title: Text(
              movie.title,
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),

    )
    ;
  }
}
