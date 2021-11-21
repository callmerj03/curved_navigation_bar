import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;

  Widget cell(IconData icon, bool isVertical) {
    return RotatedBox(
        quarterTurns: isVertical ? 1 : 0, child: Icon(icon, size: 30));
  }

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return Container(
          color: Colors.blueAccent,
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Text(_page.toString(), textScaleFactor: 10.0),
                    ElevatedButton(
                      child: Text('Go To Page of index 1'),
                      onPressed: () {
                        final CurvedNavigationBarState? navBarState =
                            _bottomNavigationKey.currentState;
                        navBarState?.setPage(1);
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: orientation == Orientation.portrait
                    ? Alignment.bottomCenter
                    : Alignment.bottomLeft,
                child: RotatedBox(
                  quarterTurns: orientation == Orientation.portrait ? 0 : 1,
                  child: CurvedNavigationBar(
                    index: _page,
                    isVertical:orientation == Orientation.portrait ? false :true ,
                    height: 60.0,
                    items: <Widget>[
                      cell(Icons.six__ft_apart_outlined,
                          orientation == Orientation.landscape ? true : false),
                      cell(Icons.list, orientation == Orientation.landscape ? true : false),
                      cell(Icons.compare_arrows, orientation == Orientation.landscape ? true : false),
                      cell(Icons.call_split, orientation == Orientation.landscape ? true : false),
                      cell(Icons.perm_identity, orientation == Orientation.landscape ? true : false),
                    ],
                    color: Colors.white,
                    buttonBackgroundColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                    animationCurve: Curves.easeInOut,
                    animationDuration: Duration(milliseconds: 600),
                    onTap: (index) {
                      setState(() {
                        _page = index;
                      });
                    },
                    letIndexChange: (index) => true,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
