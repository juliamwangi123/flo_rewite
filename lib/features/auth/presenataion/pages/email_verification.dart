import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Your Email', style: normalSize16Text()),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.email, size: 64, color: AppColors.floaidPink,),
            Text(
              'A verification email has been sent to your email address. Please check your inbox and click the verification link.',
              textAlign: TextAlign.center,
              style: normalSize14Text(),
            ),
            mediumVerticalSizedBox,
            smallHorizontalSizedBox,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.activeState,
                  foregroundColor: AppColors.palePink,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Resend Email', style: normalSize14Text()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
