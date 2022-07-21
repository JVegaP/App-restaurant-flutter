import 'package:app_restaurant_flutter/presentation/widgets/text_label_custom.dart';
import 'package:flutter/material.dart';

Widget buttonCustom(
    BuildContext context,
    String text,
    Color color,
    Function function) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Center(
        child: textLabelCustom(
            text,
            TextAlign.center,
            Colors.white,
            14,
            FontWeight.bold),
      ),
    ),
  );
}