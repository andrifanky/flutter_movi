import 'package:flutter/material.dart';
import 'package:flutter_movi/config/styles/styles.dart';

class BottomNavBarButton extends StatelessWidget {
  const BottomNavBarButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap
  });

  final String icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          onTap();
        },
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 60,
          width: 60,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Image.asset(icon, color: color)
              ),
              const SizedBox(height: 2),
              Text(label, style: poppins12SemiBold.copyWith(color: color))
            ],
          ),
        ),
      ),
    );
  }
}
