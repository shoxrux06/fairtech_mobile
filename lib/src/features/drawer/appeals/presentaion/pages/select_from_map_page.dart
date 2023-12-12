import 'dart:async';
import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:fairtech_mobile/src/core/utils/responsive.dart';
import 'package:fairtech_mobile/src/features/components/app_bar/custom_app_bar.dart';
import 'package:fairtech_mobile/src/features/components/buttons/custom_button_without_gradient.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SelectFromMapPage extends StatefulWidget {
  const SelectFromMapPage({super.key});


  @override
  _LocationChooserState createState() => _LocationChooserState();
}

class _LocationChooserState extends State<SelectFromMapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng _center = LatLng(41.297441965444406, 69.24021454703133);
  final Set<Marker> _markers = {};
  late LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  String name = "";
  String street = "";
  String country = "";
  String administrativeArea = "";
  String locality = "";
  String postalCode = "";
  String subLocality = "";
  String subThoroughfare = "";

  final panelController = PanelController();

  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _getUserLocation();
    });
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'Xaritadagi joylashgan joyi'),
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          GoogleMap(
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: _onMapCreated,
            initialCameraPosition:
            CameraPosition(target: _center, zoom: 11.0),
            markers: _markers,
            mapType: _currentMapType,
            onCameraMove: _onCameraMove,
            onTap: _handleTap,
          ),
          Stack(
            children: [
              SlidingUpPanel(
                  minHeight: _height * 0.05,
                  maxHeight: _height * 0.4,
                  controller: panelController,
                  panel: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 4,
                              width: _width * 0.2,
                              color: context.theme.primaryColor,
                            ),
                            TextField(
                                maxLines: 2,
                                controller: textEditingController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(12)),
                                      borderSide:
                                      BorderSide(width: 1,  color: context.theme.primaryColor,),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(4)),
                                      borderSide:
                                      BorderSide(width: 1,  color: context.theme.primaryColor,),
                                    ),
                                    errorBorder:  OutlineInputBorder(
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(4)),
                                      borderSide:
                                      BorderSide(width: 1, color:  context.theme.primaryColor,),
                                    ),
                                    errorStyle: TextStyle(
                                        color: Colors.orange.withOpacity(0.5)),
                                    labelStyle: TextStyle(
                                        color: Colors.black.withOpacity(1)),
                                    labelText: "Address"),
                                cursorColor: Colors.black12
                            ),
                            SizedBox(
                              width: Responsive.width(100, context),
                              height:48,
                              child: CustomButtonWithoutGradient(onTap: (){
                                if(textEditingController.text.isNotEmpty){
                                  context.pop({
                                    'coordinates': _center,
                                    'lane': textEditingController.text,
                                  });
                                }
                              },text: 'Save',
                              textColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  body: null),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      _customButton(
                          context,
                          Icons.gps_fixed_rounded,
                          _getUserLocation
                      ),
                      Text('Joylashuv',style: context.textStyle.regularTitle1,)
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  FloatingActionButton _customButton(BuildContext context,IconData icon, VoidCallback function) {
    return FloatingActionButton(
      heroTag: icon.codePoint,
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: context.theme.primaryColor,
      child: Icon(
        icon,
        size: 16,
        color: Colors.white,
      ),
    );
  }

  _handleTap(LatLng point) {
    print(' ***** Tapped ***** ');
    panelController.open();
    _markers.clear();
    _getLocation(point);
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: InfoWindow(title: street, snippet: subLocality),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ));
    });
  }

  _getLocation(LatLng point) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(point.latitude, point.longitude);
    for (var placemark in placemarks ) {
      if(placemark.subLocality != '' || (placemark.street != 'Unnamed Road')){
        setState(() {
          street = placemark.street??'';
          country = placemark.country ??'';
          administrativeArea = placemark.administrativeArea ??'';
          locality = placemark.locality ??'';
          subLocality = placemark.subLocality ??'';
          textEditingController.text = "$subLocality $street";
        });
      }
    }
    _center = LatLng(point.latitude, point.longitude);
  }

  _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    panelController.open();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    late Position position;

    if(permission == LocationPermission.always || permission == LocationPermission.whileInUse){
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high, forceAndroidLocationManager: true);
    }
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    _center = LatLng(position.latitude, position.longitude);

    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_center.toString()),
        position: _center,
        infoWindow: InfoWindow(title: subLocality, snippet: street),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ));
    });
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 16),
      ),
    );

    for (var placemark in placemarks) {
      if(placemark.subLocality != ''){
        setState(() {
          street = placemark.street??'';
          country = placemark.country ??'';
          administrativeArea = placemark.administrativeArea ??'';
          locality = placemark.locality ??'';
          subLocality = placemark.subLocality ??'';
          textEditingController.text = "$subLocality, $street";
        });
      }
    }
  }
}