import 'package:core_network/core_network.dart';
import 'package:core_storage/core_storage.dart';
import 'package:mocktail/mocktail.dart';

class MockPlaneApiClient extends Mock implements PlaneApiClient {}

class MockWorkItemDao extends Mock implements WorkItemDao {}

class MockProjectDao extends Mock implements ProjectDao {}

class MockCycleDao extends Mock implements CycleDao {}

class MockStateDao extends Mock implements StateDao {}
