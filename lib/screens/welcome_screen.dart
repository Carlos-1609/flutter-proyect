import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../Screens/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var _selectedPage = 0;

  void _onChangePage(index) {
    setState(() {
      _selectedPage = index;
    });
    print(_selectedPage);
  }

  PageDecoration getPageDecoration() => PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xff1A71F3),
      ),
      bodyTextStyle: TextStyle(fontSize: 16),
      imagePadding: EdgeInsets.all(0));
  Widget buildImage(String path, BuildContext ctx) => Center(
        child: Image.asset(path),
        // child: CircleAvatar(
        //   radius: 200,
        //   backgroundColor: Colors.grey[200],
        //   child: Image.asset(path),
        // ),
      );
  // Widget buildImage(String path, BuildContext ctx) => Container(
  //       child: Stack(
  //           alignment:
  //               _selectedPage <= 1 ? Alignment.topRight : Alignment.topCenter,
  //           clipBehavior: Clip.hardEdge,
  //           children: [
  //             Positioned(
  //               width: _selectedPage <= 1 ? null : 420,
  //               top: _selectedPage == 0
  //                   ? -30
  //                   : _selectedPage == 1
  //                       ? -30
  //                       : -150,
  //               right: _selectedPage == 0
  //                   ? -70
  //                   : _selectedPage == 1
  //                       ? 70
  //                       : -15,
  //               bottom: _selectedPage <= 1 ? null : 0,
  //               child: CircleAvatar(
  //                 radius: 180,
  //                 backgroundColor: Colors.grey[200],
  //                 child: Container(
  //                     margin:
  //                         _selectedPage <= 1 ? null : EdgeInsets.only(top: 45),
  //                     child: Image.asset(path)),
  //               ),
  //             ),
  //             Positioned(
  //               bottom: _selectedPage <= 1 ? 0 : -70,
  //               left: 150,
  //               top: _selectedPage == 0 || _selectedPage == 2 ? 210 : 230,
  //               child: CircleAvatar(
  //                 radius: 45,
  //                 backgroundColor: Color(0xff1A71F3),
  //                 child: Text(
  //                   'Logo',
  //                   style: TextStyle(
  //                       color: Colors.white, fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //             )
  //           ]),
  //     );

  DotsDecorator getDotDecorator() => DotsDecorator(
        color: Color(0xffbdbdbd),
        activeColor: Color(0xff1A71F3),
        size: Size(5, 5),
        activeSize: Size(15, 5),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IntroductionScreen(
          showNextButton: true,
          showSkipButton: true,
          skip: Text('Skip'),
          //onSkip: () => Navigator.of(context).pushReplacementNamed(SignUp.routeName),
          next: Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecorator(),
          onChange: (index) => _onChangePage(index),
          done: Text(
            'Crear Cuenta',
            style: TextStyle(
              color: Color(0xff1A71F3),
            ),
          ),
          onDone: () {
            Navigator.of(context).pushReplacementNamed(SignUp.routeName);
          },
          pages: [
            PageViewModel(
              title: 'Bienvenido a GO Lend',
              body:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
              image: buildImage('assets/images/page1.png', context),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Feature 1',
              body:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
              image: buildImage('assets/images/page2.png', context),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Feature 2',
              body:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
              image: buildImage('assets/images/page3.png', context),
              decoration: getPageDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}
