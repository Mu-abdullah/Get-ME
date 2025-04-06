import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/widgets/app_text_form_felid.dart';
import '../cubits/chat_cubit/chat_cubit.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController controller;

  const MessageInput({super.key, required this.controller});

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
                backgroundColor: AppColors.black,
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
    context.read<ChatCubit>().sendMessage(text, context);
    controller.clear();
  }
}
