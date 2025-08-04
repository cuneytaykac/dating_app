# SUNFLIX App

Modern ve kullanıcı dostu bir Flutter tabanlı film ve dizi streaming uygulaması. Bu proje, kullanıcıların film ve dizileri keşfetmesini, favorilerini yönetmesini ve kişiselleştirilmiş öneriler almasını sağlayan, çok dilli destek sunan bir mobil uygulamadır.

## 🚀 Özellikler

### 🔐 Kimlik Doğrulama
- **Giriş Yapma**: E-posta ve şifre ile güvenli giriş
- **Kayıt Olma**: Kullanıcı sözleşmesi ile kayıt
- **Şifre Sıfırlama**: Unutulan şifreler için sıfırlama
- **Sosyal Medya Girişi**: Google, Apple, Facebook entegrasyonu (gelecek)

### 👤 Kullanıcı Profili
- **Profil Oluşturma**: Fotoğraf yükleme ve profil düzenleme
- **Profil Detayları**: Kullanıcı bilgileri ve tercihleri
- **Fotoğraf Yönetimi**: Kamera ve galeri entegrasyonu

### 🎬 Film ve Dizi Koleksiyonu
- **Film Listesi**: Beğenilen filmlerin görüntülenmesi
- **Film Detayları**: Detaylı film bilgileri, oyuncular, yönetmen
- **Favori Filmler**: Kullanıcının beğendiği filmler
- **İzleme Listesi**: İzlenmek istenen içerikler
- **İzlenen İçerikler**: Tamamlanan film ve diziler

### 🔍 Keşfetme ve Arama
- **Film Keşfi**: Yeni filmler ve diziler keşfetme
- **Kategori Bazlı Arama**: Tür, yıl, dil filtreleme
- **Akıllı Öneriler**: Kişiselleştirilmiş içerik önerileri
- **Trend İçerikler**: Popüler film ve diziler

### 💎 Premium Özellikler
- **Jeton Sistemi**: Premium içerik için jeton paketleri
- **Sınırlı Teklifler**: Özel bonus ve avantajlar
- **Premium Paketler**: Farklı fiyat seviyelerinde paketler
- **Reklamsız İzleme**: Premium üyelik avantajları

### 🌍 Çok Dilli Destek
- **Türkçe**: Tam Türkçe desteği
- **İngilizce**: İngilizce dil desteği
- **Kolay Genişletme**: Yeni diller kolayca eklenebilir

## 🛠️ Teknoloji Stack

### Frontend
- **Flutter**: 3.7.2+ SDK
- **Dart**: Modern Dart programlama dili
- **Material Design**: Google'ın tasarım sistemi

### State Management
- **Flutter Bloc**: Reaktif state management
- **Cubit**: Basit state management için

### Network & API
- **Dio**: HTTP client kütüphanesi
- **Pretty Dio Logger**: Network logları için
- **Connectivity Plus**: İnternet bağlantısı kontrolü

### Storage
- **Hive**: Yerel veritabanı
- **Get Storage**: Basit key-value storage
- **Hive Flutter**: Flutter için Hive entegrasyonu

### Code Generation
- **Freezed**: Immutable data classes
- **JSON Serializable**: JSON serialization
- **Build Runner**: Code generation tool
- **Injectable**: Dependency injection

### UI & UX
- **Moon Extension**: UI utility kütüphanesi
- **Cached Network Image**: Resim önbellekleme
- **Shimmer**: Loading efektleri
- **Image Picker**: Fotoğraf seçimi

### Firebase
- **Firebase Core**: Firebase temel servisleri
- **Firebase Analytics**: Kullanıcı analitikleri
- **Firebase Crashlytics**: Hata takibi

### Navigation
- **Go Router**: Modern routing sistemi

### Localization
- **Easy Localization**: Çok dilli destek

## 📱 Ekranlar

### Kimlik Doğrulama
- **Giriş Ekranı**: E-posta ve şifre ile giriş
- **Kayıt Ekranı**: Yeni kullanıcı kaydı
- **Şifre Sıfırlama**: Unutulan şifre sıfırlama

### Ana Ekranlar
- **Ana Sayfa**: Film ve dizi koleksiyonu
- **Keşfetme**: Yeni içerik keşfetme
- **Arama**: Film ve dizi arama
- **Profil**: Kullanıcı profili ve ayarlar

### Özel Ekranlar
- **Profil Fotoğrafı Oluşturma**: Fotoğraf yükleme
- **Film Detayları**: Detaylı film bilgileri
- **Sınırlı Teklif**: Premium paket seçimi

## 🏗️ Proje Yapısı

```
lib/
├── app/
│   ├── components/          # Yeniden kullanılabilir UI bileşenleri
│   │   ├── app_bar/        # Özel app bar bileşenleri
│   │   ├── bottom_navigation/ # Alt navigasyon
│   │   ├── buttons/        # Buton bileşenleri
│   │   ├── cache_image/    # Resim önbellekleme
│   │   ├── form_fields/    # Form alanları
│   │   └── photo_picker/   # Fotoğraf seçici
│   ├── data/
│   │   ├── datasource/     # Veri kaynakları
│   │   │   ├── local/      # Yerel veri servisleri
│   │   │   └── remote/     # Uzak API servisleri
│   │   └── model/          # Veri modelleri
│   └── presentation/       # UI katmanı
│       ├── create_profile_picture/
│       ├── discover/       # Keşfetme ekranı
│       ├── home/          # Ana sayfa
│       ├── movie_detail/  # Film detayları
│       ├── profile/       # Profil ekranı
│       ├── register/      # Kayıt ekranı
│       └── sign_in/       # Giriş ekranı
├── core/
│   ├── base/              # Temel sınıflar
│   ├── error/             # Hata yönetimi
│   ├── firebase/          # Firebase servisleri
│   ├── getIt/             # Dependency injection
│   ├── mixins/            # Mixin'ler
│   ├── navigation/        # Navigasyon
│   ├── network/           # Network katmanı
│   ├── result/            # Sonuç yönetimi
│   ├── theme/             # Tema yönetimi
│   └── utility/           # Yardımcı sınıflar
├── gen/                   # Generated dosyalar
└── main.dart              # Uygulama giriş noktası
```

## 🚀 Kurulum

### Gereksinimler
- Flutter SDK 3.7.2+
- Dart SDK
- Android Studio / VS Code
- Git

### Adımlar

1. **Projeyi klonlayın**
```bash
git clone https://github.com/cuneytaykac/sunflix_app.git
cd sunflix_app
```

2. **Bağımlılıkları yükleyin**
```bash
flutter pub get
```

3. **Code generation çalıştırın**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. **Firebase yapılandırması**
   - `firebase_options.dart` dosyasını Firebase Console'dan indirin
   - Android ve iOS için gerekli yapılandırmaları ekleyin

5. **Uygulamayı çalıştırın**
```bash
flutter run
```

## 🔧 Geliştirme

### Code Generation
Proje, code generation kullanır. Değişiklik yaptıktan sonra:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Linting
Kod kalitesi için linting kuralları:

```bash
flutter analyze
```

### Test
Testleri çalıştırmak için:

```bash
flutter test
```

## 📦 Bağımlılıklar

### Production Dependencies
- **flutter_bloc**: State management
- **dio**: HTTP client
- **freezed**: Immutable data classes
- **hive**: Local database
- **easy_localization**: Localization
- **go_router**: Navigation
- **get_it**: Dependency injection
- **firebase_core**: Firebase services
- **cached_network_image**: Image caching
- **image_picker**: Photo selection

### Development Dependencies
- **build_runner**: Code generation
- **flutter_lints**: Linting rules
- **json_serializable**: JSON serialization
- **injectable_generator**: DI code generation

## 🎨 Tema ve Tasarım

### Renk Paleti
- **appVampireBlack**: Ana arka plan rengi
- **appKUCrimson**: Vurgu rengi
- **appRosewood**: İkincil vurgu rengi
- **appMajorelleBlue**: Üçüncül vurgu rengi
- **appWhite**: Metin ve border rengi

### Tipografi
- **Euclid Circular A**: Ana font ailesi
- Responsive text sizing
- Material Design typography

## 🌐 Çok Dilli Destek

### Desteklenen Diller
- **Türkçe (tr)**: Varsayılan dil
- **İngilizce (en)**: İkincil dil

### Yeni Dil Ekleme
1. `assets/localizable/` klasörüne yeni JSON dosyası ekleyin
2. `EasyLocalizationManager`'da desteklenen dilleri güncelleyin
3. Tüm string'leri çevirin

## 🔒 Güvenlik

### Kimlik Doğrulama
- Token tabanlı authentication
- Secure storage for sensitive data
- Automatic token refresh

### Veri Güvenliği
- HTTPS only communication
- Certificate pinning (development)
- Encrypted local storage

## 📊 Analytics ve Monitoring

### Firebase Analytics
- Kullanıcı davranışları
- Ekran görüntüleme
- Özel olaylar

### Crashlytics
- Otomatik crash reporting
- Performance monitoring
- Error tracking

## 🚀 Deployment

### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## 🤝 Katkıda Bulunma

1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Commit yapın (`git commit -m 'Add amazing feature'`)
4. Push yapın (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

## 📄 Lisans

Bu proje MIT lisansı altında lisanslanmıştır. Detaylar için `LICENSE` dosyasına bakın.

## 📞 İletişim

- **Geliştirici**: Muhammet Cüneyt AYKAÇ
- **E-posta**: cuneytaykac2@gmail.com
- **GitHub**: https://github.com/cuneytaykac/

## 🙏 Teşekkürler

- Flutter ekibine harika framework için
- Tüm açık kaynak kütüphane geliştiricilerine
- Topluluk katkılarına

---


