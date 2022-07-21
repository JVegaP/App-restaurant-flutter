import 'package:app_restaurant_flutter/domain/entities/history/history_entity.dart';
import 'package:app_restaurant_flutter/presentation/ui/history/widgets/item_history.dart';
import 'package:app_restaurant_flutter/presentation/widgets/container_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

Widget listHistory(BuildContext context, List<History> history) {
  return history.isEmpty ? containerEmpty(context) : AnimationLimiter(
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: history.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index){
          return AnimationConfiguration.staggeredList(
              position: index,
              delay: const Duration(milliseconds: 100),
              duration: const Duration(milliseconds: 350),
              child: SlideAnimation(
                  verticalOffset: 50.0,
                  curve: Curves.decelerate,
                  child: FadeInAnimation(
                    child: itemHistory(context, history[index]),
                  )
              )
          );
        },
      )
  );
}