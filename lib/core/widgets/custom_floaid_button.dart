import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomFloAidButton extends StatelessWidget {
  final bool isButtonActive;
  final void Function() handleSubmitButton;
  final bool? isLoading;
  final String buttonText;

  const CustomFloAidButton({
    super.key, 
    required this.isButtonActive, 
    required this.handleSubmitButton,  
    this.isLoading = false, 
    required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: isButtonActive
            ? const LinearGradient(
                colors: [AppColors.floaidPink, AppColors.floaidPurple],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
        color: isButtonActive ? null : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isButtonActive
            ? [
                BoxShadow(
                  color: AppColors.floaidPink.withValues(alpha: 0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isButtonActive ? handleSubmitButton : null,
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: isLoading == true
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.5,
                    ),
                  )
                : Text(
                  buttonText,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: isButtonActive ? Colors.white : Colors.grey.shade500,
                    ),
                  ),
          ),
        ),
      ),
      );
    
    }
  }
