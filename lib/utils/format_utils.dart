import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormatUtils {
  static const cpfMask = '###.###.###-##';
  static const cnpjMask = '##.###.###/####-##';
  static const mobilePhoneMask = '(##) ##### ####';
  static const residentialPhoneMask = '(##) #### ####';
  static const postalCodeMask = '#####-###';

  static bool isEmailValid(String email) {
    try {
      const String p =
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
      final RegExp regExp = RegExp(p);
      return email.isNotEmpty && regExp.hasMatch(email);
    } catch (_) {
      return false;
    }
  }

  static String removeSpecialCharacters(String text) {
    final RegExp regex = RegExp(r'[^\s\w]');
    return text.replaceAll(regex, '');
  }

  static String maskDocument(String document) {
    final documentNumber = removeSpecialCharacters(document);

    switch (documentNumber.length) {
      case 11:
        final documentMask = MaskTextInputFormatter(
            mask: cpfMask, filter: {'#': RegExp(r'[0-9]')});
        return documentMask.maskText(documentNumber);
      case 14:
        final documentMask = MaskTextInputFormatter(
            mask: cnpjMask, filter: {'#': RegExp(r'[0-9]')});
        return documentMask.maskText(documentNumber);
      default:
        return document;
    }
  }

  static String maskPhoneNumber(String phone) {
    final phoneNumber = removeSpecialCharacters(phone);

    switch (phoneNumber.length) {
      case 11:
        final phoneMask = MaskTextInputFormatter(
            mask: mobilePhoneMask, filter: {'#': RegExp(r'[0-9]')});
        return phoneMask.maskText(phoneNumber);
      case 10:
        final phoneMask = MaskTextInputFormatter(
            mask: residentialPhoneMask, filter: {'#': RegExp(r'[0-9]')});
        return phoneMask.maskText(phoneNumber);
      default:
        return phone;
    }
  }

  static String maskPostalCode(String code) {
    final postalCode = removeSpecialCharacters(code);

    switch (postalCode.length) {
      case 8:
        final phoneMask = MaskTextInputFormatter(
            mask: postalCodeMask, filter: {'#': RegExp(r'[0-9]')});
        return phoneMask.maskText(postalCode);
      default:
        return code;
    }
  }
}
