import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_workspace_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedWorkspace extends _$SelectedWorkspace {
  @override
  Workspace? build() => null;

  // ignore: use_setters_to_change_properties
  void select(Workspace workspace) {
    state = workspace;
  }

  void clear() {
    state = null;
  }
}
