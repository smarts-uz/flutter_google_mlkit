import 'package:flutter/material.dart';
import 'package:flutter_google_mlkit/nlp_views/entity_extraction_view.dart';
import 'package:flutter_google_mlkit/nlp_views/language_identifier_view.dart';
import 'package:flutter_google_mlkit/nlp_views/language_translator_view.dart';
import 'package:flutter_google_mlkit/nlp_views/smart_reply_view.dart';
import 'package:flutter_google_mlkit/views/digital_ink_recognizer_view.dart';
import 'package:flutter_google_mlkit/views/pose_detector_view.dart';
import 'package:flutter_google_mlkit/views/selfie_segmenter_view.dart';
import 'package:flutter_google_mlkit/views/bar_scanner_view.dart';
import 'package:flutter_google_mlkit/views/object_detector_view.dart';
import 'package:flutter_google_mlkit/views/text_detector_view.dart';
import 'package:flutter_google_mlkit/views/face_detector_view.dart';
import 'package:flutter_google_mlkit/views/face_mesh_detector_view.dart';
import 'package:flutter_google_mlkit/views/label_detector_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google ML Kit Demo App'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  ExpansionTile(
                    title: Text('Vision APIs'),
                    children: [
                      CustomCard('Barcode Scanning', BarcodeScannerView()),
                      CustomCard('Face Detection', FaceDetectorView()),
                      CustomCard('Face Mesh Detection', FaceMeshDetectorView()),
                      CustomCard('Image Labeling', ImageLabelView()),
                      CustomCard('Object Detection', ObjectDetectorView()),
                      CustomCard('Text Recognition', TextRecognizerView()),
                      CustomCard('Digital Ink Recognition', DigitalInkView()),
                      CustomCard('Pose Detection', PoseDetectorView()),
                      CustomCard('Selfie Segmentation', SelfieSegmenterView()),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ExpansionTile(
                    title: Text('Natural Language APIs'),
                    children: [
                      CustomCard('Language ID', LanguageIdentifierView()),
                      CustomCard(
                          'On-device Translation', LanguageTranslatorView()),
                      CustomCard('Smart Reply', SmartReplyView()),
                      CustomCard('Entity Extraction', EntityExtractionView()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String _label;
  final Widget _viewPage;
  final bool featureCompleted;

  const CustomCard(
    this._label,
    this._viewPage, {
    super.key,
    this.featureCompleted = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor,
        title: Text(
          _label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          if (!featureCompleted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('This feature has not been implemented yet'),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => _viewPage),
            );
          }
        },
      ),
    );
  }
}
