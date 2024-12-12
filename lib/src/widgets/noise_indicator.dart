import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/noise_provider.dart';

class NoiseIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noiseLevel = Provider.of<NoiseProvider>(context).currentNoiseLevel;

    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        'Aktueller Lärmpegel: ${noiseLevel.toStringAsFixed(2)} dB',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
