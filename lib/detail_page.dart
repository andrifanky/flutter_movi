import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movi/config/styles/styles.dart';
import 'package:flutter_movi/main.dart';
import 'package:flutter_movi/widgets/cast.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.title
  });

  final String title;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  bool _favoriteStatus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    final themeMode = Provider.of<ThemeNotifier>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops:  const [0.6, 1],
                    colors: <Color>[
                      Colors.transparent,
                      themeMode.darkMode ? darkColor : whiteColor
                    ],
                  ),
                ),
                child: Hero(
                  tag: 'topMovieHero_${widget.title}',
                  child: Image.asset('assets/images/cover/the_witcher_cover.png',
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.8,
                    fit: BoxFit.cover
                  ),
                )
              ),
              Positioned(
                top: 50,
                left: 0,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(CupertinoIcons.chevron_left_circle_fill, color: whiteColor, size: 30)
                )
              ),
            ],
          ),
          const SizedBox(height: 25),
          Align(
            alignment: Alignment.center,
            child: Text('The Witcher 2021', style: poppins26SemiBold)
          ),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.center,
            child: Text('Sci-Fiction', style: poppinsMedium.copyWith(color: greyColor))
          ),
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star_rounded, color: yellowColor),
              Icon(Icons.star_rounded, color: yellowColor),
              Icon(Icons.star_rounded, color: yellowColor),
              Icon(Icons.star_rounded, color: yellowColor),
              Icon(Icons.star_half_rounded, color: yellowColor)
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: yellowColor,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: IconButton(
                  onPressed: () {},
                  color: whiteColor,
                  icon: const Icon(Icons.play_arrow_rounded)
                ),
              ),
              const SizedBox(width: 15),
              Container(
                decoration: BoxDecoration(
                  color: _favoriteStatus ? yellowColor :greyColor,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _favoriteStatus = !_favoriteStatus;
                    });
                  },
                  color: whiteColor,
                  icon: const Icon(Icons.favorite_rounded)
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          cast(),
        ],
      ),
    );
  }

  Widget cast() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: defaultMargin, top: defaultMargin, right: defaultMargin),
          child: Text('Cast', style: poppins18SemiBold),
        ),
        const SizedBox(height: 5),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            children: [
              Cast(image:'assets/images/cast/henry_cavill_cast.png', name: 'Henry Cavill', castName: 'Geralt'),
              Cast(image:'assets/images/cast/freeya_alan_cast.png', name: 'Freeya Alan', castName: 'Ciri')
            ],
          ),
        )
      ],
    );
  }
}
