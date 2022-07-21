import 'package:app_restaurant_flutter/domain/entities/history/history_entity.dart';
import 'package:app_restaurant_flutter/presentation/widgets/text_label_custom.dart';
import 'package:flutter/material.dart';

Widget itemHistory(BuildContext context, History item) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.blueAccent)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textLabelCustom(
                    item.numberTransaction,
                    TextAlign.start,
                    Colors.black,
                    16,
                    FontWeight.w800
                ),
                textLabelCustom(
                    item.date,
                    TextAlign.end,
                    Colors.black87,
                    15,
                    FontWeight.w400
                )
              ],
            ),
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textLabelCustom(
                    item.description,
                    TextAlign.start,
                    Colors.black,
                    18,
                    FontWeight.w900
                ),
                textLabelCustom(
                    item.value,
                    TextAlign.start,
                    Colors.black87,
                    18,
                    FontWeight.normal
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