import 'package:flutter/material.dart';

import '../../widgets/image_popup.dart';
import 'package:badges/badges.dart' as badge;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _ProfileHeader(),
        const SizedBox(height: 24),
        actionTile(
          onTap: () {},
          icon: const badge.Badge(
            badgeContent: Text("3", style: TextStyle(color: Colors.white, fontSize: 11)),
            child: Icon(Icons.notifications_outlined),
          ),
          text: "Notifications",
        ),
        actionTile(
          onTap: () {},
          icon: const Icon(Icons.person_outline),
          text: "Edit Profile",
        ),
        actionTile(
          onTap: () {},
          icon: const Icon(Icons.shield_outlined),
          text: "Change Password",
        ),
        actionTile(
          onTap: () {},
          icon: const Icon(Icons.headset_outlined),
          text: "Help Center",
        ),
        actionTile(
          onTap: () {},
          icon: const Icon(Icons.logout, color: Colors.red),
          text: "Log Out",
          isLogout: true,
        ),
      ],
    );
  }

  Widget actionTile(
      {required void Function() onTap, required Widget icon, required String text, bool isLogout = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text, style: TextStyle(color: isLogout ? Colors.red : null, fontSize: 13)),
                    Icon(Icons.arrow_forward_ios, size: 18, color: isLogout ? Colors.red : null),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const ImagePopUp(
                imageUrl: 'assets/images/guestpro full team.jpg',
              ),
            );
          },
          child: Column(
            children: [
              Image.asset(
                'assets/images/guestpro full team.jpg',
                height: 135,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 90),
            ],
          ),
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const ImagePopUp(
                    imageUrl: 'assets/images/guestpro logo.png',
                    // height: 40,
                    width: 40,
                  ),
                );
              },
              child: Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/guestpro logo.png',
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'GuestPro',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const Text(
              'Cloud PMS, GuestAps, Orderbil',
              style: TextStyle(
                color: Color(0xFFB4B3BB),
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            )
          ],
        )
      ],
    );
  }
}
