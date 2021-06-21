int _bitrateInBits(int rate) {
  if (rate >= 8) {
    return rate ~/ 8;
  } else {
    return 160 ~/ 8;
  }
}

int _sizeInBits(int size) {
  return size * 8;
}

int _getDuration(String time) {
  try {
    var params = time.split(':');
    var count = params.length;

    // assuming MM:ss format
    if (count == 2) {
      var minutes = params[0];
      var seconds = params[1];

      return int.parse(minutes) * 60 + int.parse(seconds);
    }
    // assuming HH:MM:ss format
    else if (count == 3) {
      var hours = params[0];
      var minutes = params[1];
      var seconds = params[2];

      return int.parse(hours) * 3600 +
          int.parse(minutes) * 60 +
          int.parse(seconds);
    } else {
      return -1;
    }
  } catch (e) {
    return -1;
  }
}

String _padNumber(int value) {
  if (value < 10) {
    return '0' + value.toString();
  } else {
    return value.toString();
  }
}

int getFileSize(String time, {int rate = 160}) {
  var audioDuration = _getDuration(time);

  if (audioDuration > -1) {
    return audioDuration * _bitrateInBits(rate);
  } else {
    return -1;
  }
}

String getAudioDuration(int size, int rate) {
  if (size == 0 || rate > size) {
    return '-1';
  } else {
    try {
      var audioDuration = _sizeInBits(size) ~/ rate;

      if (audioDuration > 0) {
        audioDuration = audioDuration.round();

        var hours = audioDuration ~/ 3600;
        var minutes = (audioDuration - hours * 3600) ~/ 60;
        var seconds = audioDuration % 60;

        return _padNumber(hours) +
            ':' +
            _padNumber(minutes) +
            ':' +
            _padNumber(seconds);
      } else {
        return '00:00:00';
      }
    } catch (e) {
      return '-1';
    }
  }
}

int getAudioBitrate(String time, int size) {
  var audioDuration = _getDuration(time);

  if (audioDuration > -1) {
    try {
      return (_sizeInBits(size) ~/ audioDuration).round();
    } catch (e) {
      return -1;
    }
  } else {
    return -1;
  }
}
