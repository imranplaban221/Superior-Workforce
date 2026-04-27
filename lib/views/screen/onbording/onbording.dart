import 'package:flutter/material.dart';
import 'package:flutter_extension/views/base/custom_curve_painter.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Stack(
            children: [

             
              Container(
                color: const Color(0xFF1877B5),
              ),

              if (index == 0)
                Positioned(
                  top: 47,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 544,
                    child: CustomPaint(
                      painter: BottomCurvePainter(),
                    ),
                  ),
                ),

             
              if (index == 1)
                Positioned(
                  top: 47,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 503,
                    child: CustomPaint(
                      painter: SecondCurvePainter(),
                    ),
                  ),
                ),

             
              if (index == 2)
                Positioned.fill(
                  child: CustomPaint(
                    painter: BottomCurvePainter(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}