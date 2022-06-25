
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:reviewhotel/AddComment.dart';
import 'package:reviewhotel/Hotel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailHotelWidget extends StatefulWidget {
  const DetailHotelWidget({Key? key, required this.hotel}) : super(key: key);
  final Hotel hotel;
  @override
  _DetailHotelWidgetState createState() => _DetailHotelWidgetState();
}

class _DetailHotelWidgetState extends State<DetailHotelWidget> {
  late PageController pageViewController;
  late double ratingBarValue = widget.hotel.rating;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> getPhotos(){
    List<Widget> lw = [];
    for(var pic in widget.hotel.photos){
      lw.add(
          Image.network(
            pic,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          )
      );
    }
    return lw;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    height: 450,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 500,
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                                child: PageView(
                                  controller: pageViewController =
                                      PageController(initialPage: 0),
                                  scrollDirection: Axis.horizontal,
                                  children: getPhotos(),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: SmoothPageIndicator(
                                    controller: pageViewController =
                                        PageController(initialPage: 0),
                                    count: widget.hotel.photos.length,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) {
                                      pageViewController.animateToPage(
                                        i,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    effect: ExpandingDotsEffect(
                                      expansionFactor: 2,
                                      spacing: 8,
                                      radius: 16,
                                      dotWidth: 16,
                                      dotHeight: 16,
                                      dotColor: Color(0xFF9E9E9E),
                                      activeDotColor: Color(0xFF3F51B5),
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.9, -0.84),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              size: 30,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    widget.hotel.place,
                    style:TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF5C6871),
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.hotel.alamat,
                          textAlign: TextAlign.start,
                          style:TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFF8B97A2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 2, 5, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: widget.hotel.getColor(),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.05, 0),
                            child: Text(
                              widget.hotel.rating.toString(),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFF1F4F8),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                          child: Text(
                            widget.hotel.getRatingDescription(),
                            style:
                            TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  RatingBar.builder(
                    onRatingUpdate: (newValue) =>
                        setState(() => ratingBarValue = newValue),
                    itemBuilder: (context, index) => Icon(
                      Icons.star_rounded,
                    ),
                    direction: Axis.horizontal,
                    initialRating: ratingBarValue / 2,
                    unratedColor: Color(0xFF9E9E9E),
                    itemCount: 5,
                    itemSize: 40,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        //print(i.place);

                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddCommentWidget(
                                hotel: widget.hotel,
                                rating: ratingBarValue
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Rate it!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                        ),
                      ),
                    )
                  ),
                ],
              ),
            ),

            for(var comment in widget.hotel.comments)
              Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFF5F5F5),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                comment.url_pic,
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    comment.nama,
                                    textAlign: TextAlign.start,
                                    style:TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    comment.comment,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
