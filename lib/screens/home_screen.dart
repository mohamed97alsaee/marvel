import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marvel/helpers/consts.dart';
import 'package:marvel/models/movie_model.dart';
import 'package:marvel/widgets/custom_icon_button.dart';
import 'package:marvel/widgets/movie_card.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List<MovieModel> movies = [];
  fetchMovies() {
    setState(() {
      isLoading = true;
    });
    http
        .get(Uri.parse("https://mcuapi.herokuapp.com/api/v1/movies"))
        .then((response) {
      if (response.statusCode == 200) {
        var decodeData = json.decode(response.body)['data'];
        for (var x in decodeData) {
          movies.add(MovieModel.fromJson(x));
        }

        setState(() {});
        print(response.body);
      } else {
        print(response.body);
      }
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black45),
          actions: [
            CustomIconButton(
              asset: 'assets/icons/heart_outlined.png',
              onTap: () {},
            ),
            CustomIconButton(
              asset: 'assets/icons/dm.png',
              onTap: () {},
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset(
            "assets/marvel_logo.png",
            width: size.width * 0.2,
          ),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                color: mainColor,
              ))
            : GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: movies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.65),
                itemBuilder: (context, index) {
                  return MovieCard(
                    movie: movies[index],
                  );
                }));
  }
}
