import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// A small colored badge that displays the member's role label.
class MemberRoleBadge extends StatelessWidget {
  const MemberRoleBadge({required this.role, super.key});

  final MemberRole role;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        _label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: _foregroundColor,
        ),
      ),
    );
  }

  String get _label => switch (role) {
        MemberRole.admin => 'Admin',
        MemberRole.member => 'Member',
        MemberRole.viewer => 'Viewer',
        MemberRole.guest => 'Guest',
      };

  Color get _backgroundColor => switch (role) {
        MemberRole.admin => PlaneColors.primarySurface,
        MemberRole.member => PlaneColors.successLight,
        MemberRole.viewer => PlaneColors.infoLight,
        MemberRole.guest => PlaneColors.warningLight,
      };

  Color get _foregroundColor => switch (role) {
        MemberRole.admin => PlaneColors.primaryDark,
        MemberRole.member => PlaneColors.success,
        MemberRole.viewer => PlaneColors.info,
        MemberRole.guest => PlaneColors.warning,
      };
}
