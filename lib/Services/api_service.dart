import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutterai/secrets.dart';
class GeminiServices {
  final model = GenerativeModel(model: 'gemini- pro', apiKey: geminiApikey);

  Future<String> getResponse (String prompt) async {
    try {
      final content = [ Content.text(prompt)];
      final response = await model.generateContent(content);
      return response.text?? " No response From Gemini 😢";
    }
    catch (e)
    {
      return " Error : $e";
    }
  }
}