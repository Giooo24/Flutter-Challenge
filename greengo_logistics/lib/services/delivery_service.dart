import '../models/delivery.dart';

class DeliveryService {
  static List<Delivery> getSampleDeliveries() {
    return [
      Delivery(
        id: 1,
        address: 'Calle 45 #23-15',
        client: 'María González',
        time: '10:30 AM',
        priority: DeliveryPriority.high,
      ),
      Delivery(
        id: 2,
        address: 'Carrera 15 #78-42',
        client: 'Carlos Ruiz',
        time: '11:00 AM',
        priority: DeliveryPriority.medium,
      ),
      Delivery(
        id: 3,
        address: 'Avenida 9 #12-88',
        client: 'Ana López',
        time: '11:30 AM',
        priority: DeliveryPriority.low,
      ),
      Delivery(
        id: 4,
        address: 'Calle 100 #50-23',
        client: 'Pedro Martínez',
        time: '12:00 PM',
        priority: DeliveryPriority.high,
      ),
      Delivery(
        id: 5,
        address: 'Carrera 7 #32-10',
        client: 'Laura Díaz',
        time: '12:30 PM',
        priority: DeliveryPriority.medium,
      ),
      Delivery(
        id: 6,
        address: 'Calle 26 #68-15',
        client: 'Jorge Silva',
        time: '1:00 PM',
        priority: DeliveryPriority.low,
      ),
    ];
  }

  static DeliveryStats calculateStats(List<Delivery> deliveries) {
    final completed = deliveries.where((d) => d.delivered).length;
    final total = deliveries.length;
    final pending = total - completed;
    final progressValue = total > 0 ? (completed / total) * 100 : 0.0;

    return DeliveryStats(
      completed: completed,
      pending: pending,
      total: total,
      progress: progressValue,
    );
  }
}

class DeliveryStats {
  final int completed;
  final int pending;
  final int total;
  final double progress;

  DeliveryStats({
    required this.completed,
    required this.pending,
    required this.total,
    required this.progress,
  });
}