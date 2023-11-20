import 'dart:async';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pongs/app/services/url_constants/url_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNewGameRepository {
  late DatabaseReference _firebaseDatabaseRef;

  Future<bool> setGamerUser(Map<String, dynamic> map) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
    
    final userUid = prefs.getString('loginUserId');
    final urlPath =
        '${PrivateStringUrl.users}$userUid${NomeDaPastaPrivada.usuarioLogado}${NomeDaPastaPrivada.jogosPostadosPeloUsuario}';
    bool result = false;

    _firebaseDatabaseRef = FirebaseDatabase.instance.ref().child(urlPath);

    await _firebaseDatabaseRef.push().set(map).whenComplete(() {
      result = true;
    });

    return result;
  }

  Future setGamerAll(Map<String, dynamic> map) async {
    String urlPath = PublicStringUrl.todosOsJogos;

    bool result = false;

    _firebaseDatabaseRef = FirebaseDatabase.instance.ref().child(urlPath);

    await _firebaseDatabaseRef.push().set(map).whenComplete(() {
      result = true;
    });

    return result;
  }

 
  Future<String> setImageThumbnailGame(File file) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    String downloadURL = '';

    try {
      Reference storageReference =
          FirebaseStorage.instance.ref().child('Pongs images/Thumbnail games').child('$fileName.jpg');

      await storageReference.putFile(file);

      print('Imagem enviada com sucesso!');

      downloadURL = await storageReference.getDownloadURL();
    } catch (e) {
      print('Erro ao enviar a imagem: $e');
    }

    return downloadURL;
  }


    Future<String> setImageCoverPhotoGame(File file) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    String downloadURL = '';

    try {
      Reference storageReference =
          FirebaseStorage.instance.ref().child('Pongs images/Cover photo games').child('$fileName.jpg');

      await storageReference.putFile(file);

      print('Imagem enviada com sucesso!');

      downloadURL = await storageReference.getDownloadURL();
    } catch (e) {
      print('Erro ao enviar a imagem: $e');
    }

    return downloadURL;
  }
}
