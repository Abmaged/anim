import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    animation = Tween<double>(
      begin: 3,
      end: 10,
    ).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.easeInOutQuad,
        reverseCurve: Curves.easeInCirc,
      ),
    ) ;
  }

//  double buttomValue = 85;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
           //   position: animation!,
              scale: animation!,
            //  filterQuality: FilterQuality(),
              child: Container(
                width: 100,
                height: 100,
                child: Image.network(
                    'https://clipart.world/wp-content/uploads/2021/06/Free-Rocket-Ship-clipart-png-image.png'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      animationController!.forward();
                    },
                    child: Text("Start")),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      animationController!.reverse();
                    },
                    child: Text("Back")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
