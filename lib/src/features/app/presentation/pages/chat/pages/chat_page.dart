import 'dart:developer';
import 'dart:io';

import 'package:chat/src/features/app/presentation/pages/chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  static const routeName = '/ChatPage';

  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final TextEditingController _txtCtrl = TextEditingController();

  late FocusNode _focusNode;

  final List<ChatMessage> _messages = [];

  bool writing = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Column(
          children: const [
            CircleAvatar(
              maxRadius: 14,
              backgroundColor: Colors.blueAccent,
              child: Text(
                'Te',
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(height: 3),
            Text(
              'Rosa Caicedo',
              style: TextStyle(color: Colors.black87, fontSize: 10),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _messages.length,
                  reverse: true,
                  itemBuilder: (ctx, i) {
                    return _messages[i];
                  }),
            ),
            const Divider(height: 1),
            inputChat(),
          ],
        ),
      ),
    );
  }

  Widget inputChat() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _txtCtrl,
                focusNode: _focusNode,
                autofocus: true,
                onChanged: (v) {
                  setState(() {
                    writing = (v.trim().isNotEmpty);
                  });
                },
                decoration:
                    const InputDecoration.collapsed(hintText: 'Send message'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Platform.isIOS
                  ? CupertinoButton(
                      onPressed: !writing ? null : _handleSubmit,
                      child: const Text('Send'),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue[400]),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: const Icon(Icons.send),
                          onPressed: !writing ? null : _handleSubmit,
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _handleSubmit() async {
    if (!writing) return;
    log(_txtCtrl.text, name: 'message');
    _focusNode.requestFocus();
    final newMessage = ChatMessage(
      message: _txtCtrl.text,
      uid: '123',
      animationController: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      ),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    _txtCtrl.clear();
    setState(() {
      writing = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement socket off

    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }
}
