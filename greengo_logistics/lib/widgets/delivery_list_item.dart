import 'package:flutter/material.dart';
import '../models/delivery.dart';

class DeliveryListItem extends StatelessWidget {
  final Delivery delivery;

  const DeliveryListItem({
    super.key,
    required this.delivery,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: delivery.delivered ? Colors.green.shade50 : Colors.grey.shade50,
        border: Border.all(
          color: delivery.delivered ? Colors.green.shade300 : Colors.grey.shade300,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: delivery.delivered ? Colors.green.shade500 : Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: Icon(
              delivery.delivered ? Icons.check_circle : Icons.access_time,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  delivery.client,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  delivery.address,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Text(
            delivery.time,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}