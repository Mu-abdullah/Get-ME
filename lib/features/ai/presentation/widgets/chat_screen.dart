import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';
 
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/style/widgets/app_text_form_felid.dart';
import '../cubits/chat_cubit/chat_cubit.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

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
                            return _TypingIndicator();
                          }
                          final message = state.messages[index];
                          final isUser = message['role'] == 'user';

                          return ChatBubble(
                            message: message['text']!,
                            isUser: isUser,
                            time:
                                '${DateTime.now().hour}:${DateTime.now().minute} ', // Add actual time from message
                          );
                        },
                      );
              },
            ),
          ),
          _MessageInput(controller: controller),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final String time;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isUser,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      // mainAxisAlignment:
      //     isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 10,
      children: [
        if (isUser) ...[
          CircleAvatar(
            backgroundColor: colorScheme.primaryContainer,
            child: const Icon(Icons.person, color: Colors.white),
          ),
        ],
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: isUser ? AppColors.blueAccent : Colors.white,
              borderRadius: AppBorderRadius.largeRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  message,
                  maxLines: 100,
                ),
                AppText(time),
              ],
            ),
          ),
        ),
        if (!isUser) ...[
          CircleAvatar(
            backgroundColor: AppColors.black,
            child: const Icon(
              HugeIcons.strokeRoundedRobot01,
              color: Colors.white,
            ),
          ),
        ],
      ],
    );
  }
}

class _MessageInput extends StatelessWidget {
  final TextEditingController controller;

  const _MessageInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
              child: AppTextFormField(
            controller: controller,
            type: TextInputType.text,
            validate: (v) {
              if (v!.isEmpty) {
                return context.translate(LangKeys.requiredValue);
              }
              return null;
            },
            onSubmitted: (p0) {
              _sendMessage(context, controller.text);
            },
            hint: context.translate(LangKeys.typeYourMessage),
          )),
          const SizedBox(width: 12),
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return FloatingActionButton(
                onPressed: state.isLoading
                    ? null
                    : () => _sendMessage(context, controller.text),
                backgroundColor: Theme.of(context).colorScheme.primary,
                elevation: 2,
                mini: true,
                child: Transform.rotate(
                  angle: -0.2,
                  child: const Icon(HugeIcons.strokeRoundedSent,
                      color: Colors.white),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(BuildContext context, String text) {
    context.read<ChatCubit>().sendMessage(text);
    controller.clear();
  }
}

class _TypingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _BouncingDot(delay: 0),
                _BouncingDot(delay: 200),
                _BouncingDot(delay: 400),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: AppColors.black,
            child: const Icon(
              HugeIcons.strokeRoundedRobot01,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _BouncingDot extends StatefulWidget {
  final int delay;

  const _BouncingDot({required this.delay});

  @override
  __BouncingDotState createState() => __BouncingDotState();
}

class __BouncingDotState extends State<_BouncingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    Future.delayed(Duration(milliseconds: widget.delay),
        () => _controller.repeat(reverse: true));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -_controller.value * 8),
          child: child,
        );
      },
      child: Container(
        width: 8,
        height: 8,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.grey[600],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
