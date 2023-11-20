import 'dart:io';

class AddNewGameState {
  AddNewGameState._({
    required this.pathThumbnail,
    required this.pathCoverPhoto,
  });
  final File pathThumbnail;
  final File pathCoverPhoto;

  AddNewGameState.inicial()
      : this._(
          pathThumbnail: File(''),
          pathCoverPhoto: File(''),
        );

  AddNewGameState copyWith({
    required File pathThumbnail,
    required File pathCoverPhoto,
  }) {
    return AddNewGameState._(
      pathThumbnail: pathThumbnail,
      pathCoverPhoto: pathCoverPhoto,
    );
  }
}
