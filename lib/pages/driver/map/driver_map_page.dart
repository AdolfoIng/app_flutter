import 'package:app_uber1/pages/driver/map/driver_map_controller.dart';
import 'package:app_uber1/src/widgets/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverMapPage extends StatefulWidget {
  const DriverMapPage({super.key});

  @override
  State<DriverMapPage> createState() => _DriverMapPageState();
}

class _DriverMapPageState extends State<DriverMapPage> {
  DriverMapController _controllerMap = DriverMapController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _controllerMap.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _googleMapsWidget(),
        SafeArea(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buttonDrawer(), _buttonCenterPosition()],
            ),
            Expanded(child: Container()),
            _buttonConect()
          ],
        ))
      ]),
    );
  }

  Widget _googleMapsWidget() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _controllerMap.intialPosition,
      onMapCreated: _controllerMap.onMapCreate,
    );
  }

  Widget _buttonDrawer() {
    return Container(
      alignment: Alignment.centerLeft,
      child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          )),
    );
  }

  Widget _buttonCenterPosition() {
    return Container(
      //alignment: Alignment.centerRight,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        shape: const CircleBorder(),
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Icon(
            Icons.location_searching,
            color: Colors.grey[600],
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buttonConect() {
    return Container(
      height: 50,
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: ButtonApp(
        color: Colors.amber,
        colorText: Colors.black,
        texto: 'CONECTATE',
        onPresed: () {},
      ),
    );
  }
}
