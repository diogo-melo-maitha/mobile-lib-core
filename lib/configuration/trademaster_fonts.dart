import 'package:flutter/material.dart';

abstract class TmFonts {
  static TextStyle regular16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Open Sans',
  );

  static TextStyle regularGray18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: 'Open Sans',
    color: Color.fromRGBO(109, 111, 114, 1)
  );

  static TextStyle regular32 = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    fontFamily: 'Open Sans',
  );

  static TextStyle bold12 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontFamily: 'Open Sans',
  );

  static TextStyle bold13 = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    fontFamily: 'Open Sans',
  );

  static TextStyle bold14 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: 'Open Sans',
  );

  static TextStyle semiBold17 = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    fontFamily: 'Open Sans',
  );

  static TextStyle bold18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: 'Open Sans',
  );
}