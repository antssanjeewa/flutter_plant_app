import 'package:flutter/material.dart';
import 'package:plant_app/app/constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("skip", style: AppTextStyles.bodyBold),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 1.8,
              child: Image.asset("images/image1.png"),
            ),
            SizedBox(height: AppSize.base),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.lg),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineMedium,
                  children: [
                    TextSpan(
                      text: "Enjoy Your Life with",
                      style: AppTextStyles.heading.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(text: " Plants", style: AppTextStyles.headingBold),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
