import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:message2/chat/cubit/chat_cubit.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  static const String routePath = '/chat';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit(),
      child: const ChartView(),
    );
  }
}

class ChartView extends StatelessWidget {
  const ChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Message'),
          ),
          body: const Center(
            child: Text('Message body page'),
          ),
        );
      },
    );
  }
}
