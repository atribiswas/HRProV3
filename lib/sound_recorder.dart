import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class SoundRecorder {
  final pathToSaveAudio = 'images\audio_example.aac';
  FlutterSoundRecorder? _audioRecorder;
  // ignore: unused_field
  bool _isRecorderInitialized = false;
  bool get isRecording => _audioRecorder!.isRecording;
  Future _record() async {
    if (!_isRecorderInitialized) return;
    await _audioRecorder!.startRecorder(toFile: pathToSaveAudio);
  }

  Future _stop() async {
    if (!_isRecorderInitialized) return;
    await _audioRecorder!.stopRecorder();
  }

  Future toggleRecording() async {
    if (_audioRecorder!.isStopped) {
      await _record();
    } else {
      await _stop();
      dispose();
    }
  }

  Future init() async {
    _audioRecorder = FlutterSoundRecorder();
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone Permission Denied');
    }
    await _audioRecorder!.openRecorder();
    _isRecorderInitialized = true;
  }

  void dispose() {
    if (!_isRecorderInitialized) return;

    _audioRecorder!.stopRecorder();
    _audioRecorder = null;
    _isRecorderInitialized = false;
  }
}
