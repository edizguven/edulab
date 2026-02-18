// =============================================================================
// COĞRAFYA SORULARI – Kategorilere göre (UI/UX uyumlu)
// =============================================================================
//
// BURAYA YENİ SORU EKLEYEBİLİRSİN:
// İlgili kategoriyi bul (örn. cografyaKategorileri[0].sorular) ve listeye ekle:
//
//   CografyaSoru(
//     soru: 'Soru metni?',
//     dogruCevap: 'Doğru cevap',
//     yanlisSecenekler: ['Yanlış 1', 'Yanlış 2', 'Yanlış 3'],
//   ),
//
// Yeni kategori eklemek: cografyaKategorileri listesine CografyaKategori
// (id, ad, ikon, sorular) ekleyin. Detay: SORU_EKLEME_REHBERI.md
// =============================================================================

class CografyaSoru {
  final String soru;
  final String dogruCevap;
  final List<String> yanlisSecenekler;

  const CografyaSoru({
    required this.soru,
    required this.dogruCevap,
    required this.yanlisSecenekler,
  });
}

class CografyaKategori {
  final String id;
  final String ad;
  final String ikon;
  final List<CografyaSoru> sorular;

  const CografyaKategori({
    required this.id,
    required this.ad,
    required this.ikon,
    required this.sorular,
  });
}

final List<CografyaKategori> cografyaKategorileri = [
  CografyaKategori(
    id: 'kultur',
    ad: 'Kültürel Semboller ve Yemekler',
    ikon: '🍝',
    sorular: [
      const CografyaSoru(
        soru:
            "Pizza ve makarna denince akla gelen, haritada çizmeye benzeyen ülke hangisidir?",
        dogruCevap: 'İtalya',
        yanlisSecenekler: ['İspanya', 'Yunanistan', 'Fransa'],
      ),
      const CografyaSoru(
        soru:
            "Eyfel Kulesi'ni görmek isteyen bir çocuk hangi şehre gitmelidir?",
        dogruCevap: 'Paris',
        yanlisSecenekler: ['Londra', 'Berlin', 'Roma'],
      ),
      const CografyaSoru(
        soru: "Suşi hangi ülkede en çok sevilen yemektir?",
        dogruCevap: 'Japonya',
        yanlisSecenekler: ['Çin', 'Kore', 'Tayland'],
      ),
      const CografyaSoru(
        soru: "Paella ve flamenko hangi ülkeyle özdeşleşir?",
        dogruCevap: 'İspanya',
        yanlisSecenekler: ['Portekiz', 'İtalya', 'Meksika'],
      ),
      const CografyaSoru(
        soru: "Kanguru ve koala figürleri hangi ülkenin sembolüdür?",
        dogruCevap: 'Avustralya',
        yanlisSecenekler: ['Yeni Zelanda', 'Güney Afrika', 'Brezilya'],
      ),
      const CografyaSoru(
        soru: "Pizza'nın anavatanı sayılan şehir hangisidir?",
        dogruCevap: 'Napoli',
        yanlisSecenekler: ['Roma', 'Milano', 'Venedik'],
      ),
      const CografyaSoru(
        soru: "Big Ben saat kulesi hangi şehirdedir?",
        dogruCevap: 'Londra',
        yanlisSecenekler: ['Paris', 'New York', 'Tokyo'],
      ),
      const CografyaSoru(
        soru: "Taco ve burrito hangi ülkenin yemekleridir?",
        dogruCevap: 'Meksika',
        yanlisSecenekler: ['İspanya', 'Brezilya', 'Arjantin'],
      ),
      const CografyaSoru(
        soru:
            "Piramitleri ve kum çöllerini görmek isteyen bir çocuk hangi ülkeye gitmelidir?",
        dogruCevap: 'Mısır',
        yanlisSecenekler: ['Fransa', 'İzlanda', 'Japonya'],
      ),
      const CografyaSoru(
        soru:
            "Uzaydan bile görülebilen dünyanın en uzun duvarı (Çin Seddi) hangi ülkededir?",
        dogruCevap: 'Çin',
        yanlisSecenekler: ['Rusya', 'Hindistan', 'Türkiye'],
      ),
      const CografyaSoru(
        soru: "Özgürlük Heykeli hangi ünlü şehirde bulunur?",
        dogruCevap: 'New York',
        yanlisSecenekler: ['Londra', 'Paris', 'İstanbul'],
      ),
      const CografyaSoru(
        soru:
            "Türkiye'nin başkenti ve Anıtkabir'in bulunduğu şehir hangisidir?",
        dogruCevap: 'Ankara',
        yanlisSecenekler: ['İstanbul', 'İzmir', 'Antalya'],
      ),
      const CografyaSoru(
        soru:
            "Bayrağında kırmızı bir güneş (daire) olan 'Doğan Güneşin Ülkesi' hangisidir?",
        dogruCevap: 'Japonya',
        yanlisSecenekler: ['Çin', 'Almanya', 'İtalya'],
      ),
      const CografyaSoru(
        soru:
            "Dünyanın en soğuk yerlerinden biri olan ve penguenlerin yaşadığı yer neresidir?",
        dogruCevap: 'Antarktika',
        yanlisSecenekler: ['Sahra Çölü', 'Brezilya', 'Avustralya'],
      ),
      const CografyaSoru(
        soru: "Laleleri ve yel değirmenleri ile ünlü ülke hangisidir?",
        dogruCevap: 'Hollanda',
        yanlisSecenekler: ['İngiltere', 'Fransa', 'Yunanistan'],
      ),
      const CografyaSoru(
        soru:
            "Çikolatası ve saatleri ile çok meşhur olan Avrupa ülkesi hangisidir?",
        dogruCevap: 'İsviçre',
        yanlisSecenekler: ['Meksika', 'Mısır', 'Çin'],
      ),
      const CografyaSoru(
        soru:
            "İç içe geçen tahta bebekler (Matruşka) hangi ülkenin simgesidir?",
        dogruCevap: 'Rusya',
        yanlisSecenekler: ['İspanya', 'Kanada', 'Hindistan'],
      ),
      const CografyaSoru(
        soru:
            "Bayrağında akçaağaç yaprağı bulunan ve çok soğuk olan ülke hangisidir?",
        dogruCevap: 'Kanada',
        yanlisSecenekler: ['Brezilya', 'Avustralya', 'Meksika'],
      ),
      const CografyaSoru(
        soru:
            "Venedik şehrinde sokaklarda arabalar yerine kullanılan teknelere ne denir?",
        dogruCevap: 'Gondol',
        yanlisSecenekler: ['Vapur', 'Kano', 'Yat'],
      ),
      const CografyaSoru(
        soru: "Dünyanın en yüksek dağı olan Everest hangi kıtadadır?",
        dogruCevap: 'Asya',
        yanlisSecenekler: ['Avrupa', 'Afrika', 'Antarktika'],
      ),
      const CografyaSoru(
        soru:
            "Safari yapıp aslan ve zürafaları görebileceğimiz kıta hangisidir?",
        dogruCevap: 'Afrika',
        yanlisSecenekler: ['Avrupa', 'Asya', 'Antarktika'],
      ),
      const CografyaSoru(
        soru:
            "Amazon ormanları ve futbolu ile ünlü olan Güney Amerika ülkesi hangisidir?",
        dogruCevap: 'Brezilya',
        yanlisSecenekler: ['Almanya', 'Rusya', 'Japonya'],
      ),
      const CografyaSoru(
        soru: "Panda ayılarının doğal evi olan ülke hangisidir?",
        dogruCevap: 'Çin',
        yanlisSecenekler: ['Kanada', 'Avustralya', 'Türkiye'],
      ),
      const CografyaSoru(
        soru: "Güneş her zaman hangi yönden doğar?",
        dogruCevap: 'Doğu',
        yanlisSecenekler: ['Batı', 'Kuzey', 'Güney'],
      ),
      const CografyaSoru(
        soru: "Etrafı tamamen sularla çevrili kara parçasına ne ad verilir?",
        dogruCevap: 'Ada',
        yanlisSecenekler: ['Dağ', 'Vadi', 'Çöl'],
      ),
      const CografyaSoru(
        soru: "Dünyamızın şekli en çok neye benzer?",
        dogruCevap: 'Top',
        yanlisSecenekler: ['Kutu', 'Üçgen', 'Masa'],
      ),
      const CografyaSoru(
        soru:
            "Kırmızı renkli, üzerinde beyaz ay ve yıldız olan bayrak hangi ülkenindir?",
        dogruCevap: 'Türkiye',
        yanlisSecenekler: ['Fransa', 'İtalya', 'Yunanistan'],
      ),
      const CografyaSoru(
        soru:
            "Çöllerde susuzluğa en dayanıklı olan ve hörgüçleri bulunan hayvan hangisidir?",
        dogruCevap: 'Deve',
        yanlisSecenekler: ['At', 'Fil', 'Zürafa'],
      ),
      const CografyaSoru(
        soru:
            "Hangi mevsimde ağaçlar yapraklarını döker ve havalar soğumaya başlar?",
        dogruCevap: 'Sonbahar',
        yanlisSecenekler: ['Yaz', 'İlkbahar', 'Kış'],
      ),
      const CografyaSoru(
        soru:
            "Dünyanın en uzun nehri olarak bilinen 'Nil Nehri' hangi kıtadadır?",
        dogruCevap: 'Afrika',
        yanlisSecenekler: ['Avrupa', 'Asya', 'Avustralya'],
      ),
      const CografyaSoru(
        soru:
            "Süper kahraman filmlerinde sıkça gördüğümüz gökdelenler en çok hangi ülkededir?",
        dogruCevap: 'Amerika (ABD)',
        yanlisSecenekler: ['İzlanda', 'Moğolistan', 'Norveç'],
      ),
      const CografyaSoru(
        soru: "Kutup ayıları nerede yaşar?",
        dogruCevap: 'Kuzey Kutbu',
        yanlisSecenekler: ['Çöller', 'Ormanlar', 'Şehirler'],
      ),
      const CografyaSoru(
        soru:
            "Fransa denince akla gelen, uzun ve ince olan meşhur ekmeğin adı nedir?",
        dogruCevap: 'Baget',
        yanlisSecenekler: ['Simit', 'Pizza', 'Lavaş'],
      ),
      const CografyaSoru(
        soru: "Hangi mevsimde kardan adam yapabiliriz?",
        dogruCevap: 'Kış',
        yanlisSecenekler: ['Yaz', 'İlkbahar', 'Sonbahar'],
      ),
      const CografyaSoru(
        soru:
            "Dünyada iki kıtayı (Asya ve Avrupa) birbirine bağlayan tek şehir hangisidir?",
        dogruCevap: 'İstanbul',
        yanlisSecenekler: ['Londra', 'Tokyo', 'Roma'],
      ),
      const CografyaSoru(
        soru:
            "Çok eski zamanlarda yaşamış olan dev sürüngenlerin (Dinozorlar) fosilleri yerin altında nerede bulunur?",
        dogruCevap: 'Her yerde (Kıtalarda)',
        yanlisSecenekler: [
          'Sadece denizde',
          'Sadece gökyüzünde',
          'Sadece ayda',
        ],
      ),
      const CografyaSoru(
        soru: "Mavi çatılı beyaz evleri ile ünlü komşumuz hangisidir?",
        dogruCevap: 'Yunanistan',
        yanlisSecenekler: ['Bulgaristan', 'İran', 'Gürcistan'],
      ),
      const CografyaSoru(
        soru:
            "Denizin altında yaşayan mercan resiflerini ve renkli balıkları görmek için en ünlü yer hangisidir?",
        dogruCevap: 'Avustralya',
        yanlisSecenekler: ['Rusya', 'Almanya', 'İsviçre'],
      ),
    ],
  ),
  CografyaKategori(
    id: 'hayvanlar',
    ad: 'Hayvanlar ve Yaşam Alanları',
    ikon: '🦘',
    sorular: [
      const CografyaSoru(
        soru:
            "Kanguruları doğal ortamında görmek için hangi kıtaya gitmeliyiz?",
        dogruCevap: 'Avustralya',
        yanlisSecenekler: ['Afrika', 'Güney Amerika', 'Asya'],
      ),
      const CografyaSoru(
        soru: "Dev pandaların ana vatanı olan ülke hangisidir?",
        dogruCevap: 'Çin',
        yanlisSecenekler: ['Japonya', 'Hindistan', 'Nepal'],
      ),
      const CografyaSoru(
        soru:
            "Aslan ve fil gibi hayvanları doğal yaşamda görmek için hangi kıtaya gidilir?",
        dogruCevap: 'Afrika',
        yanlisSecenekler: ['Asya', 'Güney Amerika', 'Avustralya'],
      ),
      const CografyaSoru(
        soru: "Kutup ayıları hangi bölgede yaşar?",
        dogruCevap: 'Kuzey Kutbu',
        yanlisSecenekler: ['Antarktika', 'Alpler', 'Sibirya ormanları'],
      ),
      const CografyaSoru(
        soru: "Penguenler doğal ortamda nerede yaşar?",
        dogruCevap: 'Antarktika',
        yanlisSecenekler: ['Kuzey Kutbu', 'Afrika', 'Avustralya'],
      ),
      const CografyaSoru(
        soru: "Lama ve alpaka hangi kıtada yaygındır?",
        dogruCevap: 'Güney Amerika',
        yanlisSecenekler: ['Asya', 'Afrika', 'Avrupa'],
      ),
      const CografyaSoru(
        soru: "Zürafa ve zebra hangi kıtada doğal yaşar?",
        dogruCevap: 'Afrika',
        yanlisSecenekler: ['Avustralya', 'Asya', 'Güney Amerika'],
      ),

      // --- HAYVANLAR VE YAŞAM ALANLARI: 50 SORU ---
      const CografyaSoru(
        soru:
            "Okaliptüs ağaçlarında yaşayan ve sadece Avustralya'da bulunan hayvan hangisidir?",
        dogruCevap: 'Koala',
        yanlisSecenekler: ['Maymun', 'Sincap', 'Panda'],
      ),
      const CografyaSoru(
        soru:
            "Dünyanın en büyük yağmur ormanı olan Amazon'da yaşayan, çok yavaş hareket eden hayvan hangisidir?",
        dogruCevap: 'Tembel Hayvan (Sloth)',
        yanlisSecenekler: ['Çita', 'Tavşan', 'Kanguru'],
      ),
      const CografyaSoru(
        soru: "Kaplanların doğal yaşam alanı en çok hangi kıtada bulunur?",
        dogruCevap: 'Asya',
        yanlisSecenekler: ['Afrika', 'Avrupa', 'Avustralya'],
      ),
      const CografyaSoru(
        soru:
            "Sadece Madagaskar adasında yaşayan, uzun ve halkalı kuyruğu olan hayvan hangisidir?",
        dogruCevap: 'Lemur',
        yanlisSecenekler: ['Rakun', 'Kedi', 'Tilki'],
      ),
      const CografyaSoru(
        soru:
            "Hörgüçlerinde yağ depolayarak sıcak çöllerde uzun süre susuz kalabilen hayvan hangisidir?",
        dogruCevap: 'Deve',
        yanlisSecenekler: ['At', 'Fil', 'İnek'],
      ),
      const CografyaSoru(
        soru:
            "Kuzey Kutbu'nun dondurucu soğuklarında beyaz kürkleri sayesinde gizlenebilen avcı hangisidir?",
        dogruCevap: 'Kutup Ayısı',
        yanlisSecenekler: ['Boz Ayı', 'Aslan', 'Kurt'],
      ),
      const CografyaSoru(
        soru:
            "Antarktika'nın buzulları üzerinde yaşayan, uçamayan ama çok iyi yüzen kuş hangisidir?",
        dogruCevap: 'Penguen',
        yanlisSecenekler: ['Pelikan', 'Martı', 'Kartal'],
      ),
      const CografyaSoru(
        soru:
            "Dünyanın en hızlı kara hayvanı olan Çita, en çok hangi bölgede yaşar?",
        dogruCevap: 'Afrika Savanları',
        yanlisSecenekler: ['Asya Ormanları', 'Avrupa Dağları', 'Kuzey Kutbu'],
      ),
      const CografyaSoru(
        soru:
            "Bambu filizleri ile beslenen siyah beyaz renkli dev ayılar nerede yaşar?",
        dogruCevap: 'Çin',
        yanlisSecenekler: ['Rusya', 'Amerika', 'Brezilya'],
      ),
      const CografyaSoru(
        soru:
            "Kesesinde yavrusunu taşıyan ve zıplayarak ilerleyen Kanguru hangi kıtanın sembolüdür?",
        dogruCevap: 'Avustralya',
        yanlisSecenekler: ['Afrika', 'Güney Amerika', 'Avrupa'],
      ),
      const CografyaSoru(
        soru:
            "Zürafalar boyunlarının uzunluğu sayesinde hangi kıtadaki yüksek ağaçların yapraklarını yerler?",
        dogruCevap: 'Afrika',
        yanlisSecenekler: ['Asya', 'Antarktika', 'Kuzey Amerika'],
      ),
      const CografyaSoru(
        soru: "Dünyanın en büyük hayvanı olan Mavi Balina nerede yaşar?",
        dogruCevap: 'Okyanuslarda',
        yanlisSecenekler: ['Nehirlerde', 'Göllerde', 'Havuzlarda'],
      ),
      const CografyaSoru(
        soru:
            "Tukan kuşları gibi renkli gagalı kuşlar genellikle hangi iklimde yaşar?",
        dogruCevap: 'Sıcak ve Yağmurlu (Tropikal)',
        yanlisSecenekler: ['Kutuplar', 'Çöller', 'Dağ Tepeleri'],
      ),
      const CografyaSoru(
        soru:
            "Kar leoparları dünyanın en yüksek dağları olan hangi bölgede yaşar?",
        dogruCevap: 'Himalayalar (Asya)',
        yanlisSecenekler: ['Sahra Çölü', 'Amazon Ormanları', 'Okyanuslar'],
      ),
      const CografyaSoru(
        soru: "Nil Timsahı adını aldığı Nil Nehri hangi kıtadadır?",
        dogruCevap: 'Afrika',
        yanlisSecenekler: ['Avrupa', 'Asya', 'Avustralya'],
      ),
      const CografyaSoru(
        soru:
            "Ren geyikleri ve Elikler genellikle dünyanın hangi kısmındaki soğuk ormanlarda yaşar?",
        dogruCevap: 'Kuzey Yarımküre',
        yanlisSecenekler: [
          'Ekvator Hattı',
          'Güney Kutbu',
          'Avustralya Çölleri',
        ],
      ),
      const CografyaSoru(
        soru: "Deniz atları yaşamlarını nerede sürdürürler?",
        dogruCevap: 'Tuzlu su (Deniz ve Okyanus)',
        yanlisSecenekler: ['Tatlı su nehirleri', 'Buzullar', 'Yeraltı suları'],
      ),
      const CografyaSoru(
        soru:
            "Lama ve Alpaka gibi hayvanlar hangi kıtadaki yüksek dağlarda yaşar?",
        dogruCevap: 'Güney Amerika',
        yanlisSecenekler: ['Afrika', 'Avrupa', 'Asya'],
      ),
      const CografyaSoru(
        soru: "Grizzly (Boz) ayıları en çok hangi kıtadaki ormanlarda görülür?",
        dogruCevap: 'Kuzey Amerika',
        yanlisSecenekler: ['Avustralya', 'Afrika', 'Antarktika'],
      ),
      const CografyaSoru(
        soru:
            "Goriller ve Şempanzeler doğal olarak hangi kıtanın yağmur ormanlarında yaşar?",
        dogruCevap: 'Afrika',
        yanlisSecenekler: ['Avrupa', 'Avustralya', 'Kuzey Kutbu'],
      ),
      const CografyaSoru(
        soru:
            "Deniz kaplumbağaları (Caretta Caretta) yumurta bırakmak için hangi ülkenin kıyılarını çok sever?",
        dogruCevap: 'Türkiye',
        yanlisSecenekler: ['İzlanda', 'İsviçre', 'Moğolistan'],
      ),
      const CografyaSoru(
        soru:
            "Çizgili derileri olan Zebraları görmek için hangi kıtaya gitmeliyiz?",
        dogruCevap: 'Afrika',
        yanlisSecenekler: ['Asya', 'Avrupa', 'Kuzey Amerika'],
      ),
      const CografyaSoru(
        soru:
            "Deniz aslanları ve fok balıkları en çok hangi bölgelerin kıyılarında yaşar?",
        dogruCevap: 'Soğuk deniz kıyıları',
        yanlisSecenekler: ['Sıcak çöller', 'Şehir merkezleri', 'Ağaç tepeleri'],
      ),
      const CografyaSoru(
        soru: "Orangutanlar hangi adaların tropikal ormanlarında yaşarlar?",
        dogruCevap: 'Borneo ve Sumatra (Asya)',
        yanlisSecenekler: ['İzlanda', 'Grönland', 'Madagaskar'],
      ),
      const CografyaSoru(
        soru: "Kutup tilkisi, kışın karda gizlenmek için hangi renk olur?",
        dogruCevap: 'Beyaz',
        yanlisSecenekler: ['Kahverengi', 'Yeşil', 'Siyah'],
      ),
      const CografyaSoru(
        soru: "Deve kuşları doğal ortamda hangi kıtanın düzlüklerinde yaşar?",
        dogruCevap: 'Afrika',
        yanlisSecenekler: ['Avrupa', 'Asya', 'Antarktika'],
      ),
      const CografyaSoru(
        soru: "Flamingolar genellikle nasıl alanlarda yaşamayı severler?",
        dogruCevap: 'Sığ göller ve sulak alanlar',
        yanlisSecenekler: ['Sık ormanlar', 'Kuru çöller', 'Yüksek dağlar'],
      ),
      const CografyaSoru(
        soru:
            "Bayrağında Akçaağaç yaprağı olan ve geyikleriyle ünlü soğuk ülke hangisidir?",
        dogruCevap: 'Kanada',
        yanlisSecenekler: ['Brezilya', 'Avustralya', 'Meksika'],
      ),
      const CografyaSoru(
        soru: "Tarantula gibi büyük örümcekler en çok hangi iklimde yaşar?",
        dogruCevap: 'Sıcak ve nemli bölgeler',
        yanlisSecenekler: ['Karlı bölgeler', 'Kutuplar', 'Buzullar'],
      ),
      const CografyaSoru(
        soru:
            "Akrep ve Çıngıraklı yılan gibi hayvanlar en çok hangi ortamda bulunur?",
        dogruCevap: 'Çöller',
        yanlisSecenekler: ['Göller', 'Buzullar', 'Şehir parkları'],
      ),
      const CografyaSoru(
        soru: "Kunduzlar yuvalarını yapmak için hangisini kullanırlar?",
        dogruCevap: 'Ağaç dalları ve çamur',
        yanlisSecenekler: ['Sadece taş', 'Sadece yaprak', 'Demir çubuklar'],
      ),
      const CografyaSoru(
        soru: "Papağanlar en çok hangi bölgelerde doğal olarak yaşarlar?",
        dogruCevap: 'Tropikal ormanlar',
        yanlisSecenekler: ['Kuzey Kutbu', 'Çöller', 'Bozkırlar'],
      ),
      const CografyaSoru(
        soru: "Yarasalar gündüzleri genellikle nerede saklanırlar?",
        dogruCevap: 'Mağaralar ve karanlık yerler',
        yanlisSecenekler: [
          'Deniz altı',
          'Güneşli tarlalar',
          'Ağaçların en tepesi',
        ],
      ),
      const CografyaSoru(
        soru: "Pelikanlar yiyeceklerini (balıkları) nerede ararlar?",
        dogruCevap: 'Deniz ve göl kenarlarında',
        yanlisSecenekler: [
          'Orman içlerinde',
          'Çöl kumlarında',
          'Dağ zirvelerinde',
        ],
      ),
      const CografyaSoru(
        soru: "Vahşi kurtlar en çok hangi kıtaların ormanlarında yaşar?",
        dogruCevap: 'Kuzey Amerika ve Avrupa',
        yanlisSecenekler: ['Avustralya', 'Antarktika', 'Afrika'],
      ),
      const CografyaSoru(
        soru: "Piranha balıkları hangi kıtanın nehirlerinde yaşar?",
        dogruCevap: 'Güney Amerika',
        yanlisSecenekler: ['Avrupa', 'Asya', 'Avustralya'],
      ),
      const CografyaSoru(
        soru: "Hipopotamlar (Su Aygırları) günün çoğunu nerede geçirirler?",
        dogruCevap: 'Suyun içinde',
        yanlisSecenekler: ['Ağaç tepesinde', 'Kum tepesinde', 'Havada'],
      ),
      const CografyaSoru(
        soru: "Kutup ayıları neden Güney Kutbu'nda yaşamazlar?",
        dogruCevap: 'Doğal yaşam alanları Kuzey Kutbu olduğu için',
        yanlisSecenekler: [
          'Orası çok sıcak olduğu için',
          'Orada su olmadığı için',
          'Yüzemedikleri için',
        ],
      ),
      const CografyaSoru(
        soru:
            "Geyiklerin kafasındaki boynuzlar genellikle ne zaman düşer ve yeniden çıkar?",
        dogruCevap: 'Her yıl belirli dönemlerde',
        yanlisSecenekler: ['Sadece ölünce', 'Hiç düşmez', 'Sadece doğunca'],
      ),
      const CografyaSoru(
        soru: "Bukalemunlar neden renk değiştirirler?",
        dogruCevap: 'Duygularını göstermek ve gizlenmek için',
        yanlisSecenekler: [
          'Üşüdükleri için',
          'Acıktıkları için',
          'Uykuları geldiği için',
        ],
      ),
      const CografyaSoru(
        soru:
            "Komodo Ejderi denilen dev kertenkele hangi ülkedeki adalarda yaşar?",
        dogruCevap: 'Endonezya',
        yanlisSecenekler: ['İngiltere', 'Fransa', 'Kanada'],
      ),
      const CografyaSoru(
        soru: "Morslar (Deniz filleri) okyanusun hangi bölgesinde yaşarlar?",
        dogruCevap: 'Kuzeydeki soğuk sular',
        yanlisSecenekler: [
          'Ekvatoral sıcak sular',
          'Nehir ağızları',
          'Küçük göller',
        ],
      ),
      const CografyaSoru(
        soru:
            "Karıncayiyenler dilleriyle beslendikleri karıncaları en çok hangi kıtada ararlar?",
        dogruCevap: 'Güney Amerika',
        yanlisSecenekler: ['Avrupa', 'Antarktika', 'Kuzey Kutbu'],
      ),
      const CografyaSoru(
        soru: "Kartallar yuvalarını genellikle nereye yaparlar?",
        dogruCevap: 'Yüksek kayalıklar ve ağaç tepeleri',
        yanlisSecenekler: ['Yerin altı', 'Deniz kıyısı', 'Evlerin damı'],
      ),
      const CografyaSoru(
        soru:
            "Kırkayaklar ve küçük böcekler ormanda nerenin altında yaşamayı sever?",
        dogruCevap: 'Nemli yapraklar ve taş altları',
        yanlisSecenekler: [
          'Güneşli açık alanlar',
          'Ağaçların en ucu',
          'Bulutların içi',
        ],
      ),
      const CografyaSoru(
        soru: "Bal arıları kovanlarını en çok hangi alanlara yakın kurarlar?",
        dogruCevap: 'Çiçekli bahçeler ve ormanlar',
        yanlisSecenekler: ['Buzullar', 'Derin mağaralar', 'Okyanus ortası'],
      ),
      const CografyaSoru(
        soru:
            "Sincaplar kışın yemek için topladıkları palamutları nereye saklarlar?",
        dogruCevap: 'Toprak altına veya ağaç kovuklarına',
        yanlisSecenekler: [
          'Deniz dibine',
          'Bulutların üstüne',
          'Evlerin içine',
        ],
      ),
      const CografyaSoru(
        soru:
            "Örümcek maymunları kuyruklarını beşinci bir el gibi kullanarak nerede hareket ederler?",
        dogruCevap: 'Ağaç dallarında',
        yanlisSecenekler: [
          'Yerde koşturarak',
          'Su altında yüzerek',
          'Kumda yürüyerek',
        ],
      ),
      const CografyaSoru(
        soru:
            "Jaguarlar benekli kürkleri ile hangi kıtanın ormanlarında gizlenirler?",
        dogruCevap: 'Güney Amerika',
        yanlisSecenekler: ['Avrupa', 'Avustralya', 'Antarktika'],
      ),
      const CografyaSoru(
        soru:
            "Yaban eşekleri ve Zebralar hangi kıtada sürüler halinde gezerler?",
        dogruCevap: 'Afrika',
        yanlisSecenekler: ['Asya', 'Kuzey Amerika', 'Avrupa'],
      ),
    ],
  ),
  CografyaKategori(
    id: 'mevsimler',
    ad: 'Mevsimler ve Giyim Kuşam',
    ikon: '🧥',
    sorular: [
      const CografyaSoru(
        soru: "Eskimo evlerine (iglo) neden ihtiyaç duyulur?",
        dogruCevap: 'Soğuktan korunmak için',
        yanlisSecenekler: [
          'Yağmurdan korunmak için',
          'Güneşten korunmak için',
          'Rüzgârdan korunmak için',
        ],
      ),
      const CografyaSoru(
        soru:
            "Çölde yaşayan insanlar neden ince ama vücudu örten kıyafetler giyer?",
        dogruCevap: 'Güneşten korunmak için',
        yanlisSecenekler: [
          'Moda için',
          'Soğuktan korunmak için',
          'Yağmurdan korunmak için',
        ],
      ),
      const CografyaSoru(
        soru: "Türkiye'de kış yaşanırken Avustralya'da hangi mevsim yaşanır?",
        dogruCevap: 'Yaz',
        yanlisSecenekler: ['Kış', 'İlkbahar', 'Sonbahar'],
      ),
      const CografyaSoru(
        soru: "Kuzey ve Güney yarımkürede mevsimler nasıldır?",
        dogruCevap: 'Ters',
        yanlisSecenekler: ['Aynı', 'Karışık', 'Belirsiz'],
      ),
      const CografyaSoru(
        soru:
            "Kar yağan bölgelerde evler neden genelde sağlam ve izole yapılır?",
        dogruCevap: 'Soğuğu dışarıda tutmak için',
        yanlisSecenekler: ['Güzel görünsün diye', 'Rüzgâr için', 'Deprem için'],
      ),
    ],
  ),
  CografyaKategori(
    id: 'bayraklar',
    ad: 'Bayraklar ve Renkler',
    ikon: '🏳️',
    sorular: [
      const CografyaSoru(
        soru:
            "Aşağıdakilerden hangisi bayrağında ay ve yıldız olan bir ülkedir?",
        dogruCevap: 'Türkiye',
        yanlisSecenekler: ['Fransa', 'Brezilya', 'Japonya'],
      ),
      const CografyaSoru(
        soru: "Brezilya bayrağındaki yeşil renk neyi temsil eder?",
        dogruCevap: 'Ormanlar / Doğa',
        yanlisSecenekler: ['Deniz', 'Gökyüzü', 'Kan'],
      ),
      const CografyaSoru(
        soru: "Kırmızı daire (güneş) hangi ülkenin bayrağındadır?",
        dogruCevap: 'Japonya',
        yanlisSecenekler: ['Çin', 'Kore', 'Tayland'],
      ),
      const CografyaSoru(
        soru: "Yıldız ve çizgili bayrak hangi ülkeye aittir?",
        dogruCevap: 'ABD',
        yanlisSecenekler: ['İngiltere', 'Fransa', 'Rusya'],
      ),
      const CografyaSoru(
        soru: "Ay yıldızlı bayrağı olan başka bir ülke hangisidir?",
        dogruCevap: 'Tunus',
        yanlisSecenekler: ['Mısır', 'Suudi Arabistan', 'İran'],
      ),
      const CografyaSoru(
        soru: "Fransa bayrağındaki renkler sırasıyla ne anlama gelir?",
        dogruCevap: 'Özgürlük, eşitlik, kardeşlik',
        yanlisSecenekler: [
          'Deniz, toprak, gökyüzü',
          'Kan, kar, güneş',
          'Gece, gündüz, alacakaranlık',
        ],
      ),
    ],
  ),
  CografyaKategori(
    id: 'doga',
    ad: 'Doğa Olayları ve Yer Şekilleri',
    ikon: '🏔️',
    sorular: [
      const CografyaSoru(
        soru: "Etrafı tamamen sularla çevrili kara parçasına ne ad verilir?",
        dogruCevap: 'Ada',
        yanlisSecenekler: ['Yarımada', 'Kıta', 'Ova'],
      ),
      const CografyaSoru(
        soru: "Everest Dağı'na tırmanmak için hangi kıtaya gitmelisin?",
        dogruCevap: 'Asya',
        yanlisSecenekler: ['Avrupa', 'Afrika', 'Güney Amerika'],
      ),
      const CografyaSoru(
        soru: "Pusula ibresi hangi yönü gösterir?",
        dogruCevap: 'Kuzey',
        yanlisSecenekler: ['Güney', 'Doğu', 'Batı'],
      ),
      const CografyaSoru(
        soru: "Denize doğru uzanan kara parçasına ne denir?",
        dogruCevap: 'Yarımada',
        yanlisSecenekler: ['Ada', 'Körfez', 'Burun'],
      ),
      const CografyaSoru(
        soru: "Dünyanın en uzun nehri hangisidir?",
        dogruCevap: 'Nil',
        yanlisSecenekler: ['Amazon', 'Mississippi', 'Tuna'],
      ),
      const CografyaSoru(
        soru: "Depremler en çok hangi tür yerlerde görülür?",
        dogruCevap: 'Fay hatlarında',
        yanlisSecenekler: ['Ovalarda', 'Çöllerde', 'Kutup bölgelerinde'],
      ),

      // --- DOĞA OLAYLARI VE YER ŞEKİLLERİ: 50 SORU ---
      const CografyaSoru(
        soru:
            "Gökyüzünde güneş varken yağmur yağdığında oluşan renkli kuşak hangisidir?",
        dogruCevap: 'Gökkuşağı',
        yanlisSecenekler: ['Bulut', 'Şimşek', 'Sis'],
      ),
      const CografyaSoru(
        soru:
            "Yerin sarsılmasına ve binaların sallanmasına neden olan doğa olayı nedir?",
        dogruCevap: 'Deprem',
        yanlisSecenekler: ['Fırtına', 'Heyelan', 'Çığ'],
      ),
      const CografyaSoru(
        soru: "Etrafı sularla çevrili olan kara parçasına ne ad verilir?",
        dogruCevap: 'Ada',
        yanlisSecenekler: ['Vadi', 'Dağ', 'Ova'],
      ),
      const CografyaSoru(
        soru:
            "Bir dağın tepesinden aşağıya doğru hızla kayan büyük kar kütlesine ne denir?",
        dogruCevap: 'Çığ',
        yanlisSecenekler: ['Sel', 'Deprem', 'Rüzgar'],
      ),
      const CografyaSoru(
        soru:
            "Aşırı yağmurlar sonucu akarsuların taşması ve her yeri su basması olayına ne denir?",
        dogruCevap: 'Sel',
        yanlisSecenekler: ['Kuraklık', 'Sis', 'Dolu'],
      ),
      const CografyaSoru(
        soru: "İçinden sıcak lavlar ve dumanlar çıkan dağlara ne ad verilir?",
        dogruCevap: 'Yanardağ (Volkan)',
        yanlisSecenekler: ['Peri Bacası', 'Buzul', 'Mağara'],
      ),
      const CografyaSoru(
        soru:
            "Suyun çok yüksek bir yerden aşağıya doğru dökülmesiyle ne oluşur?",
        dogruCevap: 'Şelale',
        yanlisSecenekler: ['Göl', 'Deniz', 'Dere'],
      ),
      const CografyaSoru(
        soru: "Gökyüzünde aniden çakan parlak ışığa ne denir?",
        dogruCevap: 'Şimşek',
        yanlisSecenekler: ['Gök gürültüsü', 'Gökkuşağı', 'Yıldız'],
      ),
      const CografyaSoru(
        soru: "Şimşek çaktıktan sonra duyduğumuz yüksek sese ne denir?",
        dogruCevap: 'Gök gürültüsü',
        yanlisSecenekler: ['Rüzgar sesi', 'Yağmur sesi', 'Dalga sesi'],
      ),
      const CografyaSoru(
        soru:
            "Yerin altında oluşan ve insanların içine girebildiği büyük boşluklara ne denir?",
        dogruCevap: 'Mağara',
        yanlisSecenekler: ['Kanyon', 'Ada', 'Tepe'],
      ),
      const CografyaSoru(
        soru:
            "Havanın yere çok yakın bulutlarla kaplanması sonucu önümüzü görmemizi zorlaştıran olay nedir?",
        dogruCevap: 'Sis',
        yanlisSecenekler: ['Kar', 'Dolu', 'Güneş'],
      ),
      const CografyaSoru(
        soru:
            "İki dağın arasında kalan çukur bölgeye veya uzun yola ne ad verilir?",
        dogruCevap: 'Vadi',
        yanlisSecenekler: ['Zirve', 'Ada', 'Kıta'],
      ),
      const CografyaSoru(
        soru:
            "Yağmur damlalarının donarak küçük buz topları halinde yere düşmesine ne denir?",
        dogruCevap: 'Dolu',
        yanlisSecenekler: ['Kar', 'Çiy', 'Sis'],
      ),
      const CografyaSoru(
        soru:
            "Deniz kenarlarında dalgaların karaya vurduğu kumlu alanlara ne denir?",
        dogruCevap: 'Plaj (Kumsal)',
        yanlisSecenekler: ['Okyanus', 'Nehir', 'Göl'],
      ),
      const CografyaSoru(
        soru: "Çok geniş, dümdüz ve tarım yapılan alanlara ne ad verilir?",
        dogruCevap: 'Ova',
        yanlisSecenekler: ['Dağ', 'Uçurum', 'Vadi'],
      ),
      const CografyaSoru(
        soru:
            "Toprağın yağmurla ağırlaşıp dağ yamacından aşağı kaymasına ne ad verilir?",
        dogruCevap: 'Heyelan (Toprak kayması)',
        yanlisSecenekler: ['Deprem', 'Tsunami', 'Fırtına'],
      ),
      const CografyaSoru(
        soru: "Denizlerin ortasında yüzen dev buz kütlelerine ne denir?",
        dogruCevap: 'Buz dağı (Iceberg)',
        yanlisSecenekler: ['Ada', 'Gemi', 'Yakamoz'],
      ),
      const CografyaSoru(
        soru: "Çok şiddetli esen ve her şeyi uçurabilen rüzgarlara ne denir?",
        dogruCevap: 'Fırtına',
        yanlisSecenekler: ['Meltem', 'Esinti', 'Çiy'],
      ),
      const CografyaSoru(
        soru: "Dünya'nın en yüksek noktası olan Everest bir nedir?",
        dogruCevap: 'Dağ',
        yanlisSecenekler: ['Göl', 'Ada', 'Ova'],
      ),
      const CografyaSoru(
        soru:
            "Deniz suyunun rüzgarla birlikte yükselip kıyıya doğru hareket etmesine ne denir?",
        dogruCevap: 'Dalga',
        yanlisSecenekler: ['Akıntı', 'Sel', 'Girdap'],
      ),
      const CografyaSoru(
        soru:
            "Sadece kumlarla kaplı, çok az yağmur yağan sıcak yerlere ne denir?",
        dogruCevap: 'Çöl',
        yanlisSecenekler: ['Orman', 'Buzul', 'Çayır'],
      ),
      const CografyaSoru(
        soru:
            "Çöllerde aniden karşımıza çıkan su ve ağaçlık alanlara ne denir?",
        dogruCevap: 'Vaha',
        yanlisSecenekler: ['Ada', 'Körfez', 'Mağara'],
      ),
      const CografyaSoru(
        soru: "Okyanuslarda deprem sonrası oluşan dev dalgalara ne ad verilir?",
        dogruCevap: 'Tsunami',
        yanlisSecenekler: ['Sel', 'Hortum', 'Girdap'],
      ),
      const CografyaSoru(
        soru:
            "Kendi etrafında dönerek ilerleyen ve her şeyi içine çeken rüzgara ne denir?",
        dogruCevap: 'Hortum',
        yanlisSecenekler: ['Sis', 'Kar', 'Çiy'],
      ),
      const CografyaSoru(
        soru:
            "Akarsuların döküldüğü ve balıkların yaşadığı büyük su kütlelerine ne denir?",
        dogruCevap: 'Deniz',
        yanlisSecenekler: ['Havuz', 'Kanal', 'Hendek'],
      ),
      const CografyaSoru(
        soru:
            "Dört tarafı sularla çevrili olmayan, bir ucu karaya bağlı kara parçasına ne denir?",
        dogruCevap: 'Yarımada',
        yanlisSecenekler: ['Ada', 'Kıta', 'Kaya'],
      ),
      const CografyaSoru(
        soru:
            "Yüksek dağların tepesinde hiç erimeden duran buz kütlelerine ne denir?",
        dogruCevap: 'Buzul',
        yanlisSecenekler: ['Kar topu', 'Dolu', 'Sis'],
      ),
      const CografyaSoru(
        soru: "Ülkemizde Kapadokya'da bulunan ilginç taş şekillerine ne denir?",
        dogruCevap: 'Peri Bacası',
        yanlisSecenekler: ['Piramit', 'Gökdelen', 'Kule'],
      ),
      const CografyaSoru(
        soru:
            "Denizlerin karaya doğru girdiği küçük su girintilerine ne denir?",
        dogruCevap: 'Körfez',
        yanlisSecenekler: ['Ada', 'Dağ', 'Ova'],
      ),
      const CografyaSoru(
        soru:
            "Gece gökyüzünde parlayan ve bize çok uzak olan ısı ışık kaynakları nedir?",
        dogruCevap: 'Yıldızlar',
        yanlisSecenekler: ['Bulutlar', 'Uçaklar', 'Kuşlar'],
      ),
      const CografyaSoru(
        soru:
            "Dünya'nın uydusu olan ve geceleri gökyüzünde gördüğümüz gök cismi hangisidir?",
        dogruCevap: 'Ay',
        yanlisSecenekler: ['Güneş', 'Mars', 'Venüs'],
      ),
      const CografyaSoru(
        soru:
            "Hangi mevsimde ağaçlar yaprak döker ve göçmen kuşlar sıcak yerlere gider?",
        dogruCevap: 'Sonbahar',
        yanlisSecenekler: ['İlkbahar', 'Yaz', 'Kış'],
      ),
      const CografyaSoru(
        soru: "Pusulanın renkli ucu her zaman hangi yönü gösterir?",
        dogruCevap: 'Kuzey',
        yanlisSecenekler: ['Güney', 'Doğu', 'Batı'],
      ),
      const CografyaSoru(
        soru: "Güneş'in sabahları doğduğu yöne ne ad verilir?",
        dogruCevap: 'Doğu',
        yanlisSecenekler: ['Batı', 'Kuzey', 'Güney'],
      ),
      const CografyaSoru(
        soru: "Güneş'in akşamları battığı yöne ne ad verilir?",
        dogruCevap: 'Batı',
        yanlisSecenekler: ['Doğu', 'Kuzey', 'Güney'],
      ),
      const CografyaSoru(
        soru: "Yağmurun oluşması için gökyüzünde hangisinin olması gerekir?",
        dogruCevap: 'Bulut',
        yanlisSecenekler: ['Sis', 'Gökkuşağı', 'Yıldız'],
      ),
      const CografyaSoru(
        soru: "Dünya'nın etrafını saran hava tabakasına ne ad verilir?",
        dogruCevap: 'Atmosfer',
        yanlisSecenekler: ['Yer kabuğu', 'Okyanus', 'Mağara'],
      ),
      const CografyaSoru(
        soru:
            "Denizlerin altında bulunan ve mercanların oluşturduğu renkli yapılara ne denir?",
        dogruCevap: 'Mercan Resifi',
        yanlisSecenekler: ['Su altı dağı', 'Yosun tarlası', 'Deniz vadi'],
      ),
      const CografyaSoru(
        soru:
            "Yanardağ patladığında dışarı çıkan çok sıcak ve akışkan maddeye ne denir?",
        dogruCevap: 'Lav',
        yanlisSecenekler: ['Çamur', 'Su', 'Kar'],
      ),
      const CografyaSoru(
        soru: "Dünyamızın şekli en çok hangisine benzer?",
        dogruCevap: 'Basketbol topu',
        yanlisSecenekler: ['Kitap', 'Kutu', 'Üçgen peynir'],
      ),
      const CografyaSoru(
        soru: "Kutuplarda havanın çok soğuk olmasının nedeni nedir?",
        dogruCevap: 'Güneş ışınlarının eğik gelmesi',
        yanlisSecenekler: [
          'Çok ağaç olması',
          'Rüzgarın olmaması',
          'Denizin olmaması',
        ],
      ),
      const CografyaSoru(
        soru: "Çöllerde rüzgarın biriktirdiği kum tepelerine ne denir?",
        dogruCevap: 'Kumul',
        yanlisSecenekler: ['Kaya', 'Çukur', 'Vadi'],
      ),
      const CografyaSoru(
        soru: "Deniz suyunun içinde en çok ne bulunur?",
        dogruCevap: 'Tuz',
        yanlisSecenekler: ['Şeker', 'Çikolata', 'Meyve suyu'],
      ),
      const CografyaSoru(
        soru:
            "Yağmurdan sonra toprakta oluşan ve bitkilerin büyümesini sağlayan sıvı nedir?",
        dogruCevap: 'Su',
        yanlisSecenekler: ['Süt', 'Yağ', 'Boya'],
      ),
      const CografyaSoru(
        soru:
            "Hangi doğa olayı kışın yolların kapanmasına ve kardan adam yapmamıza neden olur?",
        dogruCevap: 'Kar',
        yanlisSecenekler: ['Yağmur', 'Sis', 'Fırtına'],
      ),
      const CografyaSoru(
        soru: "Yer altından fışkırarak çıkan sıcak su kaynaklarına ne denir?",
        dogruCevap: 'Gayzer',
        yanlisSecenekler: ['Dere', 'Göl', 'Şelale'],
      ),
      const CografyaSoru(
        soru:
            "Dünya'nın en büyük su kütlelerine (denizlerden daha büyük) ne denir?",
        dogruCevap: 'Okyanus',
        yanlisSecenekler: ['Nehir', 'Baraj', 'Göl'],
      ),
      const CografyaSoru(
        soru: "Deniz ile karanın birleştiği çizgiye ne denir?",
        dogruCevap: 'Kıyı çizgisi',
        yanlisSecenekler: ['Ufuk çizgisi', 'Yol çizgisi', 'Buz çizgisi'],
      ),
      const CografyaSoru(
        soru:
            "Gökyüzü ve yerin birleşiyor gibi göründüğü uzak çizgiye ne denir?",
        dogruCevap: 'Ufuk çizgisi',
        yanlisSecenekler: ['Kıyı çizgisi', 'Bulut çizgisi', 'Gökkuşağı'],
      ),
      const CografyaSoru(
        soru:
            "Hangi doğa olayı sayesinde bitkiler susuz kalmaz ve barajlar dolar?",
        dogruCevap: 'Yağmur',
        yanlisSecenekler: ['Güneş', 'Rüzgar', 'Sis'],
      ),
    ],
  ),
  CografyaKategori(
    id: 'baskentler',
    ad: 'Başkentler ve Şehir Yaşamı',
    ikon: '🏛️',
    sorular: [
      const CografyaSoru(
        soru:
            "Türkiye'nin kalbi sayılan, TBMM'nin bulunduğu başkentimiz neresidir?",
        dogruCevap: 'Ankara',
        yanlisSecenekler: ['İstanbul', 'İzmir', 'Bursa'],
      ),
      const CografyaSoru(
        soru: "Kırmızı çift katlı otobüslerle ünlü şehir hangisidir?",
        dogruCevap: 'Londra',
        yanlisSecenekler: ['Paris', 'New York', 'Tokyo'],
      ),
      const CografyaSoru(
        soru: "Fransa'nın başkenti neresidir?",
        dogruCevap: 'Paris',
        yanlisSecenekler: ['Lyon', 'Marsilya', 'Nice'],
      ),
      const CografyaSoru(
        soru: "Almanya'nın başkenti neresidir?",
        dogruCevap: 'Berlin',
        yanlisSecenekler: ['Münih', 'Frankfurt', 'Hamburg'],
      ),
      const CografyaSoru(
        soru: "Japonya'nın başkenti neresidir?",
        dogruCevap: 'Tokyo',
        yanlisSecenekler: ['Osaka', 'Kyoto', 'Hiroşima'],
      ),
      const CografyaSoru(
        soru: "Mısır'ın başkenti neresidir?",
        dogruCevap: 'Kahire',
        yanlisSecenekler: ['İskenderiye', 'Lüksor', 'Şarm El Şeyh'],
      ),
      const CografyaSoru(
        soru: "Rusya'nın başkenti neresidir?",
        dogruCevap: 'Moskova',
        yanlisSecenekler: ['St. Petersburg', 'Kazan', 'Soçi'],
      ),
      const CografyaSoru(
        soru: "Çin'in başkenti neresidir?",
        dogruCevap: 'Pekin',
        yanlisSecenekler: ['Şangay', 'Hong Kong', 'Guangzhou'],
      ),
      const CografyaSoru(
        soru: "İtalya'nın başkenti neresidir?",
        dogruCevap: 'Roma',
        yanlisSecenekler: ['Milano', 'Venedik', 'Napoli'],
      ),
      const CografyaSoru(
        soru: "İspanya'nın başkenti neresidir?",
        dogruCevap: 'Madrid',
        yanlisSecenekler: ['Barselona', 'Valencia', 'Sevilla'],
      ),

      // --- BAŞKENTLER VE ŞEHİR YAŞAMI: 50 SORU ---
      const CografyaSoru(
        soru: "Türkiye'nin başkenti neresidir?",
        dogruCevap: 'Ankara',
        yanlisSecenekler: ['İstanbul', 'İzmir', 'Antalya'],
      ),
      const CografyaSoru(
        soru:
            "Fransa'nın başkenti olan ve 'Aşıklar Şehri' olarak bilinen yer neresidir?",
        dogruCevap: 'Paris',
        yanlisSecenekler: ['Lyon', 'Marsilya', 'Nice'],
      ),
      const CografyaSoru(
        soru:
            "İngiltere'nin başkenti olan ve kırmızı otobüsleriyle ünlü şehir hangisidir?",
        dogruCevap: 'Londra',
        yanlisSecenekler: ['Manchester', 'Liverpool', 'Oxford'],
      ),
      const CografyaSoru(
        soru:
            "İtalya'nın başkenti olan ve içinde tarihi Kolezyum'u barındıran şehir hangisidir?",
        dogruCevap: 'Roma',
        yanlisSecenekler: ['Venedik', 'Milano', 'Floransa'],
      ),
      const CografyaSoru(
        soru:
            "Japonya'nın başkenti olan ve dünyanın en kalabalık şehirlerinden biri hangisidir?",
        dogruCevap: 'Tokyo',
        yanlisSecenekler: ['Kyoto', 'Osaka', 'Hiroşima'],
      ),
      const CografyaSoru(
        soru: "Almanya'nın başkenti neresidir?",
        dogruCevap: 'Berlin',
        yanlisSecenekler: ['Münih', 'Hamburg', 'Frankfurt'],
      ),
      const CografyaSoru(
        soru: "Azerbaycan'ın başkenti ve en büyük şehri hangisidir?",
        dogruCevap: 'Bakü',
        yanlisSecenekler: ['Gence', 'Nahçıvan', 'Sumgayıt'],
      ),
      const CografyaSoru(
        soru:
            "Mısır'ın başkenti olan ve Piramitlere çok yakın olan şehir hangisidir?",
        dogruCevap: 'Kahire',
        yanlisSecenekler: ['İskenderiye', 'Hurgada', 'Luksor'],
      ),
      const CografyaSoru(
        soru: "Amerika Birleşik Devletleri'nin (ABD) başkenti neresidir?",
        dogruCevap: 'Washington D.C.',
        yanlisSecenekler: ['New York', 'Los Angeles', 'Miami'],
      ),
      const CografyaSoru(
        soru:
            "Rusya'nın başkenti olan ve Kızıl Meydan'ı ile ünlü şehir hangisidir?",
        dogruCevap: 'Moskova',
        yanlisSecenekler: ['St. Petersburg', 'Kazan', 'Sibirya'],
      ),
      const CografyaSoru(
        soru:
            "Yunanistan'ın başkenti olan ve tarihi tapınaklarıyla ünlü şehir hangisidir?",
        dogruCevap: 'Atina',
        yanlisSecenekler: ['Selanik', 'Rodos', 'Girit'],
      ),
      const CografyaSoru(
        soru: "İspanya'nın başkenti neresidir?",
        dogruCevap: 'Madrid',
        yanlisSecenekler: ['Barselona', 'Sevilla', 'Valencia'],
      ),
      const CografyaSoru(
        soru: "Çin'in başkenti neresidir?",
        dogruCevap: 'Pekin',
        yanlisSecenekler: ['Şangay', 'Hong Kong', 'Wuhan'],
      ),
      const CografyaSoru(
        soru:
            "Hollanda'nın başkenti olan ve kanallarıyla ünlü şehir hangisidir?",
        dogruCevap: 'Amsterdam',
        yanlisSecenekler: ['Rotterdam', 'Lahey', 'Utrecht'],
      ),
      const CografyaSoru(
        soru:
            "Kuzey komşumuz olan ve Ayasofya Camii'nin bulunduğu en büyük şehrimiz hangisidir?",
        dogruCevap: 'İstanbul',
        yanlisSecenekler: ['Ankara', 'Bursa', 'Edirne'],
      ),
      const CografyaSoru(
        soru: "Brezilya'nın başkenti neresidir?",
        dogruCevap: 'Brasilia',
        yanlisSecenekler: ['Rio de Janeiro', 'Sao Paulo', 'Salvador'],
      ),
      const CografyaSoru(
        soru: "Güney Kore'nin başkenti neresidir?",
        dogruCevap: 'Seul',
        yanlisSecenekler: ['Busan', 'Incheon', 'Jeju'],
      ),
      const CografyaSoru(
        soru: "Avustralya'nın başkenti hangisidir?",
        dogruCevap: 'Canberra',
        yanlisSecenekler: ['Sidney', 'Melbourne', 'Perth'],
      ),
      const CografyaSoru(
        soru: "Kanada'nın başkenti hangisidir?",
        dogruCevap: 'Ottawa',
        yanlisSecenekler: ['Toronto', 'Montreal', 'Vancouver'],
      ),
      const CografyaSoru(
        soru: "Suudi Arabistan'ın başkenti neresidir?",
        dogruCevap: 'Riyad',
        yanlisSecenekler: ['Mekke', 'Medine', 'Cidde'],
      ),
      const CografyaSoru(
        soru: "Portekiz'in başkenti neresidir?",
        dogruCevap: 'Lizbon',
        yanlisSecenekler: ['Porto', 'Braga', 'Faro'],
      ),
      const CografyaSoru(
        soru: "Hindistan'ın başkenti neresidir?",
        dogruCevap: 'Yeni Delhi',
        yanlisSecenekler: ['Mumbai', 'Kalküta', 'Bangalore'],
      ),
      const CografyaSoru(
        soru: "Arjantin'in başkenti neresidir?",
        dogruCevap: 'Buenos Aires',
        yanlisSecenekler: ['Rosario', 'Cordoba', 'Mendoza'],
      ),
      const CografyaSoru(
        soru: "Meksika'nın başkenti hangisidir?",
        dogruCevap: 'Meksiko (Mexico City)',
        yanlisSecenekler: ['Cancun', 'Guadalajara', 'Tijuana'],
      ),
      const CografyaSoru(
        soru:
            "Avusturya'nın başkenti ve müzik şehri olarak bilinen yer hangisidir?",
        dogruCevap: 'Viyana',
        yanlisSecenekler: ['Salzburg', 'Graz', 'Linz'],
      ),
      const CografyaSoru(
        soru:
            "Belçika'nın başkenti olan ve Avrupa'nın merkezi sayılan şehir hangisidir?",
        dogruCevap: 'Brüksel',
        yanlisSecenekler: ['Brugge', 'Anvers', 'Gent'],
      ),
      const CografyaSoru(
        soru: "Macaristan'ın başkenti neresidir?",
        dogruCevap: 'Budapeşte',
        yanlisSecenekler: ['Debrecen', 'Pecs', 'Szeged'],
      ),
      const CografyaSoru(
        soru: "İsviçre'nin başkenti neresidir?",
        dogruCevap: 'Bern',
        yanlisSecenekler: ['Zürih', 'Cenevre', 'Basel'],
      ),
      const CografyaSoru(
        soru: "Katar'ın başkenti neresidir?",
        dogruCevap: 'Doha',
        yanlisSecenekler: ['Dubai', 'Abu Dabi', 'Kuveyt'],
      ),
      const CografyaSoru(
        soru: "Irak'ın başkenti neresidir?",
        dogruCevap: 'Bağdat',
        yanlisSecenekler: ['Erbil', 'Musul', 'Basra'],
      ),
      const CografyaSoru(
        soru: "İran'ın başkenti neresidir?",
        dogruCevap: 'Tahran',
        yanlisSecenekler: ['Tebriz', 'İsfahan', 'Şiraz'],
      ),
      const CografyaSoru(
        soru: "Kuzey Kıbrıs Türk Cumhuriyeti'nin başkenti neresidir?",
        dogruCevap: 'Lefkoşa',
        yanlisSecenekler: ['Girne', 'Magosa', 'Güzelyurt'],
      ),
      const CografyaSoru(
        soru: "Norveç'in başkenti neresidir?",
        dogruCevap: 'Oslo',
        yanlisSecenekler: ['Bergen', 'Stavanger', 'Trondheim'],
      ),
      const CografyaSoru(
        soru: "İsveç'in başkenti neresidir?",
        dogruCevap: 'Stokholm',
        yanlisSecenekler: ['Göteborg', 'Malmö', 'Uppsala'],
      ),
      const CografyaSoru(
        soru: "Danimarka'nın başkenti neresidir?",
        dogruCevap: 'Kopenhag',
        yanlisSecenekler: ['Billund', 'Aarhus', 'Odense'],
      ),
      const CografyaSoru(
        soru: "Birleşik Arap Emirlikleri'nin başkenti neresidir?",
        dogruCevap: 'Abu Dabi',
        yanlisSecenekler: ['Dubai', 'Şarika', 'Acman'],
      ),
      const CografyaSoru(
        soru: "Tayland'ın başkenti neresidir?",
        dogruCevap: 'Bangkok',
        yanlisSecenekler: ['Phuket', 'Pattaya', 'Chiang Mai'],
      ),
      const CografyaSoru(
        soru: "Ukrayna'nın başkenti neresidir?",
        dogruCevap: 'Kiev',
        yanlisSecenekler: ['Lviv', 'Odessa', 'Harkov'],
      ),
      const CografyaSoru(
        soru:
            "Küba'nın başkenti ve renkli eski arabalarıyla ünlü şehir hangisidir?",
        dogruCevap: 'Havana',
        yanlisSecenekler: ['Varadero', 'Santiago', 'Trinidad'],
      ),
      const CografyaSoru(
        soru:
            "Çek Cumhuriyeti'nin başkenti ve 'Masal Şehir' olarak bilinen yer hangisidir?",
        dogruCevap: 'Prag',
        yanlisSecenekler: ['Brno', 'Ostrava', 'Plzen'],
      ),
      const CografyaSoru(
        soru:
            "Şehirlerde trafiği yöneten kırmızı, sarı ve yeşil ışıklı araca ne denir?",
        dogruCevap: 'Trafik Lambası',
        yanlisSecenekler: ['Tabela', 'Sokak Lambası', 'Radar'],
      ),
      const CografyaSoru(
        soru: "Şehirlerde yerin altından giden hızlı trene ne ad verilir?",
        dogruCevap: 'Metro',
        yanlisSecenekler: ['Tramvay', 'Vapur', 'Teleferik'],
      ),
      const CografyaSoru(
        soru: "Bir şehrin en yüksek binasına genellikle ne ad verilir?",
        dogruCevap: 'Gökdelen',
        yanlisSecenekler: ['Villa', 'Kulübe', 'Şato'],
      ),
      const CografyaSoru(
        soru: "Şehirlerde uçakların iniş ve kalkış yaptığı yere ne denir?",
        dogruCevap: 'Havalimanı',
        yanlisSecenekler: ['Otogar', 'İskele', 'İstasyon'],
      ),
      const CografyaSoru(
        soru:
            "Gökdelenleri ve Özgürlük Heykeli ile ünlü, ABD'nin en büyük şehri hangisidir?",
        dogruCevap: 'New York',
        yanlisSecenekler: ['Washington', 'Chicago', 'Houston'],
      ),
      const CografyaSoru(
        soru: "Hangi şehirde ulaşım için kanallar ve tekneler kullanılır?",
        dogruCevap: 'Venedik',
        yanlisSecenekler: ['Berlin', 'Madrid', 'Viyana'],
      ),
      const CografyaSoru(
        soru:
            "Bir şehrin yönetildiği, belediye başkanının çalıştığı yere ne ad verilir?",
        dogruCevap: 'Belediye Binası',
        yanlisSecenekler: ['Kütüphane', 'Okul', 'Hastane'],
      ),
      const CografyaSoru(
        soru:
            "İnsanların yürüyüş yaptığı ve oyun oynadığı yeşil şehir alanlarına ne denir?",
        dogruCevap: 'Park',
        yanlisSecenekler: ['Fabrika', 'Otopark', 'Tünel'],
      ),
      const CografyaSoru(
        soru: "Dubai şehrinde bulunan dünyanın en yüksek binasının adı nedir?",
        dogruCevap: 'Burj Khalifa',
        yanlisSecenekler: ['Eyfel Kulesi', 'Pisa Kulesi', 'Galata Kulesi'],
      ),
      const CografyaSoru(
        soru:
            "İstanbulluların kıtalar arası geçiş yapmak için kullandığı araç hangisidir?",
        dogruCevap: 'Vapur',
        yanlisSecenekler: ['Uçak', 'Bisiklet', 'Scooter'],
      ),
    ],
  ),
];
