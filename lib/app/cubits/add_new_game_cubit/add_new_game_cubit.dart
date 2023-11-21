import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pongs/app/cubits/add_new_game_cubit/add_new_game_state.dart';
import 'package:pongs/app/models/game_model/game_model.dart';
import 'package:pongs/app/repositories/add_new_game_repository/add_new_game_repository.dart';
import 'package:pongs/app/services/navigator_service/navigator_custom_service.dart';
import 'package:pongs/app/views/dashboard/dashboard_view.dart';
import 'package:pongs/app/widgets/flushbar_widget/flushbar_sucess_widget.dart';
import 'package:uuid/uuid.dart';
import 'package:permission_handler/permission_handler.dart';

class AddNewGameCubit extends Cubit<AddNewGameState> {
  String filePathThumbnail = '';
  String filePathcoverPhoto = '';
  List<String> listHowToPlay = [];
  List<String> listMaterials = [];

  final titleOfGameController = TextEditingController();
  final amountOfPeopleController = TextEditingController();
  final timePerRoundController = TextEditingController();
  final oneMaterialsController = TextEditingController();
  final twoMaterialsController = TextEditingController();
  final threeMaterialsController = TextEditingController();
  final fourMaterialsController = TextEditingController();
  final descriptionController = TextEditingController();

  final oneHowToPlayController = TextEditingController();
  final twoHowToPlayController = TextEditingController();
  final threeHowToPlayController = TextEditingController();
  final fourHowToPlayController = TextEditingController();
  final fiveHowToPlayController = TextEditingController();
  final sixHowToPlayController = TextEditingController();
  final sevenHowToPlayController = TextEditingController();
  final eightHowToPlayController = TextEditingController();

  final titleOfGameNode = FocusNode();
  final amountOfPeopleNode = FocusNode();
  final timePerRoundNode = FocusNode();
  final oneMaterialsNode = FocusNode();
  final twoMaterialsNode = FocusNode();
  final threeMaterialsNode = FocusNode();
  final fourMaterialsNode = FocusNode();
  final descriptionNode = FocusNode();

  final oneHowToPlayNode = FocusNode();
  final twoHowToPlayNode = FocusNode();
  final threeHowToPlayNode = FocusNode();
  final fourHowToPlayNode = FocusNode();
  final fiveHowToPlayNode = FocusNode();
  final sixHowToPlayNode = FocusNode();
  final sevenHowToPlayNode = FocusNode();
  final eightHowToPlayNode = FocusNode();

  bool showInputTwoMaterials = false;
  bool showInputThreeMaterials = false;
  bool showInputFourMaterials = false;
  int countInputMaterials = 2;

  bool showInputTwoHowToPlay = false;
  bool showInputThreeHowToPlay = false;
  bool showInputFourHowToPlay = false;
  bool showInputFiveHowToPlay = false;
  bool showInputSixHowToPlay = false;
  bool showInputSevenHowToPlay = false;
  bool showInputEightHowToPlay = false;
  int countInputHowToPlay = 2;

  bool showButtonAddInputHowToPlay = true;

  final AddNewGameRepository _repository;

  AddNewGameCubit(this._repository) : super(AddNewGameState.inicial());

  void incrementAmountOfPeople() {
    if (amountOfPeopleController.text.isEmpty) {
      amountOfPeopleController.text = '0';
    }

    int currentValor = int.parse(amountOfPeopleController.text);

    if (currentValor >= 100) {
      currentValor = 100;
      amountOfPeopleController.text = currentValor.toString();
    } else {
      currentValor++;
      amountOfPeopleController.text = currentValor.toString();
    }
  }

  void decrementAmountOfPeople() {
    if (amountOfPeopleController.text.isNotEmpty) {
      int currentValor = int.parse(amountOfPeopleController.text);

      if (currentValor <= 0) {
        currentValor = 0;
        amountOfPeopleController.text = currentValor.toString();
      } else {
        currentValor--;
        amountOfPeopleController.text = currentValor.toString();
      }
    }
  }

  void incrementTimePerRound() {
    if (timePerRoundController.text.isEmpty) {
      timePerRoundController.text = '0';
    }

    int currentValor = int.parse(timePerRoundController.text);

    if (currentValor >= 100) {
      currentValor = 100;
      timePerRoundController.text = currentValor.toString();
    } else {
      currentValor++;
      timePerRoundController.text = currentValor.toString();
    }
  }

  void decrementTimePerRound() {
    if (timePerRoundController.text.isNotEmpty) {
      int currentValor = int.parse(timePerRoundController.text);

      if (currentValor <= 0) {
        currentValor = 0;
        timePerRoundController.text = currentValor.toString();
      } else {
        currentValor--;
        timePerRoundController.text = currentValor.toString();
      }
    }
  }

  incrementInputMaterials() {
    if (countInputMaterials > 4) {
      countInputMaterials = 4;
    }

    if (countInputMaterials == 2) {
      countInputMaterials++;
      showInputTwoMaterials = true;
    } else if (countInputMaterials == 3) {
      countInputMaterials++;
      showInputThreeMaterials = true;
    } else if (countInputMaterials == 4) {
      countInputMaterials++;
      showInputFourMaterials = true;
    }
  }

  incrementInputHowToPlay() {
    if (countInputHowToPlay > 8) {
      countInputHowToPlay = 8;
    }

    if (countInputHowToPlay == 2) {
      countInputHowToPlay++;
      showInputTwoHowToPlay = true;
    } else if (countInputHowToPlay == 3) {
      countInputHowToPlay++;
      showInputThreeHowToPlay = true;
    } else if (countInputHowToPlay == 4) {
      countInputHowToPlay++;
      showInputFourHowToPlay = true;
    } else if (countInputHowToPlay == 5) {
      countInputHowToPlay++;
      showInputFiveHowToPlay = true;
    } else if (countInputHowToPlay == 6) {
      countInputHowToPlay++;
      showInputSixHowToPlay = true;
    } else if (countInputHowToPlay == 7) {
      countInputHowToPlay++;
      showInputSevenHowToPlay = true;
    } else if (countInputHowToPlay == 8) {
      countInputHowToPlay++;
      showInputEightHowToPlay = true;

      showButtonAddInputHowToPlay = false;
    }
  }

  addListOfHowToPlay() {
    if (oneHowToPlayController.text.isNotEmpty) {
      listHowToPlay.add(oneHowToPlayController.text);
    }

    if (twoHowToPlayController.text.isNotEmpty) {
      listHowToPlay.add(twoHowToPlayController.text);
    }

    if (threeHowToPlayController.text.isNotEmpty) {
      listHowToPlay.add(threeHowToPlayController.text);
    }

    if (fourHowToPlayController.text.isNotEmpty) {
      listHowToPlay.add(fourHowToPlayController.text);
    }

    if (fiveHowToPlayController.text.isNotEmpty) {
      listHowToPlay.add(fiveHowToPlayController.text);
    }

    if (sixHowToPlayController.text.isNotEmpty) {
      listHowToPlay.add(sixHowToPlayController.text);
    }

    if (sevenHowToPlayController.text.isNotEmpty) {
      listHowToPlay.add(sevenHowToPlayController.text);
    }

    if (eightHowToPlayController.text.isNotEmpty) {
      listHowToPlay.add(eightHowToPlayController.text);
    }
  }

  addListOfMaterials() {
    if (oneMaterialsController.text.isNotEmpty) {
      listMaterials.add(oneMaterialsController.text);
    }

    if (twoMaterialsController.text.isNotEmpty) {
      listMaterials.add(twoMaterialsController.text);
    }

    if (threeMaterialsController.text.isNotEmpty) {
      listMaterials.add(threeMaterialsController.text);
    }

    if (fourMaterialsController.text.isNotEmpty) {
      listMaterials.add(fourMaterialsController.text);
    }
  }

  Future<void> sendGame(BuildContext context) async {
    addListOfHowToPlay();
    addListOfMaterials();

    bool sendGameuser = await _repository.setGamerUser(
      GameModel(
        gameId: const Uuid().v4(),
        gameTitle: titleOfGameController.text,
        thumbnail: filePathThumbnail,
        coverPhoto: filePathcoverPhoto,
        materials: listMaterials,
        description: descriptionController.text,
        amountOfPeople: amountOfPeopleController.text.isNotEmpty
            ? int.parse(amountOfPeopleController.text)
            : 0,
        timePerRound: timePerRoundController.text.isNotEmpty
            ? int.parse(timePerRoundController.text)
            : 0,
        howToPlay: listHowToPlay,
      ).toMap(),
    );

    bool sendGameAll = await _repository.setGamerAll(
      GameModel(
        gameId: const Uuid().v4(),
        gameTitle: titleOfGameController.text,
        thumbnail: filePathThumbnail,
        coverPhoto: filePathcoverPhoto,
        materials: listMaterials,
        description: descriptionController.text,
        amountOfPeople: amountOfPeopleController.text.isNotEmpty
            ? int.parse(amountOfPeopleController.text)
            : 0,
        timePerRound: timePerRoundController.text.isNotEmpty
            ? int.parse(timePerRoundController.text)
            : 0,
        howToPlay: listHowToPlay,
      ).toMap(),
    );

    if (sendGameuser && sendGameAll) {
      FlushbarSuccessWidget(
        context: context,
        title: 'Cadastro completo',
        message: 'Novo jogo cadastrado com sucesso',
        duration: Duration(seconds: 3)
      );

      Future.delayed(Duration(seconds: 4), () {
        NavigatorCustomService.pushAndRemoveUntil(
            pageName: const DashboardView());

        clearFields();
      });
    }
  }

  Future<void> sendImageThumbnailGame(File file) async {
    filePathThumbnail = await _repository.setImageThumbnailGame(file);
  }

  Future<void> sendImageCoverPhotoGame(File file) async {
    filePathcoverPhoto = await _repository.setImageCoverPhotoGame(file);
  }

  Future<dynamic> getThumbnailGameImageGallery() async {
    bool permissionGranted = await checkPermission(Permission.camera);

    if (permissionGranted) {
      final picker = ImagePicker();
      XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 100,
        maxHeight: 100,
        imageQuality: 100,
      );

      if (pickedFile == null) {
        return false;
      }
      File file = File(pickedFile.path);

      emit(state.copyWith(
          pathThumbnail: file, pathCoverPhoto: state.pathCoverPhoto));

      sendImageThumbnailGame(file);

      return true;
    }
  }

  Future<dynamic> getCoverPhotoGameImageGallery() async {
    bool permissionGranted = await checkPermission(Permission.camera);

    if (permissionGranted) {
      final picker = ImagePicker();
      XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 400,
        maxHeight: 264,
        imageQuality: 100,
      );

      if (pickedFile == null) {
        return false;
      }
      File file = File(pickedFile.path);

      emit(state.copyWith(
          pathCoverPhoto: file, pathThumbnail: state.pathThumbnail));

      sendImageCoverPhotoGame(file);

      return true;
    }
  }

  Future<bool> checkPermission(Permission permission) async {
    final status = await permission.request();
    bool permissionGranted = false;
    if (status.isGranted) {
      permissionGranted = true;
    } else {
      Permission.camera;
    }

    return permissionGranted;
  }

  clearFields() {
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        filePathThumbnail = '';
        filePathcoverPhoto = '';
        listHowToPlay = [];
        listMaterials = [];

        titleOfGameController.clear();
        amountOfPeopleController.clear();
        timePerRoundController.clear();

        oneMaterialsController.clear();
        twoMaterialsController.clear();
        threeMaterialsController.clear();
        fourMaterialsController.clear();
        descriptionController.clear();

        oneHowToPlayController.clear();
        twoHowToPlayController.clear();
        threeHowToPlayController.clear();
        fourHowToPlayController.clear();
        fiveHowToPlayController.clear();
        sixHowToPlayController.clear();
        sevenHowToPlayController.clear();
        eightHowToPlayController.clear();

        showInputTwoMaterials = false;
        showInputThreeMaterials = false;
        showInputFourMaterials = false;
        countInputMaterials = 2;

        showInputTwoHowToPlay = false;
        showInputThreeHowToPlay = false;
        showInputFourHowToPlay = false;
        showInputFiveHowToPlay = false;
        showInputSixHowToPlay = false;
        showInputSevenHowToPlay = false;
        showInputEightHowToPlay = false;
        countInputHowToPlay = 2;

        showButtonAddInputHowToPlay = true;
      },
    );
  }
}
