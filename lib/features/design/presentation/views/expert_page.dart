import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VillaDesignScreen extends StatefulWidget {
  const VillaDesignScreen({Key? key}) : super(key: key);

  @override
  _VillaDesignScreenState createState() => _VillaDesignScreenState();
}

class _VillaDesignScreenState extends State<VillaDesignScreen> {
  static const String apiUrl = 'https://1b95-91-207-174-13.ngrok-free.app';
  String _currentQuestion = "style";
  String? _questionText;
  String _description = "";
  List<String> _options = [];
  Uint8List? _imageData;
  bool _isLoading = false;
  bool _isGeneratingImage = false;

  @override
  void initState() {
    super.initState();
    _fetchQuestion();
  }

  Future<void> _fetchQuestion([String? answer]) async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('$apiUrl/villa-design'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'current_question': _currentQuestion,
          'answer': answer,
        }),
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          if (data['description'] != null) {
            _description = data['description'];
            _currentQuestion = "end";
            _questionText = null;
            _options = [];
          } else {
            _questionText = data['question'];
            _options = List<String>.from(data['options']);
            _currentQuestion = data['next_question'];
          }
        });
      } else {
        _showError('Failed to fetch question. Please try again.');
      }
    } catch (e) {
      if (!mounted) return;
      _showError('Connection error. Please check your internet connection.');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _generateImage() async {
    if (_isGeneratingImage) return;

    setState(() {
      _isGeneratingImage = true;
    });

    try {
      final response = await http.post(
        Uri.parse('$apiUrl/generate-image'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'description': _description}),
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        setState(() {
          _imageData = response.bodyBytes;
        });
      } else {
        _showError('Failed to generate image. Please try again.');
      }
    } catch (e) {
      if (!mounted) return;
      _showError('Connection error while generating image.');
    } finally {
      if (mounted) {
        setState(() {
          _isGeneratingImage = false;
        });
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Villa Design Expert'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_isLoading)
                const Center(child: CircularProgressIndicator())
              else if (_questionText != null) ...[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _questionText!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ..._options.map((option) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ElevatedButton(
                        onPressed: () => _fetchQuestion(option),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                        ),
                        child: Text(option),
                      ),
                    )),
              ] else if (_currentQuestion == "end") ...[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          'Your Villa Description:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _description,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isGeneratingImage ? null : _generateImage,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                  child: _isGeneratingImage
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Generate Villa Image'),
                ),
              ],
              if (_imageData != null) ...[
                const SizedBox(height: 20),
                Expanded(
                  child: Card(
                    child: Image.memory(
                      _imageData!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
