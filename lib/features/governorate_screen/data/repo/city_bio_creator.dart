import 'package:flutter/material.dart';

import '../../../../core/services/ai/ai_setup.dart';

class CityBioCreator {
  Future<String> generateCityBio(String city) async {
    var response = await AiSetup.aiGenerate(
      promot:
          "A description without introduction about $city Governorate, the best time to visit, and its most famous cities or places, in bullet points of 150 words in Arabic, to be displayed in a phone application.",
    );
    debugPrint("CityBioCreator: $response");
    return response;
  }
}
