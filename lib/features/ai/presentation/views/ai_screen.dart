import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/chat_cubit/chat_cubit.dart';
import '../refactor/ai_screen_body.dart';

class AiScreen extends StatelessWidget {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: const AIScreenBody(),
    );
  }
}
