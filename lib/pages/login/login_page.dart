import 'package:app_uber1/pages/login/login_controller.dart';
import 'package:app_uber1/pages/utils/colors.dart' as utils;
import 'package:app_uber1/src/widgets/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _controller = LoginController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.key,
      appBar: AppBar(
        backgroundColor: utils.Colors.uberCloneColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerLogin(),
            _textLogin(),
            _textFieldEmail(),
            const SizedBox(height: 30),
            _textFieldPassword(),
            const SizedBox(height: 30),
            _buttonLogin(),
            const SizedBox(height: 20),
            _textCreateAcount()
          ],
        ),
      ),
    );
  }

  Widget _bannerLogin() {
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

  Widget _textLogin() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: const Text(
        'Login',
        style: TextStyle(
            color: Colors.black87, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _controller.emailController,
        decoration: const InputDecoration(
            hintText: 'email', suffixIcon: Icon(Icons.email_outlined)),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _controller.passwordController,
        decoration: const InputDecoration(
            hintText: 'password', suffixIcon: Icon(Icons.lock_open_outlined)),
      ),
    );
  }

  Widget _buttonLogin() {
    return ButtonApp(
        color: Colors.black,
        texto: 'Iniciar Sesion',
        onPresed: _controller.login);
  }

  Widget _textCreateAcount() {
    return GestureDetector(
      onTap: _controller.goToRegisterPage,
      child: Container(
        child: Text(
          'No tines cuenta?',
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ),
    );
  }
}
