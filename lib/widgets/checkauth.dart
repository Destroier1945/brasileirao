import 'package:brasileirao/page/home_page.dart';
import 'package:brasileirao/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../page/autenticacao_page.dart';

class CheckAuth extends StatelessWidget {
  const CheckAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => AuthService.to.userIsAuthenticated.value
        ? HomePage()
        : AutenticacaoPage());
  }
}
