import 'package:flutter/material.dart';
import 'package:edulab/data/kitap_sorulari.dart';
import 'package:edulab/screens/kitap_okuma_ekrani.dart';
import 'package:edulab/screens/turkce_oyun.dart';

class TurkceSecimEkrani extends StatefulWidget {
  const TurkceSecimEkrani({super.key});

  @override
  State<TurkceSecimEkrani> createState() => _TurkceSecimEkraniState();
}

class _TurkceSecimEkraniState extends State<TurkceSecimEkrani> {
  String mod = 'Pratik';
  String zorluk = 'Çaylak';
  int soruSayisi = 10;
  int? secilenKitapIndex;

  @override
  Widget build(BuildContext context) {
    final kitapModu = mod == 'Kitap okuma';
    return Scaffold(
      appBar: AppBar(title: const Text('Türkçe – Görevi Özelleştir')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('MOD SEÇ', style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              children: [
                _chip('Pratik'),
                _chip('Zamana Karşı'),
                _chip('Test'),
                _chip('Kitap okuma'),
              ],
            ),
            const SizedBox(height: 24),
            if (!kitapModu) ...[
              const Text('ZORLUK SEVİYESİ', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'Çaylak', label: Text('Çaylak')),
                  ButtonSegment(value: 'Usta', label: Text('Usta')),
                  ButtonSegment(value: 'Efsane', label: Text('Efsane')),
                ],
                selected: {zorluk},
                onSelectionChanged: (s) => setState(() => zorluk = s.first),
              ),
              const SizedBox(height: 24),
              const Text('SORU SAYISI', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SegmentedButton<int>(
                segments: const [
                  ButtonSegment(value: 5, label: Text('5')),
                  ButtonSegment(value: 10, label: Text('10')),
                  ButtonSegment(value: 20, label: Text('20')),
                ],
                selected: {soruSayisi},
                onSelectionChanged: (s) => setState(() => soruSayisi = s.first),
              ),
            ] else ...[
              const Text('KİTAP SEÇ', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ...List.generate(kitapListesi.length, (i) {
                final k = kitapListesi[i];
                return ListTile(
                  title: Text(k.kitapAdi),
                  subtitle: Text('${k.sayfalar.length} sayfa · ${k.sorular.length} soru'),
                  leading: Icon(
                    secilenKitapIndex == i ? Icons.radio_button_checked : Icons.radio_button_off,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTap: () => setState(() => secilenKitapIndex = i),
                );
              }),
              if (secilenKitapIndex == null && kitapListesi.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Lütfen bir kitap seçin',
                    style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12),
                  ),
                ),
            ],
            const SizedBox(height: 32),
            SizedBox(
              height: 56,
              child: FilledButton(
                onPressed: () {
                  if (kitapModu && secilenKitapIndex == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Lütfen bir kitap seçin')),
                    );
                    return;
                  }
                  if (kitapModu && secilenKitapIndex != null) {
                    // Önce kitabı oku; okuma ekranından "Sorulara geç" ile sorulara gidilir
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => KitapOkumaEkrani(kitapIndex: secilenKitapIndex!),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TurkceOyunEkrani(
                          mod: mod,
                          zorluk: zorluk,
                          toplamSoru: soruSayisi,
                          kitapIndex: null,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('BAŞLA! 🎮'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String t) => ChoiceChip(
        label: Text(t),
        selected: mod == t,
        onSelected: (_) {
          setState(() {
            mod = t;
            if (t != 'Kitap okuma') {
              secilenKitapIndex = null;
            } else if (kitapListesi.isNotEmpty) {
              secilenKitapIndex = 0;
            }
          });
        },
      );
}
