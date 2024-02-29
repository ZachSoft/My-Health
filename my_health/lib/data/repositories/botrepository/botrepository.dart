import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:my_health/features/myhealth/models/botChatModel/BotChatModel.dart';
import 'package:my_health/utils/constants/constants_apikey.dart';
import 'package:my_health/utils/exceptions/Http_exceptions.dart';

class BotRepository extends GetxController {
  static BotRepository get instance => Get.find();

  Future<String?> generateChatText(List<BotchatModel> chats) async {
    try {
      Dio dio = Dio();
      const String apikey = ApiConstants.secretApikey;

      final response = await dio.post(
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apikey",
          data: {
            "contents": chats.map((e) => e.toMap()).toList(),
            "generationConfig": {
              "temperature": 0.9,
              "topK": 1,
              "topP": 1,
              "maxOutputTokens": 2048,
              "stopSequences": []
            },
            "safetySettings": [
              {
                "category": "HARM_CATEGORY_HARASSMENT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_HATE_SPEECH",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              }
            ]
          });
      if (response.statusCode == 200) {
        return response
            .data['candidates'].first['content']['parts'].first['text'];
      } else {
        throw HttpExceptions(response.statusCode!).message;
      }
    } catch (e) {
      throw HttpExceptions(500).message; // Default to internal server error
    }
  }
}
