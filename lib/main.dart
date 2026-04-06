import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(QuoteApp());
}

class QuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuotePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuotePage extends StatefulWidget {
  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  final List<Map<String, String>> quotes = [
    {"text": "Stay hungry, stay foolish", "author": "Steve Jobs"},
    {"text": "Dream big and dare to fail", "author": "Norman Vaughan"},
    {"text": "Success is no accident", "author": "Pele"},
    {"text": "Work hard in silence", "author": "Unknown"},
  ];

  Map<String, String> currentQuote = {
    "text": "Click the button to generate a quote",
    "author": ""
  };

  void generateQuote() {
    final random = Random();
    setState(() {
      currentQuote = quotes[random.nextInt(quotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quote Generator"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Quote Box
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        currentQuote["text"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "- ${currentQuote["author"]}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Button
              ElevatedButton(
                onPressed: generateQuote,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text(
                  "New Quote",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}