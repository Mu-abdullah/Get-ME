import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../../../core/app/visited_places/visited_placed_cubit/visited_placed_cubit.dart';
import '../../../../../core/services/ai/ai_setup.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  late ChatSession _chatSession;

  ChatCubit() : super(const ChatState()) {
    _chatSession = AiSetup.startChat(); // Initialize chat session
  }

  Future<void> sendMessage(String message, BuildContext context) async {
    if (message.trim().isEmpty) return;

    // Add user message and set loading state
    final updatedMessages = List<Map<String, String>>.from(state.messages)
      ..add({'role': 'user', 'text': message.trim()});
    emit(state.copyWith(messages: updatedMessages, isLoading: true));

    try {
      // Retrieve the user's interested places from Hive via the cubit
      final interestedPlaces = context.read<VisitedPlacedCubit>().places;
      String enhancedPrompt = message;

      // Enhance the prompt with context about interested places
      if (interestedPlaces.isNotEmpty) {
        enhancedPrompt =
            '$message\n\nUser’s interested places from Hive: ${interestedPlaces.join(", ")}. Use this to tailor your response.';
      } else {
        enhancedPrompt =
            '$message\n\nThe user’s interested places list is empty. Suggest some popular or exciting destinations in your response.';
      }

      final response =
          await _chatSession.sendMessage(Content.text(enhancedPrompt));
      final aiResponse = response.text ??
          'Hello, traveler! I’m not sure how to help with that. Could you share more about your travel plans?';

      // Add the AI response to the message list
      final newMessages = List<Map<String, String>>.from(state.messages)
        ..add({
          'role': 'ai',
          'text': aiResponse,
        });
      emit(state.copyWith(messages: newMessages, isLoading: false));
    } catch (e) {
      // Provide a friendly error message in Rahaali’s tone
      final errorMessages = List<Map<String, String>>.from(state.messages)
        ..add({
          'role': 'ai',
          'text':
              'Oh no, traveler! Something went wrong: $e. Try asking again, and I’ll do my best to help with your travel plans!',
        });
      emit(state.copyWith(messages: errorMessages, isLoading: false));
    }
  }

  void clearChat() {
    _chatSession = AiSetup.startChat();
    emit(const ChatState());
  }
}
