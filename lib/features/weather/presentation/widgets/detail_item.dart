import 'package:flutter/material.dart';

Widget buildDetailItem(IconData icon, String value, String label) {
  return Column(
    children: [
      Icon(icon, color: Colors.blue.shade600, size: 20),
      const SizedBox(height: 4),
      Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
      Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
    ],
  );
}
