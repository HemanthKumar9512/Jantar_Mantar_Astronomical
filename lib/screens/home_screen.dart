import 'package:flutter/material.dart';
import '../models/instrument.dart';
import '../data/indian_cities.dart';
import '../services/calculator_service.dart';
import '../widgets/instrument_card.dart';
import 'instrument_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IndianCity? _selectedCity;
  double _scale = 1.0;
  CalculationResult? _calculationResult;
  final JantarMantarCalculator _calculator = JantarMantarCalculator();
  final TextEditingController _customLatController = TextEditingController();
  final TextEditingController _customLonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedCity = indianCities.first;
  }

  void _calculateInstruments() {
    if (_selectedCity == null) return;

    final result = _calculator.calculateAllInstruments(_selectedCity!, _scale);
    setState(() {
      _calculationResult = result;
    });
  }

  void _showCitySelectionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Indian City'),
        content: Container(
          width: double.maxFinite,
          height: 400,
          child: ListView.builder(
            itemCount: indianCities.length,
            itemBuilder: (context, index) {
              final city = indianCities[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  leading: Icon(Icons.location_city, color: Colors.blue),
                  title: Text('${city.name}, ${city.state}'),
                  subtitle: Text(
                    '${city.latitude.toStringAsFixed(4)}°, ${city.longitude.toStringAsFixed(4)}°',
                  ),
                  onTap: () {
                    setState(() {
                      _selectedCity = city;
                    });
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
          '🏛️ Jantar Mantar Pro',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade600, Colors.purple.shade600],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    '12 Ancient Indian Astronomical Instruments',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Calculate precise dimensions for any location in India',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Location Selection Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '📍 Select Location',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    SizedBox(height: 16),

                    // City Selection
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selected City:',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.blue.shade700,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.location_city,
                                color: Colors.blue.shade600,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${_selectedCity?.name}, ${_selectedCity?.state}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue.shade900,
                                      ),
                                    ),
                                    Text(
                                      '${_selectedCity?.latitude.toStringAsFixed(4)}°, ${_selectedCity?.longitude.toStringAsFixed(4)}°',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.blue.shade600,
                                ),
                                onPressed: _showCitySelectionDialog,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

                    // Scale Selection
                    Text(
                      'Scale: ${_scale}x',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Slider(
                      value: _scale,
                      min: 0.5,
                      max: 2.0,
                      divisions: 3,
                      onChanged: (value) {
                        setState(() {
                          _scale = value;
                        });
                      },
                      activeColor: Colors.blue.shade600,
                      inactiveColor: Colors.grey.shade300,
                    ),

                    SizedBox(height: 20),

                    // Calculate Button
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _calculateInstruments,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade600,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                        ),
                        child: Text(
                          'Calculate All 12 Instruments',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24),

            // Results Section
            if (_calculationResult != null) ...[
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calculate, color: Colors.green.shade600),
                          SizedBox(width: 12),
                          Text(
                            '📊 Calculation Results',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade800,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),

                      // Location Info
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            _buildResultRow(
                              '📍 Location',
                              _calculationResult!.location.name,
                            ),
                            _buildResultRow(
                              '📏 Latitude',
                              '${_calculationResult!.location.latitude.toStringAsFixed(4)}°',
                            ),
                            _buildResultRow(
                              '📐 Longitude',
                              '${_calculationResult!.location.longitude.toStringAsFixed(4)}°',
                            ),
                            _buildResultRow(
                              '⏰ Time Correction',
                              '${((_calculationResult!.location.longitude - 82.5) * 4).toStringAsFixed(1)} minutes',
                            ),
                            _buildResultRow(
                              '🎯 Accuracy',
                              _calculationResult!.accuracyEstimate,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      Text(
                        '🛠️ 12 Astronomical Instruments:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ),

              // Instruments List
              ..._calculationResult!.instruments.entries.map((entry) {
                return InstrumentCard(
                  instrumentKey: entry.key,
                  instrument: entry.value,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InstrumentDetailScreen(
                          instrument: entry.value,
                          scale: _scale,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ],

            // Info Section
            SizedBox(height: 24),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ℹ️ About Jantar Mantar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.shade800,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Jantar Mantar are historical astronomical observatories built by Maharaja Jai Singh II in the early 18th century. '
                      'These instruments represent the pinnacle of Indian astronomy and can measure time, track celestial bodies, '
                      'and predict eclipses with remarkable accuracy.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildFeatureRow('✅ All 12 Traditional Instruments'),
                    _buildFeatureRow('✅ 95%+ Accuracy for Any Indian Location'),
                    _buildFeatureRow('✅ 3D Visualizations'),
                    _buildFeatureRow('✅ Cross-Platform (Android, iOS, Web)'),
                    _buildFeatureRow('✅ Historical & Scientific Context'),
                    _buildFeatureRow('✅ Construction Guidelines'),
                  ],
                ),
              ),
            ),

            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildResultRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.check_circle, size: 16, color: Colors.green.shade600),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
          ),
        ],
      ),
    );
  }
}
