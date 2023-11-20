import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pongs/app/cubits/add_new_game_cubit/add_new_game_cubit.dart';
import 'package:pongs/app/cubits/add_new_game_cubit/add_new_game_state.dart';
import 'package:pongs/app/icons/icons_pongs.dart';
import 'package:pongs/app/services/service_locator/service_locator.dart';
import 'package:pongs/app/widgets/buttom_large_custom/buttom_large_custom_widget.dart';
import 'package:pongs/app/widgets/input_custom/input_custom_widget.dart';
import 'package:pongs/app/widgets/input_custom/input_medium_custom_widget.dart';
import 'package:pongs/app/widgets/input_custom/input_small_custom_widget.dart';

class AddNewGameView extends StatefulWidget {
  const AddNewGameView({super.key});

  @override
  State<AddNewGameView> createState() => _AddNewGameViewState();
}

class _AddNewGameViewState extends State<AddNewGameView> {
  late final AddNewGameCubit _cubit;

  bool fotoDeCapa = false;
  bool thumb = false;

  @override
  void initState() {
    _cubit = context.read<AddNewGameCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddNewGameCubit>(
        create: (_) => getIt.get<AddNewGameCubit>(),
        child: Builder(
          builder: (context) {
            return BlocConsumer<AddNewGameCubit, AddNewGameState>(
                listener: ((context, state) {
                  //TODO: adicionar flushbar de erro.
                }),
                bloc: _cubit,
                builder: (context, state) {
                  return Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: SingleChildScrollView(
                          child: Stack(children: [
                            Column(
                              children: [
                                fotoDeCapa
                                    ? Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: FileImage(
                                              state.pathCoverPhoto,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    _cubit.clearFields();
                                                  },
                                                  child: const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 15.0, top: 15.0),
                                                    child: Icon(
                                                      IconsPongs.close,
                                                      color: Color(0xFF611313),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                            // Cover Photo
                                            Center(
                                              child: GestureDetector(
                                                onTap: () async {
                                                  fotoDeCapa = await _cubit
                                                      .getCoverPhotoGameImageGallery();
                                                },
                                                child: const SizedBox(
                                                  height: 180,
                                                  child: Icon(
                                                    IconsPongs.add_image,
                                                    color: Color(0xFF611313),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(
                                        color: Color(0xffFFE9C9),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    _cubit.clearFields();
                                                  },
                                                  child: const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 15.0, top: 15.0),
                                                    child: Icon(
                                                      IconsPongs.close,
                                                      color: Color(0xFF611313),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                            // Cover Photo
                                            Center(
                                              child: GestureDetector(
                                                onTap: () async {
                                                  fotoDeCapa = await _cubit
                                                      .getCoverPhotoGameImageGallery();
                                                  setState(() {});
                                                },
                                                child: const SizedBox(
                                                  height: 180,
                                                  child: Icon(
                                                    IconsPongs.add_image,
                                                    color: Color(0xFF611313),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                // foto de capa Refatorar
                                Container(
                                  color: const Color(0xffFFF2DF),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.07),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 29.0, top: 24, bottom: 24),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Titulo do jogo: ",
                                              style: GoogleFonts.getFont(
                                                'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF161616),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                InputMediumCustomWidget(
                                                  customBackgroundColor:
                                                      const Color(0xFFFEDCA9),
                                                  controller: _cubit
                                                      .titleOfGameController,
                                                  focusNode:
                                                      _cubit.titleOfGameNode,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      // Widget Quantidade de Pessoas
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 24.0),
                                            child: Text(
                                              'Quantidade de pessoas',
                                              style: GoogleFonts.getFont(
                                                'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF161616),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 50.0,
                                                top: 8.0,
                                                bottom: 8.0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.45,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 18.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _cubit
                                                            .decrementAmountOfPeople();
                                                      },
                                                      child: const Icon(
                                                        IconsPongs.decrement,
                                                        color:
                                                            Color(0xFF611313),
                                                      ),
                                                    ),
                                                  ),
                                                  InputSmallCustomWidget(
                                                    customBackgroundColor:
                                                        const Color(0xFFFEDCA9),
                                                    controller: _cubit
                                                        .amountOfPeopleController,
                                                    focusNode: _cubit
                                                        .amountOfPeopleNode,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 18.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _cubit
                                                            .incrementAmountOfPeople();
                                                      },
                                                      child: const Icon(
                                                        IconsPongs.increment,
                                                        color:
                                                            Color(0xFF611313),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 24.0),
                                            child: Text(
                                              'Tempo por rodada',
                                              style: GoogleFonts.getFont(
                                                'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF161616),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 50.0,
                                                top: 8.0,
                                                bottom: 8.0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.45,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 18.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _cubit
                                                            .decrementTimePerRound();
                                                      },
                                                      child: const Icon(
                                                        IconsPongs.decrement,
                                                        color:
                                                            Color(0xFF611313),
                                                      ),
                                                    ),
                                                  ),
                                                  InputSmallCustomWidget(
                                                    customBackgroundColor:
                                                        const Color(0xFFFEDCA9),
                                                    controller: _cubit
                                                        .timePerRoundController,
                                                    focusNode:
                                                        _cubit.timePerRoundNode,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 18.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        _cubit
                                                            .incrementTimePerRound();
                                                      },
                                                      child: const Icon(
                                                        IconsPongs.increment,
                                                        color:
                                                            Color(0xFF611313),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Widget materiais
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 29.0, top: 24),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Materiais: ",
                                              style: GoogleFonts.getFont(
                                                'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF161616),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 1, right: 3),
                                                  child: Text(
                                                    '1.',
                                                    style: GoogleFonts.getFont(
                                                      'Poppins',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xFF161616),
                                                    ),
                                                  ),
                                                ),
                                                InputMediumCustomWidget(
                                                  customBackgroundColor:
                                                      const Color(0xFFFEDCA9),
                                                  controller: _cubit
                                                      .oneMaterialsController,
                                                  focusNode:
                                                      _cubit.oneMaterialsNode,
                                                ),
                                                const SizedBox(
                                                  width: 16,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    _cubit
                                                        .incrementInputMaterials();
                                                    setState(() {});
                                                  },
                                                  child: const Icon(
                                                    IconsPongs.increment,
                                                    color: Color(0xFF611313),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      // Widget materiais 2
                                      Visibility(
                                        visible: _cubit.showInputTwoMaterials,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 29.0, top: 24),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 1, right: 3),
                                                    child: Text(
                                                      '2.',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Poppins',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xFF161616),
                                                      ),
                                                    ),
                                                  ),
                                                  InputMediumCustomWidget(
                                                    customBackgroundColor:
                                                        const Color(0xFFFEDCA9),
                                                    controller: _cubit
                                                        .twoMaterialsController,
                                                    focusNode:
                                                        _cubit.twoMaterialsNode,
                                                  ),
                                                  const SizedBox(
                                                    width: 16,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      _cubit
                                                          .incrementInputMaterials();
                                                      setState(() {});
                                                    },
                                                    child: const Icon(
                                                      IconsPongs.increment,
                                                      color: Color(0xFF611313),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Widget materiais 3
                                      Visibility(
                                        visible: _cubit.showInputThreeMaterials,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 29.0, top: 24),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 1, right: 3),
                                                    child: Text(
                                                      '3.',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Poppins',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xFF161616),
                                                      ),
                                                    ),
                                                  ),
                                                  InputMediumCustomWidget(
                                                    customBackgroundColor:
                                                        const Color(0xFFFEDCA9),
                                                    controller: _cubit
                                                        .twoMaterialsController,
                                                    focusNode:
                                                        _cubit.twoMaterialsNode,
                                                  ),
                                                  const SizedBox(
                                                    width: 16,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      _cubit
                                                          .incrementInputMaterials();
                                                      setState(() {});
                                                    },
                                                    child: const Icon(
                                                      IconsPongs.increment,
                                                      color: Color(0xFF611313),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Widget materiais 4
                                      Visibility(
                                        visible: _cubit.showInputFourMaterials,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 29.0, top: 24),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 1, right: 3),
                                                    child: Text(
                                                      '4.',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Poppins',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: const Color(
                                                            0xFF161616),
                                                      ),
                                                    ),
                                                  ),
                                                  InputMediumCustomWidget(
                                                    customBackgroundColor:
                                                        const Color(0xFFFEDCA9),
                                                    controller: _cubit
                                                        .twoMaterialsController,
                                                    focusNode:
                                                        _cubit.twoMaterialsNode,
                                                  ),
                                                  const SizedBox(
                                                    width: 16,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

                                      // Widget Descrição
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 29.0, top: 24, bottom: 24),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Descrição: ",
                                              style: GoogleFonts.getFont(
                                                'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF161616),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                InputCustomWidget(
                                                  paddingTop: 0,
                                                  customWidth: 240,
                                                  customHeight: 123,
                                                  customMaxLines: 4,
                                                  customBorderRadius: 15,
                                                  customBackgroundColor:
                                                      const Color(0xFFFEDCA9),
                                                  controller: _cubit
                                                      .descriptionController,
                                                  focusNode:
                                                      _cubit.descriptionNode,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),

                                      // Widget Como jogar 1
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 36.0, top: 24, bottom: 24),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Como jogar?",
                                              style: GoogleFonts.getFont(
                                                'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF161616),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 7, right: 3),
                                                  child: Text(
                                                    '1.',
                                                    style: GoogleFonts.getFont(
                                                      'Poppins',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: const Color(
                                                          0xFF161616),
                                                    ),
                                                  ),
                                                ),
                                                InputCustomWidget(
                                                  paddingTop: 0,
                                                  customWidth: 216,
                                                  customHeight: 76,
                                                  customBorderRadius: 15,
                                                   customMaxLines: 4,
                                                  customBackgroundColor:
                                                      const Color(0xFFFEDCA9),
                                                  controller: _cubit
                                                      .oneHowToPlayController,
                                                  focusNode:
                                                      _cubit.oneHowToPlayNode,
                                                ),
                                              ],
                                            ),

                                            // Widget como jogar 2
                                            Visibility(
                                              visible:
                                                  _cubit.showInputTwoHowToPlay,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 7, right: 3),
                                                      child: Text(
                                                        '2.',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Poppins',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color(
                                                              0xFF161616),
                                                        ),
                                                      ),
                                                    ),
                                                    InputCustomWidget(
                                                      paddingTop: 0,
                                                      customWidth: 216,
                                                      customHeight: 76,
                                                      customMaxLines: 4,
                                                      customBorderRadius: 15,
                                                      customBackgroundColor:
                                                          const Color(
                                                              0xFFFEDCA9),
                                                      controller: _cubit
                                                          .twoHowToPlayController,
                                                      focusNode: _cubit
                                                          .twoHowToPlayNode,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                            // Widget como jogar 3

                                            Visibility(
                                              visible: _cubit
                                                  .showInputThreeHowToPlay,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 7, right: 3),
                                                      child: Text(
                                                        '3.',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Poppins',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color(
                                                              0xFF161616),
                                                        ),
                                                      ),
                                                    ),
                                                    InputCustomWidget(
                                                      paddingTop: 0,
                                                      customWidth: 216,
                                                      customHeight: 76,
                                                      customMaxLines: 4,
                                                      customBorderRadius: 15,
                                                      customBackgroundColor:
                                                          const Color(
                                                              0xFFFEDCA9),
                                                      controller: _cubit
                                                          .threeHowToPlayController,
                                                      focusNode: _cubit
                                                          .threeHowToPlayNode,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                            // Widget como jogar 4

                                            Visibility(
                                              visible:
                                                  _cubit.showInputFourHowToPlay,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 7, right: 3),
                                                      child: Text(
                                                        '4.',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Poppins',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color(
                                                              0xFF161616),
                                                        ),
                                                      ),
                                                    ),
                                                    InputCustomWidget(
                                                      paddingTop: 0,
                                                      customWidth: 216,
                                                      customHeight: 76,
                                                      customMaxLines: 4,
                                                      customBorderRadius: 15,
                                                      customBackgroundColor:
                                                          const Color(
                                                              0xFFFEDCA9),
                                                      controller: _cubit
                                                          .fourHowToPlayController,
                                                      focusNode: _cubit
                                                          .fourHowToPlayNode,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                            // Widget como jogar 5

                                            Visibility(
                                              visible:
                                                  _cubit.showInputFiveHowToPlay,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 7, right: 3),
                                                      child: Text(
                                                        '5.',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Poppins',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color(
                                                              0xFF161616),
                                                        ),
                                                      ),
                                                    ),
                                                    InputCustomWidget(
                                                      paddingTop: 0,
                                                      customWidth: 216,
                                                      customHeight: 76,
                                                      customMaxLines: 4,
                                                      customBorderRadius: 15,
                                                      customBackgroundColor:
                                                          const Color(
                                                              0xFFFEDCA9),
                                                      controller: _cubit
                                                          .fiveHowToPlayController,
                                                      focusNode: _cubit
                                                          .fiveHowToPlayNode,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                            // Widget como jogar 6

                                            Visibility(
                                              visible:
                                                  _cubit.showInputSixHowToPlay,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 7, right: 3),
                                                      child: Text(
                                                        '6.',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Poppins',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color(
                                                              0xFF161616),
                                                        ),
                                                      ),
                                                    ),
                                                    InputCustomWidget(
                                                      paddingTop: 0,
                                                      customWidth: 216,
                                                      customHeight: 76,
                                                      customMaxLines: 4,
                                                      customBorderRadius: 15,
                                                      customBackgroundColor:
                                                          const Color(
                                                              0xFFFEDCA9),
                                                      controller: _cubit
                                                          .sixHowToPlayController,
                                                      focusNode: _cubit
                                                          .sixHowToPlayNode,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            // Widget como jogar 7

                                            Visibility(
                                              visible: _cubit
                                                  .showInputSevenHowToPlay,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 7, right: 3),
                                                      child: Text(
                                                        '7.',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Poppins',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color(
                                                              0xFF161616),
                                                        ),
                                                      ),
                                                    ),
                                                    InputCustomWidget(
                                                      paddingTop: 0,
                                                      customWidth: 216,
                                                      customHeight: 76,
                                                      customMaxLines: 4,
                                                      customBorderRadius: 15,
                                                      customBackgroundColor:
                                                          const Color(
                                                              0xFFFEDCA9),
                                                      controller: _cubit
                                                          .sevenHowToPlayController,
                                                      focusNode: _cubit
                                                          .sevenHowToPlayNode,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            // Widget como jogar 8

                                            Visibility(
                                              visible: _cubit
                                                  .showInputEightHowToPlay,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 7, right: 3),
                                                      child: Text(
                                                        '8.',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Poppins',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color(
                                                              0xFF161616),
                                                        ),
                                                      ),
                                                    ),
                                                    InputCustomWidget(
                                                      paddingTop: 0,
                                                      customWidth: 216,
                                                      customHeight: 76,
                                                      customMaxLines: 4,
                                                      customBorderRadius: 15,
                                                      customBackgroundColor:
                                                          const Color(
                                                              0xFFFEDCA9),
                                                      controller: _cubit
                                                          .eightHowToPlayController,
                                                      focusNode: _cubit
                                                          .eightHowToPlayNode,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Visibility(
                                        visible:
                                            _cubit.showButtonAddInputHowToPlay,
                                        child: InkWell(
                                          onTap: () {
                                            _cubit.incrementInputHowToPlay();
                                            setState(() {});
                                          },
                                          child: const Center(
                                            child: Icon(
                                              IconsPongs.increment,
                                              color: Color(0xFF611313),
                                            ),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(height: 33),

                                      Center(
                                        child: ButtonLargeCustomWidget(
                                          customPaddingTop: 0,
                                          customColorTitle:
                                              const Color(0xFFFFB74E),
                                          customBackgroundColor:
                                              const Color(0xFF611313),
                                          buttonName: 'Publicar',
                                          customFontSize: 16,
                                          onPressed: () {
                                            _cubit.sendGame();
                                            // _cubit.clearFields();
                                          },
                                        ),
                                      ),

                                      const SizedBox(height: 40),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.23,
                              left: MediaQuery.of(context).size.height * 0.03,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                  child: GestureDetector(
                                    onTap: () async {
                                      thumb = await _cubit
                                          .getThumbnailGameImageGallery();
                                      setState(() {});
                                    },

                                    // TODO: REFATORAR
                                    child: thumb
                                        ? Container(
                                            // Imagem do perfil

                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: FileImage(
                                                  state.pathThumbnail,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            width: 100,
                                            height: 100,
                                            child: const Icon(
                                              IconsPongs.add_image,
                                              color: Color(0xFF611313),
                                            ),
                                          )
                                        : Container(
                                            // Imagem do perfil
                                            color: Color(0XFFFEDCA9),
                                            width: 100,
                                            height: 100,
                                            child: const Icon(
                                              IconsPongs.add_image,
                                              color: Color(0xFF611313),
                                            ),
                                          ),

                                    // Refatorar foto thumb
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
