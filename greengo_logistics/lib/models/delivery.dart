import 'package:flutter/material.dart';
class Delivery {
  final int id;
  final String address;
  final String client;
  final String time;
  final DeliveryPriority priority;
  bool delivered;

  Delivery({
    required this.id,
    required this.address,
    required this.client,
    required this.time,
    required this.priority,
    this.delivered = false,
  });

  // Método para convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'client': client,
      'time': time,
      'priority': priority.name,
      'delivered': delivered,
    };
  }

  // Factory para crear desde JSON
  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      id: json['id'],
      address: json['address'],
      client: json['client'],
      time: json['time'],
      priority: DeliveryPriority.values.firstWhere(
        (e) => e.name == json['priority'],
      ),
      delivered: json['delivered'] ?? false,
    );
  }
}

enum DeliveryPriority {
  high,
  medium,
  low,
}

extension DeliveryPriorityExtension on DeliveryPriority {
  String get label {
    switch (this) {
      case DeliveryPriority.high:
        return 'Urgente';
      case DeliveryPriority.medium:
        return 'Normal';
      case DeliveryPriority.low:
        return 'Baja';
    }
  }

  Color get color {
    switch (this) {
      case DeliveryPriority.high:
        return Colors.red.shade100;
      case DeliveryPriority.medium:
        return Colors.yellow.shade100;
      case DeliveryPriority.low:
        return Colors.green.shade100;
    }
  }

  Color get borderColor {
    switch (this) {
      case DeliveryPriority.high:
        return Colors.red.shade700;
      case DeliveryPriority.medium:
        return Colors.yellow.shade700;
      case DeliveryPriority.low:
        return Colors.green.shade700;
    }
  }
}