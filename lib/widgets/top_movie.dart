import 'package:flutter/material.dart';
import 'package:flutter_movi/config/styles/styles.dart';
import 'package:flutter_movi/detail_page.dart';

class TopMovie extends StatelessWidget {
  const TopMovie({
    super.key,
    required this.cover,
    required this.title,
    required this.genre
  });

  final String cover;
  final String title;
  final String genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(title: title)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultRadius),
              child: Hero(
                tag: 'topMovieHero_$title',
                child: Image.asset(cover, height: 170, width: 120, fit: BoxFit.cover)
              )
            ),
            const SizedBox(height: 5),
            Text(title, style: poppins16Bold),
            Text(genre, style: poppinsMedium.copyWith(color: greyColor))
          ],
        ),
      ),
    );
  }
}
