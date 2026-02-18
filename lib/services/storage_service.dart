import 'package:shared_preferences/shared_preferences.dart';

/// Tüm kalıcı veri anahtarları ve işlemler tek yerde (bakım kolaylığı).
class StorageService {
  StorageService._();

  static const String _kAd = 'edulab_ad';
  static const String _kSoyad = 'edulab_soyad';
  static const String _kEmail = 'edulab_email';
  static const String _kCinsiyet = 'edulab_cinsiyet';
  static const String _kGem = 'edulab_gem';
  static const String _kAcikAraclar = 'edulab_acik_araclar';
  static const String _kEnYuksekMat = 'edulab_en_yuksek_mat';
  static const String _kVeliPin = 'edulab_veli_pin';
  static const String _kDarkMode = 'edulab_dark_mode';

  static Future<SharedPreferences> get _prefs async =>
      SharedPreferences.getInstance();

  static Future<bool> kullaniciKayitliMi() async {
    final p = await _prefs;
    return p.getString(_kAd) != null && p.getString(_kAd)!.isNotEmpty;
  }

  static Future<void> kullaniciKaydet(
    String ad,
    String soyad,
    String email,
    String cinsiyet,
  ) async {
    final p = await _prefs;
    await p.setString(_kAd, ad);
    await p.setString(_kSoyad, soyad);
    await p.setString(_kEmail, email);
    await p.setString(_kCinsiyet, cinsiyet);
    await p.setInt(_kGem, 0);
    await p.setStringList(_kAcikAraclar, ['araba']);
  }

  /// Ana sayfa ve drawer için tek seferde profil + gem + en yüksek skor.
  static Future<Map<String, dynamic>> getProfil() async {
    final p = await _prefs;
    return {
      'ad': p.getString(_kAd) ?? '',
      'soyad': p.getString(_kSoyad) ?? '',
      'email': p.getString(_kEmail) ?? '',
      'cinsiyet': p.getString(_kCinsiyet) ?? '',
      'gem': p.getInt(_kGem) ?? 0,
      'enYuksekMat': p.getInt(_kEnYuksekMat) ?? 0,
    };
  }

  static Future<int> gemGetir() async {
    final p = await _prefs;
    return p.getInt(_kGem) ?? 0;
  }

  static Future<void> gemEkle(int miktar) async {
    final p = await _prefs;
    final mevcut = p.getInt(_kGem) ?? 0;
    await p.setInt(_kGem, (mevcut + miktar).clamp(0, 999999));
  }

  static Future<bool> gemHarca(int miktar) async {
    final p = await _prefs;
    final mevcut = p.getInt(_kGem) ?? 0;
    if (mevcut < miktar) return false;
    await p.setInt(_kGem, mevcut - miktar);
    return true;
  }

  static Future<List<String>> acikAraclariGetir() async {
    final p = await _prefs;
    return p.getStringList(_kAcikAraclar) ?? ['araba'];
  }

  static Future<void> aracAc(String aracId) async {
    final p = await _prefs;
    final liste = p.getStringList(_kAcikAraclar) ?? ['araba'];
    if (!liste.contains(aracId)) {
      liste.add(aracId);
      await p.setStringList(_kAcikAraclar, liste);
    }
  }

  static Future<int> enYuksekMatGetir() async {
    final p = await _prefs;
    return p.getInt(_kEnYuksekMat) ?? 0;
  }

  static Future<void> enYuksekMatKaydet(int skor) async {
    final p = await _prefs;
    final mevcut = p.getInt(_kEnYuksekMat) ?? 0;
    if (skor > mevcut) await p.setInt(_kEnYuksekMat, skor);
  }

  // --- Veli PIN (çocuk güvenliği) ---
  static Future<bool> veliPinVarMi() async {
    final p = await _prefs;
    final pin = p.getString(_kVeliPin);
    return pin != null && pin.length >= 4;
  }

  static Future<void> veliPinAyarla(String pin) async {
    final p = await _prefs;
    await p.setString(_kVeliPin, pin);
  }

  static Future<bool> veliPinKontrol(String pin) async {
    final p = await _prefs;
    return p.getString(_kVeliPin) == pin;
  }

  // --- Karanlık tema ---
  static Future<bool> darkModeGetir() async {
    final p = await _prefs;
    return p.getBool(_kDarkMode) ?? false;
  }

  static Future<void> darkModeAyarla(bool value) async {
    final p = await _prefs;
    await p.setBool(_kDarkMode, value);
  }
}
