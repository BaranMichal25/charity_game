class DonationOptionsDto {
  List<DonationOptionDto> donationOption;

  DonationOptionsDto({this.donationOption});

  DonationOptionsDto.fromJson(Map<String, dynamic> json) {
    if (json['donationOption'] != null) {
      donationOption = List<DonationOptionDto>();
      json['donationOption'].forEach((v) {
        donationOption.add(DonationOptionDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.donationOption != null) {
      data['donationOption'] =
          this.donationOption.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DonationOptionsDto &&
          runtimeType == other.runtimeType &&
          donationOption == other.donationOption;

  @override
  int get hashCode => donationOption.hashCode;
}

class DonationOptionDto {
  int amount;
  String description;

  DonationOptionDto({this.amount, this.description});

  DonationOptionDto.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount'] = this.amount;
    data['description'] = this.description;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DonationOptionDto &&
          runtimeType == other.runtimeType &&
          amount == other.amount &&
          description == other.description;

  @override
  int get hashCode => amount.hashCode ^ description.hashCode;
}
