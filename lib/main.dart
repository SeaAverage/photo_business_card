import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(new MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/comet.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage:
                      AssetImage('images/Emily_Joey_Reception-15.jpg'),
                ),
                Text(
                  'Joey Seabaugh',
                  style: TextStyle(
                    fontFamily: 'Sriracha',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'PHOTOGRAPHER',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                    color: Colors.grey.shade400,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 220.0,
                  child: Divider(
                    color: Colors.grey.shade400,
                  ),
                ),
                GestureDetector(
                  onTap: _launchURL,
                  child: Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading:
                          Icon(Icons.public, color: Colors.deepOrange.shade500),
                      title: Text(
                        'joeyseabaugh.myportfolio.com',
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _launchEmail,
                  child: Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading:
                          Icon(Icons.email, color: Colors.deepOrange.shade500),
                      title: Text(
                        'joey.seabaugh.photography@gmail.com',
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _launchPhone,
                  child: Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading:
                          Icon(Icons.phone, color: Colors.deepOrange.shade500),
                      title: Text(
                        '217.414.0762',
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_launchEmail() async {
  const email = 'mailto:joey.seabaugh.photography@gmail.com';
  if (await canLaunch(email)) {
    await launch(email);
  } else {
    throw 'Could not launch $email';
  }
}

_launchPhone() async {
  const phone = 'tel:+1 217 414 0762';
  if (await canLaunch(phone)) {
    await launch(phone);
  } else {
    throw 'Could not launch $phone';
  }
}

_launchURL() async {
  await FlutterWebBrowser.openWebPage(
      url: 'https://joeyseabaugh.myportfolio.com');
}
