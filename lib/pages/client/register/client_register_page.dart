import 'package:app_uber1/pages/client/register/client_register_controller.dart';
import 'package:app_uber1/src/widgets/button_app.dart';
import 'package:flutter/material.dart';
import 'package:app_uber1/pages/utils/colors.dart' as utils;
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ClientRegisterPage extends StatefulWidget {
  const ClientRegisterPage({super.key});

  @override
  State<ClientRegisterPage> createState() => _ClientRegisterPageState();
}

class _ClientRegisterPageState extends State<ClientRegisterPage> {
  ClientRegisterController _controllerRegister = ClientRegisterController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _controllerRegister.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controllerRegister.key,
      appBar: AppBar(
        backgroundColor: utils.Colors.uberCloneColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerRegister(),
            _textRegister(),
            _textFieldUserName(),
            const SizedBox(height: 30),
            _textFieldEmail(),
            const SizedBox(height: 30),
            _textFieldPassword(),
            const SizedBox(height: 30),
            _textFieldConfirmPassword(),
            const SizedBox(height: 30),
            _buttonRegister()
          ],
        ),
      ),
    );
  }

  Widget _bannerRegister() {
    return ClipPath(
        clipper: WaveClipperTwo(),
        child: Container(
          color: utils.Colors.uberCloneColor,
          height: MediaQuery.of(context).size.height * 0.22,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/img/logo_app.png',
                width: 150,
                height: 100,
              ),
              const Text('Fast & Furious',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ));
  }

  Widget _textRegister() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: const Text(
        'Registro',
        style: TextStyle(
            color: Colors.black87, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _textFieldUserName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _controllerRegister.usernameController,
        decoration: const InputDecoration(
            hintText: 'username', suffixIcon: Icon(Icons.person_2_outlined)),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _controllerRegister.emailController,
        decoration: const InputDecoration(
            hintText: 'email', suffixIcon: Icon(Icons.email_outlined)),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _controllerRegister.passwordController,
        decoration: const InputDecoration(
            hintText: 'password', suffixIcon: Icon(Icons.lock_open_outlined)),
      ),
    );
  }

  Widget _textFieldConfirmPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _controllerRegister.confirmPasswordController,
        decoration: const InputDecoration(
            hintText: 'confirmar password',
            suffixIcon: Icon(Icons.lock_open_outlined)),
      ),
    );
  }

  Widget _buttonRegister() {
    return ButtonApp(
        color: Colors.black,
        colorText: Colors.white,
        texto: 'Crear Cuenta',
        onPresed: _controllerRegister.registerUser);
  }
}
