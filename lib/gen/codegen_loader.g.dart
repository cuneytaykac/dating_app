// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _tr = {
  "sign_in": {
    "title": "Giriş Yap",
    "welcome": "Merhabalar",
    "email": "E-Posta",
    "password": "Şifre",
    "forgot_password": "Şifremi unuttum",
    "sign_in_button": "Giriş Yap",
    "no_account": "Bir hesabın yok mu?",
    "sign_up": "Kayıt Ol!",
    "email_required": "E-posta boş olamaz",
    "email_invalid": "Geçerli bir e-posta adresi giriniz",
    "password_required": "Şifre boş olamaz",
    "password_min_length": "Şifre en az 6 karakter olmalıdır",
    "form_validation_error": "Lütfen form hatalarını düzeltiniz"
  },
  "register": {
    "title": "Kayıt Ol",
    "welcome": "Hoşgeldiniz",
    "description": "Tempus varius a vitae interdum id tortor elementum tristique eleifend at.",
    "full_name": "Ad Soyad",
    "email": "E-Posta",
    "password": "Şifre",
    "confirm_password": "Şifre Tekrar",
    "register_button": "Şimdi Kaydol",
    "already_have_account": "Zaten bir hesabın var mı?",
    "sign_in": "Giriş Yap!",
    "terms_title": "Kullanıcı sözleşmesini",
    "terms_accepted": "okudum ve kabul ediyorum.",
    "terms_description": "Bu sözleşmeyi okuyarak devam ediniz lütfen.",
    "full_name_required": "Ad soyad boş olamaz",
    "full_name_min_length": "Ad soyad en az 2 karakter olmalıdır",
    "email_required": "E-posta boş olamaz",
    "email_invalid": "Geçerli bir e-posta adresi giriniz",
    "password_required": "Şifre boş olamaz",
    "password_min_length": "Şifre en az 6 karakter olmalıdır",
    "confirm_password_required": "Şifre tekrarı boş olamaz",
    "passwords_not_match": "Şifreler eşleşmiyor",
    "terms_required": "Kullanıcı sözleşmesini kabul etmelisiniz",
    "form_validation_error": "Lütfen form hatalarını düzeltiniz"
  },
  "discover": {
    "user_name": "Günahkar Adam",
    "user_description": "Community every territories dogpile so. Last they investigation model",
    "read_more": "Daha Fazlası",
    "home": "Anasayfa",
    "profile": "Profil"
  },
  "photo_picker": {
    "camera": "Kamera",
    "gallery": "Galeri",
    "take_photo": "Fotoğraf çek",
    "select_from_gallery": "Galeriden seç",
    "add_photo": "Fotoğraf Ekle",
    "loading": "Yükleniyor...",
    "error_occurred": "Fotoğraf seçilirken hata oluştu",
    "permission_required": "Kamera veya galeri izni gerekli",
    "camera_not_available": "Kamera erişimi şu anda kullanılamıyor. Lütfen tekrar deneyin.",
    "ok": "Tamam"
  },
  "profile_picture": {
    "title": "Profil Detay",
    "upload_photos": "Fotoğraflarınızı Yükleyin",
    "description": "Resources out incentivize relaxation floor loss cc.",
    "continue": "Devam Et"
  }
};
static const Map<String,dynamic> _en = {
  "sign_in": {
    "title": "Sign In",
    "welcome": "Hello",
    "email": "Email",
    "password": "Password",
    "forgot_password": "Forgot Password",
    "sign_in_button": "Sign In",
    "no_account": "Don't have an account?",
    "sign_up": "Sign Up!",
    "email_required": "Email cannot be empty",
    "email_invalid": "Please enter a valid email address",
    "password_required": "Password cannot be empty",
    "password_min_length": "Password must be at least 6 characters",
    "form_validation_error": "Please fix form errors"
  },
  "register": {
    "title": "Register",
    "welcome": "Welcome",
    "description": "Tempus varius a vitae interdum id tortor elementum tristique eleifend at.",
    "full_name": "Full Name",
    "email": "Email",
    "password": "Password",
    "confirm_password": "Confirm Password",
    "register_button": "Register Now",
    "already_have_account": "Already have an account?",
    "sign_in": "Sign In!",
    "terms_title": "I have read and accept the",
    "terms_accepted": "user agreement.",
    "terms_description": "Please continue by reading this agreement.",
    "full_name_required": "Full name cannot be empty",
    "full_name_min_length": "Full name must be at least 2 characters",
    "email_required": "Email cannot be empty",
    "email_invalid": "Please enter a valid email address",
    "password_required": "Password cannot be empty",
    "password_min_length": "Password must be at least 6 characters",
    "confirm_password_required": "Confirm password cannot be empty",
    "passwords_not_match": "Passwords do not match",
    "terms_required": "You must accept the user agreement",
    "form_validation_error": "Please fix form errors"
  },
  "discover": {
    "user_name": "Sinful Man",
    "user_description": "Community every territories dogpile so. Last they investigation model",
    "read_more": "Read More",
    "home": "Home",
    "profile": "Profile"
  },
  "photo_picker": {
    "camera": "Camera",
    "gallery": "Gallery",
    "take_photo": "Take Photo",
    "select_from_gallery": "Select from Gallery",
    "add_photo": "Add Photo",
    "loading": "Loading...",
    "error_occurred": "An error occurred while selecting a photo",
    "permission_required": "Camera or gallery permission required",
    "camera_not_available": "Camera access is currently unavailable. Please try again.",
    "ok": "OK"
  },
  "profile_picture": {
    "title": "Profile Details",
    "upload_photos": "Upload Your Photos",
    "description": "Resources out incentivize relaxation floor loss cc.",
    "continue": "Continue"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"tr": _tr, "en": _en};
}
