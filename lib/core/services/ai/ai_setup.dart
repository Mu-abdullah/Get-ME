import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../get_it/git_it.dart';

class AiSetup {
  static final String apiKey = '${dotenv.env['GOOGLE_GEMINI_API']}';

  static GenerativeModel get generativeAI => locator<GenerativeModel>();

  static Future<String> aiGenerate({required String promot}) async {
    var generativeAI = AiSetup.generativeAI;

    var prompt = promot;

    final content = [Content.text(prompt)];
    final response = await generativeAI.generateContent(content);

    return response.text!;
  }
}
