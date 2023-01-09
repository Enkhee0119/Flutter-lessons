import 'package:flutter/material.dart';
import 'package:movie_app/model/movie/index.dart';
import 'package:movie_app/screens/movieDetail.dart';
import 'package:movie_app/widgets/my_bottomsheet.dart';

class MovieSpecialCard extends StatelessWidget {
  final MovieModel data;
  const MovieSpecialCard(this.data, {super.key});
  void _onCardTap(BuildContext context) {
    // showBottomSheet(
    //     context: context, builder: (context) => MyBottomSheet(data));
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => MovieDetailPage(data)));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
        onTap: () => _onCardTap(context),
        child: Container(
          height: size.width * 0.6,
          width: size.width * 0.4,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(data.imgUrl), fit: BoxFit.fill)),
          child: Icon(
            Icons.play_circle,
            color: Colors.grey.withOpacity(0.5),
            size: 60,
          ),
        ));
  }
}
