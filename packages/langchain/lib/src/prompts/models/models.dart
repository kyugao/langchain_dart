import 'package:meta/meta.dart';

import '../../chat_models/models/models.dart';

/// {@template prompt_value}
/// Represents the input to an LLM or Chat model.
///
/// When working with an LLM, the [toString] method will be used.
/// When working with a Chat model, the [toChatMessages] method will be used.
/// {@endtemplate}
@immutable
abstract interface class PromptValue {
  /// {@macro prompt_value}
  const PromptValue();

  /// Returns a string representing the prompt.
  @override
  String toString();

  /// Returns a list of messages representing the prompt.
  List<ChatMessage> toChatMessages();
}

/// {@template string_prompt_template}
/// Prompt value whose value is a string.
///
/// When [toString] is called, it returns the string value.
/// When [toChatMessages] is called, it returns a [HumanChatMessage] with the
/// value as content.
/// {@endtemplate}
@immutable
class StringPromptValue implements PromptValue {
  /// {@macro string_prompt_template}
  const StringPromptValue(this.value);

  final String value;

  @override
  String toString() {
    return value;
  }

  @override
  List<ChatMessage> toChatMessages() {
    return [ChatMessage.human(value)];
  }
}

/// {@template chat_prompt_template}
/// Prompt value whose value is a list of messages.
///
/// When [toString] is called, it returns the string representation of the
/// messages using the following format:
/// ```
/// System: <system message>
/// Human: <human message>
/// AI: <AI message>
/// Human: <human message>
/// AI: <AI message>
/// ...
/// ```
/// When [toChatMessages] is called, it returns the list of messages.
/// {@endtemplate}
@immutable
class ChatPromptValue implements PromptValue {
  /// {@macro chat_prompt_template}
  const ChatPromptValue(this.messages);

  final List<ChatMessage> messages;

  @override
  String toString() {
    return messages.map(
      (final m) {
        final role = switch (m) {
          SystemChatMessage _ => 'System',
          HumanChatMessage _ => 'Human',
          AIChatMessage _ => 'AI',
          final CustomChatMessage m => m.role,
        };
        return '$role: ${m.content}';
      },
    ).join('\n');
  }

  @override
  List<ChatMessage> toChatMessages() {
    return messages;
  }
}

/// Input values used to format a prompt.
/// The keys are the names of the variables in the prompt template
/// and the values the actual values to use.
typedef InputValues = Map<String, dynamic>;

/// Partial input values used to format a prompt.
/// The keys are the names of the variables in the prompt template
/// and the values the actual values to use.
typedef PartialValues = Map<String, dynamic>;
