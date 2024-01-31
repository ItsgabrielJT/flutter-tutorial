import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/const.dart';
import '../../theme/theme.dart';
import '../app_state.dart';
import '../src/authentication.dart';
import 'widget/plantcard.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> onboardList(BuildContext context) =>
      <Map<String, dynamic>>[
        <String, dynamic>{
          'image': '1.json',
          'text': 'Perfiles',
        },
      ];

  int current = 0;
  final CarouselController _carouselController = CarouselController();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      bottomNavigationBar: Consumer<ApplicationState>(
        builder: (context, appState, _) => AuthFunc(
            loggedIn: appState.loggedIn,
            signOut: () {
              FirebaseAuth.instance.signOut();
            }),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                scrollPhysics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                enlargeCenterPage: false,
                aspectRatio: dw(context) / dh(context),
                onPageChanged: (index, reason) {
                  setState(() {
                    current = index;
                  });
                },
              ),
              items: onboardList(context).map((model) {
                return PlantCard(
                  key: widget.key,
                  model: model,
                  current: current,
                );
              }).toList()),
        ],
      ),
    );
  }
}
