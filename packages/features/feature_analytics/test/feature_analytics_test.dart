import 'package:feature_analytics/feature_analytics.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProjectAnalytics', () {
    test('can be instantiated', () {
      const analytics = ProjectAnalytics(
        totalIssues: 100,
        completedIssues: 60,
        openIssues: 30,
        overdueIssues: 10,
        issuesByState: {},
        issuesByPriority: {},
        issuesByAssignee: {},
      );
      expect(analytics.totalIssues, 100);
      expect(analytics.completedIssues, 60);
      expect(analytics.openIssues, 30);
      expect(analytics.overdueIssues, 10);
    });
  });

  group('WorkloadItem', () {
    test('can be instantiated', () {
      const item = WorkloadItem(
        memberId: '1',
        memberName: 'Alice',
        assignedCount: 10,
        completedCount: 8,
      );
      expect(item.memberId, '1');
      expect(item.memberName, 'Alice');
      expect(item.assignedCount, 10);
      expect(item.completedCount, 8);
    });
  });

  group('BurndownPoint', () {
    test('can be instantiated', () {
      final point = BurndownPoint(
        date: DateTime(2025, 1, 15),
        ideal: 20,
        actual: 22,
      );
      expect(point.ideal, 20);
      expect(point.actual, 22);
    });
  });

  group('CycleAnalytics', () {
    test('can be instantiated', () {
      const analytics = CycleAnalytics(
        velocity: 25,
        completionRate: 80,
        burndownData: [],
        issuesByState: {},
      );
      expect(analytics.velocity, 25);
      expect(analytics.completionRate, 80);
    });
  });
}
