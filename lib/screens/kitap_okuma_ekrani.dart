import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:edulab/data/kitap_sorulari.dart';
import 'package:edulab/screens/turkce_oyun.dart';

/// Kullanıcı kitabı bu ekranda sayfa sayfa okur; "Sorulara geç" ile soru ekranına gider.
class KitapOkumaEkrani extends StatefulWidget {
  final int kitapIndex;

  const KitapOkumaEkrani({super.key, required this.kitapIndex});

  @override
  State<KitapOkumaEkrani> createState() => _KitapOkumaEkraniState();
}

class _KitapOkumaEkraniState extends State<KitapOkumaEkrani> {
  int _sayfaNo = 0;
  late KitapSorulari _kitap;

  @override
  void initState() {
    super.initState();
    _kitap = kitapListesi[widget.kitapIndex];
  }

  int get _toplamSayfa => _kitap.sayfalar.length;
  bool get _ilkSayfa => _sayfaNo <= 0;
  bool get _sonSayfa => _sayfaNo >= _toplamSayfa - 1;

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.sizeOf(context).width > 600;
    // Çocukların rahat okuyabilmesi için orta büyüklükte yazı (18–20)
    final fontSize = isTablet ? 22.0 : 18.0;
    final lineHeight = 1.5;

    return Scaffold(
      appBar: AppBar(
        title: Text(_kitap.kitapAdi),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Sayfa göstergesi
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Sayfa ${_sayfaNo + 1} / $_toplamSayfa',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            // Kitap metni (kaydırılabilir, orta punto)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Text(
                  _kitap.sayfalar[_sayfaNo],
                  style: TextStyle(
                    fontSize: fontSize,
                    height: lineHeight,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            // Önceki / Sonraki + Sorulara geç
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 48,
                        child: Semantics(
                          label: 'Önceki sayfa',
                          button: true,
                          child: FilledButton.tonal(
                            onPressed: _ilkSayfa ? null : () => setState(() => _sayfaNo--),
                            child: const Text('← Önceki'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        height: 48,
                        child: Semantics(
                          label: 'Sonraki sayfa',
                          button: true,
                          child: FilledButton.tonal(
                            onPressed: _sonSayfa ? null : () => setState(() => _sayfaNo++),
                            child: const Text('Sonraki →'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: Semantics(
                      label: 'Okumayı bitirdim, sorulara geç',
                      button: true,
                      child: FilledButton(
                        onPressed: () {
                          HapticFeedback.mediumImpact();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TurkceOyunEkrani(
                                mod: 'Kitap okuma',
                                zorluk: 'Çaylak',
                                toplamSoru: _kitap.sorular.length,
                                kitapIndex: widget.kitapIndex,
                              ),
                            ),
                          );
                        },
                        child: const Text('Okumayı bitirdim – Sorulara geç 📖➜✏️'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
