import 'dart:developer';

import 'package:app_filmes/application/ui/loader/loader_mixin.dart';
import 'package:app_filmes/application/ui/messages/messages_mixin.dart';
import 'package:app_filmes/services/login/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({required LoginService loginService})
      : _loginService = loginService;

  @override
  void onInit() {
    loaderListener(loading);
    messageListener(message);
    super.onInit();
  }

  Future<void> login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(
        MessageModel.info(
          title: 'Sucesso',
          message: 'Login realizado com sucesso!',
        ),
      );
    } catch (e, s) {
      log(e.toString(), name: 'login()');
      log(s.toString(), name: 'login()');
      loading(false);
      message(
        MessageModel.erro(
          title: 'Login error',
          message: 'Ocorreu um erro ao tentar realizar o Login',
        ),
      );
    }
  }
}
