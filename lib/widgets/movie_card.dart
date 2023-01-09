import 'package:flutter/material.dart';
import 'package:movie_app/model/movie/index.dart';
import 'package:movie_app/screens/movieDetail.dart';
import 'package:movie_app/widgets/my_dialog.dart';

class MovieCard extends StatelessWidget {
  final MovieModel data;
  const MovieCard(this.data, {super.key});

  void _onCardTap(BuildContext context) {
    // showDialog(
    //     // useSafeArea: false,
    //     context: context,
    //     builder: (context) => myDialog(data));
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => MovieDetailPage(data)));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 3 - 20;
    return InkWell(
        onTap: () => _onCardTap(context),
        child: Column(
          children: [
            Container(
              height: width * 1.5,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                    image: NetworkImage(data.imgUrl), fit: BoxFit.fill),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              width: width,
              child: Text(
                data.title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white.withOpacity(0.8)),
              ),
            )
          ],
        ));
  }
}
