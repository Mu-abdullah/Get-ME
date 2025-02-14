import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../../core/services/ai/ai_setup.dart';

class CityBioCreator {
  Future<String> generateCityBio(String city) async {
    var generativeAI = AiSetup.generativeAI;

    var prompt =
        "short description about $city with 100 words in arabic language";

    final content = [Content.text(prompt)];
    final response = await generativeAI.generateContent(content);

    return response.text!;
  }
}
