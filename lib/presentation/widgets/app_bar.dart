import 'package:animate_do/animate_do.dart';
import 'package:app_restaurant_flutter/core/utils/routes.dart';
import 'package:app_restaurant_flutter/data/sources/local_source/user_data_source.dart';
import 'package:flutter/material.dart';

Widget appBar(BuildContext context, bool back) {
  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
      color: Colors.white60,
    ),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: InkWell(
                    onTap: (){
                      routes.openHistoryScreen(context);
                    },
                    child: FadeInLeft(
                        delay: const Duration(milliseconds: 150),
                        duration: const Duration(milliseconds: 350),
                        child: const Icon(Icons.history, color: Colors.blueAccent, size: 20))
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                    onTap: (){
                      prefs.user = "0";
                      routes.openLoginScreen(context);
                    },
                    child: FadeInRight(
                        delay: const Duration(milliseconds: 150),
                        duration: const Duration(milliseconds: 350),
                        child: const Icon(Icons.logout, color: Colors.blueAccent, size: 20))
                ),
              ),
            ],
          ),
        ),
        const Center(
          child: Image(
            image: AssetImage('assets/images/ic_logo.png'),
            height: 35, width: 35, fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.black38,
            width: MediaQuery.of(context).size.width,
            height: 1,
          ),
        )
      ],
    ),
  );
}