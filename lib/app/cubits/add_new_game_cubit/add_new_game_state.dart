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

// class AddNewGameInitial extends AddNewGameState {}

// class AddNewGameLoading extends AddNewGameState {}

// class AddNewGameSucess extends AddNewGameState {
//   final File pathThumbnail;
//   final File pathCoverPhoto;

//   AddNewGameSucess({
//     required this.pathThumbnail,
//     required this.pathCoverPhoto,
//   });
// }

// class AddNewGameError extends AddNewGameState {
//   String message;
//   AddNewGameError({
//     required this.message,
//   });
// }

// // AddImagesGames

// class AddImagesGamesInitial extends AddNewGameState {}

// class AddImagesGamesLoading extends AddNewGameState {}

// class AddImagesGamesSucess extends AddNewGameState {
//   File? pathThumbnail;
//   File? pathCoverPhoto;
//   AddImagesGamesSucess({
//     this.pathThumbnail,
//     this.pathCoverPhoto,
//   });
// }

// class AddImagesGamesError extends AddNewGameState {
//   File? pathThumbnail;
//   File? pathCoverPhoto;
//   String message;
//   AddImagesGamesError({
//     required this.message,
//     this.pathThumbnail,
//     this.pathCoverPhoto,
//   });
// }



// Thumbnail

// class ImageThumbnailInitial extends AddNewGameState {}

// class ImageThumbnailLoading extends AddNewGameState {}

// class ImageThumbnailSucess extends AddNewGameState {
//   File pathThumbnail;
//   ImageThumbnailSucess({required this.pathThumbnail});
// }

// class ImageThumbnailError extends AddNewGameState {
//   String message;
//   ImageThumbnailError({required this.message});
// }

// // Cover Photo

// class CoverPhotoInitial extends AddNewGameState {}

// class CoverPhotoLoading extends AddNewGameState {}

// class CoverPhotoSucess extends AddNewGameState {
//   File pathCoverPhoto;
//   CoverPhotoSucess({required this.pathCoverPhoto});
// }

// class CoverPhotoError extends AddNewGameState {
//   String message;
//   CoverPhotoError({required this.message});
// }
