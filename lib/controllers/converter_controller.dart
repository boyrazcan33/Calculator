import '../models/converter_model.dart';

class ConverterController {
  ConverterModel model = ConverterModel();

  String convertKmToMile(String kmText) {
    if (kmText.isEmpty) return '';
    try {
      double km = double.parse(kmText);
      double miles = model.kmToMile(km);
      return miles.toStringAsFixed(2);
    } catch (e) {
      return '';
    }
  }

  String convertMileToKm(String mileText) {
    if (mileText.isEmpty) return '';
    try {
      double miles = double.parse(mileText);
      double km = model.mileToKm(miles);
      return km.toStringAsFixed(2);
    } catch (e) {
      return '';
    }
  }
}