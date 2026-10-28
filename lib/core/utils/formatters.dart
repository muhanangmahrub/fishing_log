import 'package:intl/intl.dart';

final _dateTime = DateFormat('d MMM y, HH:mm');

String formatDateTime(DateTime value) => _dateTime.format(value);
