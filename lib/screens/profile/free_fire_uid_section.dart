import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:royalbattle/screens/profile/constants.dart';

class FreeFireUidSection extends StatelessWidget {
  final bool isUidVerified;
  final VoidCallback onVerify;

  const FreeFireUidSection({
    super.key,
    required this.isUidVerified,
    required this.onVerify,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: kCardDecoration,
      child: Column(
        children: [
          const Text(
            'Free Fire UID',
            style: kSectionTitleStyle,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '9876543210', // Example UID
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace',
                ),
              ),
              const SizedBox(width: 12),
              IconButton(
                icon: const Icon(Icons.copy, color: kPrimaryColor),
                onPressed: () async {
                  await Clipboard.setData(const ClipboardData(text: '9876543210'));
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('UID copied to clipboard'),
                        backgroundColor: kPrimaryColor,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onVerify,
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            ),
            child: const Text('Verify UID'),
          ),
          const SizedBox(height: 16),
          // UID Status
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isUidVerified)
                _buildVerificationStatus(
                  'UID Verified',
                  kSuccessColor,
                  Icons.check_circle,
                )
              else
                _buildVerificationStatus(
                  'Pending Verification',
                  kWarningColor,
                  Icons.hourglass_empty,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationStatus(String text, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: color.withValues(alpha: 0.8), size: 18),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: color.withValues(alpha: 0.8),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
