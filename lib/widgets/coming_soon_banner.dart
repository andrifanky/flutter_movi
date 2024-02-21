import 'package:flutter/material.dart';
import 'package:flutter_movi/config/styles/styles.dart';

class ComingSoonBanner extends StatelessWidget {
  const ComingSoonBanner({
    super.key,
    required this.banner,
    required this.title,
    required this.releaseDate
  });

  final String banner;
  final String title;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(defaultRadius),
            child: Image.asset(banner, height: 150, width: 300, fit: BoxFit.cover)
          ),
          const SizedBox(height: 5),
          Text(title, style: poppins18SemiBold),
          Text(releaseDate, style: poppinsMedium.copyWith(color: greyColor))
        ],
      ),
    );
  }
}
