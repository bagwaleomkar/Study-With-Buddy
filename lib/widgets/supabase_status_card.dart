import 'package:flutter/material.dart';
import '../core/config/supabase_config.dart';
import '../core/constants/app_colors.dart';
import '../services/supabase_service.dart';

/// Informative card displaying the live Supabase backend connection status.
class SupabaseStatusCard extends StatefulWidget {
  const SupabaseStatusCard({super.key});

  @override
  State<SupabaseStatusCard> createState() => _SupabaseStatusCardState();
}

class _SupabaseStatusCardState extends State<SupabaseStatusCard> {
  bool _isChecking = false;
  bool? _isConnected;

  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  Future<void> _checkStatus() async {
    if (!mounted) return;
    setState(() {
      _isChecking = true;
    });

    final isLive = await SupabaseService.checkConnection();

    if (mounted) {
      setState(() {
        _isChecking = false;
        _isConnected = isLive;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isConfigured = SupabaseConfig.isConfigured;

    Color statusColor;
    String statusTitle;
    String statusMessage;
    IconData statusIcon;

    if (!isConfigured) {
      statusColor = AppColors.warning;
      statusTitle = 'Supabase: Pending Configuration';
      statusMessage = 'Add your SUPABASE_URL and SUPABASE_ANON_KEY to .env to enable backend features.';
      statusIcon = Icons.link_off_rounded;
    } else if (_isChecking) {
      statusColor = AppColors.info;
      statusTitle = 'Supabase: Checking Connection...';
      statusMessage = 'Verifying connection to PostgreSQL database...';
      statusIcon = Icons.sync_rounded;
    } else if (_isConnected == true) {
      statusColor = AppColors.success;
      statusTitle = 'Supabase: Connected';
      statusMessage = 'PostgreSQL database and Realtime services are online.';
      statusIcon = Icons.check_circle_outline_rounded;
    } else {
      statusColor = AppColors.info;
      statusTitle = 'Supabase: Configured (Offline or Standby)';
      statusMessage = 'Client initialized. Database queries will execute as authenticated.';
      statusIcon = Icons.cloud_done_outlined;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                statusIcon,
                color: statusColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    statusTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: statusColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    statusMessage,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.refresh, size: 18),
              onPressed: _isChecking ? null : _checkStatus,
              tooltip: 'Refresh Connection',
            ),
          ],
        ),
      ),
    );
  }
}
