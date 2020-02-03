import 'dart:async';

import 'package:farm_app/src/common/accounts/slide_dots.dart';
import 'package:farm_app/src/common/accounts/slide_item.dart';
import 'package:farm_app/src/models/auth/slide.dart';
import 'package:flutter/material.dart';

class GettingStartedScreen extends StatefulWidget {
  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _transition();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    PageView.builder(
                      controller: _pageController,
                      itemCount: slideList.length,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: _onPageChanged,
                      itemBuilder: (context, i) => SlideItem(index: i),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          for (int i = 0; i < slideList.length; i++)
                            if (i == _currentPage)
                              SlideDots(
                                isActive: true,
                              )
                            else
                              SlideDots(
                                isActive: false,
                              )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton(
                    child: Text('Registrarse'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    color: Colors.lightGreen,
                    textColor: Colors.white,
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                  ),
                  FlatButton(
                    child: Text('Iniciar sesión'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    color: Colors.lightGreen,
                    textColor: Colors.white,
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _transition() {
    Timer.periodic(Duration(seconds: 3), (Timer timer) async {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if(_pageController.hasClients){
        await _pageController.animateToPage(_currentPage,
            duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      }

    });
  }
}
