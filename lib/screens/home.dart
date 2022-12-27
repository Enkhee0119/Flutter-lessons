import 'package:flutter/material.dart';
import 'package:movie_app/screens/movies.dart';
import 'package:movie_app/screens/profile.dart';
import 'package:movie_app/screens/wishlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;
  List<Widget> _totalPage = [MoviesPage(), WishListPage(), ProfilePage()];

  void setCurrenIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff36393f),
      body: SafeArea(
        /* safeArea нь notch-н доороос эхлүүлэх widget */
        child: _totalPage[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: setCurrenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Кино",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Дуртай",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Профайл",
          )
        ],
      ),
    );
  }
}
