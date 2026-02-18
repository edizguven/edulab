import 'package:flutter/material.dart';
import 'package:edulab/data/cografya_sorulari.dart';
import 'package:edulab/screens/cografya_oyun.dart';

class CografyaSecimEkrani extends StatefulWidget {
  const CografyaSecimEkrani({super.key});

  @override
  State<CografyaSecimEkrani> createState() => _CografyaSecimEkraniState();
}

class _CografyaSecimEkraniState extends State<CografyaSecimEkrani> {
  int? secilenKategoriIndex;
  String mod = 'Pratik';
  String zorluk = 'Çaylak';
  int soruSayisi = 10;

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.sizeOf(context).width > 600;
    return Scaffold(
      appBar: AppBar(title: const Text('Coğrafya – Görevi Özelleştir')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'KATEGORİ SEÇ',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = isTablet ? 3 : 2;
                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: isTablet ? 1.4 : 1.1,
                  children: List.generate(cografyaKategorileri.length, (i) {
                    final k = cografyaKategorileri[i];
                    final secili = secilenKategoriIndex == i;
                    return InkWell(
                      onTap: () => setState(() => secilenKategoriIndex = i),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: secili
                              ? Theme.of(context).colorScheme.primaryContainer
                              : Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: secili
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).dividerColor,
                            width: secili ? 2 : 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(k.ikon, style: const TextStyle(fontSize: 28)),
                            const SizedBox(height: 6),
                            Text(
                              k.ad,
                              style: TextStyle(
                                fontSize: isTablet ? 13 : 11,
                                fontWeight: secili ? FontWeight.bold : FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${k.sorular.length} soru',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
            if (secilenKategoriIndex == null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Lütfen bir kategori seçin',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              ),
            const SizedBox(height: 24),
            const Text('MOD SEÇ', style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              children: [
                _chip('Pratik'),
                _chip('Zamana Karşı'),
                _chip('Test'),
              ],
            ),
            const SizedBox(height: 24),
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
            const SizedBox(height: 32),
            SizedBox(
              height: 56,
              child: FilledButton(
                onPressed: () {
                  if (secilenKategoriIndex == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Lütfen bir kategori seçin')),
                    );
                    return;
                  }
                  final k = cografyaKategorileri[secilenKategoriIndex!];
                  final maxSoru = k.sorular.length;
                  final toplamSoru = soruSayisi > maxSoru ? maxSoru : soruSayisi;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CografyaOyunEkrani(
                        mod: mod,
                        zorluk: zorluk,
                        toplamSoru: toplamSoru,
                        kategoriIndex: secilenKategoriIndex!,
                      ),
                    ),
                  );
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
        onSelected: (_) => setState(() => mod = t),
      );
}
