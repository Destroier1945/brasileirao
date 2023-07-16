import 'package:brasileirao/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AutenticacaoController extends GetxController {
  final email = TextEditingController();
  final senha = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var titulo = 'Bem - vindo'.obs;
  var botaoPrincipal = 'Entrar'.obs;
  var appBarButton = 'Cadastre-se'.obs;
  var isLogin = true.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    ever(isLogin, (visible) {
      titulo.value = visible ? 'Bem vindo' : 'Crie sua conta';
      botaoPrincipal.value = visible ? 'Entrar' : 'Registrar-se';
      appBarButton.value = visible ? 'Cadastra-se' : 'Login';
      formKey.currentState!.reset();
    });
  }

  login() async {
    isLoading.value = true;
    await AuthService.to.login(email.text, senha.text);
    isLoading.value = false;
  }

  registrar() async {
    isLoading.value = true;
    await AuthService.to.createUser(email.text, senha.text);
    isLoading.value = false;
  }

  toggleRegistrar() async {
    isLogin.value = !isLogin.value;
  }
}
