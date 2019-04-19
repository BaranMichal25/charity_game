import 'package:meta/meta.dart';

class DonationOption {
  final int amount;
  final String description;

  DonationOption({
    @required this.amount,
    @required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DonationOption &&
          runtimeType == other.runtimeType &&
          amount == other.amount &&
          description == other.description;

  @override
  int get hashCode => amount.hashCode ^ description.hashCode;

  @override
  String toString() {
    return 'DonationOption{amount: $amount, description: $description}';
  }
}
