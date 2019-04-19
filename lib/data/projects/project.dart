import 'package:charity_game/data/projects/donation_option.dart';
import 'package:charity_game/data/projects/organization.dart';
import 'package:meta/meta.dart';

class Project {
  final int id;
  final Organization organization;
  final String title;
  final String summary;
  final String themeName;
  final String country;
  final String region;
  final double goal;
  final double funding;
  final double remaining;
  final int numberOfDonations;
  final String need;
  final String longTermImpact;
  final String activities;
  final List<DonationOption> donationOptions;

  Project({
    @required this.id,
    @required this.organization,
    @required this.title,
    @required this.summary,
    @required this.themeName,
    @required this.country,
    @required this.region,
    @required this.goal,
    @required this.funding,
    @required this.remaining,
    @required this.numberOfDonations,
    @required this.need,
    @required this.longTermImpact,
    @required this.activities,
    @required this.donationOptions,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Project &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          organization == other.organization &&
          title == other.title &&
          summary == other.summary &&
          themeName == other.themeName &&
          country == other.country &&
          region == other.region &&
          goal == other.goal &&
          funding == other.funding &&
          remaining == other.remaining &&
          numberOfDonations == other.numberOfDonations &&
          need == other.need &&
          longTermImpact == other.longTermImpact &&
          activities == other.activities &&
          donationOptions == other.donationOptions;

  @override
  int get hashCode =>
      id.hashCode ^
      organization.hashCode ^
      title.hashCode ^
      summary.hashCode ^
      themeName.hashCode ^
      country.hashCode ^
      region.hashCode ^
      goal.hashCode ^
      funding.hashCode ^
      remaining.hashCode ^
      numberOfDonations.hashCode ^
      need.hashCode ^
      longTermImpact.hashCode ^
      activities.hashCode ^
      donationOptions.hashCode;

  @override
  String toString() {
    return 'Project{id: $id, organization: $organization, title: $title, '
        'summary: $summary, themeName: $themeName, country: $country, '
        'region: $region, goal: $goal, funding: $funding, '
        'remaining: $remaining, numberOfDonations: $numberOfDonations, '
        'need: $need, longTermImpact: $longTermImpact, activities: $activities, '
        'donationOptions: $donationOptions}';
  }
}
