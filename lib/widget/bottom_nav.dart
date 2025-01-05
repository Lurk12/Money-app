import 'package:flutter/material.dart';

Widget customBottomNavigationBar(BuildContext context, int selectedIndex) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
        ),
      ],
    ),
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNavItem(
          context,
          Icons.account_balance_wallet_outlined,
          0,
          selectedIndex,
        ),
        _buildNavItem(
          context,
          Icons.notifications_none,
          1,
          selectedIndex,
        ),
        _buildNavItem(
          context,
          Icons.person_outline,
          2,
          selectedIndex,
        ),
      ],
    ),
  );
}

Widget _buildNavItem(
    BuildContext context, IconData icon, int index, int selectedIndex) {
  final isSelected = selectedIndex == index;
  return GestureDetector(
    onTap: () {
      if (index == 0) {
        // Account Screen
      } else if (index == 1) {
        Navigator.pushNamed(context, '/notification');
      } else if (index == 2) {
        Navigator.pushNamed(context, '/profile');
      }
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.blueAccent : Colors.grey,
          size: 28,
        ),
        const SizedBox(height: 4),
        if (isSelected)
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
            ),
          ),
      ],
    ),
  );
}