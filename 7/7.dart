import 'dart:io';

extension ParseMyDateTime on String {
  MyDateTime parseMyDateTime() {
    return MyDateTime(
        int.parse(split(':').toList()[0]),
        int.parse(split(':').toList()[1]),
        double.parse(split(':').toList()[2]).round());
  }
}

class MyDateTime {
  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  MyDateTime(this.hours, this.minutes, this.seconds) {
    if (seconds > 59) {
      seconds -= 60;
      minutes += 1;
    }
    if (minutes > 59) {
      minutes -= 60;
      hours += 1;
    }
    if (hours > 23) {
      hours -= 24;
    }
  }

  MyDateTime operator +(MyDateTime other) => _plus(other);
  MyDateTime operator -(MyDateTime other) => _minus(other);
  MyDateTime operator /(int divider) => _division(divider);
  @override
  String toString() {
    String newHours;
    String newMinutes;
    String newSeconds;
    if (hours < 10) {
      newHours = '0${hours.toString()}';
    } else {
      newHours = hours.toString();
    }
    if (minutes < 10) {
      newMinutes = '0${minutes.toString()}';
    } else {
      newMinutes = minutes.toString();
    }
    if (seconds < 10) {
      newSeconds = '0${seconds.toString()}';
    } else {
      newSeconds = seconds.toString();
    }

    return '$newHours:$newMinutes:$newSeconds';
  }

  MyDateTime _plus(MyDateTime other) {
    int newSeconds = seconds + other.seconds;
    int newMinutes = minutes + other.minutes;
    int newHours = hours + other.hours;

    if (newSeconds > 59) {
      newSeconds -= 60;
      newMinutes += 1;
    }
    if (newMinutes > 59) {
      newMinutes -= 60;
      newHours += 1;
    }
    if (newHours > 23) {
      newHours -= 24;
    }
    return MyDateTime(newHours, newMinutes, newSeconds);
  }

  MyDateTime _minus(MyDateTime other) {
    int newSeconds = seconds - other.seconds;
    int newMinutes = minutes - other.minutes;
    int newHours = hours - other.hours;

    if (newSeconds < 0) {
      newSeconds += 60;
      newMinutes -= 1;
    }
    if (newMinutes < 0) {
      newMinutes += 60;
      newHours -= 1;
    }
    if (newHours < 0) {
      newHours += 24;
    }
    return MyDateTime(newHours, newMinutes, newSeconds);
  }

  MyDateTime _division(int divider) {
    int newHours = hours;
    int newMinutes = minutes;
    int newSeconds = seconds;
    int addMinutes = 0;
    int addSeconds = 0;
    if (hours % 2 != 0) {
      hours -= 1;
      addMinutes += 30;
    }
    if (minutes % 2 != 0) {
      minutes -= 1;
      addSeconds += 30;
    }
    newHours = (newHours / divider).round();
    newMinutes = (newMinutes / divider).round();
    newSeconds = (newSeconds / divider).round();
    return MyDateTime(
        (hours / divider).round(),
        (minutes / divider).round() + addMinutes,
        (seconds / divider).round() + addSeconds);
  }
}

void main() {
  MyDateTime startTime = stdin.readLineSync().toString().parseMyDateTime();
  MyDateTime realTime = stdin.readLineSync().toString().parseMyDateTime();
  MyDateTime endTime = stdin.readLineSync().toString().parseMyDateTime();
  MyDateTime connectionTime = (endTime - startTime) / 2;
  print((realTime + connectionTime).toString());
}
