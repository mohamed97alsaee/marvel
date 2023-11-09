import 'package:flutter/material.dart';
import 'package:marvel/helpers/consts.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.asset, required this.onTap});
  final String asset;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border:
                    Border.all(width: 1, color: mainColor.withOpacity(0.4))),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                asset,
                width: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
