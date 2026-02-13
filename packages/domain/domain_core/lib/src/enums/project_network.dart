import 'package:json_annotation/json_annotation.dart';

part 'project_network.g.dart';

@JsonEnum(alwaysCreate: true, valueField: 'value')
enum ProjectNetwork {
  secret(0),
  private_(2);

  const ProjectNetwork(this.value);

  final int value;
}
