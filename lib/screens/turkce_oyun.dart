import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:edulab/data/turkce_sorulari.dart';
import 'package:edulab/data/kitap_sorulari.dart';
import 'package:edulab/services/storage_service.dart';
import 'package:edulab/services/sound_service.dart';

class TurkceOyunEkrani extends StatefulWidget {
  final String mod;
  final String zorluk;
  final int toplamSoru;
  final int? kitapIndex;

  const TurkceOyunEkrani({
    super.key,
    required this.mod,
    required this.zorluk,
    required this.toplamSoru,
    this.kitapIndex,
  });

  @override
  State<TurkceOyunEkrani> createState() => _TurkceOyunEkraniState();
}

class _TurkceOyunEkraniState extends State<TurkceOyunEkrani> {
  int _soruNo = 0;
  int _dogruSayisi = 0;
  late List<String> _secenekler;
  late String _dogruCevap;
  late String _soruMetin;
  final _rnd = Random();
  Timer? _timer;
  int _sure = 60;
  bool _kitapModu = false;
  late List<KitapSoru> _kitapSorulari;
  late List<List<String>> _yanlisYazimHavuz;

  @override
  void initState() {
    super.initState();
    _kitapModu = widget.kitapIndex != null;
    if (_kitapModu) {
      _kitapSorulari = List.from(kitapListesi[widget.kitapIndex!].sorular)..shuffle(_rnd);
    } else {
      _yanlisYazimHavuz = turkceYanlisYazimSorulari;
    }
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
    if (_kitapModu) {
      final s = _kitapSorulari[_soruNo];
      _soruMetin = s.soru;
      _dogruCevap = s.dogruCevap;
      _secenekler = [s.dogruCevap, ...s.yanlisSecenekler]..shuffle(_rnd);
    } else {
      final soru = _yanlisYazimHavuz[_rnd.nextInt(_yanlisYazimHavuz.length)];
      final dogruYazim = soru[0];
      final yanlisYazim = soru[1];
      final diger = _yanlisYazimHavuz
          .where((s) => s[0] != dogruYazim)
          .map((s) => s[0])
          .toList()
        ..shuffle(_rnd);
      final ek = diger.take(2).toList();
      _secenekler = [dogruYazim, yanlisYazim, ...ek]..shuffle(_rnd);
      _dogruCevap = yanlisYazim;
      _soruMetin = 'Yanlış yazılmış kelimeyi seç:';
    }
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
          title: const Text('Türkçe tamamlandı! 🏆'),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Soru ${_soruNo + 1}/${widget.toplamSoru}'),
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
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      _soruMetin,
                      style: TextStyle(
                        fontSize: isTablet ? 22 : 18,
                        fontWeight: FontWeight.w500,
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
                      childAspectRatio: 3,
                      children: _secenekler
                          .map(
                            (s) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Semantics(
                                label: 'Seçenek: $s',
                                button: true,
                                child: SizedBox(
                                  height: 48,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    onPressed: () => _cevapVer(s),
                                    child: Text(s, style: TextStyle(fontSize: isTablet ? 20 : 18)),
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
