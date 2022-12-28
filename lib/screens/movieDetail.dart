import 'package:flutter/material.dart';
import 'package:movie_app/model/movie/index.dart';
import 'package:provider/provider.dart';

import '../providers/common.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieModel data;
  const MovieDetailPage(this.data, {super.key});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!Provider.of<CommonProvider>(context, listen: false).isLoggedIn) {
        Provider.of<CommonProvider>(context, listen: false).changeCurrentIdx(2);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Нэвтэрнэ үү")));
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Consumer<CommonProvider>(
      builder: (context, provider, child) {
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
                        widget.data.imgUrl,
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
                              color: Colors.white.withOpacity(0.6),
                              size: 50,
                            ),
                            SizedBox(height: 20),
                            Text(
                              widget.data.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "${widget.data.publishedYear}он |${widget.data.durationMin}мин |${widget.data.type}",
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
                      )),
                      SafeArea(
                          child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(
                            provider.isWishMovie(widget.data)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () => provider.addWishList(widget.data.id),
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
                      widget.data.description ?? "",
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
      },
    );
  }
}
