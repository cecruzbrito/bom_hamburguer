// ignore_for_file: public_member_api_docs, sort_constructors_first
class DiscountEntity {
  final String desc;
  final double percentage;
  final double valueDiscount;
  DiscountEntity({required this.desc, required this.percentage, required this.valueDiscount});

  static final zero = DiscountEntity(desc: "No Discount", percentage: 0, valueDiscount: 0);

  bool get hasDiscount => percentage > 0;
}
