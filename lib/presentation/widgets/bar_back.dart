import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

Widget barBack(BuildContext context) {
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
                      Navigator.pop(context);
                    },
                    child: FadeIn(
                        delay: const Duration(milliseconds: 150),
                        duration: const Duration(milliseconds: 350),
                        child: const Icon(Icons.arrow_back_ios, color: Colors.blueAccent, size: 20))
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