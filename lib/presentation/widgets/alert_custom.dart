import 'package:app_restaurant_flutter/core/utils/strings.dart';
import 'package:app_restaurant_flutter/presentation/widgets/button_custom.dart';
import 'package:app_restaurant_flutter/presentation/widgets/text_label_custom.dart';
import 'package:flutter/material.dart';

class AlertCustom extends StatelessWidget {
  const AlertCustom({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    _closeAlert() {
      Navigator.pop(context);
    }
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            textLabelCustom(
                title,
                TextAlign.center,
                Colors.deepPurple,
                16,
                FontWeight.bold
            ),
            const SizedBox(height: 15),
            buttonCustom(context, Strings.accept, Colors.green, _closeAlert)
          ],
        ),
      ),
    );
  }
}