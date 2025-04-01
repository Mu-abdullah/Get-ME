import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslationService {
  static final _translator = GoogleTranslator();

  static Future<String> translateText(
    String text,
    String targetLanguage, {
    String sourceLanguage = 'auto',
  }) async {
    try {
      final translation = await _translator.translate(
        text,
        from: sourceLanguage,
        to: targetLanguage,
      );
      return translation.text;
    } catch (e) {
      debugPrint('Translation error: $e');
      return text;
    }
  }

  static Future<Map<String, String>> translatePlace({
    required String name,
    required String description,
    required String targetLanguage,
    String sourceLanguage = 'auto',
  }) async {
    final translatedName = await translateText(name, targetLanguage,
        sourceLanguage: sourceLanguage);
    final translatedDescription = await translateText(
        description, targetLanguage,
        sourceLanguage: sourceLanguage);
    return {
      'name': translatedName,
      'description': translatedDescription,
    };
  }
}
