import 'package:firebase_project/splashdata/splashservices.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _slideAnimation;
  splashservices splashservice = splashservices();
  @override
  void initState() {
    super.initState();
    splashservice.checklogin(context);
    _animationController = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(_animationController);

    _scaleAnimation = Tween<double>(
      begin: 0.1,
      end: 0.7,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * 3.1415,
    ).animate(_animationController);

    _slideAnimation = Tween<double>(
      begin: 0.0,
      end: 150.0,
    ).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation has completed, perform any necessary actions
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 62, 2, 1.000),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeAnimation.value,
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Transform.rotate(
                    angle: _rotationAnimation.value,
                    child: Transform.translate(
                      offset: Offset(0.0, -(_slideAnimation.value ?? 0.0)),
                      child: child,
                    ),
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 400)),
                Center(
                  child: Text(
                    'CodeCafe',
                    style: TextStyle(
                      fontSize: 78,
                      letterSpacing: 6,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 216, 215, 214),
                      fontFamily: 'headingfonts',
                    ),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  '     Community',
                  style: TextStyle(
                    fontSize: 44,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 202, 197, 191),
                    fontFamily: 'headingfonts',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



// class splashscreen extends StatefulWidget {
//   const splashscreen({super.key});

//   @override
//   State<splashscreen> createState() => _splashscreenState();
// }

// class _splashscreenState extends State<splashscreen> {
//   splashservices splashservis = splashservices();
//   @override
//   void initState() {
//     super.initState();
//     splashservis.checklogin(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//               child: Text(
//             'splashscreen',
//             style: TextStyle(fontSize: 50),
//           ))
//         ],
//       ),
//     );
//   }
// }
