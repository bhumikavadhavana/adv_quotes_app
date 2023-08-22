// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
// import 'package:get/get.dart';
//
// class IntroPage extends StatefulWidget {
//   const IntroPage({super.key});
//
//   @override
//   State<IntroPage> createState() => _IntroPageState();
// }
//
// class _IntroPageState extends State<IntroPage> {
//   final Color kDarkBlueColor = const Color(0xFF053149);
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       child: OnBoardingSlider(
//         finishButtonText: 'Start',
//         onFinish: () {
//           Get.offAllNamed('/Homepage');
//         },
//         finishButtonStyle: FinishButtonStyle(
//           backgroundColor: Color(0xff302d4c),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
//         ),
//         // skipTextButton: Text(
//         //   'Skip',
//         //   style: TextStyle(
//         //     fontSize: 20,
//         //     fontWeight: FontWeight.w600,
//         //     backgroundColor: Color(0xff302d4c),
//         //   ),
//         // ),
//         // trailing: const Text(
//         //   'Skip',
//         //   style: TextStyle(
//         //     fontSize: 16,
//         //     color: Color(0xff302d4c),
//         //     fontWeight: FontWeight.w600,
//         //   ),
//         // ),
//         // trailingFunction: () {
//         //   Get.offNamedUntil('/Homepage', (route) => route.isFirst);
//         // },
//        // controllerColor: Color(0xff302d4c),
//         // controllerColor: kDarkBlueColor,
//         totalPage: 3,
//         headerBackgroundColor: Colors.white,
//         //pageBackgroundColor: Colors.white,
//
//         background: [
//           Image.network(
//             "https://e1.pxfuel.com/desktop-wallpaper/718/479/desktop-wallpaper-pastel-paint-brush-stroke-background-inspirational-quote-phone-pastel-quotes-thumbnail.jpg",
//             fit: BoxFit.cover,
//             height: 800,
//           ),
//           Image.network(
//             "https://i.pinimg.com/originals/69/5d/d0/695dd0ae4b7d2460cd138ecdea38954f.jpg",
//             fit: BoxFit.cover,
//             height: 800,
//           ),
//           Image.network(
//             "https://i.pinimg.com/564x/34/68/1b/34681ba54a5166a0fa769a6270e6effd.jpg",
//             fit: BoxFit.cover,
//             height: 800,
//           ),
//         ],
//         speed: 1.8,
//         pageBodies: [
//           Container(
//             alignment: Alignment.center,
//             width: MediaQuery.of(context).size.width,
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 480,
//                 ),
//                 Text(
//                   'On your way...',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: kDarkBlueColor,
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Text(
//                   'to find the perfect looking Onboarding for your app?',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.black26,
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             alignment: Alignment.center,
//             width: MediaQuery.of(context).size.width,
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 480,
//                 ),
//                 Text(
//                   'You’ve reached your destination.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: kDarkBlueColor,
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Text(
//                   'Sliding with animation',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.black26,
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             alignment: Alignment.center,
//             width: MediaQuery.of(context).size.width,
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 480,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Text(
//                   'Where everything is possible and customize your onboarding.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.black26,
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class introscreen extends StatefulWidget {
  const introscreen({super.key});

  @override
  State<introscreen> createState() => _introscreenState();
}

class _introscreenState extends State<introscreen> {
  final introKey = GlobalKey<_introscreenState>();

  void _onIntroEnd(context) {
    Get.offAllNamed('/Homepage');
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = TextStyle(fontSize: 19.0);
    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      //bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      // imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Text(""),
          // child: Image.network(
          //   "https://e1.pxfuel.com/desktop-wallpaper/718/479/desktop-wallpaper-pastel-paint-brush-stroke-background-inspirational-quote-phone-pastel-quotes-thumbnail.jpg",
          //   fit: BoxFit.cover,
          //   height: 800,
          // ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff302d4c), // background color
            foregroundColor: Colors.white, // text color
          ),
          child: const Text(
            'Let\'s go right away!',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        PageViewModel(
          image: Image.network(
            "https://img.freepik.com/premium-vector/hand-drawn-quote-about-dream_132073-130.jpg?w=360",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
          title: "Good Day Quotes",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",

          //decoration: pageDecoration,
        ),
        PageViewModel(
          image: Image.network(
            "https://img.freepik.com/premium-vector/follow-your-dreams-colorful-calligraphy-lettering-phrase-modern-typography-text-vector-illustration_218179-926.jpg?w=360",
            fit: BoxFit.cover,
            height: 300,
          ),
          title: "Positive Dreamy Day",
          body: "Waiting your mainifesting day,one day is possible this day ",
          decoration: pageDecoration.copyWith(
            //fullScreen: true,
            bodyAlignment: Alignment.topLeft,
            imageAlignment: Alignment.topCenter,
          ),
        ),
        // PageViewModel(
        //   title: "Your Quotes",
        //   body: "Be always Happy",
        //   image: Image.network(
        //     "https://png.pngtree.com/png-vector/20200202/ourmid/pngtree-adventure-quote-lettering-typography-go-where-you-feel-most-alive-png-image_2140383.jpg",
        //     fit: BoxFit.cover,
        //     height: 800,
        //   ),
        //   decoration: pageDecoration.copyWith(
        //     contentMargin: const EdgeInsets.symmetric(horizontal: 16),
        //     fullScreen: true,
        //     bodyFlex: 2,
        //     imageFlex: 3,
        //     safeArea: 100,
        //   ),
        // ),
        PageViewModel(
          title: "Title of last page - reversed",
          bodyWidget: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Click on ",
              ),
              Icon(Icons.edit),
              Text(
                " to edit a post",
              ),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          image: Image.network(
            "https://us.123rf.com/450wm/ollymolly2015/ollymolly20151909/ollymolly2015190900519/131992915-motivational-poster-about-teamwork.jpg?ver=6",
            fit: BoxFit.cover,
            height: 1000,
          ),
          reverse: true,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      skip: const Text('Skip',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.black,
      ),
      done: const Text('Done',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          )),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: Colors.deepPurple,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Color(0xffE6E6FA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
      ),
    );
  }
}
