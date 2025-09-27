import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'FlutterAI - Chatbot',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var Prompt = "";
   TextEditingController Tcontroller = TextEditingController();

  void AskAi() {
    setState(() {
      Prompt = Tcontroller.text;
      Tcontroller.clear();
      print(" $Prompt");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, ,
          ,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
         padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextField(
              onSubmitted: (value) => AskAi(
              ),
              controller: Tcontroller,
              decoration: InputDecoration(
                hintText: " Ask anything",
                contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),


                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                suffixIcon:
                IconButton(onPressed: (){
                  AskAi();
                }, icon:   Icon(

                  Icons.send, color: Colors.tealAccent,
                ),),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
