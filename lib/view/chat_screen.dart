import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var Prompt = "";
  TextEditingController tController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void AskAi() {
      if (tController.text.trim().isEmpty) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text(
                '⚠️ Empty Message',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.tealAccent : Colors.teal,
                ),
              ),
              content: Text(
                'Please type something before sending!',
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: isDark ? Colors.tealAccent : Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
        return;
      }

      setState(() {
        Prompt = tController.text.trim();
        tController.clear();
        print('Ask Ai: $Prompt');
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter AI || Chatbot",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(" $Prompt", style: TextStyle(backgroundColor: Colors.teal, color: Colors.white),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // 🟢 TextField
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) => AskAi(),
                      controller: tController,
                      decoration: InputDecoration(
                        hintText: "🧠  What's in your mind?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // 🟢 Send Button as a small circle
                  GestureDetector(
                    onTap: () {
                  AskAi();
                    },
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.send, color: Colors.white, size: 22),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
