import 'package:app_restaurant_flutter/domain/entities/home/restaurant.dart';
import 'package:app_restaurant_flutter/presentation/widgets/text_label_custom.dart';
import 'package:flutter/material.dart';

Widget itemRestaurant(BuildContext context, Restaurant item) {
  return Column(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.deepPurple)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.add_location_sharp, color: Colors.deepPurple, size: 25),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textLabelCustom(
                        item.name,
                        TextAlign.start,
                        Colors.black,
                        18,
                        FontWeight.w900
                    ),
                    textLabelCustom(
                        item.city,
                        TextAlign.start,
                        Colors.black87,
                        18,
                        FontWeight.normal
                    ),
                    textLabelCustom(
                        '${item.distance.toString()} mts',
                        TextAlign.start,
                        Colors.black54,
                        16,
                        FontWeight.normal
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}