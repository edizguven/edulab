import 'package:flutter/material.dart';
import 'package:edulab/services/storage_service.dart';
import 'package:edulab/widgets/app_widgets.dart';

class AracItem {
  final String id;
  final String ad;
  final int gemFiyat;
  final IconData ikon;

  const AracItem(this.id, this.ad, this.gemFiyat, this.ikon);
}

final List<AracItem> garajAraclari = [
  const AracItem('araba', 'Araba', 0, Icons.directions_car),
  const AracItem('kamyon', 'Kamyon', 50, Icons.local_shipping),
  const AracItem('yaris', 'Yarış', 100, Icons.sports_esports),
  const AracItem('helikopter', 'Helikopter', 150, Icons.flight),
  const AracItem('uzay', 'Uzay Gemisi', 200, Icons.rocket_launch),
  const AracItem('roket', 'Süper Roket', 300, Icons.rocket),
];

class GarajEkrani extends StatefulWidget {
  const GarajEkrani({super.key});

  @override
  State<GarajEkrani> createState() => _GarajEkraniState();
}

class _GarajEkraniState extends State<GarajEkrani> {
  List<String> _acik = [];
  int _gem = 0;
  bool _yuklendi = false;

  @override
  void initState() {
    super.initState();
    _yukle();
  }

  Future<void> _yukle() async {
    final acik = await StorageService.acikAraclariGetir();
    final gem = await StorageService.gemGetir();
    setState(() {
      _acik = acik;
      _gem = gem;
      _yuklendi = true;
    });
  }

  Future<void> _aracAc(AracItem arac) async {
    if (_acik.contains(arac.id)) return;
    if (_gem < arac.gemFiyat) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Yetersiz gem! 💎 ${arac.gemFiyat} gerekli.')),
      );
      return;
    }
    final ok = await StorageService.gemHarca(arac.gemFiyat);
    if (!ok) return;
    await StorageService.aracAc(arac.id);
    if (mounted) {
      setState(() {
        _acik = [..._acik, arac.id];
        _gem -= arac.gemFiyat;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${arac.ad} açıldı! 🎉')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.sizeOf(context).width > 600;
    if (!_yuklendi) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garajım 🏎️'),
        actions: [GemBadge(gem: _gem, isTablet: isTablet)],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isTablet ? 3 : 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: isTablet ? 1.0 : 0.9,
        ),
        itemCount: garajAraclari.length,
        itemBuilder: (context, i) {
          final a = garajAraclari[i];
          final acik = _acik.contains(a.id);
          return Semantics(
            label: acik ? '${a.ad} açık' : '${a.ad}, ${a.gemFiyat} gem ile aç',
            button: !acik,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: acik ? Theme.of(context).cardColor : Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(a.ikon, size: 48, color: acik ? Colors.red : Colors.grey),
                  const SizedBox(height: 8),
                  Text(a.ad, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  if (acik)
                    const Text('Açık ✓', style: TextStyle(color: Colors.green))
                  else
                    Text('💎 ${a.gemFiyat}', style: const TextStyle(fontSize: 14)),
                  if (!acik) ...[
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _gem >= a.gemFiyat ? () => _aracAc(a) : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Aç'),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
