import '../../../../core/services/ai/ai_setup.dart';

class CityBioCreator {
  Future<String> generateCityBio(String city) async {
    var response = await AiSetup.aiGenerate(
      promot:
          "A description without introduction about $city Governorate, the best time to visit, and its famous cities or places in 150 words in Arabic",
    );
    return response;
  }
}
