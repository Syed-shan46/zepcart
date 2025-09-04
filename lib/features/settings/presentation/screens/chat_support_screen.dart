import 'package:flutter/material.dart';
import 'package:zepcart/core/common/design_system/app_colors.dart';
import 'package:zepcart/core/common/design_system/app_opacity.dart';
import 'package:zepcart/core/common/design_system/app_sizes.dart';
import 'package:zepcart/core/common/extensions/context_extensions.dart';
import 'package:zepcart/core/common/localization/app_strings_settings.dart';
import 'package:zepcart/shared/styles/app_text_styles.dart';
import 'package:zepcart/shared/widgets/appbars/primary_appbar.dart';

class ChatSupportScreen extends StatefulWidget {
  const ChatSupportScreen({super.key});

  @override
  State<ChatSupportScreen> createState() => _ChatSupportScreenState();
}

class _ChatSupportScreenState extends State<ChatSupportScreen> {
  // Sample messages shown initially in the chat
  final List<_Message> messages = [
    _Message(sender: 'bot', text: AppStringsSettings.welcomeMessage),
    _Message(sender: 'user', text: AppStringsSettings.sampleUserQuery),
    _Message(sender: 'bot', text: AppStringsSettings.sampleBotReply),
    _Message(sender: 'user', text: AppStringsSettings.userShippingQuestion),
    _Message(sender: 'bot', text: AppStringsSettings.shippingInfo),
  ];

  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // Sends a message and clears the input field
  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add(_Message(sender: 'user', text: text));
      _messageController.clear();
    });

    // 👇 Auto-scroll to bottom after message is added
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with title
      appBar: PrimaryAppbar(
        title: AppStringsSettings.chatTitle,
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined, size: AppSizes.font.xxl),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.support_agent_outlined, size: AppSizes.font.xxl),
            onPressed: () {},
          ),
        ],
      ),

      // Main content: chat messages and input field
      body: Column(
        children: [
          // Message list
          Expanded(
            child: ListView.separated(
              controller: _scrollController,
              padding: EdgeInsets.all(AppSizes.padding.md),
              itemCount: messages.length,
              separatorBuilder:
                  (_, __) => SizedBox(height: AppSizes.spacing.sm),
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser = message.sender == 'user';

                return Align(
                  alignment:
                      isUser ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.85,
                    ),
                    padding: EdgeInsets.all(AppSizes.padding.md),
                    decoration: BoxDecoration(
                      color:
                          isUser
                              ? context.colors.primary
                              : context.isDarkMode
                              ? Colors.grey.shade800
                              : AppColors.white,
                      borderRadius: BorderRadius.circular(AppSizes.cardRadius),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(
                            AppOpacities.almostTransparent,
                          ),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),

                    // Message text styling
                    child: Text(
                      message.text,
                      style: context.text.bodyMedium?.copyWith(
                        color:
                            isUser ? AppColors.white : context.colors.onSurface,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Message input field and send button
          Padding(
            padding: EdgeInsets.all(AppSizes.padding.md),
            child: Row(
              children: [
                // Message input box
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: AppStringsSettings.messageInputHint,
                      hintStyle: context.text.bodySmall?.copyWith(
                        color: AppColors.grey500,
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: AppSizes.padding.md,
                        vertical: AppSizes.padding.sm,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSizes.inputRadius,
                        ),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSizes.borderRadius.md,
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: AppTextStyles.bodyMedium(context),
                  ),
                ),
                SizedBox(width: AppSizes.spacing.sm),

                // Send button
                IconButton(
                  icon: const Icon(Icons.send_rounded),
                  color: context.colors.primary,
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Private message model for chat
class _Message {
  final String sender; // 'user' or 'bot'
  final String text;

  _Message({required this.sender, required this.text});
}
