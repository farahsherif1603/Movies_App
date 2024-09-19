import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'InkWellCard.dart';

class Detailsfilm extends StatefulWidget {
  static const String routeName = 'details';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Detailsfilm> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomeContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
      appBar: AppBar(
        backgroundColor: Color(0xff121312),
        title: Text(
          'Dora and the Lost City of Gold',
          style: TextStyle(color: Colors.white),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: pages[selectedIndex],
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
            height: 220,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Images/Image12.png'), // Ensure this path is correct
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: InkWell(
                onTap: () async {
                  const url =
                      'https://www.youtube.com/watch?v=your_video_id'; // Replace with your YouTube video link
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
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dora and the Lost City of Gold',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '2019  PG-13  2h 7m',
                  style: TextStyle(
                    color: Colors.white30,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 180,
                  child: Image.asset(
                    'Images/Image12.png', // Ensure this path is correct
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dora and the Lost City of Gold',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 20),
                          SizedBox(width: 4),
                          Text(
                            '7.7',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            color: Color(0xff282A24),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Recommended',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Container(
            color: Color(0xff282A24),
            height: 300, // Increase height for the movie cards
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Inkwellcard(image: 'Images/Image.png',rating: 7.7,title: 'DeadPool',year: '2018',duration: '',),
                Inkwellcard(image: 'Images/f8b938401308eabc48c30669869eeac8@2x.png',rating: 7.7,title: 'DeadPool',year: '2018',duration: '',),
                Inkwellcard(image: 'Images/Image.png',rating: 7.7,title: 'DeadPool',year: '2018',duration: '',),
                Inkwellcard(image: 'Images/Image.png',rating: 7.7,title: 'DeadPool',year: '2018',duration: '',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
