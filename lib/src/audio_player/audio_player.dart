/// {@template audio_player}
/// Abstract interface for platform-specific audio players.
/// {@endtemplate}
abstract interface class AudioPlayer {
  /// Plays the audio file at the given path.
  ///
  /// Throws an error if the file does not exist or cannot be played.
  Future<int> play(String path);
}
