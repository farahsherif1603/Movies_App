import 'package:flutter/material.dart';
import 'package:movies_app/BrowserPage.dart';
import 'package:movies_app/detailsfilm.dart';
import 'package:movies_app/search.dart';
import 'package:movies_app/watchList.dart';
import 'package:url_launcher/url_launcher.dart';
import 'InkWellCard.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomeContent(),
    SearchScreen(),
    BrowseScreen(),
    WatchlistPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Watchlist',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Images/Image12.png'),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 2,
                  left: 10,
                  child: Image.asset('Images/Image.png'),
                ),
                Positioned(
                  bottom: 155,
                  left: 1,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), backgroundColor: Colors.transparent),
                    child: Icon(
                      Icons.add,
                      color: Colors.white54,
                    ),
                  ),
                ),



                Positioned(bottom:-1 ,left:95,child:  ElevatedButton(
                    onPressed: () {Navigator.pushNamed(context,'details' );},
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), backgroundColor: Colors.transparent),
                    child: Icon(
                      Icons.question_mark_rounded,color: Colors.cyan,))),
                 Positioned(
                  bottom: 0,
                  left: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dora and the Lost City of Gold',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '2019 PG-13 2h 7m',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      const url = 'https://www.youtube.com/watch?v=your_video_id'; // Replace with your YouTube video link
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    onHighlightChanged: (isHighlighted) {
                      setState(() {
                        _isPlaying = isHighlighted;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: _isPlaying
                            ? [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: Offset(0, 4),
                          ),
                        ]
                            : [],
                      ),
                      child: Icon(
                        Icons.play_circle_outline,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'New Releases',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 15),
                Inkwellcard(image: "Images/Image.png", rating:5.6, title: "dora and the city", year: "2019", duration: "2054")
                ,Inkwellcard(image: 'Images/f8b938401308eabc48c30669869eeac8@2x.png', rating:5.6, title: "dora and the city", year: "2019", duration: "2054")
                ,Inkwellcard(image: 'Images/3.png', rating:5.6, title: "dora and the city", year: "2019", duration: "2054")
                ,Inkwellcard(image: 'Images/Image12.png', rating:5.6, title: "dora and the city", year: "2019", duration: "2054")
,


                SizedBox(width: 8),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Recommended',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 270, // Increase height for the movie cards
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Inkwellcard(image: 'Images/d09cbedd39d8c74b576632e50de5c3d3.png',rating: 7.7,title: 'DeadPool',year: '2018',duration: '',),
                Inkwellcard(image: 'Images/d09cbedd39d8c74b576632e50de5c3d3.png',rating: 7.7,title: 'DeadPool',year: '2018',duration: '',),
                Inkwellcard(image: 'Images/d09cbedd39d8c74b576632e50de5c3d3.png',rating: 7.7,title: 'DeadPool',year: '2018',duration: '',),
                Inkwellcard(image: 'Images/f8b938401308eabc48c30669869eeac8@2x.png',rating: 7.7,title: 'DeadPool',year: '2018',duration: '',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
