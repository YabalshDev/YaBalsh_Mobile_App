// ignore_for_file: unused_field, prefer_final_fields

abstract class PromoService {
  bool _isPromoValid = true;

  bool get isPromoValid;

  void setPromoValidity(bool value);
}

class PromoServiceImpl implements PromoService {
  @override
  bool _isPromoValid = true;

  @override
  bool get isPromoValid => _isPromoValid;

  @override
  void setPromoValidity(bool value) => _isPromoValid = value;
}
