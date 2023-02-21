class AppErrorMessages {
  static const Map<String, dynamic> statusCodesTranslator = {
    '400': 'خطا في بيانات الطلب ...حاول مرة اخرى',
    '401': 'غير مصرح بهذا الطلب ... سجل دخول',
    '403': 'حظر الطلب من السيرفر ..حاول مرة اخرى',
    '404': 'لم يتم العثور على عنوان الطلب..حاول مرة اخرى',
    '405': 'خطا داخلي في السيرفر..حاول لاحقا',
    '409': 'خطا داخلي في السيرفر..حاول لاحقا',
    '422': 'خطا داخلي في السيرفر..حاول لاحقا',
    '500': 'خطا داخلي في السيرفر..حاول لاحقا',
  };

  static const Map<String, dynamic> errorMessagesTranslator = {
    'The email has already been taken.': 'البريد الاكتروني ماخوذ مسبقا',
    'Invalid Credentials': 'كلمة المرور غير صحيحة',
  };
}
