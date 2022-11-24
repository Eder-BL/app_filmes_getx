import 'package:app_filmes/application/ui/theme_extensions.dart';
import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  const FilterTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      constraints: const BoxConstraints(minHeight: 30, minWidth: 100),
      decoration: BoxDecoration(
        color: context.themeRed,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Align(
        alignment: Alignment.center,
        child: Text(
          'Drama',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
