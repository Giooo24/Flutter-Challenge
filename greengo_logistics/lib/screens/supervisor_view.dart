import 'package:flutter/material.dart';
import '../models/delivery.dart';
import '../services/delivery_service.dart';
import '../utils/app_colors.dart';
import '../utils/constants.dart';
import '../widgets/stats_card.dart';
import '../widgets/delivery_list_item.dart';

class SupervisorView extends StatelessWidget {
  final List<Delivery> deliveries;

  const SupervisorView({
    super.key,
    required this.deliveries,
  });

  @override
  Widget build(BuildContext context) {
    final stats = DeliveryService.calculateStats(deliveries);

    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
      child: ListView(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        children: [
          _buildStatsRow(stats),
          const SizedBox(height: AppConstants.paddingMedium),
          _buildProgressCard(stats),
          const SizedBox(height: AppConstants.paddingMedium),
          _buildAllDeliveriesCard(),
        ],
      ),
    );
  }

  Widget _buildStatsRow(DeliveryStats stats) {
    return Row(
      children: [
        Expanded(
          child: StatsCard(
            title: 'Completadas',
            value: stats.completed.toString(),
            gradient: AppColors.completedGradient,
            icon: Icons.check_circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatsCard(
            title: 'Pendientes',
            value: stats.pending.toString(),
            gradient: AppColors.pendingGradient,
            icon: Icons.access_time,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressCard(DeliveryStats stats) {
    return Card(
      elevation: AppConstants.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Progreso Global',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TweenAnimationBuilder<double>(
                duration: AppConstants.slowAnimation,
                curve: Curves.easeOut,
                tween: Tween<double>(begin: 0, end: stats.progress / 100),
                builder: (context, value, _) => LinearProgressIndicator(
                  value: value,
                  minHeight: 24,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllDeliveriesCard() {
    return Card(
      elevation: AppConstants.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Todas las Entregas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...deliveries.map((delivery) => DeliveryListItem(delivery: delivery)),
          ],
        ),
      ),
    );
  }
}
