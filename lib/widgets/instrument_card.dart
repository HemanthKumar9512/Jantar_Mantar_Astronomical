import 'package:flutter/material.dart';
import '../models/instrument.dart';

class InstrumentCard extends StatelessWidget {
  final String instrumentKey;
  final InstrumentCalculation instrument;
  final VoidCallback onTap;

  const InstrumentCard({
    Key? key,
    required this.instrumentKey,
    required this.instrument,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue.shade50, Colors.purple.shade50],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    _getInstrumentIcon(instrumentKey),
                    color: Colors.blue.shade700,
                    size: 24,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          instrument.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        Text(
                          instrument.sanskritName,
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                instrument.description,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      instrument.precision,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green.shade800,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getInstrumentIcon(String instrumentKey) {
    switch (instrumentKey) {
      case 'samratYantra':
        return Icons.schedule;
      case 'ramaYantra':
        return Icons.account_balance;
      case 'digamsaYantra':
        return Icons.explore;
      case 'dhruvaYantra':
        return Icons.nightlight_round;
      case 'yantraSamrat':
        return Icons.merge_type;
      case 'golayantra':
        return Icons.language;
      case 'bhittiYantra':
        return Icons.border_vertical;
      case 'dakshinottaraBhittiYantra':
        return Icons.north;
      case 'rasivalayaYantra':
        return Icons.star;
      case 'nadiValayaYantra':
        return Icons.timelapse;
      case 'palakaYantra':
        return Icons.visibility;
      case 'chaapaYantra':
        return Icons.architecture;
      default:
        return Icons.science;
    }
  }
}
