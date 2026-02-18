import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:edulab/main.dart' as app;
import 'package:edulab/services/storage_service.dart';
import 'package:edulab/widgets/app_widgets.dart';
import 'package:edulab/screens/veli_pin_dialog.dart';
import 'package:edulab/screens/garaj_ekrani.dart';
import 'package:edulab/screens/matematik_secim.dart';
import 'package:edulab/screens/turkce_secim.dart';
import 'package:edulab/screens/cografya_secim.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  String _ad = '';
  String _cinsiyet = '';
  String _email = '';
  int _gem = 0;
  int _enYuksekMat = 0;
  bool _yuklendi = false;

  @override
  void initState() {
    super.initState();
    _yukle();
  }

  Future<void> _yukle() async {
    final p = await StorageService.getProfil();
    setState(() {
      _ad = p['ad'] as String? ?? '';
      _cinsiyet = p['cinsiyet'] as String? ?? '';
      _email = p['email'] as String? ?? '';
      _gem = p['gem'] as int? ?? 0;
      _enYuksekMat = p['enYuksekMat'] as int? ?? 0;
      _yuklendi = true;
    });
  }

  void _gorevAc(Widget ekran) async {
    await Navigator.push(context, MaterialPageRoute(builder: (_) => ekran));
    if (mounted) _yukle();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.sizeOf(context).width > 600;
    if (!_yuklendi) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Çıkmak için sol menüden "Uygulamadan çık"ı kullanın.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Selam, $_ad!'),
          centerTitle: true,
          actions: [GemBadge(gem: _gem, isTablet: isTablet)],
        ),
        drawer: _drawer(context),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(isTablet ? 24 : 20),
              child: Column(
                children: [
                  Text(
                    'Hangi görevi tamamlayacaksın?',
                    style: TextStyle(fontSize: isTablet ? 20 : 18),
                    textAlign: TextAlign.center,
                  ),
                  if (_enYuksekMat > 0) ...[
                    const SizedBox(height: 8),
                    Text(
                      'En yüksek matematik skorun: $_enYuksekMat doğru 🏆',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: isTablet ? 3 : 2,
                padding: const EdgeInsets.all(20),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: isTablet ? 1.1 : 0.95,
                children: [
                  GorevKarti(
                    baslik: 'Matematik',
                    ikon: Icons.calculate,
                    renk: Colors.orange,
                    onTap: () => _gorevAc(const MatematikSecimEkrani()),
                  ),
                  GorevKarti(
                    baslik: 'Türkçe',
                    ikon: Icons.abc,
                    renk: Colors.blue,
                    onTap: () => _gorevAc(const TurkceSecimEkrani()),
                  ),
                  GorevKarti(
                    baslik: 'Coğrafya',
                    ikon: Icons.public,
                    renk: Colors.green,
                    onTap: () => _gorevAc(const CografyaSecimEkrani()),
                  ),
                  GorevKarti(
                    baslik: 'Garajım 🏎️',
                    ikon: Icons.directions_car,
                    renk: Colors.red,
                    onTap: () => _gorevAc(const GarajEkrani()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 24),
          children: [
            if (_cinsiyet.isNotEmpty)
              ListTile(
                leading: Icon(_cinsiyet == 'Kız' ? Icons.face_3 : Icons.face),
                title: const Text('Karakter'),
                subtitle: Text(_cinsiyet),
              ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Veli Raporu'),
              subtitle: Text(_email.isEmpty ? '—' : _email),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      _email.isEmpty
                          ? 'Veli e-postası kayıtlı değil.'
                          : 'Haftalık özet "$_email" adresine gönderilecek. (Yakında)',
                    ),
                    duration: const Duration(seconds: 3),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Veli kilidi (şifre belirle)'),
              onTap: () async {
                Navigator.pop(context);
                await VeliPinDialog.gosterAyarla(context);
              },
            ),
            ValueListenableBuilder<bool>(
              valueListenable: app.darkModeNotifier,
              builder: (_, dark, _) => ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text('Karanlık tema'),
                trailing: Switch(
                  value: dark,
                  onChanged: (v) async {
                    await StorageService.darkModeAyarla(v);
                    app.darkModeNotifier.value = v;
                  },
                ),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Uygulamadan çık'),
              onTap: () async {
                Navigator.pop(context);
                final ok = await VeliPinDialog.gosterKontrol(context);
                if (ok && context.mounted) {
                  SystemNavigator.pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
