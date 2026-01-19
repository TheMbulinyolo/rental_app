import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Bonjour 👋",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 4),
            Text(
              "Eddy",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(
            "https://i.pravatar.cc/150",
          ),
        ),
      ],
    );
  }
}
