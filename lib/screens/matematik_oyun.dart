import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:edulab/services/storage_service.dart';
import 'package:edulab/services/sound_service.dart';

class OyunEkrani extends StatefulWidget {
  final String mod;
  final String islem;
  final String zorluk;
  final int toplamSoru;

  const OyunEkrani({
    super.key,
    required this.mod,
    required this.islem,
    required this.zorluk,
    this.toplamSoru = 10,
  });

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {
  int soruNo = 1;
  int dogruSayisi = 0;
  int sayi1 = 0;
  int sayi2 = 0;
  int dogruCevap = 0;
  String girdi = '';
  List<int> secenekler = [];
  int sure = 60;
  Timer? timer;
  bool _kutlamaGoster = false;

  @override
  void initState() {
    super.initState();
    yeniSoru();
    if (widget.mod == 'Zamana Karşı') {
      timer = Timer.periodic(const Duration(seconds: 1), (t) {
        if (sure > 0) {
          setState(() => sure--);
        } else {
          t.cancel();
          bitir();
        }
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void yeniSoru() {
    final r = Random();
    if (widget.islem == '+') {
      final limit = widget.zorluk == 'Çaylak' ? 9 : (widget.zorluk == 'Usta' ? 40 : 100);
      sayi1 = r.nextInt(limit) + 1;
      sayi2 = r.nextInt(limit) + 1;
      dogruCevap = sayi1 + sayi2;
    } else if (widget.islem == '-') {
      final limit = widget.zorluk == 'Çaylak' ? 9 : (widget.zorluk == 'Usta' ? 40 : 100);
      sayi1 = r.nextInt(limit) + 1;
      sayi2 = r.nextInt(limit) + 1;
      if (sayi1 < sayi2) {
        final t = sayi1;
        sayi1 = sayi2;
        sayi2 = t;
      }
      dogruCevap = sayi1 - sayi2;
    } else if (widget.islem == 'x') {
      final maxSonuc = widget.zorluk == 'Çaylak' ? 40 : (widget.zorluk == 'Usta' ? 60 : 100);
      do {
        sayi1 = r.nextInt(10) + 1;
        sayi2 = r.nextInt(10) + 1;
      } while (sayi1 * sayi2 > maxSonuc);
      dogruCevap = sayi1 * sayi2;
    } else {
      final limit = widget.zorluk == 'Çaylak' ? 30 : (widget.zorluk == 'Usta' ? 60 : 100);
      sayi2 = r.nextInt(9) + 2;
      dogruCevap = r.nextInt(limit ~/ sayi2) + 1;
      sayi1 = dogruCevap * sayi2;
    }
    if (widget.mod == 'Test') {
      secenekler = [dogruCevap];
      while (secenekler.length < 4) {
        final yanlis = dogruCevap + r.nextInt(10) - 5;
        if (yanlis >= 0 && !secenekler.contains(yanlis)) secenekler.add(yanlis);
      }
      secenekler.shuffle();
    }
    girdi = '';
  }

  void kontrol([int? secilen]) {
    final cevap = secilen ?? int.tryParse(girdi) ?? -1;
    final dogruMu = cevap == dogruCevap;
    if (dogruMu) {
      dogruSayisi++;
      HapticFeedback.mediumImpact();
      SoundService.playCorrect();
      setState(() => _kutlamaGoster = true);
      Future.delayed(const Duration(milliseconds: 400), () {
        if (mounted) setState(() => _kutlamaGoster = false);
      });
    } else {
      HapticFeedback.heavyImpact();
      SoundService.playWrong();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Yanlış! Doğru cevap: $dogruCevap')),
        );
      }
    }
    if (soruNo >= widget.toplamSoru) {
      timer?.cancel();
      bitir();
    } else {
      setState(() {
        soruNo++;
        yeniSoru();
      });
    }
  }

  void bitir() {
    final gem = widget.mod == 'Pratik' ? 0 : dogruSayisi * 10;
    StorageService.gemEkle(gem);
    StorageService.enYuksekMatKaydet(dogruSayisi);
    if (mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (c) => AlertDialog(
          title: const Text('GÖREV TAMAMLANDI! 🏆'),
          content: Text(
            '$dogruSayisi Doğru!\nKazandığın Gem: 💎 $gem\n(Toplam gem cüzdanına eklendi.)',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('ANA SAYFAYA DÖN'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.sizeOf(context).width > 600;
    return Scaffold(
      appBar: AppBar(title: Text('Soru $soruNo/${widget.toplamSoru}')),
      body: Column(
        children: [
          if (widget.mod == 'Zamana Karşı')
            LinearProgressIndicator(
              value: sure / 60,
              minHeight: 10,
              color: Colors.redAccent,
            ),
          const Spacer(),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: _kutlamaGoster
                  ? Colors.green.withValues(alpha: 0.25)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$sayi1 ${widget.islem} $sayi2 = ?',
                  style: TextStyle(
                    fontSize: isTablet ? 56 : 44,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (widget.mod != 'Test')
                  Text(
                    girdi,
                    style: TextStyle(
                      fontSize: isTablet ? 64 : 52,
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
          const Spacer(),
          widget.mod == 'Test' ? _testSecenekleri() : _numpad(),
        ],
      ),
    );
  }

  Widget _testSecenekleri() {
    final isTablet = MediaQuery.sizeOf(context).width > 600;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: isTablet ? 2.2 : 2,
        children: secenekler
            .map(
              (s) => Semantics(
                label: 'Cevap $s',
                button: true,
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () => kontrol(s),
                    child: Text('$s', style: const TextStyle(fontSize: 28)),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _numpad() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 1.5,
        children: [
          ...[1, 2, 3, 4, 5, 6, 7, 8, 9, 0].map(
            (n) => Semantics(
              label: 'Rakam $n',
              button: true,
              child: SizedBox(
                height: 48,
                child: TextButton(
                  onPressed: () => setState(() => girdi += n.toString()),
                  child: Text('$n', style: const TextStyle(fontSize: 28)),
                ),
              ),
            ),
          ),
          Semantics(
            label: 'Sil',
            button: true,
            child: IconButton(
              onPressed: () => setState(() => girdi = ''),
              icon: const Icon(Icons.backspace, color: Colors.red),
              style: IconButton.styleFrom(minimumSize: const Size(48, 48)),
            ),
          ),
          Semantics(
            label: 'Onayla',
            button: true,
            child: ElevatedButton(
              onPressed: kontrol,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text('OK'),
            ),
          ),
        ],
      ),
    );
  }
}
