import 'package:flutter/material.dart';
import 'package:reviewhotel/ListHotel.dart';
import 'package:reviewhotel/NavigatorDrawer.dart';
import 'package:reviewhotel/Wilayah.dart';

import 'package:google_fonts/google_fonts.dart';

class PageWilayahWidget extends StatefulWidget {
  const PageWilayahWidget({Key? key}) : super(key: key);

  @override
  _PageWilayahWidgetState createState() => _PageWilayahWidgetState();
}

class _PageWilayahWidgetState extends State<PageWilayahWidget> {

  late TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Wilayah> ListWilayah = [
    Wilayah(
        "Riau",
        'https://cdn-2.tstatic.net/jabar/foto/bank/images/jalan-riau.jpg',
        40115
    ),
    Wilayah(
        "Braga",
        'https://assets.promediateknologi.com/crop/0x0:0x0/750x500/photo/ayobandung/bank_image/medium/jalan-braga-surganya-spot-foto-yang-instagramable.jpg',
        40111
    ),
    Wilayah(
        "Asia Afrika",
        'https://karosatuklik.com/wp-content/uploads/2021/03/JLN-AA-01-2.jpg',
        40131
    ),
    Wilayah(
        "Dago",
        'https://i0.wp.com/id-velopedia.velo.com/wp-content/uploads/2021/03/CFD-Bandung-Cluster.jpg?fit=1280%2C850&ssl=1',
        40135
    ),
    Wilayah(
        "Merdeka",
        'https://cdn-2.tstatic.net/jabar/foto/bank/images/jalan-merdeka-uy.jpg',
        40117
    )
  ];

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      drawer: NavigationDrawerWidget(),
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
                            scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                      ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                    child: Text(
                      'WILAYAH',
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
        bottom: false,
        child:
        Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 10),
                        child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          for (var i in ListWilayah)
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: 180,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.network(
                                    i.url_pic,
                                  ).image,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x3600000F),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                  onTap: () async {
                                    //print(i.place);

                                    await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ListHotelWidget(
                                            wilayah: i
                                          ),
                                        ),
                                      );
                                  },
                                  child:Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0x90000000),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        i.place.toUpperCase(),
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFF1F4F8),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                        ],
                      )
                    )
                )
            ),
      ),
    );
  }
}
