import 'package:flutter/material.dart';
import 'package:flutter_movi/config/styles/styles.dart';

class Cast extends StatelessWidget {
  const Cast({
    super.key,
    required this.image,
    required this.name,
    required this.castName
  });

  final String image;
  final String name;
  final String castName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 220,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: greyColor.withOpacity(0.5)
        ),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(image)
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(name, style: poppinsSemiBold, overflow: TextOverflow.ellipsis)
                    )
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(castName, style: poppinsMedium.copyWith(color: greyColor))
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
