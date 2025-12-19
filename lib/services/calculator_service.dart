import 'dart:math';
import '../models/instrument.dart';

class JantarMantarCalculator {
  double baseScale;

  JantarMantarCalculator({this.baseScale = 1.0});

  double _toRadians(double degrees) => degrees * (pi / 180);
  double _toDegrees(double radians) => radians * (180 / pi);
  double _sin(double degrees) => sin(_toRadians(degrees));
  double _cos(double degrees) => cos(_toRadians(degrees));
  double _tan(double degrees) => tan(_toRadians(degrees));

  // 1. SAMRAT YANTRA - Supreme Sundial
  InstrumentCalculation calculateSamratYantra(
    double latitude,
    double longitude,
    double scale,
  ) {
    final gnomonAngle = latitude;
    final gnomonHeight = baseScale * scale * 3;
    final quadrantRadius = gnomonHeight;
    final baseWidth = 2 * gnomonHeight;

    final hourLines = <Map<String, dynamic>>[];
    for (int hour = 6; hour <= 18; hour++) {
      final angle = 15 * (hour - 12);
      hourLines.add({
        'hour': hour,
        'angle': angle,
        'position': quadrantRadius * _sin(angle.toDouble()),
      });
    }

    return InstrumentCalculation(
      name: "Samrat Yantra",
      sanskritName: "सम्राट यंत्र",
      parameters: {
        'gnomonAngle': gnomonAngle,
        'gnomonHeight': gnomonHeight,
        'quadrantRadius': quadrantRadius,
        'baseWidth': baseWidth,
        'hourLines': hourLines,
      },
      calibrationNote:
          "Gnomon inclined at ${gnomonAngle.toStringAsFixed(2)}° for latitude ${latitude.toStringAsFixed(2)}°",
      precision: "2 seconds",
      historicalContext:
          "World's largest sundial built by Maharaja Jai Singh II (1727-1733)",
      scientificPurpose: "Precise time measurement and solar position tracking",
      description:
          "The Supreme Instrument - a giant equinoctial sundial capable of measuring time with 2-second accuracy",
      mathematicalPrinciples: [
        "Trigonometric shadow calculations",
        "Spherical astronomy principles",
        "Equinoctial time measurement",
        "Latitude-specific gnomon angle",
      ],
      constructionMaterials: [
        "Marble",
        "Local stone",
        "Brass fittings",
        "Lime mortar",
      ],
    );
  }

  // 2. RAMA YANTRA - Cylindrical Observatory
  InstrumentCalculation calculateRamaYantra(
    double latitude,
    double longitude,
    double scale,
  ) {
    final cylinderRadius = baseScale * scale * 2.5;
    final cylinderHeight = cylinderRadius;
    final centralPillarHeight = cylinderHeight;

    final sectorGaps = <Map<String, dynamic>>[];
    for (int i = 0; i < 12; i++) {
      sectorGaps.add({
        'startAngle': i * 30,
        'endAngle': i * 30 + (i % 2 == 0 ? 12 : 18),
        'type': i % 2 == 0 ? "gap" : "wall",
      });
    }

    return InstrumentCalculation(
      name: "Rama Yantra",
      sanskritName: "राम यंत्र",
      parameters: {
        'cylinderRadius': cylinderRadius,
        'cylinderHeight': cylinderHeight,
        'centralPillarHeight': centralPillarHeight,
        'sectorGaps': sectorGaps,
        'azimuthRange': 360,
        'altitudeRange': 90,
      },
      calibrationNote: "Complementary sectors ensure continuous 360° coverage",
      precision: "1 arc-minute",
      historicalContext:
          "Unique cylindrical design for altitude and azimuth measurements",
      scientificPurpose:
          "Altitude and azimuth measurements of celestial bodies",
      description:
          "Cylindrical structure with complementary sectors for continuous celestial coordinate measurements",
      mathematicalPrinciples: [
        "Cylindrical coordinate system",
        "Complementary angle relationships",
        "Shadow geometry in circular structures",
      ],
      constructionMaterials: ["Stone", "Marble", "Brass markers"],
    );
  }

  // 3. DIGAMSA YANTRA - Azimuth Instrument
  InstrumentCalculation calculateDigamsaYantra(
    double latitude,
    double longitude,
    double scale,
  ) {
    final innerWallHeight = baseScale * scale * 1;
    final outerWallHeight = 2 * innerWallHeight;
    final centralPillarHeight = innerWallHeight;
    final innerRadius = baseScale * scale * 1.5;
    final outerRadius = baseScale * scale * 3;

    return InstrumentCalculation(
      name: "Digamsa Yantra",
      sanskritName: "दिगंश यंत्र",
      parameters: {
        'innerWallHeight': innerWallHeight,
        'outerWallHeight': outerWallHeight,
        'centralPillarHeight': centralPillarHeight,
        'innerRadius': innerRadius,
        'outerRadius': outerRadius,
        'azimuthDivisions': 360,
        'precisionDivisions': 360 * 60,
      },
      calibrationNote:
          "Shadow of central pillar indicates azimuth on circular scales",
      precision: "1 arc-minute",
      historicalContext:
          "Used for precise azimuth measurements of celestial objects",
      scientificPurpose: "Azimuth measurement of celestial bodies",
      description:
          "Circular instrument with central pillar for azimuth measurements",
      mathematicalPrinciples: [
        "Circular geometry",
        "Azimuth angle calculations",
        "Shadow direction analysis",
      ],
      constructionMaterials: ["Stone walls", "Central pillar", "Brass scales"],
    );
  }

  // 4. DHRUVA YANTRA - Polar Circle
  InstrumentCalculation calculateDhruvaYantra(
    double latitude,
    double longitude,
    double scale,
  ) {
    final ringDiameter = baseScale * scale * 2.5;
    final ringInclination = 90 - latitude;
    final centralAxisAngle = latitude;

    return InstrumentCalculation(
      name: "Dhruva Yantra",
      sanskritName: "ध्रुव यंत्र",
      parameters: {
        'ringDiameter': ringDiameter,
        'ringInclination': ringInclination,
        'centralAxisAngle': centralAxisAngle,
        'timeDivisions': 24 * 60 / 24,
        'declinationRange': 46.8,
        'polarAlignmentOffset': latitude,
      },
      calibrationNote:
          "Ring inclined at ${ringInclination.toStringAsFixed(2)}° for polar alignment",
      precision: "30 seconds",
      historicalContext:
          "Designed for polar star observations and declination measurements",
      scientificPurpose: "Polar star observations and declination measurements",
      description:
          "Polar-aligned ring instrument for celestial pole observations",
      mathematicalPrinciples: [
        "Polar alignment calculations",
        "Declination measurements",
        "Sidereal time tracking",
      ],
      constructionMaterials: [
        "Metal ring",
        "Stone base",
        "Alignment mechanisms",
      ],
    );
  }

  // 5. YANTRA-SAMRAT - Combined Instrument
  InstrumentCalculation calculateYantraSamrat(
    double latitude,
    double longitude,
    double scale,
  ) {
    final gnomonAngle = latitude;
    final gnomonHeight = baseScale * scale * 3;
    final polarRingDiameter = gnomonHeight * 0.8;
    final polarRingInclination = 90 - latitude;

    return InstrumentCalculation(
      name: "Yantra-Samrat",
      sanskritName: "यंत्र सम्राट",
      parameters: {
        'gnomonAngle': gnomonAngle,
        'gnomonHeight': gnomonHeight,
        'polarRingDiameter': polarRingDiameter,
        'polarRingInclination': polarRingInclination,
        'dualScaleSolar': 24 * 60,
        'dualScaleSidereal': 23.934 * 60,
        'combinedPrecision': 2,
      },
      calibrationNote: "Integrates solar and sidereal time measurement",
      precision: "2 seconds",
      historicalContext:
          "Combination instrument merging features of multiple yantras",
      scientificPurpose: "Combined solar and sidereal time measurement",
      description:
          "Advanced instrument combining features of Samrat Yantra and Dhruva Yantra",
      mathematicalPrinciples: [
        "Solar time calculations",
        "Sidereal time corrections",
        "Combined coordinate systems",
      ],
      constructionMaterials: ["Marble", "Brass rings", "Stone platform"],
    );
  }

  // 6. GOLAYANTRA - Armillary Sphere
  InstrumentCalculation calculateGolayantra(
    double latitude,
    double longitude,
    double scale,
  ) {
    final outerRingDiameter = baseScale * scale * 2;
    final celestialEquatorInclination = latitude;
    final eclipticInclination = 23.44;

    final rings = [
      {
        'name': "Celestial Equator",
        'inclination': celestialEquatorInclination,
        'diameter': outerRingDiameter,
      },
      {
        'name': "Ecliptic",
        'inclination': eclipticInclination,
        'diameter': outerRingDiameter * 0.95,
      },
      {
        'name': "Meridian",
        'inclination': 0,
        'diameter': outerRingDiameter * 0.9,
      },
    ];

    return InstrumentCalculation(
      name: "Golayantra",
      sanskritName: "गोलयन्त्र",
      parameters: {
        'outerRingDiameter': outerRingDiameter,
        'rings': rings,
        'numberOfRings': rings.length,
        'graduationDivisions': 360,
      },
      calibrationNote: "Multiple rings represent celestial coordinate systems",
      precision: "15 arc-minutes",
      historicalContext:
          "Indian version of the armillary sphere for comprehensive celestial mapping",
      scientificPurpose: "Three-dimensional celestial sphere modeling",
      description:
          "Armillary sphere representing multiple celestial coordinate systems",
      mathematicalPrinciples: [
        "Spherical astronomy",
        "Celestial coordinate systems",
        "Ring geometry",
      ],
      constructionMaterials: ["Metal rings", "Brass pivots", "Stone base"],
    );
  }

  // 7. BHITTI YANTRA - Wall Instrument
  InstrumentCalculation calculateBhittiYantra(
    double latitude,
    double longitude,
    double scale,
  ) {
    final wallHeight = baseScale * scale * 4;
    final wallThickness = 0.3;

    final altitudeMarks = <Map<String, dynamic>>[];
    for (int alt = 10; alt <= 90; alt += 10) {
      altitudeMarks.add({
        'altitude': alt,
        'shadowLength': wallHeight / _tan(alt.toDouble()),
      });
    }

    return InstrumentCalculation(
      name: "Bhitti Yantra",
      sanskritName: "भित्ति यंत्र",
      parameters: {
        'wallHeight': wallHeight,
        'wallThickness': wallThickness,
        'meridianAlignment': 0,
        'altitudeScaleRange': 90,
        'scalePrecision': 1 / 60,
        'altitudeMarks': altitudeMarks,
      },
      calibrationNote: "Wall precisely aligned with local meridian",
      precision: "1 arc-minute",
      historicalContext:
          "Wall-mounted instrument for meridian altitude measurements",
      scientificPurpose: "Meridian altitude measurements of celestial bodies",
      description: "Wall-mounted instrument for precise altitude measurements",
      mathematicalPrinciples: [
        "Altitude angle calculations",
        "Shadow length trigonometry",
        "Meridian alignment",
      ],
      constructionMaterials: ["Stone wall", "Marble scales", "Brass markers"],
    );
  }

  // 8. DAKSHINOTTARA BHITTI YANTRA - North-South Wall
  InstrumentCalculation calculateDakshinottaraBhittiYantra(
    double latitude,
    double longitude,
    double scale,
  ) {
    final wallHeight = baseScale * scale * 4;
    final seasonalCorrection = 23.44 * _sin(180);
    final localTimeCorrection = (longitude - 82.5) * 4;

    return InstrumentCalculation(
      name: "Dakshinottara Bhitti Yantra",
      sanskritName: "दक्षिणोत्तर भित्ति यंत्र",
      parameters: {
        'wallHeight': wallHeight,
        'meridianPrecisionAlignment': 0,
        'declinationScaleRange': 46.8,
        'transitTimePrecision': 2,
        'seasonalCorrection': seasonalCorrection,
        'localTimeCorrection': localTimeCorrection,
      },
      calibrationNote: "Specialized for precise meridian passage timing",
      precision: "2 seconds",
      historicalContext:
          "Enhanced wall instrument for transit observations with seasonal corrections",
      scientificPurpose:
          "Precise meridian transit timing with seasonal corrections",
      description:
          "North-South wall instrument for precise transit observations",
      mathematicalPrinciples: [
        "Transit timing calculations",
        "Seasonal declination corrections",
        "Meridian passage analysis",
      ],
      constructionMaterials: [
        "Precision stonework",
        "Brass scales",
        "Alignment tools",
      ],
    );
  }

  // 9. RASIVALAYA YANTRA - Zodiac Instruments
  InstrumentCalculation calculateRasivalayaYantra(
    double latitude,
    double longitude,
    double scale,
  ) {
    final zodiacSigns = [
      "Aries",
      "Taurus",
      "Gemini",
      "Cancer",
      "Leo",
      "Virgo",
      "Libra",
      "Scorpio",
      "Sagittarius",
      "Capricorn",
      "Aquarius",
      "Pisces",
    ];

    final instruments = <Map<String, dynamic>>[];
    for (int i = 0; i < zodiacSigns.length; i++) {
      instruments.add({
        'zodiacSign': zodiacSigns[i],
        'eclipticLongitude': i * 30,
        'gnomonAngle': latitude + (i * 2),
        'scaleRange': 30,
        'constellationAlignment': i * 30,
      });
    }

    return InstrumentCalculation(
      name: "Rasivalaya Yantra",
      sanskritName: "राशिवलय यंत्र",
      parameters: {
        'numberOfInstruments': 12,
        'instruments': instruments,
        'siderealCorrection': 50.26,
        'precisionAchievable': 1 / 60,
      },
      calibrationNote: "Unique to Jaipur - one instrument per zodiac sign",
      precision: "1 arc-minute",
      historicalContext:
          "Twelve separate instruments, each aligned with a zodiac constellation",
      scientificPurpose:
          "Sidereal coordinate measurements for each zodiac sign",
      description:
          "Twelve instruments each aligned with specific zodiac constellations",
      mathematicalPrinciples: [
        "Sidereal coordinate system",
        "Zodiac alignment calculations",
        "Ecliptic longitude measurements",
      ],
      constructionMaterials: [
        "Multiple stone structures",
        "Brass zodiac markers",
        "Individual gnomons",
      ],
    );
  }

  // 10. NADI VALAYA YANTRA - Equatorial Ring
  InstrumentCalculation calculateNadiValayaYantra(
    double latitude,
    double longitude,
    double scale,
  ) {
    final ringDiameter = baseScale * scale * 2.5;
    final ringInclination = latitude;
    final gnomonLength = (ringDiameter / 2) * _sin(latitude);

    final hourDivisions = <Map<String, dynamic>>[];
    for (int hour = 0; hour < 24; hour++) {
      hourDivisions.add({'hour': hour, 'angle': hour * 15, 'subdivisions': 12});
    }

    return InstrumentCalculation(
      name: "Nadi Valaya Yantra",
      sanskritName: "नाडी वलय यंत्र",
      parameters: {
        'ringDiameter': ringDiameter,
        'ringInclination': ringInclination,
        'dualDialConfiguration': 2,
        'gnomonLength': gnomonLength,
        'hourDivisions': hourDivisions,
      },
      calibrationNote: "Two rings for complete 24-hour coverage",
      precision: "2 minutes",
      historicalContext: "Equatorial sundial working throughout the year",
      scientificPurpose: "Equatorial coordinate system measurements",
      description: "Equatorial ring sundial with dual hemisphere coverage",
      mathematicalPrinciples: [
        "Equatorial coordinate system",
        "Hour angle calculations",
        "Dual hemisphere timekeeping",
      ],
      constructionMaterials: ["Metal ring", "Stone base", "Dual gnomons"],
    );
  }

  // 11. PALAKA YANTRA - Observation Instrument
  InstrumentCalculation calculatePalakaYantra(
    double latitude,
    double longitude,
    double scale,
  ) {
    final platformDiameter = baseScale * scale * 2;
    final observationHeight = baseScale * scale * 0.3;
    final sightingMechanismHeight = baseScale * scale * 0.5;

    return InstrumentCalculation(
      name: "Palaka Yantra",
      sanskritName: "पलक यंत्र",
      parameters: {
        'platformDiameter': platformDiameter,
        'observationHeight': observationHeight,
        'graduatedScaleRange': 360,
        'sightingMechanismHeight': sightingMechanismHeight,
        'precisionMarkings': 360 * 60,
        'portableScaleFactor': 0.5,
        'alignmentAccuracy': 1 / 60,
      },
      calibrationNote: "Versatile instrument for various measurements",
      precision: "1 arc-minute",
      historicalContext: "Multi-purpose observational instrument",
      scientificPurpose: "General astronomical observations and measurements",
      description:
          "Versatile platform instrument for various astronomical measurements",
      mathematicalPrinciples: [
        "General angular measurements",
        "Coordinate transformations",
        "Multi-purpose observational geometry",
      ],
      constructionMaterials: [
        "Circular platform",
        "Sighting mechanisms",
        "Graduated scales",
      ],
    );
  }

  // 12. CHAAPA YANTRA - Arc Instrument
  InstrumentCalculation calculateChaapaYantra(
    double latitude,
    double longitude,
    double scale,
  ) {
    final arcRadius = baseScale * scale * 1.5;
    final centralPivotHeight = baseScale * scale * 0.5;
    final plumbBobLength = arcRadius * 0.7;

    return InstrumentCalculation(
      name: "Chaapa Yantra",
      sanskritName: "छाप यंत्र",
      parameters: {
        'arcRadius': arcRadius,
        'arcRange': 90,
        'centralPivotHeight': centralPivotHeight,
        'graduatedDivisions': 90 * 60,
        'plumbBobLength': plumbBobLength,
        'precisionAchievable': 1 / 60,
      },
      calibrationNote: "Used for terrestrial and celestial height measurements",
      precision: "1 arc-minute",
      historicalContext:
          "Arc-based instrument for angular measurements used by ancient astronomers",
      scientificPurpose: "Vertical angle and altitude measurements",
      description: "Arc instrument for precise angular height measurements",
      mathematicalPrinciples: [
        "Arc geometry",
        "Angular measurements",
        "Height calculations",
      ],
      constructionMaterials: ["Curved arc", "Central pivot", "Plumb bob"],
    );
  }

  // MAIN CALCULATION FUNCTION
  CalculationResult calculateAllInstruments(IndianCity location, double scale) {
    final instruments = <String, InstrumentCalculation>{
      'samratYantra': calculateSamratYantra(
        location.latitude,
        location.longitude,
        scale,
      ),
      'ramaYantra': calculateRamaYantra(
        location.latitude,
        location.longitude,
        scale,
      ),
      'digamsaYantra': calculateDigamsaYantra(
        location.latitude,
        location.longitude,
        scale,
      ),
      'dhruvaYantra': calculateDhruvaYantra(
        location.latitude,
        location.longitude,
        scale,
      ),
      'yantraSamrat': calculateYantraSamrat(
        location.latitude,
        location.longitude,
        scale,
      ),
      'golayantra': calculateGolayantra(
        location.latitude,
        location.longitude,
        scale,
      ),
      'bhittiYantra': calculateBhittiYantra(
        location.latitude,
        location.longitude,
        scale,
      ),
      'dakshinottaraBhittiYantra': calculateDakshinottaraBhittiYantra(
        location.latitude,
        location.longitude,
        scale,
      ),
      'rasivalayaYantra': calculateRasivalayaYantra(
        location.latitude,
        location.longitude,
        scale,
      ),
      'nadiValayaYantra': calculateNadiValayaYantra(
        location.latitude,
        location.longitude,
        scale,
      ),
      'palakaYantra': calculatePalakaYantra(
        location.latitude,
        location.longitude,
        scale,
      ),
      'chaapaYantra': calculateChaapaYantra(
        location.latitude,
        location.longitude,
        scale,
      ),
    };

    return CalculationResult(
      location: location,
      instruments: instruments,
      calculatedAt: DateTime.now(),
      baseScale: scale,
      accuracyEstimate: "95%+",
    );
  }
}
