import '../../../../core/services/ai/ai_setup.dart';

class CityBioCreator {
  Future<String> generateCityBio(String city) async {
    var response = await AiSetup.aiGenerate(
      promot:
          "short description without introduction about $city city with 50 words in arabic language",
    );
    return response;
  }
}
