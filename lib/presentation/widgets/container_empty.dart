import 'package:animate_do/animate_do.dart';
import 'package:app_restaurant_flutter/core/utils/strings.dart';
import 'package:app_restaurant_flutter/presentation/widgets/text_label_custom.dart';
import 'package:flutter/material.dart';

Widget containerEmpty(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: FadeIn(
      delay: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 400),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage('assets/images/ic_no_results.png'),
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover
              ),
              const SizedBox(height: 20,),
              textLabelCustom(Strings.viewEmpty, TextAlign.center,
                  Colors.black54, 20, FontWeight.bold)
            ],
          ),
        ),
      ),
    ),
  );
}