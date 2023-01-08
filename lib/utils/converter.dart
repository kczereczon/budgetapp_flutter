class Converter {
  late final String currency;
  late final String format;

  Converter({required this.currency, required this.format});
  
  Converter.usd() {
    currency = "\$";
    format = "{s}{d}.{f}";
  }

  Converter.pln() {
    currency = "zł";
    format = "{d},{f} {s}";
  }

  String formatValue(int value) {
    double float = value / 100;
    int integer = float.floor();
    int fractional = value - integer*100; 


    String formatted = format;  
    formatted = formatted.replaceAll("{s}", currency);
    formatted = formatted.replaceAll("{d}", integer.toString());
    formatted = formatted.replaceAll("{f}", fractional.toString().padLeft(2, '0'));

    return formatted;
  }

}