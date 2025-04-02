import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../../../core/services/ai/ai_setup.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  late ChatSession _chatSession;

  ChatCubit() : super(const ChatState()) {
    _chatSession = AiSetup.startChat(); // Initialize chat session
  }

  Future<void> sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    // Add user message and set loading state
    final updatedMessages = List<Map<String, String>>.from(state.messages)
      ..add({'role': 'user', 'text': message.trim()});
    emit(state.copyWith(messages: updatedMessages, isLoading: true));

    try {
      final response = await _chatSession.sendMessage(Content.text(message));
      final newMessages = List<Map<String, String>>.from(state.messages)
        ..add({'role': 'ai', 'text': response.text ?? 'No response'});
      emit(state.copyWith(messages: newMessages, isLoading: false));
    } catch (e) {
      final errorMessages = List<Map<String, String>>.from(state.messages)
        ..add({'role': 'ai', 'text': 'Error: $e'});
      emit(state.copyWith(messages: errorMessages, isLoading: false));
    }
  }

  void clearChat() {
    _chatSession = AiSetup.startChat();
    emit(const ChatState());
  }
}
