import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/autenticacao_controller.dart';

class AutenticacaoPage extends StatefulWidget {
  const AutenticacaoPage({super.key});

  @override
  State<AutenticacaoPage> createState() => _AutenticacaoPageState();
}

class _AutenticacaoPageState extends State<AutenticacaoPage> {
  final controller = Get.put(AutenticacaoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.titulo.value)),
        actions: [
          TextButton(
            onPressed: controller.toggleRegistrar,
            child: Obx(
              () => Text(controller.appBarButton.value),
            ),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
            ),
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: TextFormField(
                          controller: controller.email,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informe seu email corretamente!';
                            }
                            return null;
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: TextFormField(
                        controller: controller.senha,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Senha'),
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Iforma a senha corretamente!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            if (controller.isLogin.value) {
                              controller.login();
                            } else {
                              controller.registrar();
                            }
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check),
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: Obx(
                                () => Text(
                                  controller.botaoPrincipal.value,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
      ),
    );
  }
}
