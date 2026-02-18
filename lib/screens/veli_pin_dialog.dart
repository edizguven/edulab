import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:edulab/services/storage_service.dart';

/// Veli PIN ayarlama veya doğrulama dialog'u (çocuk güvenliği).
class VeliPinDialog {
  /// PIN doğrula; doğruysa true döner.
  static Future<bool> gosterKontrol(BuildContext context) async {
    final pinVar = await StorageService.veliPinVarMi();
    if (!pinVar) return true;
    if (!context.mounted) return false;
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => _VeliPinKontrolDialog(),
    );
    return result ?? false;
  }

  /// PIN ayarla (veli menüden).
  static Future<void> gosterAyarla(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => _VeliPinAyarlaDialog(),
    );
  }
}

class _VeliPinKontrolDialog extends StatefulWidget {
  @override
  State<_VeliPinKontrolDialog> createState() => _VeliPinKontrolDialogState();
}

class _VeliPinKontrolDialogState extends State<_VeliPinKontrolDialog> {
  final _controller = TextEditingController();
  String _hata = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _kontrol() async {
    final pin = _controller.text.trim();
    if (pin.length < 4) {
      setState(() => _hata = 'En az 4 rakam girin');
      return;
    }
    final ok = await StorageService.veliPinKontrol(pin);
    if (mounted) {
      if (ok) {
        Navigator.of(context).pop(true);
      } else {
        setState(() => _hata = 'Yanlış şifre');
        _controller.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Veli onayı'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Çıkmak için veli şifresini girin.'),
          const SizedBox(height: 16),
          Semantics(
            label: 'Veli şifresi',
            child:           TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            maxLength: 6,
            obscureText: true,
            autofocus: true,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onSubmitted: (_) => _kontrol(),
            decoration: InputDecoration(
                errorText: _hata.isEmpty ? null : _hata,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('İptal'),
        ),
        FilledButton(
          onPressed: _kontrol,
          child: const Text('Onayla'),
        ),
      ],
    );
  }
}

class _VeliPinAyarlaDialog extends StatefulWidget {
  @override
  State<_VeliPinAyarlaDialog> createState() => _VeliPinAyarlaDialogState();
}

class _VeliPinAyarlaDialogState extends State<_VeliPinAyarlaDialog> {
  final _pin1 = TextEditingController();
  final _pin2 = TextEditingController();
  String _hata = '';

  @override
  void dispose() {
    _pin1.dispose();
    _pin2.dispose();
    super.dispose();
  }

  Future<void> _kaydet() async {
    if (_pin1.text.trim().length < 4) {
      setState(() => _hata = 'En az 4 rakam girin');
      return;
    }
    if (_pin1.text != _pin2.text) {
      setState(() => _hata = 'Şifreler aynı değil');
      return;
    }
    await StorageService.veliPinAyarla(_pin1.text.trim());
    if (mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veli şifresi kaydedildi')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Veli kilidi'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Uygulamadan çıkmak için kullanılacak 4–6 rakamlı şifre belirleyin.'),
          const SizedBox(height: 12),
          TextField(
            controller: _pin1,
            keyboardType: TextInputType.number,
            maxLength: 6,
            obscureText: true,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              labelText: 'Yeni şifre',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: _pin2,
            keyboardType: TextInputType.number,
            maxLength: 6,
            obscureText: true,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              labelText: 'Tekrar',
              border: OutlineInputBorder(),
            ),
          ),
          if (_hata.isNotEmpty) Text(_hata, style: TextStyle(color: Theme.of(context).colorScheme.error)),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('İptal'),
        ),
        FilledButton(
          onPressed: _kaydet,
          child: const Text('Kaydet'),
        ),
      ],
    );
  }
}
