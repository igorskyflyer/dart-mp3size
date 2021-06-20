## 🎶 Mp3Size now in Dart 🎯

> 🧮 Calculates an estimated file size of Mp3 files. 🎶

<br>

### Usage

A simple usage example:

```dart
import 'package:mp3size/mp3size.dart';

main() {
  print('mp3size: ${getFileSize('03:30')}'); // returns 4200
  print('mp3size: ${getFileSize('03:18', rate: 320)}'); // returns 7920
  print('mp3size: ${getAudioDuration(6474, 306)}'); // returns 00:02:49
  print('mp3size: ${getAudioBitrate('03:42', 5346)}'); // returns 192
}
```
