import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reviewhotel/Hotel.dart';

class AddCommentWidget extends StatefulWidget {
  const AddCommentWidget({Key? key, required this.hotel,required this.rating}) : super(key: key);

  final Hotel hotel;
  final double rating;
  @override
  _AddCommentWidgetState createState() => _AddCommentWidgetState();
}

class _AddCommentWidgetState extends State<AddCommentWidget> {
  late TextEditingController textController1;
  late TextEditingController textController2;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                  child: Text(
                    'Comment '+widget.hotel.place,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 22,
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
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xFFF5F5F5),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(10, 10, 10, 5),
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(10, 5, 5, 5),
                              child: TextFormField(
                                controller: textController1,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'textController1',
                                  Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Comment Header',
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
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(10, 5, 10, 10),
                          child: Container(
                            width: double.infinity,
                            height: 240,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(10, 5, 5, 5),
                              child: TextFormField(
                                controller: textController2,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'textController2',
                                  Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Comment',
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
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                          child:
                            ElevatedButton(
                              onPressed: () {
                                widget.hotel.AddComment(
                                  Comment('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxISERMQExATEBUWFhgTFRYVEBAXEhYYGBsWFhYVFhcYHikhGBsnHhUXJDIiKCssMTAzFyA0OTQuOSkuLywBCgoKDg0OHBAQHC4mISYsLiwuLDEuLjAwLi4uLi4uLiwsLiwuLiwuLiwsLi4uLiwuLi4uLi4vLDAuLi4uMC4uMP/AABEIANsA5gMBIgACEQEDEQH/xAAcAAEAAQUBAQAAAAAAAAAAAAAABwIDBAUGCAH/xABBEAABAwIDBQUDCQYHAQEAAAABAAIDBBEFEiEGEzFBUQciYXGBMpGhFCNCUnKCkrHBJGKiwtHhCDNDU3Oy8dI0/8QAGwEBAAMBAQEBAAAAAAAAAAAAAAMEBQIBBwb/xAAxEQACAQMCBAQDCAMAAAAAAAAAAQIDBBEhMQUSQVFhcYGxEyLBFCMykaHR8PEGYuH/2gAMAwEAAhEDEQA/AJxREQBERAEREAREQBEXF7f7bx4dHkbaSoeLsYTo0cN5JbXL0HO3mR42kss7p05VJKMVlnQ43jlPSR72eVsbeV/acejWjVx8lF+PdsxuW0cAt9ebU+kbTp6u9FGGMYtNVSumnkdI53M8hya0cGjwCwFVlWb20NyhwynBZqav9P3OoxDb/Epb3rJGDpGRGB4dwA+8rR1GKTye3PI/7Ur3fmVhoom2zQjShHaKXoioPPG5962FLj9VFbd1M0dvqyyge4Fa1EydOKe6yd5g3atiEJAkeypbzEjAHW8Hssb+JupR2U7RqOtIjJNPMdAyQizj0Y/g7yNj4LzkgUkasolOtw+jUWiw+6/bY9gooW7N+0pzXMo6x92mzY5nHvMPANkPNv7x4c9NRNKtRmpLKMGvbzoy5ZBERdEAREQBERAEREAREQBERAEREAREQBERAafajG2UVLJUv1yjutvq950a0eZ9wueS8x4viMlTNJUSuzve7M4/AAdABYAdAFI3bljhfPHRNPdibvJBf6bx3QR4M1++osVStLMsdj9Dw2goU+d7v26BFfpaZ8j2xsaXvcbNaBckqWtkOz6OANmqQ2aXiGcY4/8A7d48PzVec1Hcu1Ksaa1OAwjY2rqY3TMiysDS5pecpk5gMHO/XQeK0EjCCQQQQbEEWII4ghemFHPaVshnDq2BveAvMwD2h/uDxHPrx63ihWy8Mr0rnmliRFSIinLgREQBTr2O7WmoiNFM68sTbxknV8XC3iW6DyI6FQUtns3izqSqhqWXux4JA+k06Pb6tJHqu6c+V5K13b/GpuPXp5/9PVyKzTztkY2RpzNcA5pHAgi4PuKvK8flgiIgCIiAIiIAiIgCIiAIiIAiIgCIsXEpskMr/qsc73NJ/RAeYNrsQ+UV1TPe4fI/Kf3QcrP4QFrIoy5wa0FziQABxJOgAVs8SpJ7KdnQ4mskbcA5YgRz5v8ATgPVZs54WWfrptUoeWh02w2yTaOMSPAdO8d4/UB+g39TzXVovqottvLMuUnJ5YXxfUXhyRVtxsC9r3VFKy7D3nxt9pp5lg5t8OXlwjt7CCQQQRoQeIXplabGNmaSq1lhaXfXb3X/AIhx9VPCtjRluldOOkjz4ilSt7KYybxVTmeD2B3xBCs0vZR3vnKvu8wyLU+pOnuKl+LAsfaafcjFFPFTsVRmlNM2FrdO7JYGUO5OLuJ15eig6spnRSPieLOY4tcPEGxXsKilsdUqyqZweiOyjETPhkFzcx5oT9w90fgLV2Si/sEmvSVDOkod+JjR/IpQWjTeYo/NXcOSvNLuERF2VwiIgCIiAIiIAiIgCIiAIiIAtdtD/wDkqf8Ahl/6OWxVirhzsez6zS33gj9UPU8PJ5No6cySsjbqXODR66L0RhNC2CGOFo0Y0N/qfUqIezzCnHEcr22MJdmHRzTl+BU1OFisWs9cH6K7nmSiERFAVAiIgCIiAIiID4oe7WMK3dU2cDuyt1+22wPwyqYly/aHhbZ6KQkgOj+dafLiPUXXdOXLIloT5Zos9gjP2epdyMjR7m3/AJlKa4bsgwswYawuFnTPdNr0Nms9C1gPqu5W3TWIoy7yXNXm13CIi7KwREQBERAEREAREQBERAEREAREQHGz7PxQ18lWzQzsGdvLMDYuHnpfxF+a2E41WRiv+e37H8ysTrIuF88vP6GnSbcY57FtERVSUIiIAiIgCIiALFr6JtQwwOJDZCGOtxyk94DobXWUqqb/ADI/tD9V1BZkl4r3PJNpNo30ETWNaxoDWtAa0DgABYAeFldRFvmQEREAREQBERAEREAREQBERAEREAREQGkxf/Ob9j+ZW5RoruODvxHrmH5FW3cFk1195JfzY0KT+SJYREVQsBERAEREAREQBV0Y+ej8yfcFQruHC87PAOPwspaK+8j5o4q/gfkdAiItwygiIgCIiAIiIAiIgCIiAIiIAiIgCIiA1O0A7jHdHj3G4P6LGadAtjjEWaCQfu5h93X9Fqqd92g9dfes26WKue6LtB5p+pQV9R41RUC2EREAREQBERAFkYOLzHwZ+ZWOszAW96V3i1vuFz+asWqzVRFXeKbNyiItkzAiIgCIiAIiIAiIgCIiAIiIAiIgCIiApe24IPPRctRuyXido5pIsdDa5sR1Fl1axK6hZKLOGo4OGjm+RVa4ouok1uiajVUG89TUuF1bIVupD4CBJ3mE2bIPycORV0EEXBuORWXOLTw9GX4tNZR8RfCF9UZ2EREARFYnnDdOLjwaOJ/sgLkkgaLn+58AtvgtO5kfeFi5xeRzF+A9ywsApg8b9+r7kAcmWNtPHxW+WnaUOX7x9VoUrmrn5EERFeKgREQBERAEREAREQBERAEREAREQBERAFalla1pe4hrWguJJAAA1JJ5Cys12IQwMMk0scLBxdI9rG+9xUd4ztLBjFTHhFJUB0Lry1krS9ueJhH7PESBmLiRcjS1+OoQGfSbaU2JPZFDnaWF8hZKwsc+Md2OVgPtMde/hzWwNMWnNGbdWn2T5dFmbR7H09VFG0A08kIApporNkhsLDLbizkWHQ+HFcxQ43NTTNocSDY5SbQ1DRamqhyyngyXhdh58OICzbuhLLqLX6Fy3rRS5Gb2KsBOVwyO6Hn5HmslUSxNcLOAI8VjfJXN9iQgfVd3h6HiFQLhmL4Ssa83SMeN3/kqRR5tZHl/hwb7hxQB1SXHLGL9XH2R/Ur6d3Cx0sjw0AZnyPIAAHEkngFYxnGYKOLeSuyi+VjGi8kjjwZGwaucf/bLAwzZafEHtqcSaYoAQ6GhzaaaiSqI9t37nAc+YU9C3lV227kVWsoeZm7AbWwVMs9OwSMN9/CZGOZv4nd0yxB2paHNI9R427lcd2iYV+zCuhe2nqKEOnhkI7uVrbyQvA4se0Wt5Kzs52oYZVMYTVR08pAzRyksyuPFoe4BrteYK2IQUIqK6GdKTk8s7dFbila4BzXBwOoIIIPkQri6OQiIgCIiAIiIAiIgCIiAItVtBj1PRRGeolETOAvq5zvqsaNXO04BRbiPa5WSE/JaOKBl+66pc90hHUxx2DT4XKAmdY9VVMiaXyPbG0C5c5wa0AcSSV5/r9rcUnuJMRkjB+jTsZDbyeAXfFczjULTHJLI6SZ4abPllkkdc6A3ceqAmHHu2rDoLth3lY8X9hpZHfxe/l4gFRtj/bViU92w7ujb+43PJ6vfp7gFGSIDMr8RmndvJppJnfWkkc93vcVn7HY0aKup6scI5AX25sPdkHq0uWkRAe343hwDgbggEEcCDqCsLG8Igq4XU9RE2WN3EHkeTmni1w5EarkuxbHvleFxNcbyU5NO/wAm2MZ/AWjzaV3yAi+d9ThDgypc+qoScsdVYman5NZUge03kJB68QB08UrXtD2uDmuALXNILSDwII4hbzFaqKKF75i0RhpD8wBBB0y2PtXva3O6gmHH3UzpWUfzEDnl7Yyc7Y78mZ75b8bDTVZl5ThHVbvobfC7O4vMqGMLq8/lonn6EurRY5tDuntpYIjV1cgvHAw8B/uSu4RsHU/3HBO2wrD/AK3ubGPyC7PspxCja0wgZaqQlz5ZHl8lTbW+8drcC/c8yOdoLanGc8S/ss8S4Zc2lL4mjXVrOnjsvzN3stscYpBW1sgq6wjR1vmacH/Tp2H2RyzcT4XN+yRFspJLCPzbZFf+IDH9xQMpGmz6l9ja993HZz+HVxYPEErzgu77ZMe+V4pMGm8cH7OzjbuE7w/jLtegC4Reg2WF43U0xzU9TNAb3+ble0HzANj6rusF7asThsJTFVt57yPK+3g6Ow9SCozRAeiMF7dqKSwqIJqY8y20sY9RZ38JUibP7R0lcwyUs7Z2iwdYOBaTqA5rgC31C8ZroNkqmRr3tjqJ6clubNDM+M6G2uU68UB7DReeqLbPFYbZMQMoH0Z4Y3g+bwA74qQ9ie0qOrkbS1MYpqk+xZ14Juu6cdQ79w6+JQEhIiIAiIgC12O4tFSU8lVM7JHG3M48zyDR1cSQAOpC2Kg/tr2g31VHh7D83T2mmsdHSuHzbD9lpv8Ae8EByeN41NX1BrKjQ6iGK5yQM5ADm86Eu5npwGPvFi7xN4gMreLWbRTfMEdSB8b/AKLJ3i1WPklrGgE6k6AngP7oDn0VzdO+qfcVTlPQ+5AUoiICUv8AD/ju4xB1K42ZUsyj/kju9n8O8HmQvQOM4rDSQvqJ5BFGwXLj8ABzJ4ABeN8NrHwTRTsNnxPbI37TCHD4hek9lKN2LOixarLXRAk0VK12aKItJaZZj9Oa4Pg23XgBxe1+1k1Y/KbxRNPdjvw46utxf8BwHMnmlLXaLscyRj6yLLHI0F0g0DXgalw5B/5+fGI5HBoc4mwaMzj4BYlxCaqfPq2fTeDXFtO1X2dYUd09093l9e+ev6H1XInkEEXvcHQkG41BBHAg81ba4EAjUHUKQNgdiXSuFRUMLYhYta4EGQ6OHH6Hjz964hTlOXKi5e3dG3oupVenv4Jdc/3odFshtg4mGlrQ6KWVt6eVzcsdQL2yg8N5w05ggjjrvtuMcFDQ1FVcZmMIjvzkd3Yx+Ij0ur20eD01TSvhqWt3IbmJ9kx5RcSMd9AtHP8AReadqtvqispGUD3mWOKZz2zO0mlYAWxb0DQuAJuedxzFzuxTSSbyfKqsozm5RjypvRdvA457ySSSSTqSTqT1KoRF6RhEVWU9CgKVscClyzs8bt940+Nlhbp31T7irkLHtcHZHaEH2Ty1QHb7xWqhgeLG45gg2c0jg5p5EK1vE3iAm7sp2wdWwupqh16qnADjw3sZ0ZMPHk7x87KQF5ZwnGX0VVDXR3Jid32g+3E7SRnjpqL8CAV6eoqpksbJo3B7JGtexw4FrgC0j0KAyEREBi4lWsghknebMjY6Rx8GguP5LyjLXPmfJUSe3M90z9Txeb2HgBYWU6duWK7nCzCCQ6pkZBpa4brI8+VmW+8oAzoDL3ibxYm8TeIDL3ibxYm8TeIDL3it1FUGNLj/AOnorG8WtxFzidR3Rw6eaAxp5S9xceJVpEQBTr/h12hu2fDnu4ftEPkbNlb78ht4uUFLaYDi0lJOyojcWObcXB1s4Frh7iUZ7FJtJvHj28Sdu0/anO40cTu40/OkH2ni/c8gfj5KLa6IzfNB2VnGR/Xm1jfzPp5HOc69zxvcqlYUq0pT53v7H1Khw2lStlbR/D1/2zvnz9tDAwzNH+zvNyO9G+4s9nMeY6f0U59lmNb6nNO43fDw6mPl7j8C1Q2Vu9kMa+R1LJibMtaX/jPtac7cfNoUlKu41VLvuVeIcL+LZOgnnl1hndY2WfLMc74xnL1fXdve1XyekbQxutLU+3Y6thHteWY93yD15yXQbc7ROxCumq3XDXOyxtP0Y26Mb521PiSufWyfNk8hERAX6WoMbsw9RyI6LoIKoPbmB/qPArmFmUD3h3dFxz6IDf7xN4sTeJvEBl7xfN4sXeJvEBlF6mjsKx3eUslC83dTOuy5NzDIS5vHjldmHgMqg3eLo+zjHPkeKU8pNo5D8ml6ZZLZSegDw0+iA9QIiICAv8QOK562npQdIYjI7XTPKbWI6hrAfvKL94tjtvjXyvEaqqBu18pDDfQxs7kZ9WtB9VpN4gMreJvFi7xN4gMreJvFi7xN4gMreIXrF3ibxAJacHUaeHJYzmkcQsneL451+KAxEVx8fRW0B2Wz1VvIbH2md0+Rvl/p91bNcjs7U5Jg08HjIfM+z8be9dcVjXVPkqPx1/nqfS+AXn2mzjnePyv02fqseuT4tPtNWZYxECbv1P2Bb8z/ANT1W4c4C7ibAC7j4BcNX1RlkdIeZ0HQcgurOlzz5nsvfoQf5Ff/AALb4UfxT09Or+nr4GIiKtrPRa587KFcZCSrjGgeKubxAVRU7Rx1/JZAesXeJvEBlbxN4sXeJvEBlbxN4sXeJvEBlbxUyG4IWPvE3iA9Zdn+PfLcOpqgm7yzJL13jO6+/mRf7wRRP2CbURwOqaSZ7WRuAqGFxs0PGWN48yCz8JRAbTta7KzIX19BH3zd00DR7fWSIfW6t58RroYKfcEgggjQg8QehXt5RF28bOUgpHVop2NnzAGRtw517DvAGzjpxIJQHnvOmdUogKs6Z1SiAqzpnVKICrOmdUogKs6FypRAVLu6Cp3kTZOJcO9pzboVwSyoq6Vp0kePJx8lBXt3Wjp0NfhHFY8PnKU03FpZS8Nn7/mdDtPV5GCIXu/V2n0ePxP/AFXKK8+Zzzmc4uPUm5VldUaXwoKJX4lxB31w6uy0SXZf3ln0Ffc6pRSlAqzpnVKICrOmdUogKs6Z1SiAqzpnVKICrOs/CcMnqpWwU8TppHcGtHvJJ0aOpNgFYw2MOlY1wuC4AjqvXGyGzlJRwNFNTshz2LyLl7uPtPcS4+GuiA5bYbsmpKSLNVRR1k7x387c0TOeWMOH8RFz4cF8UlogP//Z',
                                      textController1.text,
                                      textController2.text
                                  )
                                );
                                widget.hotel.AddRating(widget.rating);
                              },
                              child: Text('Add Comment'),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(160, 40),
                                primary: Colors.black,
                                textStyle:TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                                elevation: 3,
                                side: BorderSide(
                                  color:  Colors.transparent,
                                  width: 1.5,
                                ),
                              ),
                            ),
                        )
                      ],
                    ),
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
