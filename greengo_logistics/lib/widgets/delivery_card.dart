import 'package:flutter/material.dart';
import '../models/delivery.dart';
import '../utils/constants.dart';

class DeliveryCard extends StatelessWidget {
  final Delivery delivery;
  final bool isAnimating;
  final VoidCallback onMarkAsDelivered;

  const DeliveryCard({
    super.key,
    required this.delivery,
    required this.isAnimating,
    required this.onMarkAsDelivered,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: AppConstants.quickAnimation,
      scale: isAnimating ? 0.95 : 1.0,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: delivery.delivered ? 0.6 : 1.0,
        child: Card(
          elevation: delivery.delivered ? 2 : AppConstants.cardElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            side: BorderSide(
              color: delivery.delivered ? Colors.green.shade300 : Colors.grey.shade300,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 12),
                _buildClientName(),
                const SizedBox(height: 8),
                _buildAddressRow(),
                if (delivery.delivered) _buildDeliveredBanner(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: delivery.priority.color,
            border: Border.all(color: delivery.priority.borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            delivery.priority.label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: delivery.priority.borderColor,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Icon(Icons.access_time, size: 14, color: Colors.grey.shade600),
        const SizedBox(width: 4),
        Text(
          delivery.time,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildClientName() {
    return Text(
      delivery.client,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildAddressRow() {
    return Row(
      children: [
        Icon(Icons.location_on, size: 16, color: Colors.green.shade600),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            delivery.address,
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ),
        const SizedBox(width: 8),
        _buildActionButton(),
      ],
    );
  }

  Widget _buildActionButton() {
    return Material(
      color: delivery.delivered ? Colors.green.shade500 : Colors.green.shade600,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: delivery.delivered ? null : onMarkAsDelivered,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(
            delivery.delivered ? Icons.check_circle : Icons.check_circle_outline,
            color: Colors.white,
            size: AppConstants.iconSize,
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveredBanner() {
    return Column(
      children: [
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.green.shade200)),
          ),
          child: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green.shade700, size: 16),
              const SizedBox(width: 6),
              Text(
                '✓ Entregado con éxito',
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
