import 'package:flutter/material.dart';
import 'package:royalbattle/screens/profile/app_bar.dart';
import 'package:royalbattle/screens/profile/constants.dart';

class KycSection extends StatelessWidget {
  const KycSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        children: [
          Text('KYC Section'),
        ],
      ),
    );
  }
}

class SecuritySection extends StatelessWidget {
  const SecuritySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        children: [
          Text('Security Section'),
        ],
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        children: [
          Text('Settings Section'),
        ],
      ),
    );
  }
}

class SupportSection extends StatelessWidget {
  const SupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        children: [
          Text('Support Section'),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  bool isUidVerified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const ProfileAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(), // UserProfileCard placeholder
              const SizedBox(height: 16),
              Container(), // FreeFireUidSection placeholder
              const SizedBox(height: 16),
              const Text('Tournaments Section'), // Placeholder
              const SizedBox(height: 16),
              const Text('Rewards Section'), // Placeholder
              const SizedBox(height: 16),
              const KycSection(),
              const SizedBox(height: 16),
              const SecuritySection(),
              const SizedBox(height: 16),
              const SettingsSection(),
              const SizedBox(height: 16),
              const SupportSection(),
              const SizedBox(height: 16),
              Container(), // LogoutButton placeholder
            ],
          ),
        ),
      ),
    );
  }
}
