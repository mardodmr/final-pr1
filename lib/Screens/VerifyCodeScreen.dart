// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace



import 'package:center/Screens/CreateProfileScreen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:center/Screens/SignInScreen.dart';

import '../Utils/constant.dart';
import 'HomeScreen.dart';
import 'TextFieldWidget.dart';


class VerifyCodeScreen extends StatefulWidget {
  //const SignUpScreen({Key? key}) : super(key: key);

  VerifyCodeScreen({required this.verficationId});
  final String verficationId;

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  int i = 1;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  getMobileFormWidget(context) {}

  getOtpFormWidget(BuildContext context) {}

  Color color1 = Colors.grey;
  Color color2 = Colors.grey;
  Color color3 = Colors.grey;
  Color color4 = Colors.grey;

  var tec1 = TextEditingController();
  var tec2 = TextEditingController();
  var tec3 = TextEditingController();
  var tec4 = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;



  // final MyConnectivity _connectivity = MyConnectivity.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CreateProfileScreen())
            );
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 106,
              width: 215,
              // child: Image.asset(
              //   "assets/images/zona-black 2.png",
              //   fit: BoxFit.contain,
              // ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Verification code",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 9,
            ),
            Text(
                'We just send you a verify code. check your inbox to get them'),

            /// هون انا عدلت الطول بدال البادينغ
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      keyboardType: TextInputType.none,
                      controller: tec1,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      buildCounter: (BuildContext context,
                              {int? currentLength,
                              int? maxLength,
                              bool? isFocused}) =>
                          null,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        if (value != '') {
                          setState(() {
                            color1 = Color(0xff9676FF);
                          });
                          FocusScope.of(context).nextFocus();
                        } else {
                          setState(() {
                            color1 = Colors.grey;
                          });
                        }
                      },
                      cursorColor: Color(0xff9676FF),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xEFEFEFFF),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xEFEFEFFF)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xEFEFEFFF)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xEFEFEFFF)),
                        ),
                        focusColor: color1,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      keyboardType: TextInputType.none,
                      controller: tec2,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      buildCounter: (BuildContext context,
                              {int? currentLength,
                              int? maxLength,
                              bool? isFocused}) =>
                          null,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        if (value != '') {
                          setState(() {
                            color2 = Color(0xff9676FF);
                          });
                          FocusScope.of(context).nextFocus();
                        } else {
                          setState(() {
                            color2 = Colors.grey;
                          });
                        }
                      },
                      cursorColor: Color(0xff9676FF),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xEFEFEFFF),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xEFEFEFFF)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xEFEFEFFF)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xEFEFEFFF)),
                        ),
                        focusColor: color2,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      keyboardType: TextInputType.none,
                      controller: tec3,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      buildCounter: (BuildContext context,
                              {int? currentLength,
                              int? maxLength,
                              bool? isFocused}) =>
                          null,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        if (value != '') {
                          setState(() {
                            color3 = Color(0xff9676FF);
                          });
                          FocusScope.of(context).nextFocus();
                        } else {
                          setState(() {
                            color3 = Colors.grey;
                          });
                        }
                      },
                      cursorColor: Color(0xff9676FF),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xEFEFEFFF),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xEFEFEFFF)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xEFEFEFFF)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xEFEFEFFF)),
                        ),
                        focusColor: color3,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      keyboardType: TextInputType.none,
                      controller: tec4,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      buildCounter: (BuildContext context,
                              {int? currentLength,
                              int? maxLength,
                              bool? isFocused}) =>
                          null,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        if (value != '') {
                          setState(() {
                            color4 = Color(0xff9676FF);
                          });
                          FocusScope.of(context).nextFocus();
                        } else {
                          setState(() {
                            color4 = Colors.grey;
                          });
                        }
                      },
                      cursorColor: Color(0xff9676FF),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xEFEFEFFF),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xEFEFEFFF)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xEFEFEFFF)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xEFEFEFFF)),
                        ),
                        focusColor: color4,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            Container(
              width: 139,
              height: 48,
              child: RawMaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                fillColor: Color(0xEFEFEFFF),
                onPressed: () async{
                  smsText= tec1.text + tec2.text +tec3.text +tec4.text;
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.verficationId, smsCode: smsText);

                  // Sign the user in (or link) with the credential
                  await auth.signInWithCredential(credential);

                  if(auth.currentUser?.uid != null) {
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                  }
                },
                child: Text("Continue"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Re-send code in 0:20",
              textAlign: TextAlign.center,
            ),
            NumericKeyboard(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              onKeyboardTap: _onKeyboardTap,
              textColor: Colors.black,
              rightButtonFn: () {
                setState(() {
                  if (i == 2) {
                    setState(() {
                      tec1.clear();
                      color1 = Colors.grey;
                      i--;
                    });
                  } else if (i == 3) {
                    setState(() {
                      tec2.clear();
                      color2 = Colors.grey;
                      i--;
                    });
                  } else if (i == 4) {
                    setState(() {
                      tec3.clear();
                      color3 = Colors.grey;
                      i--;
                    });
                  } else if (i == 5) {
                    setState(() {
                      tec4.clear();
                      color4 = Colors.grey;
                      i--;
                    });
                  }

                  //text = text.substring(0, text.length - 1);
                });
              },
              rightIcon: Icon(
                Icons.backspace,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String smsText = '';

  _onKeyboardTap(String value) {
    setState(() {
      //text = text + value;

    });
    _numberChange(value);
  }

  _numberChange(String value) {
    if (i == 1) {
      setState(() {
        tec1.text = value;
        color1 = Color(0xff9676FF);
        i++;
      });
    } else if (i == 2) {
      setState(() {
        tec2.text = value;
        color2 = Color(0xff9676FF);
        i++;
      });
    } else if (i == 3) {
      setState(() {
        tec3.text = value;
        color3 = Color(0xff9676FF);
        i++;
      });
    } else if (i == 4) {
      setState(() {
        tec4.text = value;
        color4 = Color(0xff9676FF);
        i++;
      });
    }
  }
}

// class MyConnectivity {
//   MyConnectivity._();
//
//   static final _instance = MyConnectivity._();
//   static MyConnectivity get instance => _instance;
//   final _connectivity = Connectivity();
//   final _controller = StreamController.broadcast();
//   Stream get myStream => _controller.stream;
//
//   void initialise() async {
//     ConnectivityResult result = await _connectivity.checkConnectivity();
//     _checkStatus(result);
//     _connectivity.onConnectivityChanged.listen((result) {
//       _checkStatus(result);
//     });
//   }
//
//   void _checkStatus(ConnectivityResult result) async {
//     bool isOnline = false;
//     try {
//       final result = await InternetAddress.lookup('google.com');
//       isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
//     } on SocketException catch (_) {
//       isOnline = false;
//     }
//     _controller.sink.add({result: isOnline});
//   }
//
//   void disposeStream() => _controller.close();
// }
