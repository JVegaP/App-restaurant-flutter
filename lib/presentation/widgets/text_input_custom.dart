import 'package:flutter/material.dart';

class TextInputCustom extends StatelessWidget {
  const TextInputCustom({
    Key? key,
    required this.placeHolder,
    required this.controller,
    this.isPassword = false,
    this.onChanged,
    this.keyboard,
    this.validationText,
    this.width,
  }) : super(key: key);

  final String placeHolder;
  final bool isPassword;
  final TextEditingController controller;
  final Function(String value)? onChanged;
  final TextInputType? keyboard;
  final String? validationText;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          cursorColor: Colors.black,
          controller: controller,
          obscureText: isPassword,
          enableSuggestions: !isPassword,
          autocorrect: !isPassword,
          onChanged: onChanged,
          keyboardType: keyboard ?? TextInputType.text,
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * .75,
              maxHeight: 40,
            ),
            fillColor: Colors.white70,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black54,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            hintStyle: const TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            hintText: placeHolder,
          ),
        ),
        validationText != ""
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .70,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.error,
                        size: 20,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: Text(
                          validationText??"",
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
