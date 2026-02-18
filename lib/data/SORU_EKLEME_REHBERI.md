# Soru Ekleme Rehberi

Bu klasördeki dosyaları düzenleyerek kendi sorularınızı ekleyebilirsiniz. Değişiklikten sonra uygulamayı yeniden çalıştırmanız yeterlidir.

---

## 1. Türkçe – Yanlış yazım soruları

**Dosya:** `turkce_sorulari.dart`

**Format:** Her satır iki kelimeden oluşur: önce **doğru yazım**, sonra **yanlış yazım**.  
Oyunda “Yanlış yazılmış kelimeyi seç” sorusunda bu dört seçenekten biri yanlış yazılmış olan olacak.

```dart
['doğru_kelime', 'yanlis_yazim'],
```

**Örnek ekleme:**
```dart
['merdiven', 'merdivan'],
['bilgisayar', 'bilgisyar'],
```

`turkceYanlisYazimSorulari` listesine yukarıdaki gibi yeni satırlar ekleyin. Son satırda virgül olabilir (Dart buna izin verir).

---

## 2. Coğrafya soruları (kategorilere göre)

**Dosya:** `cografya_sorulari.dart`

Coğrafya 6 kategoriye ayrılmıştır. Her kategorinin kendi soru listesi vardır; her soruda **1 doğru** ve **tam 3 yanlış** seçenek yazarsınız.

**Mevcut kategoriler:**

| Sıra | Kategori | Liste (kodda) |
|------|----------|----------------|
| 0 | Kültürel Semboller ve Yemekler | `cografyaKategorileri[0].sorular` |
| 1 | Hayvanlar ve Yaşam Alanları | `cografyaKategorileri[1].sorular` |
| 2 | Mevsimler ve Giyim Kuşam | `cografyaKategorileri[2].sorular` |
| 3 | Bayraklar ve Renkler | `cografyaKategorileri[3].sorular` |
| 4 | Doğa Olayları ve Yer Şekilleri | `cografyaKategorileri[4].sorular` |
| 5 | Başkentler ve Şehir Yaşamı | `cografyaKategorileri[5].sorular` |

**Mevcut bir kategoriye soru ekleme:** İlgili `CografyaKategori` içindeki `sorular:` listesine aşağıdaki formatta ekleyin:

```dart
const CografyaSoru(
  soru: 'Soru metni buraya?',
  dogruCevap: 'Doğru cevap',
  yanlisSecenekler: ['Yanlış 1', 'Yanlış 2', 'Yanlış 3'],
),
```

**Örnek (Kültürel Semboller):**
```dart
const CografyaSoru(
  soru: "Kruvasan hangi ülkenin simgesel hamur işidir?",
  dogruCevap: 'Fransa',
  yanlisSecenekler: ['İtalya', 'Avusturya', 'Belçika'],
),
```

**Örnek (Hayvanlar):**
```dart
const CografyaSoru(
  soru: "Deve hangi iklimde doğal yaşar?",
  dogruCevap: 'Çöl',
  yanlisSecenekler: ['Kutup', 'Yağmur ormanı', 'Okyanus'],
),
```

**Yeni kategori ekleme:** `cografyaKategorileri` listesine yeni bir `CografyaKategori` ekleyin. `id` ve `ad` doldurun; `ikon` tek emoji (örn. '🌍'); `sorular` listesine en az bir `CografyaSoru` koyun:

```dart
CografyaKategori(
  id: 'yeni_kategori',
  ad: 'Yeni Kategori Adı',
  ikon: '🌍',
  sorular: [
    const CografyaSoru(
      soru: 'İlk soru?',
      dogruCevap: 'Cevap',
      yanlisSecenekler: ['A', 'B', 'C'],
    ),
  ],
),
```

Uygulama açıldığında kategoriler otomatik listelenir; yeni eklediğiniz kategori de seçenekler arasında görünür.

---

## 3. Kitap okuma – içerik + sorular

**Dosya:** `kitap_sorulari.dart`

Kullanıcı önce kitabı uygulama içinde sayfa sayfa okur, sonra soruları cevaplar. Her kitabın **sayfalar** (okuma metni) ve **sorular** listesi vardır.

**Yeni kitap ekleme:** `kitapListesi` listesine aşağıdaki yapıda yeni bir kitap ekleyin:

```dart
KitapSorulari(
  kitapAdi: 'Kitabın Adı',
  sayfalar: [
    'Sayfa 1 metni. Çocukların okuyacağı paragraf...',
    'Sayfa 2 metni...',
    'Sayfa 3 metni...',
  ],
  sorular: [
    KitapSoru(
      soru: 'Soru metni buraya?',
      dogruCevap: 'Doğru cevap',
      yanlisSecenekler: ['Yanlış 1', 'Yanlış 2', 'Yanlış 3'],
    ),
  ],
),
```

**sayfalar:** Her eleman bir ekranda gösterilen "sayfa" metnidir. Kullanıcı Önceki/Sonraki ile sayfa değiştirir. Metni orta boy yazı ile gösteririz (çocuklar rahat okusun).

**Mevcut kitaba sayfa veya soru ekleme:** İlgili kitabın `sayfalar:` listesine yeni sayfa metni ekleyebilir; `sorular:` listesine yeni bir `KitapSoru(...)` ekleyebilirsiniz. Her soruda tam **3 yanlış seçenek** olmalı.

**Örnek:**
```dart
const KitapSoru(
  soru: "Karakterin adı neydi?",
  dogruCevap: 'Ali',
  yanlisSecenekler: ['Veli', 'Ayşe', 'Mehmet'],
),
```

---

## Özet tablo

| Konu       | Dosya                  | Ne eklenir? |
|-----------|------------------------|-------------|
| Türkçe    | `turkce_sorulari.dart` | `['doğru', 'yanlış'],` |
| Coğrafya  | `cografya_sorulari.dart` | `CografyaSoru(soru: '...', dogruCevap: '...', yanlisSecenekler: ['','',''])` – ilgili kategori listesine ekleyin |
| Kitap     | `kitap_sorulari.dart`  | Yeni `KitapSorulari(...)` veya mevcut kitaba `KitapSoru(...)` |

Dosyaların başındaki uzun yorum bloklarında da aynı açıklamalar bulunur.
