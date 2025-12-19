class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates({required this.latitude, required this.longitude});
}

class IndianCity {
  final String name;
  final double latitude;
  final double longitude;
  final String state;
  final String? culturalSignificance;
  final String? historicalImportance;

  IndianCity({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.state,
    this.culturalSignificance,
    this.historicalImportance,
  });
}

class InstrumentCalculation {
  final String name;
  final String sanskritName;
  final Map<String, dynamic> parameters;
  final String calibrationNote;
  final String precision;
  final String historicalContext;
  final String scientificPurpose;
  final String description;
  final List<String> mathematicalPrinciples;
  final List<String> constructionMaterials;

  InstrumentCalculation({
    required this.name,
    required this.sanskritName,
    required this.parameters,
    required this.calibrationNote,
    required this.precision,
    required this.historicalContext,
    required this.scientificPurpose,
    required this.description,
    required this.mathematicalPrinciples,
    required this.constructionMaterials,
  });
}

class CalculationResult {
  final IndianCity location;
  final Map<String, InstrumentCalculation> instruments;
  final DateTime calculatedAt;
  final double baseScale;
  final String accuracyEstimate;

  CalculationResult({
    required this.location,
    required this.instruments,
    required this.calculatedAt,
    required this.baseScale,
    required this.accuracyEstimate,
  });
}
