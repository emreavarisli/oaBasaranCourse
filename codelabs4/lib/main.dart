import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? kIOSTheme
          : kDefaultTheme,
      debugShowCheckedModeBanner: false,
      home: const ChatScreen(),
    ),
  );
}

final ThemeData kIOSTheme = ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
);

final ThemeData kDefaultTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
        .copyWith(secondary: Colors.orangeAccent[400]));

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  bool _isComposing = false;
  final List<ChatMessage> _message = [];
  final _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void _handSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      animationController: AnimationController(
        duration: const Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    setState(() {
      _message.insert(0, message);
      _isComposing = false;
    });
    _focusNode.requestFocus();
    message.animationController.forward();
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.isNotEmpty;
                  });
                },
                controller: _textController,
                onSubmitted: _isComposing ? _handSubmitted : null,
                decoration:
                    const InputDecoration.collapsed(hintText: 'Send a Message'),
                focusNode: _focusNode,
              ),
            ),
            Theme.of(context).platform == TargetPlatform.iOS
                ? CupertinoButton(
                    onPressed: _isComposing
                        ? () => _handSubmitted(_textController.text)
                        : null,
                    child: const Text('Send'),
                  )
                : IconButton(
                    onPressed: _isComposing
                        ? () => _handSubmitted(_textController.text)
                        : null,
                    icon: const Icon(Icons.send),
                  )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (ChatMessage message in _message) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('FriendlyChatApp'),
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0),
      body: Container(
        decoration: Theme.of(context).platform == TargetPlatform.iOS
            ? const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                ),
              )
            : null,
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _message[index],
                itemCount: _message.length,
              ),
            ),
            const Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }
}

String _name = 'Your Name';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {super.key, required this.text, required this.animationController});
  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(child: Text(_name[0])),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_name, style: Theme.of(context).textTheme.headline4),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(text),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
