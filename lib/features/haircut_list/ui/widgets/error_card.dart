import 'package:flutter/material.dart';
import 'package:silo_barbing_app/style_constants.dart';

class ErrorCard extends StatelessWidget {
  final VoidCallback onTap;
  const ErrorCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 112.0),
      color: AppColors.skeltonColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/error.png',
              height: 80,
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              'We’re sorry, there was a problem while loading the haircuts.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Graphik',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColors.textBlack,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Try reloading the page or check back later.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Graphik',
                fontSize: 16,
                color: AppColors.textGrey,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: onTap,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xff000000),
                                Color(0xff666666),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          border: Border.all(
                              color: const Color(0xff1B1B1B),
                              width: 1.0,
                              style: BorderStyle.solid)),
                      child: const Text(
                        'Refresh Page',
                        style: TextStyle(
                          fontFamily: 'Graphik',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
