import 'package:flutter/material.dart';

class MiniHotel{
  String place;
  String url_pic;
  double rating;
  int nreview;
  double lat;
  double lng;
  int kode_pos;

  MiniHotel(this.place,this.lat,this.lng,this.url_pic,this.rating,this.nreview,this.kode_pos);

}

class Hotel extends MiniHotel{
  String alamat;
  List<Comment> comments = [];
  late List<String> photos = [url_pic];

  Hotel(
      {place, lat, lng, required this.alamat, url_pic, rating,nreview,kode_pos}
      ):super(place,lat,lng,url_pic,rating,nreview,kode_pos);

  void AddRating(double rating){
    double dr = rating * 2;
    double tmp = this.rating * nreview.toDouble();
    this.nreview++;
    tmp += dr;
    this.rating = tmp / nreview.toDouble();
  }

  Color getColor(){
    if (this.rating < 5.0) {
      return Color(0xFFEE8B60);
    }
    if (this.rating < 8.0) {
      return Color(0xFFCDC014);
    }
    return Color(0xFF04C100);
  }

  void AddPhoto(String url_photo){
    photos.add(url_photo);
  }

  void AddPhotos(List<String> list_url){
    photos.addAll(list_url);
  }

  String getRatingDescription(){
    String review = this.nreview.toString();
    String nreview = '($review)';
    if (this.rating < 5.0) {
      return "" + nreview;
    }
    if (this.rating < 8.0) {
      return "Average" + nreview;
    }
    return "Fine" + nreview;
  }

  void AddComment(Comment c){
    nreview++;
    comments.add(c);
  }

  void SetComments(List<Comment> c){
    comments = c;
    nreview = c.length;
  }



}

class Comment {
  String url_pic;
  String nama;
  String comment;

  Comment(this.url_pic,this.nama,this.comment);
}