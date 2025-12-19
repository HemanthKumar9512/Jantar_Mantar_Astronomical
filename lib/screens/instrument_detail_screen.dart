import 'package:flutter/material.dart';
import '../models/instrument.dart';
import '../widgets/instrument_3d_viewer.dart';

class InstrumentDetailScreen extends StatelessWidget {
  final InstrumentCalculation instrument;
  final double scale;

  const InstrumentDetailScreen({
    Key? key,
    required this.instrument,
    required this.scale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(instrument.name),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 3D Visualization
            Instrument3DViewer(instrument: instrument, scale: scale),

            SizedBox(height: 24),

            // Basic Information
            _buildInfoCard('📋 Basic Information', [
              _buildInfoRow('Sanskrit Name', instrument.sanskritName),
              _buildInfoRow('Precision', instrument.precision),
              _buildInfoRow('Scientific Purpose', instrument.scientificPurpose),
            ]),

            SizedBox(height: 16),

            // Dimensions and Parameters
            _buildParametersCard(),

            SizedBox(height: 16),

            // Historical Context
            _buildInfoCard('📜 Historical Context', [
              Text(
                instrument.historicalContext,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade800,
                  height: 1.5,
                ),
              ),
            ]),

            SizedBox(height: 16),

            // Mathematical Principles
            _buildInfoCard('🧮 Mathematical Principles', [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: instrument.mathematicalPrinciples.map((principle) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 16,
                          color: Colors.green.shade600,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            principle,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ]),

            SizedBox(height: 16),

            // Construction Materials
            _buildInfoCard('🏗️ Construction Materials', [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: instrument.constructionMaterials.map((material) {
                  return Chip(
                    label: Text(material),
                    backgroundColor: Colors.orange.shade100,
                    labelStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.orange.shade800,
                    ),
                  );
                }).toList(),
              ),
            ]),

            SizedBox(height: 16),

            // Calibration Note
            _buildInfoCard('⚙️ Calibration Note', [
              Text(
                instrument.calibrationNote,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade800,
                  fontStyle: FontStyle.italic,
                  height: 1.5,
                ),
              ),
            ]),

            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParametersCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '📐 Dimensions & Parameters',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            SizedBox(height: 12),
            ...instrument.parameters.entries.map((entry) {
              final value = entry.value;
              String displayValue;

              if (value is double) {
                displayValue = value.toStringAsFixed(2);
              } else if (value is int) {
                displayValue = value.toString();
              } else if (value is List) {
                displayValue = '${value.length} items';
              } else {
                displayValue = value.toString();
              }

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        '${entry.key}:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        displayValue,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
