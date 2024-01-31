
import 'package:flutter/material.dart';


// [FIREBASE] handler


// [GRAPHICAL INTERFACE] handler
Widget sh(double val) {
  return SizedBox(height: val);
}

Widget sw(double val) {
  return SizedBox(width: val);
}

double dh(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double dw(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

// [DEFAULT PROFILE PIC]
String kP =
    'https://cdn.vectorstock.com/i/preview-1x/20/76/man-avatar-profile-vector-21372076.jpg';
