import 'package:flutter/material.dart';

BoxShadow enabledBox = BoxShadow(
  color: Colors.black,
  spreadRadius: 2,
  blurRadius: 2,
);

BoxShadow disabledBox = BoxShadow(
  color: Colors.black26,
  spreadRadius: 2,
  blurRadius: 2,
);

BoxShadow weekBox = enabledBox;
BoxShadow todayBox = disabledBox;
BoxShadow monthBox = disabledBox;