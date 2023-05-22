import 'package:uuid/uuid.dart';

abstract class UuidProvider {
  String get v4;
}

class UuidProviderImpl implements UuidProvider {
  final uuid = const Uuid();
  @override
  String get v4 => uuid.v4();
}
