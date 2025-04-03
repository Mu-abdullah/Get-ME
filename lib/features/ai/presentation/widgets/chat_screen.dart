import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';


import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../cubits/chat_cubit/chat_cubit.dart';
import 'chat_bubble.dart';
import 'message_input.dart';
import 'typing_indecator.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    DateTime now = DateTime.now();
    String period = now.hour >= 12 ? 'PM' : 'AM';
    int hour12 = now.hour % 12 == 0 ? 12 : now.hour % 12;

    String formattedTime =
        '$hour12:${now.minute.toString().padLeft(2, '0')} $period';
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueGrey[50]!, Colors.grey[100]!],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                return state.messages.isEmpty
                    ? Center(
                        child: AppText(
                          context.translate(LangKeys.noMassagesYet),
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(12),
                        itemCount:
                            state.messages.length + (state.isLoading ? 1 : 0),
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          if (state.isLoading &&
                              index == state.messages.length) {
                            return TypingIndicator();
                          }
                          final message = state.messages[index];
                          final isUser = message['role'] == 'user';

                          return ChatBubble(
                            message: message['text']!,
                            isUser: isUser,
                            time: formattedTime,
                          );
                        },
                      );
              },
            ),
          ),
          MessageInput(controller: controller),
        ],
      ),
    );
  }
}

