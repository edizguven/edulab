import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:edulab/data/cografya_sorulari.dart';
import 'package:edulab/services/storage_service.dart';
import 'package:edulab/services/sound_service.dart';

class CografyaOyunEkrani extends StatefulWidget {
  final String mod;
  final String zorluk;
  final int toplamSoru;
  final int kategoriIndex;

  const CografyaOyunEkrani({
    super.key,
    required this.mod,
    required this.zorluk,
    required this.toplamSoru,
    required this.kategoriIndex,
  });

  @override
  State<CografyaOyunEkrani> createState() => _CografyaOyunEkraniState();
}

class _CografyaOyunEkraniState extends State<CografyaOyunEkrani> {
  int _soruNo = 0;
  int _dogruSayisi = 0;
  late String _soruMetin;
  late String _dogruCevap;
  late List<String> _secenekler;
  final _rnd = Random();
  Timer? _timer;
  int _sure = 60;
  late List<CografyaSoru> _soruHavuzu;

  @override
  void initState() {
    super.initState();
    final kategori = cografyaKategorileri[widget.kategoriIndex];
    _soruHavuzu = List.from(kategori.sorular)..shuffle(_rnd);
    _yeniSoru();
    if (widget.mod == 'Zamana Karşı') {
      _timer = Timer.periodic(const Duration(seconds: 1), (t) {
        if (_sure > 0) {
          setState(() => _sure--);
        } else {
          t.cancel();
          _bitir();
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _yeniSoru() {
    final q = _soruHavuzu[_soruNo];
    _soruMetin = q.soru;
    _dogruCevap = q.dogruCevap;
    _secenekler = [q.dogruCevap, ...q.yanlisSecenekler]..shuffle(_rnd);
  }

  void _cevapVer(String secilen) {
    final dogruMu = secilen == _dogruCevap;
    if (dogruMu) {
      _dogruSayisi++;
      HapticFeedback.mediumImpact();
      SoundService.playCorrect();
    } else {
      HapticFeedback.heavyImpact();
      SoundService.playWrong();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Yanlış! Doğru cevap: $_dogruCevap')),
        );
      }
    }
    if (_soruNo + 1 >= widget.toplamSoru) {
      _timer?.cancel();
      _bitir();
    } else {
      setState(() {
        _soruNo++;
        _yeniSoru();
      });
    }
  }

  void _bitir() {
    final gemKazanc = widget.mod == 'Pratik' ? 0 : _dogruSayisi * 5;
    if (gemKazanc > 0) StorageService.gemEkle(gemKazanc);
    if (mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (c) => AlertDialog(
          title: const Text('Coğrafya tamamlandı! 🏆'),
          content: Text(
            '$_dogruSayisi doğru!'
            '${gemKazanc > 0 ? '\nKazandığın Gem: 💎 $gemKazanc' : ''}',
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
    final kategoriAd = cografyaKategorileri[widget.kategoriIndex].ad;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Soru ${_soruNo + 1}/${widget.toplamSoru}'),
            Text(
              kategoriAd,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                  ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          if (widget.mod == 'Zamana Karşı')
            LinearProgressIndicator(
              value: _sure / 60,
              minHeight: 10,
              color: Colors.redAccent,
            ),
          Expanded(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      _soruMetin,
                      style: TextStyle(
                        fontSize: isTablet ? 22 : 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      padding: const EdgeInsets.all(20),
                      crossAxisCount: isTablet ? 2 : 1,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 2.5,
                      children: _secenekler
                          .map(
                            (s) => Semantics(
                              label: 'Seçenek: $s',
                              button: true,
                              child: SizedBox(
                                height: 48,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  onPressed: () => _cevapVer(s),
                                  child: Text(
                                    s,
                                    style: TextStyle(fontSize: isTablet ? 20 : 18),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
