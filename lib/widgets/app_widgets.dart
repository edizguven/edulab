import 'package:flutter/material.dart';

/// Erişilebilirlik: en az 48x48 dokunma alanı ve anlamlı etiket (çocuk + ekran okuyucu).
const double kMinTouchTarget = 48.0;

class SemanticTap extends StatelessWidget {
  final VoidCallback? onTap;
  final String semanticLabel;
  final Widget child;
  final bool minimumSize;

  const SemanticTap({
    super.key,
    required this.onTap,
    required this.semanticLabel,
    required this.child,
    this.minimumSize = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget w = child;
    if (minimumSize) {
      w = ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: kMinTouchTarget,
          minHeight: kMinTouchTarget,
        ),
        child: Center(child: w),
      );
    }
    w = Semantics(
      label: semanticLabel,
      button: true,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: w,
      ),
    );
    return w;
  }
}

/// Gem rozeti (AppBar / ana alan).
class GemBadge extends StatelessWidget {
  final int gem;
  final bool isTablet;

  const GemBadge({super.key, required this.gem, this.isTablet = false});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Gem sayısı: $gem',
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('💎', style: TextStyle(fontSize: isTablet ? 22 : 18)),
            const SizedBox(width: 4),
            Text('$gem', style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

/// Ortak form alanı (kayıt ekranı).
class RenkliInput extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool isEmail;
  final bool darkMode;

  const RenkliInput({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    required this.isEmail,
    this.darkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      textField: true,
      child: TextFormField(
        controller: controller,
        validator: (v) {
          if (v == null || v.isEmpty) return 'Burası boş kalamaz';
          if (isEmail) {
            final ok = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
            ).hasMatch(v);
            if (!ok) return 'Geçerli bir mail adresi girin!';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: (darkMode ? Colors.white : Colors.indigo).withValues(alpha: 0.08),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

/// Ana sayfa görev kartı: büyük dokunma alanı, anlamlı etiket.
class GorevKarti extends StatelessWidget {
  final String baslik;
  final IconData ikon;
  final Color renk;
  final VoidCallback onTap;

  const GorevKarti({
    super.key,
    required this.baslik,
    required this.ikon,
    required this.renk,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$baslik görevine git',
      button: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          color: Theme.of(context).cardColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(ikon, size: 56, color: renk),
              const SizedBox(height: 8),
              Text(baslik, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
