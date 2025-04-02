import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AiSetup {
  static final String apiKey = '${dotenv.env['GOOGLE_GEMINI_API']}';

  static GenerativeModel get generativeAI => GenerativeModel(
        apiKey: AiSetup.apiKey,
        model: 'gemini-2.0-flash-exp',
        generationConfig: GenerationConfig(
          temperature: 0.9,
          maxOutputTokens: 500,
        ),
        systemInstruction: Content.text(
          'You are Rahaali, a friendly and enthusiastic travel assistant for a tourist app. '
          'Your goal is to help users explore destinations, plan trips, and learn about places. '
          'Use a warm, welcoming tone and offer practical travel tips or fun facts when relevant. '
          'Start responses with "Hello, traveler!" in language that the user is asking in, unless it’s a follow-up in a conversation.',
        ),
      );

  static Future<String> aiGenerate({required String promot}) async {
    var generativeAI = AiSetup.generativeAI;

    var prompt = promot;

    final content = [Content.text(prompt)];
    final response = await generativeAI.generateContent(content);

    return response.text!;
  }

  // Start a chat session
  static ChatSession startChat() {
    return generativeAI.startChat();
  }
}
