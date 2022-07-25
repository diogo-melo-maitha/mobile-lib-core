import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tm_lib_core/tm_lib_core.dart';

void main() {
  group('Fonts tests', () {
    WidgetsFlutterBinding.ensureInitialized();

    test('Check font regular12', () {
      final font = TmFonts.regular12;
      final result = GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.w400);

      expect(font, result);
    });

    test('Check font regular14', () {
      final font = TmFonts.regular14;
      final result = GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w400);

      expect(font, result);
    });

    test('Check font regular16', () {
      final font = TmFonts.regular16;
      final result = GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w400);

      expect(font, result);
    });

    test('Check font regular17', () {
      final font = TmFonts.regular17;
      final result = GoogleFonts.openSans(fontSize: 17, fontWeight: FontWeight.w400);

      expect(font, result);
    });

    test('Check font regular18', () {
      final font = TmFonts.regular18;
      final result = GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w400);

      expect(font, result);
    });

    test('Check font regular32', () {
      final font = TmFonts.regular32;
      final result = GoogleFonts.openSans(fontSize: 32, fontWeight: FontWeight.w400);

      expect(font, result);
    });

    test('Check font regular48', () {
      final font = TmFonts.regular48;
      final result = GoogleFonts.openSans(fontSize: 48, fontWeight: FontWeight.w400);

      expect(font, result);
    });

    test('Check font semiBold12', () {
      final font = TmFonts.semiBold12;
      final result = GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.w600);

      expect(font, result);
    });

    test('Check font semiBold16', () {
      final font = TmFonts.semiBold16;
      final result = GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600);

      expect(font, result);
    });

    test('Check font semiBold17', () {
      final font = TmFonts.semiBold17;
      final result = GoogleFonts.openSans(fontSize: 17, fontWeight: FontWeight.w600);

      expect(font, result);
    });

    test('Check font semiBold18', () {
      final font = TmFonts.semiBold18;
      final result = GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600);

      expect(font, result);
    });

    test('Check font semiBold20', () {
      final font = TmFonts.semiBold20;
      final result = GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.w600);

      expect(font, result);
    });

    test('Check font semiBold24', () {
      final font = TmFonts.semiBold24;
      final result = GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.w600);

      expect(font, result);
    });

    test('Check font bold12', () {
      final font = TmFonts.bold12;
      final result = GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.w700);

      expect(font, result);
    });

    test('Check font bold13', () {
      final font = TmFonts.bold13;
      final result = GoogleFonts.openSans(fontSize: 13, fontWeight: FontWeight.w700);

      expect(font, result);
    });

    test('Check font bold14', () {
      final font = TmFonts.bold14;
      final result = GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w700);

      expect(font, result);
    });

    test('Check font bold16', () {
      final font = TmFonts.bold16;
      final result = GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w700);

      expect(font, result);
    });

    test('Check font bold17', () {
      final font = TmFonts.bold17;
      final result = GoogleFonts.openSans(fontSize: 17, fontWeight: FontWeight.w700);

      expect(font, result);
    });

    test('Check font bold18', () {
      final font = TmFonts.bold18;
      final result = GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w700);

      expect(font, result);
    });

    test('Check font bold20', () {
      final font = TmFonts.bold20;
      final result = GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.w700);

      expect(font, result);
    });
  });
}
