import 'package:flutter/material.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/model/movie/index.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel data;
  const MovieDetailPage(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 22, 22),
      body: CustomScrollView(slivers: [
        // SliverAppBar(
        //   title: Text(data.title),
        // ),
        SliverList(
            delegate: SliverChildListDelegate(
          [
            SizedBox(
              width: width,
              height: width * 1.2,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    data.imgUrl,
                    width: width,
                    fit: BoxFit.fitWidth,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.play_circle,
                          color: Colors.white.withOpacity(0.3),
                          size: 50,
                        ),
                        SizedBox(height: 20),
                        Text(
                          data.title ?? "",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "${data.publishedYear}|${data.durationMin}|${data.type}",
                          style: TextStyle(color: Color(0xffcccccc)),
                        ),
                        SizedBox(height: 50)
                      ],
                    ),
                  ),
                  SafeArea(
                      child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.chevron_left_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ))
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Тайлбар",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(height: 20),
                Text(
                  data.description ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffbbbbbb),
                  ),
                ),
                SizedBox(height: 30)
              ],
            )
          ],
        ))
      ]),
    );
  }
}
