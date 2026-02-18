import 'package:flutter/material.dart';
import 'package:edulab/screens/matematik_oyun.dart';

class MatematikSecimEkrani extends StatefulWidget {
  const MatematikSecimEkrani({super.key});

  @override
  State<MatematikSecimEkrani> createState() => _MatematikSecimEkraniState();
}

class _MatematikSecimEkraniState extends State<MatematikSecimEkrani> {
  String mod = 'Pratik';
  String islem = '+';
  String zorluk = 'Çaylak';
  int soruSayisi = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Görevi Özelleştir')),
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
              ],
            ),
            const SizedBox(height: 30),
            const Text('İŞLEM SEÇ', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['+', '-', 'x', '÷'].map((i) => _islemButonu(i)).toList(),
            ),
            const SizedBox(height: 30),
            const Text('ZORLUK SEVİYESİ', style: TextStyle(fontWeight: FontWeight.bold)),
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
            const SizedBox(height: 50),
            SizedBox(
              height: 56,
              child: FilledButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OyunEkrani(
                      mod: mod,
                      islem: islem,
                      zorluk: zorluk,
                      toplamSoru: soruSayisi,
                    ),
                  ),
                ),
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

  Widget _islemButonu(String i) {
    final secili = islem == i;
    return Semantics(
      label: '$i işlemi',
      button: true,
      selected: secili,
      child: GestureDetector(
        onTap: () => setState(() => islem = i),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: secili ? Colors.orange : Theme.of(context).cardColor,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.orange),
          ),
          child: Text(
            i,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: secili ? Colors.white : Colors.orange,
            ),
          ),
        ),
      ),
    );
  }
}
