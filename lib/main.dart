import 'package:flutter/material.dart';
import 'package:edulab/services/storage_service.dart';
import 'package:edulab/screens/kayit_ekrani.dart';
import 'package:edulab/screens/ana_sayfa.dart';

/// Karanlık tema canlı güncelleme için (drawer'dan değiştirilince uygulama yeniden çizilir).
final ValueNotifier<bool> darkModeNotifier = ValueNotifier<bool>(false);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  darkModeNotifier.value = await StorageService.darkModeGetir();
  runApp(const EduLabApp());
}

class EduLabApp extends StatelessWidget {
  const EduLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: darkModeNotifier,
      builder: (_, darkMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'EduLab',
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Verdana',
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.light),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Verdana',
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.dark),
          ),
          home: const _BaslangicEkrani(),
        );
      },
    );
  }
}

class _BaslangicEkrani extends StatelessWidget {
  const _BaslangicEkrani();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: StorageService.kullaniciKayitliMi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == true) {
            return const AnaSayfa();
          }
          return const KayitEkrani();
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
