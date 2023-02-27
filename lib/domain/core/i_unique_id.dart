abstract class IUniqueId {}

class UniqueIdByInt implements IUniqueId {
  final int value;

  const UniqueIdByInt(this.value);
}
