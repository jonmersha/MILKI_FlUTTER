import 'package:flutter/material.dart';

class RegistrationsDashboardPage extends StatelessWidget {
  const RegistrationsDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data - replace with real stats or API calls
    final int totalRegistrations = 1240;
    final int newRegistrationsToday = 25;
    final int pendingApprovals = 8;
    final int rejectedRegistrations = 5;

    return Scaffold(
      appBar: AppBar(title: const Text('Registrations Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text(
              'Registrations Overview',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard(
                  title: 'Total Registrations',
                  value: totalRegistrations.toString(),
                  icon: Icons.person_add_alt_1,
                  color: Colors.blue,
                ),
                const SizedBox(width: 16),
                _buildStatCard(
                  title: 'New Today',
                  value: newRegistrationsToday.toString(),
                  icon: Icons.person_add,
                  color: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard(
                  title: 'Pending Approvals',
                  value: pendingApprovals.toString(),
                  icon: Icons.hourglass_top,
                  color: Colors.orange,
                ),
                const SizedBox(width: 16),
                _buildStatCard(
                  title: 'Rejected',
                  value: rejectedRegistrations.toString(),
                  icon: Icons.cancel,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 36),
            const SizedBox(height: 12),
            Text(
              value,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: color, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
