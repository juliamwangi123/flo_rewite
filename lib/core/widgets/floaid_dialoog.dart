import 'package:flutter/material.dart';

enum DialogType { danger, warning, success, info }

class FloAidDialog {
  static Future<bool?> show({
    required BuildContext context,
    required DialogType type,
    required String title,
    required String message,
    bool? isLoading,
    String? icon,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    bool singleButton = false,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
                child: Column(
                  children: [
                    // Icon
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: _getIconBackgroundColor(type),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          icon ?? _getDefaultIcon(type),
                          style: const TextStyle(fontSize: 28),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF212529),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    
                    // Message
                    Text(
                      message,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF6C757D),
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              const Divider(height: 1, color: Color(0xFFE9ECEF)),
              
              if (singleButton) _buildSingleButton(
                      context,
                      confirmText,
                      onConfirm,
                    ) else _buildTwoButtons(
                      context,
                      cancelText,
                      confirmText,
                      onCancel,
                      onConfirm,
                      isLoading
                    ),
            ],
          ),
        );
      },
    );
  }

  static Widget _buildSingleButton(
    BuildContext context,
    String confirmText,
    VoidCallback? onConfirm,
  ) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop(true);
        onConfirm?.call();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Text(
            confirmText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFFE91E63),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildTwoButtons(
    BuildContext context,
    String cancelText,
    String confirmText,
    VoidCallback? onCancel,
    VoidCallback? onConfirm,
    bool? isLoading,
  ) {
    return IntrinsicHeight(
      child: Row(
        children: [
          // Cancel Button
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop(false);
                onCancel?.call();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Text(
                    cancelText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6C757D),
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          // Divider
          Container(
            width: 1,
            color: const Color(0xFFE9ECEF),
          ),
          
          // Confirm Button
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop(true);
                onConfirm?.call();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: isLoading ==true  ? const CircularProgressIndicator() : Text(
                    confirmText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFE91E63),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Color _getIconBackgroundColor(DialogType type) {
    switch (type) {
      case DialogType.danger:
        return const Color(0xFFFEEEEE);
      case DialogType.warning:
        return const Color(0xFFFFF3E0);
      case DialogType.success:
        return const Color(0xFFE8F5E9);
      case DialogType.info:
        return const Color(0xFFE3F2FD);
    }
  }

  static String _getDefaultIcon(DialogType type) {
    switch (type) {
      case DialogType.danger:
        return '🗑️';
      case DialogType.warning:
        return '⚠️';
      case DialogType.success:
        return '✓';
      case DialogType.info:
        return 'ℹ️';
    }
  }
}





// ============================================
// HOW TO USE IN YOUR APP
// ============================================

/*

EXAMPLE 1: Delete Action
------------------------
FloAidDialog.show(
  context: context,
  type: DialogType.danger,
  icon: '🗑️',
  title: 'Delete Pickup?',
  message: 'This action cannot be undone.',
  confirmText: 'Delete',
  cancelText: 'Cancel',
  onConfirm: () {
    // Delete logic here
    deletePickup(pickupId);
  },
);


EXAMPLE 2: Cancel Action
------------------------
FloAidDialog.show(
  context: context,
  type: DialogType.warning,
  title: 'Cancel Donation?',
  message: 'Are you sure you want to cancel?',
  confirmText: 'Yes, Cancel',
  cancelText: 'Go Back',
  onConfirm: () {
    // Cancel logic here
    cancelDonation();
  },
);


EXAMPLE 3: Single Button (Info)
--------------------------------
FloAidDialog.show(
  context: context,
  type: DialogType.info,
  title: 'Important Notice',
  message: 'Your pickup has been rescheduled to tomorrow.',
  confirmText: 'OK',
  singleButton: true,
);


EXAMPLE 4: Custom Icon
----------------------
FloAidDialog.show(
  context: context,
  type: DialogType.success,
  icon: '📦',  // Custom icon
  title: 'Donation Received',
  message: 'Thank you for your contribution!',
  confirmText: 'Done',
  singleButton: true,
);

*/