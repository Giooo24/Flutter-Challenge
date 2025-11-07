import 'package:flutter/material.dart';
import '../models/delivery.dart';
import '../services/delivery_service.dart';
import '../widgets/app_header.dart';
import 'delivery_view.dart';
import 'supervisor_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Delivery> _deliveries;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _deliveries = DeliveryService.getSampleDeliveries();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onDeliveryMarked(int id) {
    setState(() {
      final delivery = _deliveries.firstWhere((d) => d.id == id);
      delivery.delivered = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppHeader(),
          _buildTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                DeliveryView(
                  deliveries: _deliveries,
                  onDeliveryMarked: _onDeliveryMarked,
                ),
                SupervisorView(deliveries: _deliveries),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        indicatorColor: Colors.green.shade600,
        labelColor: Colors.green.shade600,
        unselectedLabelColor: Colors.grey,
        tabs: const [
          Tab(icon: Icon(Icons.person), text: 'Repartidor'),
          Tab(icon: Icon(Icons.bar_chart), text: 'Supervisor'),
        ],
      ),
    );
  }
}
