import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuncmoments/app/app.dart';
import 'package:tuncmoments/chats/chat/chat.dart';
import 'package:tuncmoments/chats/chats.dart';
import 'package:tuncmoments/l10n/l10n.dart';
import 'package:tuncmoments/stories/stories.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

class ChatInboxTile extends StatelessWidget {
  const ChatInboxTile({required this.chat, super.key});

  final ChatInbox chat;

  @override
  Widget build(BuildContext context) {
    final participant = chat.participant;
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return ListTile(
      horizontalTitleGap: AppSpacing.md,
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      onTap: () => context.pushNamed(
        'chat',
        pathParameters: {'chat_id': chat.id},
        extra: ChatProps(chat: chat),
      ),
      onLongPress: () => context.confirmAction(
        title: context.l10n.deleteChatText,
        content: context.l10n.chatDeleteConfirmationText,
        yesText: context.l10n.deleteText,
        noText: context.l10n.cancelText,
        fn: () => context
            .read<ChatsBloc>()
            .add(ChatsDeleteChatRequested(chatId: chat.id, userId: user.id)),
      ),
      leading: UserStoriesAvatar(
        author: participant,
        enableInactiveBorder: false,
        withAdaptiveBorder: false,
        radius: 26,
      ),
      title: Text(participant.displayFullName),
      subtitle: Text(chat.lastMessage ?? context.l10n.noLastMessagesText),
    );
  }
}
