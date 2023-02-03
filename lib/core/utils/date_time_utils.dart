import 'package:intl/intl.dart';

String generateExpectedTime(DateTime date, int interval) {
  DateTime updatedDate = date.add(Duration(minutes: interval));
  final format = DateFormat().add_jm();
  String originalDateString = format.format(date);
  String updatedDateString = format.format(updatedDate);

  return '${formatDateToArabicIndex(originalDateString)} - ${formatDateToArabicIndex(updatedDateString)}';
}

String formatDateToPmAmFormat(DateTime date) {
  final format = DateFormat().add_jm();

  return format.format(date);
}

String formatDateToArabicIndex(String date) {
  final dateIndex = date.split(' ')[1];

  if (dateIndex == 'PM') {
    return '${date.split(' ')[0]} م';
  } else {
    return '${date.split(' ')[0]} ص';
  }
}

String getOpeningHours(String startTime, String endTime) {
  final startTimedateIndex = startTime.split(' ')[1];
  final endTimeDateIndex = endTime.split(' ')[1];
  String result = '';
  if (startTimedateIndex == 'pm') {
    result = '${startTime.split(' ')[0]} مساءا';
  } else {
    result = '${startTime.split(' ')[0]} صباحا';
  }

  if (endTimeDateIndex == 'pm') {
    result = '$result - ${endTime.split(' ')[0]} مساءا';
  } else {
    result = '$result - ${endTime.split(' ')[0]} صباحا';
  }

  return result;
}
