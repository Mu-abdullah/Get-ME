import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/app_text_form_felid.dart';

class AuthFormField extends StatelessWidget {
  const AuthFormField({
    super.key,
    required this.controller,
    this.type = TextInputType.text,
    this.validate,
    required this.hint,
    this.isPassword = false,
    this.suffix,
    this.prefix,
    this.onSubmitted,
    this.maxLength,
    this.onTap,
  });

  final TextEditingController controller;
  final TextInputType type;
  final String? Function(String?)? validate;
  final String hint;
  final bool isPassword;
  final int? maxLength;
  final Widget? suffix;
  final Widget? prefix;
  final Function(String?)? onSubmitted;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      type: type,
      hint: hint,
      isPassword: isPassword,
      suffix: isPassword ? suffix : null,
      prefix: prefix,
      onTap: onTap,
      maxLength: maxLength,
      onSubmitted: onSubmitted,
      validate: validate ??
          (v) {
            if (v!.isEmpty) {
              return context.translate(LangKeys.requiredValue);
            }
            return null;
          },
      inputFormatters: [
        // FilteringTextInputFormatter.digitsOnly,
        ArabicToEnglishNumberFormatter(),
      ],
    );
  }
}

// Custom formatter to replace Arabic numerals with English ones
class ArabicToEnglishNumberFormatter extends TextInputFormatter {
  final Map<String, String> _arabicToEnglishMap = {
    '٠': '0',
    '١': '1',
    '٢': '2',
    '٣': '3',
    '٤': '4',
    '٥': '5',
    '٦': '6',
    '٧': '7',
    '٨': '8',
    '٩': '9',
  };

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;
    // Replace each Arabic numeral in the input
    _arabicToEnglishMap.forEach((arabic, english) {
      newText = newText.replaceAll(arabic, english);
    });
    return TextEditingValue(
      text: newText,
      selection: newValue.selection, // Preserve cursor position
    );
  }
}
