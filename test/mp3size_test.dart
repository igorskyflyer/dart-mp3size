import 'package:mp3size/mp3size.dart';
import 'package:test/test.dart';

/// Since MP3 files are loosly compressed files and can have a variable bitrate, a function of allowed value deviation is used.
bool deviation(int value, int offset, int expect) {
  return value >= expect - offset && value <= expect + offset;
}

void main() {
  group('mp3Size', () {
    test('should return 86680', () {
      expect(getFileSize('01:12:14'), 86680);
    });

    test('should return 4464', () {
      expect(getFileSize('03:06', rate: 192), 4464);
    });

    test('should return -1', () {
      expect(getAudioBitrate('', -1), -1);
    });

    test('should return ~192', () {
      var bitrate = getAudioBitrate('03:42', 5346);
      expect(deviation(bitrate, 3, 192), isTrue);
    });

    test('should return ~320', () {
      var bitrate = getAudioBitrate('02:47', 6715);
      expect(deviation(bitrate, 3, 320), isTrue);
    });

    test('should return 00:02:49', () {
      var duration = getAudioDuration(6474, 306);
      expect(duration, '00:02:49');
    });
  });
}
