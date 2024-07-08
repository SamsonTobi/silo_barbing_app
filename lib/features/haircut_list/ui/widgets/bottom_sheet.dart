import 'package:flutter/material.dart';
import 'package:silo_barbing_app/style_constants.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 46),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
              decoration: BoxDecoration(
                  color: AppColors.skeltonColor,
                  borderRadius: BorderRadius.circular(40)),
              child: Image.asset('images/modal-icon.png', height: 30,),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Sign up or Login to book a haricut comfortably.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Encode', fontSize: 32, color: AppColors.textBlack),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
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
                            'Create an account',
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(14.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: const Color(0xff1B1B1B),
                                  width: 1.0,
                                  style: BorderStyle.solid)),
                          child: const Text(
                            'I already have an account',
                            style: TextStyle(
                              fontFamily: 'Graphik',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.textBlack,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
