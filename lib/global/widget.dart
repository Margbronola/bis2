import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyWidget {
  Text text({
    String? text,
    FontWeight? fontWeight,
    double? size,
    TextAlign align = TextAlign.start,
    Color? color,
    double? letterSpacing,
  }) {
    return Text(
      text!,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: size,
        color: color,
        letterSpacing: letterSpacing,
      ),
      textAlign: align,
    );
  }

  loader() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 4, sigmaX: 4),
      child: Container(
        color: Colors.white.withOpacity(0.4),
        child: Center(
          child: LoadingAnimationWidget.prograssiveDots(
              color: Colors.greenAccent.shade700, size: 50),
        ),
      ),
    );
  }

  Text text1({
    String? label,
    double? size,
    FontWeight? weight,
    TextAlign? align,
    double? letterSpacing,
    Color? color,
  }) {
    return Text(
      label!,
      style: TextStyle(
          fontSize: size,
          fontWeight: weight,
          letterSpacing: letterSpacing,
          color: color),
      textAlign: align,
    );
  }

  TextFormField textFormField2(
      {TextEditingController? controller,
      TextAlign align = TextAlign.start,
      int maxline = 1,
      TextInputType keyboardType = TextInputType.text,
      TextCapitalization capitalization = TextCapitalization.none}) {
    return TextFormField(
      controller: controller,
      textAlign: align,
      maxLines: maxline,
      keyboardType: keyboardType,
      textCapitalization: capitalization,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 7),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
