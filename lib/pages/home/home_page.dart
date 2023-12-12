import 'package:app_uber1/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //const Home({super.key});
  final HomeController _controller = HomeController();

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
      body: SafeArea(
        child: Column(
          children: [
            _bannerApp(),
            const SizedBox(height: 50),
            const Text('Selecciona tu Rol'),

            /** PASAJERO ** */
            const SizedBox(height: 30),
            _imageTypeUser('client', context, 'assets/img/pasajero.png'),
            const SizedBox(height: 10),
            _textTypeUser('Cliente'),

            /** CONDUCTOR ** */
            const SizedBox(height: 30),
            _imageTypeUser('driver', context, 'assets/img/driver.png'),
            const SizedBox(height: 10),
            _textTypeUser('Conductor'),
          ],
        ),
      ),
    );
  }

  Widget _textTypeUser(String typeUser) {
    return Text(
      typeUser,
      style: const TextStyle(fontSize: 16),
    );
  }

  Widget _imageTypeUser(String typeUser, BuildContext context, String image) {
    return GestureDetector(
      onTap: () {
        _controller.goToLoginPage(typeUser);
      },
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 50,
      ),
    );
  }

  Widget _bannerApp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          'assets/img/logo_app.png',
          width: 150,
          height: 100,
        ),
        const Text('Fast & Furious'),
      ],
    );
  }
}
