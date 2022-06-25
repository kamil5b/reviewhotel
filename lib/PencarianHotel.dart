
import 'package:flutter/material.dart';
import 'package:reviewhotel/DetailHotelPage.dart';
import 'package:reviewhotel/Hotel.dart';
import 'package:reviewhotel/DummyData.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'dart:async';

import 'package:reviewhotel/NavigatorDrawer.dart';

class PencarianHotelPageWidget extends StatefulWidget {
  const PencarianHotelPageWidget({Key? key}) : super(key: key);

  @override
  _PencarianHotelPageWidgetState createState() =>
      _PencarianHotelPageWidgetState();
}

class _PencarianHotelPageWidgetState extends State<PencarianHotelPageWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Hotel> dummyData = DummyData().dataHotel;
  LatLng googleMapsCenter = LatLng(-6.9175, 107.6191);
  late GoogleMapController  googleMapsController;
  late TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  late StreamSubscription<Position> positionStream;

  final Set<Marker> markers = new Set(); //markers for google map
  final Location _location = Location();

  void _onMapCreated(GoogleMapController _cntlr)
  {
    googleMapsController = _cntlr;
    _location.onLocationChanged.listen((l) {
      googleMapsController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!),zoom: 15),
        ),
      );
      googleMapsCenter = LatLng(l.latitude!, l.longitude!);
    });
  }

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  Set<Marker> getmarkers(List<Hotel> data) { //markers to place on map
    setState(() {
      for(var item in data) {
        markers.add(Marker( //add second marker
          markerId: MarkerId(item.place),

          position: LatLng(item.lat, item.lng), //position of marker
          infoWindow: InfoWindow( //popup info
            title: item.place,
            snippet: item.rating.toString(),
            onTap: () async {
              //print(i.place);

              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailHotelWidget(
                      hotel: item
                  ),
                ),
              );
            },
          ),
          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
        ));
      }
    });

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavigationDrawerWidget(),
      resizeToAvoidBottomInset: false,
      appBar:
      PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                    child: Text(
                      'HOTEL',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [],
          elevation: 2,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              /*
              Container(
                width: MediaQuery.of(context).size.width,
                height: 152,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: Color(0xFF0F1113),
                                size: 24,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                            child: Text(
                              'Back',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Color(0xFF0F1113),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                              child: Text(
                                'Hotel Review',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                                child: Icon(
                                  Icons.search_rounded,
                                  color: Color(0xFF95A1AC),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: TextFormField(
                                    controller: textController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Search  here...',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF95A1AC),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.95, 0),
                                  child: Icon(
                                    Icons.tune_rounded,
                                    color: Color(0xFF95A1AC),
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),*/
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: GoogleMap(
                    zoomGesturesEnabled: true,
                    initialCameraPosition: CameraPosition(target: googleMapsCenter,zoom:15.0),
                    markers: getmarkers(dummyData),
                    mapType: MapType.normal,
                    onMapCreated: _onMapCreated,
                    myLocationEnabled: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
