import 'package:audioplayers/audioplayers.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/control_classes/failure.dart';
import '../../../../core/control_classes/usecase.dart';

/// Plays the timer sound.
/// Can receive an [AudioPlayer] as a parameter, if it is null, it will create
/// a new one and it will return it.
class PlayTimerSound implements UseCase<AudioPlayer, AudioPlayer?> {
  const PlayTimerSound();

  @override
  Future<Either<Failure, AudioPlayer>> call(AudioPlayer? audioPlayer) async {
    final player = audioPlayer ?? AudioPlayer();
    if (audioPlayer == null) {
      await player.setSource(
        AssetSource('sounds/islandy_loop.mp3'),
      );
      await player.setReleaseMode(ReleaseMode.loop);
    }
    await player.resume();
    return Right(player);
  }
}
