import 'package:flutter/material.dart';
import 'package:reviewhotel/DetailHotelPage.dart';
import 'package:reviewhotel/NavigatorDrawer.dart';
import 'package:reviewhotel/Wilayah.dart';
import 'package:reviewhotel/Hotel.dart';
import 'package:reviewhotel/DummyData.dart';

class ListHotelWidget extends StatefulWidget {
  const ListHotelWidget({Key? key, required this.wilayah}) : super(key: key);
  final Wilayah wilayah;
  @override
  _ListHotelWidgetState createState() => _ListHotelWidgetState();
}

class _ListHotelWidgetState extends State<ListHotelWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<Hotel> dummyData = DummyData().dataHotel;

  List<Widget> getData(List<Hotel> hotels){
    List<Widget> lw = [];
    for (var i in dummyData) {
      if (i.kode_pos == widget.wilayah.kode_pos) {
        lw.add(
            InkWell(
                onTap: () async {
                  //print(i.place);

                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailHotelWidget(
                          hotel: i
                      ),
                    ),
                  );
                },
                child:Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x3600000F),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: Image.network(
                                    i.url_pic,
                                    width: 100,
                                    height: 110,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                                  child: Text(
                                    i.place,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 2, 5, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: (i.getColor()),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.05, 0),
                                    child: Text(
                                      i.rating.toString(),
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFF1F4F8),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                                  child: Text(i.getRatingDescription()),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
            )
        );
      }
    }
    return lw;
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
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.black,
                            size: 30,
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
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                    child: Text(
                      widget.wilayah.place,
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
      body:
      SafeArea(
          child:SingleChildScrollView(
            child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: getData(dummyData),
                ),
        )
      ),
    );
  }
}
