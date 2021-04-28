import 'package:agora_flutter_quickstart/Widgets/CustomIcons.dart';
import 'package:agora_flutter_quickstart/Widgets/SocialIcons.dart';
import 'package:agora_flutter_quickstart/src/pages/call.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();

  /// if channel textField is validated to have error
  bool _validateError = false;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Image.asset("assets/image_01.png"),
              ),
              Expanded(
                child: Container(),
              ),
              Image.asset("assets/image_02.png")
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 70.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/logo.png",
                        width: ScreenUtil.getInstance().setWidth(110),
                        height: ScreenUtil.getInstance().setHeight(110),
                      ),
                      Text(
                        " F 2 F",
                        style: TextStyle(
                            fontFamily: "Righteous-Regular",
                            fontSize: ScreenUtil.getInstance().setSp(79),
                            letterSpacing: .6,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(280),
                  ),
                  Container(
                    child: Column(children: <Widget>[
                      Text(
                        "LogIn",
                        style: TextStyle(
                          color: Colors.black,
                        fontFamily: 'Righteous-Regular',
                        fontSize: 30.0,
                        )
                      ),
                    ],),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(80),
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _channelController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        errorText:
                            _validateError ? 'ID required to join' : null,
                        hintText: 'Enter ID',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0.01,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(50),
                  ),
                  InkWell(
                    child: Container(
                      width: ScreenUtil.getInstance().setWidth(350),
                      height: ScreenUtil.getInstance().setHeight(75),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF17ead9), Color(0xFF6078ea)],
                        ),
                        borderRadius: BorderRadius.circular(6.0),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF6078ea).withOpacity(.3),
                              offset: Offset(0.0, 8.0),
                              blurRadius: 8.0)
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: onJoin,
                          child: Center(
                            child: Text(
                              "Login with ID",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins-Bold",
                                  fontSize: 18,
                                  letterSpacing: 1.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      horizontalLine(),
                      Text(
                        "Creator",
                        style: TextStyle(
                            fontSize: 16.0, fontFamily: "Poppins-Medium"),
                      ),
                      horizontalLine(),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialIcon(
                        colors: [
                          Color(0xFF102397),
                          Color(0xFF187adf),
                          Color(0xFF00eaf8),
                        ],
                        iconData: CustomIcons.facebook,
                        onPressed: _launchUrlfb,
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFFff4f38),
                          Color(0xFFff355d),
                        ],
                        iconData: CustomIcons.instagram,
                        onPressed: _launchUrli,
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFF17ead9),
                          Color(0xFF6078ea),
                        ],
                        iconData: CustomIcons.twitter,
                        onPressed: _launchUrlt,
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFF00c6fb),
                          Color(0xFF005bea),
                        ],
                        iconData: CustomIcons.linkedin,
                        onPressed: _launchUrll,
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Help? ",
                        style: TextStyle(fontFamily: "Poppins-Medium"),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CupertinoAlertDialog(
                              title: Text("jbzor"),
                              content: Text(
                                  "\n Mobile: +237 696975776 \n Email: nzudiej@gmail.com"),
                            ),
                          );
                        },
                        child: Text(
                          "Contact Us",
                          style: TextStyle(
                              color: Color(0xFF5d74e3),
                              fontFamily: "Poppins-Bold"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic();
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController.text,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
}

_launchUrlfb() async {
  const url = 'https://www.facebook.com/jeanbaptiste.nzudie.3';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Error';
  }
}

_launchUrli() async {
  const url = 'https://www.instagram.com/jeanbaptiste.nzudie';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Error';
  }
}

_launchUrlt() async {
  const url = 'https://twitter.com/nzudieB';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Error';
  }
}

_launchUrll() async {
  const url = 'https://www.linkedin.com/in/Jean-Baptiste-dessigi-nzudie-643527147';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Error';
  }
}
