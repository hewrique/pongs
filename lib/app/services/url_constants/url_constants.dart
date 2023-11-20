

import 'package:pongs/app/services/url_constants/main_url_constants.dart';

class PrivateStringUrl {
  static const String users = "${Project.pongs}/${PrivateFolder.users}/";
}

class PublicStringUrl {
  static const String todosOsJogos = "${Project.pongs}/${PublicFolder.allGames}/";
}

class NomeDaPastaPrivada {
  static const String dadosDoUsuario = '/dados do usuario/';
  static const String usuarioLogado = '/usuario logado/';
  static const String favoritos = '/favoritos/';
  static const String jogosPostadosPeloUsuario = '/jogos postados pelo usuario/';
}

class NomeDaPastaPublica {
  static const String jogosPostadosPorTodosOsUsuarios = 'jogos postados por todos os usuarios/';
}
