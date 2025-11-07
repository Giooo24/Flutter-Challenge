import 'package:flutter/material.dart';
import '../models/delivery.dart';
import '../services/delivery_service.dart';
import '../utils/app_colors.dart';
import '../utils/constants.dart';
import '../widgets/delivery_card.dart';
import '../widgets/progress_card.dart';

class DeliveryView extends StatefulWidget {
  final List<Delivery> deliveries;
  final Function(int) onDeliveryMarked;

  const DeliveryView({
    super.key,
    required this.deliveries,
    required this.onDeliveryMarked,
  });

  @override
  State<DeliveryView> createState() => _DeliveryViewState();
}

class _DeliveryViewState extends State<DeliveryView> {
  int? _animatingId;

  void _markAsDelivered(int id) {
    setState(() {
      _animatingId = id;
    });

    Future.delayed(AppConstants.normalAnimation, () {
      widget.onDeliveryMarked(id);
      setState(() {
        _animatingId = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final stats = DeliveryService.calculateStats(widget.deliveries);

    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
      child: ListView(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        children: [
          ProgressCard(stats: stats),
          const SizedBox(height: AppConstants.paddingMedium),
          ...widget.deliveries.map((delivery) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: DeliveryCard(
              delivery: delivery,
              isAnimating: _animatingId == delivery.id,
              onMarkAsDelivered: () => _markAsDelivered(delivery.id),
            ),
          )),
        ],
      ),
    );
  }
}
