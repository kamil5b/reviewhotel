import 'package:reviewhotel/Hotel.dart';
class DummyData{
  List<Hotel> dataHotel = [
    Hotel(
        place:"Panen Hotel",
        alamat:"LLRE Martadinata No.100",
        lat:-6.909139279561706, lng:107.62479715294208,
        url_pic:'https://lh3.googleusercontent.com/p/AF1QipNe4yjYeo1HfKGDcJj4jHR8bx4h2ZPvgekLFuOb=w296-h202-n-k-no-v1-rj',
        rating:9.3,nreview: 234,kode_pos: 40115),
    Hotel(
        place:"Grand Tebu Hotel",
        alamat:"LLRE Martadinata St No.207",
        lat:-6.913038460703351, lng:107.62929358250828,
        url_pic: 'https://lh3.googleusercontent.com/p/AF1QipOzGa_QRqwbC26ptY8BEnEuEQyxoICnzZjlFTQp=w296-h202-n-k-no-v1-rj',
        rating: 8.8,nreview: 345,kode_pos: 40115),
    Hotel(
        place:"Subwow Hostel",
        alamat:"LLRE Martadinata St No.207",
        lat:-6.913002749581604, lng:107.62927042830107,
        url_pic: 'https://lh3.googleusercontent.com/proxy/dHnbYDV0AgRUNY9HuyaB_OBBpe8XLPdQP49JfLcA2TNH-5Ii1yuaxbUGI1PWfwroRbz1ehZkx-I7lnq3pAveNkESID9-xJCBp9Lt5ZckXXhNRESahwhHv-306hLPVMCLPOo291sOz25mhXXkFemt3ZYI6PERtCU=w296-h202-n-k-no-v1-rj',
        rating: 4.5,nreview: 320,kode_pos: 40115),
    Hotel(
        place:"Hotel Dafam Rio",
        lat:-6.914253788107254, lng:107.6291628110453,
        alamat:"LLRE Martadinata St No.160",
        url_pic:'https://lh3.googleusercontent.com/p/AF1QipM0EzkhXLL5g5TkqcnzstS_7ysHd3JXbf336r0U=w296-h202-n-k-no-v1-rj',
        rating: 7.3,nreview: 170,kode_pos: 40115),
    Hotel(
        place:"The Newton",
        alamat:"LLRE Martadinata St No.223",
        lat:-6.914834822548927, lng:107.6298923350467,
        url_pic: 'https://lh3.googleusercontent.com/p/AF1QipPYSXnR7LC5GlOlf25c6mss_IHbEbob16IFyvBG=w296-h202-n-k-no-v1-rj',
        rating: 9.3,nreview: 234,kode_pos: 40115),
    Hotel(
        place:"Hostel Santika",
        alamat:"Sumatera No.52 - 54",
        lat:-6.907432901762556, lng:107.61183119824341,
        url_pic: 'https://lh3.googleusercontent.com/proxy/2b9svRT0Az7QJAA2-G72ykhHqwY3kVvPDQGPWG24MlzK0ElOkhFEmKSBmzFXQfpKpbzmW-hIbuLSbwdc1xbLhicE7HPEan37pr1sOlU4mslVkVxWKSxg7wEUmld2IaLiNJeGcR2BiLObdHqlK7YLZUfUbuZ-Zw=w296-h202-n-k-no-v1-rj',
        rating: 9.3,nreview: 234,kode_pos: 40115),
  ];

  List<Hotel> getDataHotel(){
    dataHotel[0].comments= [
      Comment("", "Mandalika", "Hey cam cam ku")
    ];
    return dataHotel;
  }

}