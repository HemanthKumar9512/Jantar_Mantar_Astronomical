import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vm;
import 'dart:math';
import '../models/instrument.dart';

class Instrument3DViewer extends StatefulWidget {
  final InstrumentCalculation instrument;
  final double scale;

  const Instrument3DViewer({
    Key? key,
    required this.instrument,
    required this.scale,
  }) : super(key: key);

  @override
  _Instrument3DViewerState createState() => _Instrument3DViewerState();
}

class _Instrument3DViewerState extends State<Instrument3DViewer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _rotationX = 0.0;
  double _rotationY = 0.0;
  double _scale = 1.0;
  late Matrix4 _transform;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    _updateTransform();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateTransform() {
    setState(() {
      _transform = Matrix4.identity()
        ..translate(150.0, 150.0)
        ..scale(_scale)
        ..rotateX(vm.radians(_rotationX))
        ..rotateY(vm.radians(_rotationY));
    });
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _rotationY += details.rotation;
      _scale = (_scale * details.scale).clamp(0.5, 3.0);
      _updateTransform();
    });
  }

  Widget _buildInstrumentModel() {
    switch (widget.instrument.name) {
      case "Samrat Yantra":
        return _buildSamratYantra();
      case "Rama Yantra":
        return _buildRamaYantra();
      case "Digamsa Yantra":
        return _buildDigamsaYantra();
      case "Dhruva Yantra":
        return _buildDhruvaYantra();
      case "Yantra-Samrat":
        return _buildYantraSamrat();
      case "Golayantra":
        return _buildGolayantra();
      case "Bhitti Yantra":
        return _buildBhittiYantra();
      case "Dakshinottara Bhitti Yantra":
        return _buildDakshinottaraBhittiYantra();
      case "Rasivalaya Yantra":
        return _buildRasivalayaYantra();
      case "Nadi Valaya Yantra":
        return _buildNadiValayaYantra();
      case "Palaka Yantra":
        return _buildPalakaYantra();
      case "Chaapa Yantra":
        return _buildChaapaYantra();
      default:
        return _buildGenericInstrument();
    }
  }

  Widget _buildSamratYantra() {
    final params = widget.instrument.parameters;
    return CustomPaint(
      painter: _SamratYantraPainter(params: params),
    );
  }

  Widget _buildRamaYantra() {
    final params = widget.instrument.parameters;
    return CustomPaint(
      painter: _RamaYantraPainter(params: params),
    );
  }

  Widget _buildDigamsaYantra() {
    final params = widget.instrument.parameters;
    return CustomPaint(
      painter: _DigamsaYantraPainter(params: params),
    );
  }

  Widget _buildDhruvaYantra() {
    final params = widget.instrument.parameters;
    return CustomPaint(
      painter: _DhruvaYantraPainter(params: params),
    );
  }

  Widget _buildYantraSamrat() {
    final params = widget.instrument.parameters;
    return CustomPaint(
      painter: _YantraSamratPainter(params: params),
    );
  }

  Widget _buildGolayantra() {
    final params = widget.instrument.parameters;
    return CustomPaint(
      painter: _GolayantraPainter(params: params),
    );
  }

  Widget _buildBhittiYantra() {
    final params = widget.instrument.parameters;
    return CustomPaint(
      painter: _BhittiYantraPainter(params: params),
    );
  }

  Widget _buildDakshinottaraBhittiYantra() {
    final params = widget.instrument.parameters;
    return CustomPaint(
      painter: _DakshinottaraBhittiYantraPainter(params: params),
    );
  }

  Widget _buildRasivalayaYantra() {
    final params = widget.instrument.parameters;
    return CustomPaint(
      painter: _RasivalayaYantraPainter(params: params),
    );
  }

  Widget _buildNadiValayaYantra() {
    final params = widget.instrument.parameters;
    return CustomPaint(
      painter: _NadiValayaYantraPainter(params: params),
    );
  }

  Widget _buildPalakaYantra() {
    final params = widget.instrument.parameters;
    return CustomPaint(
      painter: _PalakaYantraPainter(params: params),
    );
  }

  Widget _buildChaapaYantra() {
    final params = widget.instrument.parameters;
    return CustomPaint(
      painter: _ChaapaYantraPainter(params: params),
    );
  }

  Widget _buildGenericInstrument() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue.shade100, Colors.green.shade100],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.architecture,
            size: 60,
            color: Colors.blue.shade700,
          ),
          SizedBox(height: 16),
          Text(
            widget.instrument.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '3D Visualization',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleUpdate: _onScaleUpdate,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade50, Colors.green.shade50],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Stack(
          children: [
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform(
                    transform: _transform,
                    child: _buildInstrumentModel(),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Scale: ${widget.scale}x',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Rotate & Zoom',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Painters for each instrument
class _SamratYantraPainter extends CustomPainter {
  final Map<String, dynamic> params;

  _SamratYantraPainter({required this.params});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.fill;

    final gnomonPaint = Paint()
      ..color = Colors.red.shade700
      ..style = PaintingStyle.fill;

    // Draw base
    canvas.drawRect(Rect.fromLTWH(50, 150, 200, 20), paint);

    // Draw gnomon
    canvas.drawRect(Rect.fromLTWH(145, 50, 10, 100), gnomonPaint);

    // Draw quadrant arc
    final arcPaint = Paint()
      ..color = Colors.orange.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(150, 150), radius: 100),
      0,
      1.57, // 90 degrees
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _RamaYantraPainter extends CustomPainter {
  final Map<String, dynamic> params;

  _RamaYantraPainter({required this.params});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade600
      ..style = PaintingStyle.fill;

    // Draw cylinder base
    canvas.drawCircle(Offset(150, 150), 80, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DigamsaYantraPainter extends CustomPainter {
  final Map<String, dynamic> params;

  _DigamsaYantraPainter({required this.params});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.shade600
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw concentric circles
    canvas.drawCircle(Offset(150, 150), 60, paint);
    canvas.drawCircle(Offset(150, 150), 40, paint);
    canvas.drawCircle(Offset(150, 150), 20, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DhruvaYantraPainter extends CustomPainter {
  final Map<String, dynamic> params;

  _DhruvaYantraPainter({required this.params});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.purple.shade600
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Draw inclined ring
    final path = Path()
      ..addOval(Rect.fromCircle(center: Offset(150, 150), radius: 70));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _YantraSamratPainter extends CustomPainter {
  final Map<String, dynamic> params;

  _YantraSamratPainter({required this.params});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green.shade600
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw combined instrument
    canvas.drawCircle(Offset(150, 150), 60, paint);
    canvas.drawRect(Rect.fromLTWH(90, 90, 120, 120), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _GolayantraPainter extends CustomPainter {
  final Map<String, dynamic> params;

  _GolayantraPainter({required this.params});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange.shade600
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw multiple rings
    canvas.drawCircle(Offset(150, 150), 70, paint);
    canvas.drawCircle(Offset(150, 150), 50, paint);
    canvas.drawCircle(Offset(150, 150), 30, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _BhittiYantraPainter extends CustomPainter {
  final Map<String, dynamic> params;

  _BhittiYantraPainter({required this.params});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.brown.shade600
      ..style = PaintingStyle.fill;

    // Draw wall
    canvas.drawRect(Rect.fromLTWH(100, 50, 100, 200), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DakshinottaraBhittiYantraPainter extends CustomPainter {
  final Map<String, dynamic> params;

  _DakshinottaraBhittiYantraPainter({required this.params});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.brown.shade800
      ..style = PaintingStyle.fill;

    // Draw North-South wall
    canvas.drawRect(Rect.fromLTWH(140, 50, 20, 200), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _RasivalayaYantraPainter extends CustomPainter {
  final Map<String, dynamic> params;

  _RasivalayaYantraPainter({required this.params});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellow.shade700
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw multiple small circles for zodiac instruments
    for (int i = 0; i < 12; i++) {
      final angle = 2 * pi * i / 12;
      final x = 150.0 + 60.0 * cos(angle);
      final y = 150.0 + 60.0 * sin(angle);
      canvas.drawCircle(Offset(x, y), 15.0, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _NadiValayaYantraPainter extends CustomPainter {
  final Map<String, dynamic> params;

  _NadiValayaYantraPainter({required this.params});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Draw equatorial ring
    canvas.drawCircle(Offset(150, 150), 80, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _PalakaYantraPainter extends CustomPainter {
  final Map<String, dynamic> params;

  _PalakaYantraPainter({required this.params});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.fill;

    // Draw platform
    canvas.drawCircle(Offset(150, 150), 70, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ChaapaYantraPainter extends CustomPainter {
  final Map<String, dynamic> params;

  _ChaapaYantraPainter({required this.params});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Draw arc
    canvas.drawArc(
      Rect.fromCircle(center: Offset(150, 150), radius: 60),
      0,
      1.57, // 90 degrees
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
