import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/login.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/styles/colors.dart';
import 'package:shop_app/shared/styles/themes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String? imagePath;
  final String? title;
  final String? body;
  BoardingModel({this.imagePath, this.title, this.body});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> models = [
    BoardingModel(
        imagePath: 'assets/images/img1.png',
        title: 'All you Need',
        body: 'fined every thing that you need in one place'),
    BoardingModel(
        imagePath: 'assets/images/img2.png',
        title: 'All way to you',
        body: 'buy nay thing and every thing because delivery is not a problem anymore'),
    BoardingModel(
        imagePath: 'assets/images/img3.png',
        title: 'Paying methods',
        body: "pay using credit card or cash it's up to you"),
  ];
  bool _isLastPage = false;

  PageController _boardingController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightTheme.scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () => replaceTo(
                context,
                const LoginScreen(),
              ),
              child: Text(
                'SKIP',
                style: TextStyle(
                  color: defaultColor.shade500,
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _boardingController,
                onPageChanged: (value) {
                  if (value == models.length - 1) {
                    setState(() {
                      _isLastPage = true;
                    });
                  } else {
                    setState(() {
                      _isLastPage = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildBoardingItem(models[index]),
                itemCount: models.length,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: _boardingController,
                  count: models.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: defaultColor,
                    dotColor: defaultColor.shade100,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (_isLastPage == true) {
                      replaceTo(
                        context,
                        const LoginScreen(),
                      );
                    } else {
                      _boardingController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    }
                  },
                  child: const Icon(
                    Icons.navigate_next_rounded,
                    size: 40.0,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Image(
            image: AssetImage('${model.imagePath}'),
          )),
          const SizedBox(
            height: 30,
          ),
          Text(
            '${model.title}',
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            '${model.body}',
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      );
}
