import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:edulab/screens/ana_sayfa.dart';
import 'package:edulab/services/storage_service.dart';
import 'package:edulab/widgets/app_widgets.dart';

class KayitEkrani extends StatefulWidget {
  const KayitEkrani({super.key});

  @override
  State<KayitEkrani> createState() => _KayitEkraniState();
}

class _KayitEkraniState extends State<KayitEkrani> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _soyadController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _secilenCinsiyet;

  Color _renk1 = const Color(0xFF6A11CB);
  Color _renk2 = const Color(0xFF2575FC);

  @override
  void dispose() {
    _adController.dispose();
    _soyadController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.sizeOf(context).width > 600;
    final padding = isTablet ? 32.0 : 20.0;
    final darkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_renk1, _renk2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(padding),
            child: Container(
              constraints: BoxConstraints(maxWidth: isTablet ? 520 : 500),
              decoration: BoxDecoration(
                color: (darkMode ? (Colors.grey[900] ?? Colors.black) : Colors.white).withValues(alpha: 0.92),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Semantics(
                      label: 'EduLab kahraman oluştur',
                      child: const Icon(Icons.auto_awesome, size: 60, color: Colors.amber),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'KAHRAMANINI OLUŞTUR',
                      style: TextStyle(
                        fontSize: isTablet ? 26 : 24,
                        fontWeight: FontWeight.bold,
                        color: darkMode ? Colors.amber : Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 20),
                    RenkliInput(
                      label: 'Adın',
                      icon: Icons.star,
                      controller: _adController,
                      isEmail: false,
                      darkMode: darkMode,
                    ),
                    const SizedBox(height: 15),
                    RenkliInput(
                      label: 'Soyadın',
                      icon: Icons.rocket,
                      controller: _soyadController,
                      isEmail: false,
                      darkMode: darkMode,
                    ),
                    const SizedBox(height: 15),
                    RenkliInput(
                      label: 'Veli E-postası',
                      icon: Icons.mail,
                      controller: _emailController,
                      isEmail: true,
                      darkMode: darkMode,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _avatarButonu('Kız', Icons.face_3, Colors.pinkAccent, '👧'),
                        const SizedBox(width: 20),
                        _avatarButonu('Erkek', Icons.face, Colors.blueAccent, '👦'),
                      ],
                    ),
                    const SizedBox(height: 30),
                    _macerayaAtilButonu(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _avatarButonu(String cinsiyet, IconData ikon, Color renk, String emoji) {
    final secili = _secilenCinsiyet == cinsiyet;
    return Semantics(
      label: '$cinsiyet karakterini seç',
      button: true,
      selected: secili,
      child: GestureDetector(
        onTap: () {
          HapticFeedback.lightImpact();
          setState(() {
            _secilenCinsiyet = cinsiyet;
            if (cinsiyet == 'Kız') {
              _renk1 = const Color(0xFFFF758C);
              _renk2 = const Color(0xFFFF7EB3);
            } else {
              _renk1 = const Color(0xFF2193B0);
              _renk2 = const Color(0xFF6DD5ED);
            }
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
          decoration: BoxDecoration(
            color: secili ? renk : Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: renk, width: 3),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 36)),
              Icon(ikon, size: 32, color: secili ? Colors.white : renk),
              Text(
                cinsiyet,
                style: TextStyle(
                  color: secili ? Colors.white : renk,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _macerayaAtilButonu() {
    return Semantics(
      label: 'Macaraya başla',
      button: true,
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          onPressed: () async {
            if (!_formKey.currentState!.validate()) return;
            if (_secilenCinsiyet == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Lütfen bir karakter seç!')),
              );
              return;
            }
            final navigator = Navigator.of(context);
            await StorageService.kullaniciKaydet(
              _adController.text.trim(),
              _soyadController.text.trim(),
              _emailController.text.trim(),
              _secilenCinsiyet!,
            );
            navigator.pushReplacement(
              MaterialPageRoute(builder: (_) => const AnaSayfa()),
            );
          },
          child: const Text('MACERAYA ATIL! 🚀', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
