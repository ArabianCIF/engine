import 'package:flutter/material.dart';
//import page
import 'math.dart';
import 'science.dart';
import 'setting.dart';

class home extends StatefulWidget {
  final String value;
  const home({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  // all animation
  late AnimationController _animationController;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;
  late Animation<double> _iconanimatin;
  late String background_thema;
  bool _bool = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400),
        reverseDuration: Duration(milliseconds: 400));
    background_thema = widget.value;
    _animation1 = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _bool = true;
        }
      });
    _animation2 = Tween<double>(begin: 0, end: .3).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animation3 = Tween<double>(begin: .9, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appbar_height = AppBar().preferredSize.height;
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double device_size = (_width + _height) / 2;
    var now = DateTime.now();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animationController,
          ),
          iconSize: appbar_height,
          splashColor: Colors.transparent,
          onPressed: () {
            if (_bool == true) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
            _bool = false;
          },
        ),
      ),
      body: Stack(
        children: [
          // ALWAYS PLACE IT ackgroundImage(),ON THE TOP OF EVERY WIDGET...
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage(background_thema),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // EVERYTHING SHOULD BE HERE..
          // ALWAYS PLACE IT ON THE BOTTOM OF EVERY WIDGET...
          CustomNavigationDrawer(),
        ],
      ),
    );
  }

  Widget CustomNavigationDrawer() {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: _bool ? 0 : _height * 0.4,
        width: _bool ? 0 : _width * 0.6,
        color: Colors.transparent,
        child: Center(
          child: Transform.scale(
            scale: _animation3.value,
            child: Container(
              width: _width * 0.6,
              height: _width * 0.3,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(_animation2.value * 0.95),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: _width * 0.1,
                                height: _width * 0.1,
                                decoration: BoxDecoration(
                                  color: Colors.black
                                      .withOpacity(_animation2.value * 0.9),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: IconButton(
                                  alignment: Alignment.center,
                                  iconSize: _width * 0.075,
                                  icon: const Icon(
                                    Icons.calculate,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    // ...
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return math(
                                            value: background_thema,
                                          );
                                        },
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          final double begin = 0.0;
                                          final double end = 1.0;
                                          final Animatable<double> tween =
                                              Tween(begin: begin, end: end)
                                                  .chain(CurveTween(
                                                      curve: Curves.easeInOut));
                                          final Animation<double>
                                              doubleAnimation =
                                              animation.drive(tween);
                                          return FadeTransition(
                                            opacity: doubleAnimation,
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: _width * 0.05,
                              ),
                              Container(
                                width: _width * 0.1,
                                height: _width * 0.1,
                                decoration: BoxDecoration(
                                  color: Colors.black
                                      .withOpacity(_animation2.value * 0.9),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: IconButton(
                                  iconSize: _width * 0.075,
                                  icon: const Icon(
                                    Icons.science,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    // ...
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return science(
                                            value: background_thema,
                                          );
                                        },
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          final double begin = 0.0;
                                          final double end = 1.0;
                                          final Animatable<double> tween =
                                              Tween(begin: begin, end: end)
                                                  .chain(CurveTween(
                                                      curve: Curves.easeInOut));
                                          final Animation<double>
                                              doubleAnimation =
                                              animation.drive(tween);
                                          return FadeTransition(
                                            opacity: doubleAnimation,
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: _width * 0.05,
                              ),
                              Container(
                                width: _width * 0.1,
                                height: _width * 0.1,
                                decoration: BoxDecoration(
                                  color: Colors.black
                                      .withOpacity(_animation2.value * 0.9),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: IconButton(
                                  iconSize: _width * 0.075,
                                  icon: const Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    // ..
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return setting(
                                            value: background_thema,
                                          );
                                        },
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          final double begin = 0.0;
                                          final double end = 1.0;
                                          final Animatable<double> tween =
                                              Tween(begin: begin, end: end)
                                                  .chain(CurveTween(
                                                      curve: Curves.easeInOut));
                                          final Animation<double>
                                              doubleAnimation =
                                              animation.drive(tween);
                                          return FadeTransition(
                                            opacity: doubleAnimation,
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget MyTile(
    IconData icon,
    String title,
    VoidCallback voidCallback,
  ) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.black.withOpacity(.08),
          leading: CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          onTap: voidCallback,
          title: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          trailing: Icon(
            Icons.arrow_right,
            color: Colors.white,
          ),
        ),
        divider()
      ],
    );
  }

  Widget divider() {
    return Container(
      height: 5,
      width: MediaQuery.of(context).size.width,
    );
  }
}
