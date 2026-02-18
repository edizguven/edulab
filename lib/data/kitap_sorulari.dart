// =============================================================================
// KİTAP OKUMA – İçerik (sayfalar) + Sorular
// =============================================================================
//
// BURAYA YENİ KİTAP EKLEYEBİLİRSİN:
//
// KitapSorulari(
//   kitapAdi: 'Kitabın Adı',
//   sayfalar: [
//     'Sayfa 1 metni. Çocukların okuyacağı paragraf...',
//     'Sayfa 2 metni...',
//   ],
//   sorular: [
//     KitapSoru(soru: '...', dogruCevap: '...', yanlisSecenekler: ['','','']),
//   ],
// )
//
// sayfalar: Her eleman bir "sayfa" – kullanıcı ileri/geri ile sayfa değiştirir.
// =============================================================================

class KitapSoru {
  final String soru;
  final String dogruCevap;
  final List<String> yanlisSecenekler;

  const KitapSoru({
    required this.soru,
    required this.dogruCevap,
    required this.yanlisSecenekler,
  });
}

class KitapSorulari {
  final String kitapAdi;
  final List<String> sayfalar;
  final List<KitapSoru> sorular;

  const KitapSorulari({
    required this.kitapAdi,
    required this.sayfalar,
    required this.sorular,
  });
}

final List<KitapSorulari> kitapListesi = [
  KitapSorulari(
    kitapAdi: 'Küçük Prens',
    sayfalar: [
      'Bir zamanlar çölde uçağı arızalanan bir pilot vardı. Tam tamir etmeye çalışırken yanına küçük bir çocuk geldi. Çocuk, "Lütfen bana bir koyun resmi çizer misin?" dedi.',
      'Pilot çocuğa baktı. Çocuk çok küçüktü ve uzak bir yıldızdan gelmişti. Kendi gezegeninde tek başına yaşıyordu. Orada bir çiçeği vardı; ona çok iyi bakıyordu.',
      'Küçük prens, "İnsanlar yıldızlara bakıyor ama ne için olduğunu unutuyor," dedi. "Benim gülüm bir yıldızda. Ona baktığımda mutlu olurum."',
      'Bir tilki de vardı. Tilki ona şunu öğretti: "Birini evcilleştirirsen, o artık senden başka kimseye benzemez. Onu tanımak için zaman harcamalısın."',
      'Küçük prens pilotla vedalaştı ve gezegenine döndü. Pilot o günden sonra yıldızlara baktığında hep onu düşündü.',
    ],
    sorular: [
      const KitapSoru(
        soru: "Küçük Prens pilotu nerede tanıdı?",
        dogruCevap: 'Çölde',
        yanlisSecenekler: ['Ormanda', 'Şehirde', 'Dağda'],
      ),
      const KitapSoru(
        soru: "Küçük Prens'in gezegeninde ne vardı?",
        dogruCevap: 'Gül',
        yanlisSecenekler: ['Papatya', 'Lale', 'Menekşe'],
      ),
      const KitapSoru(
        soru: "Tilki Küçük Prens'e ne öğretti?",
        dogruCevap: 'Evcilleştirmek',
        yanlisSecenekler: ['Uçmak', 'Yüzmek', 'Koşmak'],
      ),
      const KitapSoru(
        soru: "Pilot Küçük Prens'ten ne istedi?",
        dogruCevap: 'Koyun resmi',
        yanlisSecenekler: ['Uçak', 'Su', 'Yemek'],
      ),
    ],
  ),
  KitapSorulari(
    kitapAdi: 'Şeker Portakalı',
    sayfalar: [
      'Zeze çok küçük bir çocuktu. Ailesi yeni bir eve taşınmıştı. Bahçede bir sürü ağaç vardı ama Zeze bir tanesini çok sevdi: şeker portakalı ağacı.',
      'Zeze ona "Pingüi" adını verdi. Her gün onunla konuşurdu. "Merhaba Pingüi, bugün nasılsın?" derdi. Ağaç onun en iyi arkadaşı oldu.',
      'Bir gün Zeze okulda yeni bir öğretmenle tanıştı. Öğretmenine "Portekiz" diyorlardı. Portekiz, Zeze\'ye çok iyi davrandı ve ona şarkılar öğretti.',
      'Zeze beş yaşındaydı. Bazen yaramazlık yapardı ama kalbi çok güzeldi. Şeker portakalı ağacı onu hep dinler, sırlarını kimseye söylemezdi.',
      'Zeze büyüdüğünde bile Pingüi\'yi hiç unutmadı. O ağaç, çocukluğunun en güzel hatırası oldu.',
    ],
    sorular: [
      const KitapSoru(
        soru: "Zeze'nin en sevdiği ağaç hangisiydi?",
        dogruCevap: 'Şeker portakalı',
        yanlisSecenekler: ['Mango', 'Limon', 'Elma'],
      ),
      const KitapSoru(
        soru: "Zeze ağaca ne ad verdi?",
        dogruCevap: 'Pingüi',
        yanlisSecenekler: ['Mavi', 'Yıldız', 'Prenses'],
      ),
      const KitapSoru(
        soru: "Zeze kaç yaşındaydı?",
        dogruCevap: 'Beş',
        yanlisSecenekler: ['Dört', 'Altı', 'Yedi'],
      ),
    ],
  ),
  KitapSorulari(
    kitapAdi: 'Charlie\'nin Çikolata Fabrikası',
    sayfalar: [
      'Charlie çok fakir bir ailenin çocuğuydu. En büyük hayali Willy Wonka\'nın çikolata fabrikasını gezmekti. Wonka, dünyanın en lezzetli çikolatalarını yapıyordu.',
      'Bir gün Wonka, çikolata paketlerinin içine beş altın bilet koydu. Bu biletleri bulan çocuklar fabrikayı gezecekti. Charlie her gün bir paket çikolata aldı.',
      'Son gün Charlie sokakta yerde bir para buldu. Bir çikolata aldı ve paketi açtı. İçinde altın bilet vardı! Charlie çok sevindi.',
      'Fabrikada Charlie, Augustus, Violet, Veruca ve Mike Teavee ile tanıştı. Wonka onlara şeker nehri, sakız ağacı ve fındık odası gösterdi.',
      'Diğer çocuklar yaramazlık yaptığı için elendi. Sadece Charlie kaldı. Wonka ona fabrikayı verdi. Charlie ailesiyle birlikte orada mutlu yaşadı.',
    ],
    sorular: [
      const KitapSoru(
        soru: "Fabrikanın sahibi kimdir?",
        dogruCevap: 'Willy Wonka',
        yanlisSecenekler: ['Charlie', 'Dede Joe', 'Augustus'],
      ),
      const KitapSoru(
        soru: "Charlie altın biletini nerede buldu?",
        dogruCevap: 'Çikolata paketinde',
        yanlisSecenekler: ['Sokakta', 'Okulda', 'Marketten'],
      ),
      const KitapSoru(
        soru: "Kaç çocuk fabrikayı ziyaret etti?",
        dogruCevap: 'Beş',
        yanlisSecenekler: ['Üç', 'Dört', 'Altı'],
      ),
    ],
  ),
  KitapSorulari(
    kitapAdi: 'Pinokyo',
    sayfalar: [
      'Yaşlı ve iyi kalpli bir marangoz olan Gepetto Usta, yalnızlığını paylaşmak için tahtadan bir kukla yaptı. Ona Pinokyo adını verdi. O gece Mavi Peri gelerek Pinokyo’yu canlandırdı ancak ona dürüst bir çocuk olması gerektiğini öğütledi.',
      'Pinokyo gerçek bir çocuk olmak istiyordu. Gepetto Usta, ceketini satarak Pinokyo’ya okul kitapları aldı ve onu okula gönderdi. Ancak Pinokyo, yolda kurnaz Tilki ve Kedi ile karşılaştı. Onlara inanıp okul yerine sirk gösterisine gitti.',
      'Pinokyo ne zaman yalan söylese burnu uzamaya başlıyordu. Mavi Peri onu defalarca uyardı. Pinokyo hatalarından ders çıkarmaya çalışsa da bazen merakına yenik düşüyordu. Bir gün arkadaşlarıyla "Eğlence Adası"na gitti.',
      'Pinokyo, babası Gepetto’nun onu ararken denizde dev bir balina tarafından yutulduğunu öğrendi. Hiç korkmadan denize atladı ve balinanın midesine girerek babasını buldu. Birlikte ateş yakıp balinanın hapşırmasını sağlayarak kaçtılar.',
      'Gepetto Usta’yı kurtardığı ve dürüst bir çocuk olmaya karar verdiği için Mavi Peri son kez göründü. Pinokyo’nun tahta gövdesini gerçek bir insan vücuduna dönüştürdü. Pinokyo artık babasıyla mutlu yaşayan gerçek bir çocuktu.',
    ],
    sorular: [
      const KitapSoru(
        soru: "Pinokyo'yu kim yapmıştır?",
        dogruCevap: 'Gepetto Usta',
        yanlisSecenekler: ['Mavi Peri', 'Kurnaz Tilki', 'Sirk Sahibi'],
      ),
      const KitapSoru(
        soru: "Pinokyo yalan söylediğinde ne oluyordu?",
        dogruCevap: 'Burnu uzuyordu',
        yanlisSecenekler: ['Kulakları büyüyordu', 'Boyu kısalıyordu', 'Rengi değişiyordu'],
      ),
      const KitapSoru(
        soru: "Gepetto Usta'yı nerenin içinden kurtardı?",
        dogruCevap: 'Dev bir balinanın midesinden',
        yanlisSecenekler: ['Yüksek bir kuleden', 'Karanlık bir mağaradan', 'Eğlence adasından'],
      ),
    ],
  ),
  KitapSorulari(
    kitapAdi: 'Aslan Kral',
    sayfalar: [
      'Güneşin doğuşuyla birlikte tüm hayvanlar Gurur Kayası’na toplandı. Kral Mufasa’nın oğlu küçük Simba dünyaya gelmişti. Bilge maymun Rafiki, Simba’yı tüm krallığa tanıttı. Simba bir gün kral olacağını biliyordu.',
      'Ancak Mufasa’nın kardeşi Scar, tahtı ele geçirmek istiyordu. Scar’ın kurduğu tuzak sonucu Mufasa hayatını kaybetti. Scar, suçu küçük Simba’nın üzerine attı ve ona buralardan kaçıp bir daha asla dönmemesini söyledi.',
      'Simba yorgun halde bir ormana ulaştı. Orada neşeli bir mirket olan Timon ve bir yaban domuzu olan Pumbaa ile tanıştı. Ona "Hakuna Matata" yani "Hiç üzülme, her şeyi akışına bırak" felsefesini öğrettiler.',
      'Yıllar sonra Simba büyüdü. Eski arkadaşı Nala ile karşılaştı. Nala, krallığın Scar yüzünden çok kötü durumda olduğunu anlattı. Simba başta korksa da babasının ruhundan aldığı güçle geri dönmeye karar verdi.',
      'Simba, Gurur Kayası’na dönerek Scar ile yüzleşti. Gerçekleri tüm hayvanlar öğrendi. Kötü amcasını yenen Simba, hak ettiği krallığı geri aldı. Yağmurlar yağdı, toprak yeşerdi ve krallık eski huzuruna kavuştu.',
    ],
    sorular: [
      const KitapSoru(
        soru: "Mufasa'nın oğlunun adı nedir?",
        dogruCevap: 'Simba',
        yanlisSecenekler: ['Scar', 'Rafiki', 'Pumbaa'],
      ),
      const KitapSoru(
        soru: "Timon ve Pumbaa'nın meşhur sözü nedir?",
        dogruCevap: 'Hakuna Matata',
        yanlisSecenekler: ['Gurur Kayası', 'Aslan Yüreği', 'Yaşasın Kral'],
      ),
      const KitapSoru(
        soru: "Simba'yı krallığa tanıtan bilge maymun kimdir?",
        dogruCevap: 'Rafiki',
        yanlisSecenekler: ['Nala', 'Mufasa', 'Zazu'],
      ),
    ],
  ),
  KitapSorulari(
    kitapAdi: 'Aladdin',
    sayfalar: [
      'Aladdin, pazar yerlerinde yaşayan fakir ama çok yardımsever bir gençti. Bir gün yaşlı bir adam kılığındaki büyücü, Aladdin’den gizemli bir mağaraya girip eski bir lambayı getirmesini istedi. Mağara pırıl pırıl hazinelerle doluydu.',
      'Aladdin lambayı aldı ama büyücü onu mağaraya hapsetti. Aladdin tesadüfen lambayı ovunca içinden devasa, mavi bir Cin çıktı! Cin, sahibinin üç dileğini yerine getireceğini söyledi. Aladdin ilk dileğiyle mağaradan kurtuldu.',
      'Aladdin, güzeller güzeli Prenses Jasmine ile tanışmak istiyordu. Cin’den kendisini zengin bir prens yapmasını diledi. Görkemli bir filin üzerinde, altınlar saçarak saraya gitti. Uçan halısıyla Jasmine’i gökyüzünde bir gezintiye çıkardı.',
      'Kötü vezir Cafer, lambanın Aladdin’de olduğunu anladı ve onu çaldı. Cafer, Cin’e kendisini dünyanın en güçlü büyücüsü yapmasını emretti. Sarayı ve Jasmine’i ele geçirdi. Aladdin, zekasını kullanarak Cafer’i durdurmak için geri döndü.',
      'Aladdin, Cafer’i kandırarak onun bir cin olmasını sağladı ve onu kendi lambasına hapsetti. Son dileğinde ise Cin’i tamamen özgür bıraktı. Aladdin ve Jasmine, dürüstlük ve sevgi içinde sarayda mutlu bir hayat sürdüler.',
    ],
    sorular: [
      const KitapSoru(
        soru: "Aladdin lambayı nerede bulmuştur?",
        dogruCevap: 'Gizemli bir mağarada',
        yanlisSecenekler: ['Pazar yerinde', 'Denizin dibinde', 'Sarayın bahçesinde'],
      ),
      const KitapSoru(
        soru: "Cin, Aladdin'e kaç dilek hakkı vermiştir?",
        dogruCevap: 'Üç',
        yanlisSecenekler: ['Bir', 'Beş', 'On'],
      ),
      const KitapSoru(
        soru: "Aladdin ve Jasmine gökyüzünde ne ile gezdiler?",
        dogruCevap: 'Uçan Halı',
        yanlisSecenekler: ['Balon', 'Büyük bir kuş', 'Sihirli at'],
      ),
    ],
  ),
  KitapSorulari(
    kitapAdi: 'Alice Harikalar Diyarında',
    sayfalar: [
      'Alice, bir yaz günü ağacın altında ablasını dinlerken çok tuhaf bir şey gördü: Yelek giymiş, elinde köstekli bir saat tutan Beyaz bir Tavşan! Tavşan "Gecikiyorum!" diyerek koşuyordu. Alice merakla onun peşinden bir deliğe atladı.',
      'Upuzun bir düşüşten sonra Alice, kapılarla dolu bir odaya geldi. Bir şişedeki iksiri içince minicik oldu, bir keki yiyince dev gibi büyüdü. Sonunda bir anahtarla bahçeye açılan küçük kapıdan geçmeyi başardı.',
      'Harikalar Diyarı’nda her şey çok garipti. Bir ağacın dalında sürekli sırıtan ve aniden kaybolan Çeşir Kedisi ile karşılaştı. Kedi ona yolu tarif etti. Alice daha sonra hiç bitmeyen bir çay partisine katılan Çılgın Şapkacı’yı buldu.',
      'Alice, Kupa Kraliçesi’nin bahçesine ulaştı. Kraliçe her şeye kızıyor ve iskambil kağıdından askerlerine emirler yağdırıyordu. Alice, kraliçeyle flamingo ve kirpilerin kullanıldığı tuhaf bir oyun oynadı.',
      'Bahçede büyük bir karmaşa çıkınca Alice birden korkmadı ve "Siz sadece birer kart destesisiniz!" diye bağırdı. O anda her şey dönmeye başladı. Alice gözlerini açtığında ablasının dizindeydi. Gördüğü her şey muhteşem bir rüyaydı.',
    ],
    sorular: [
      const KitapSoru(
        soru: "Alice hangi hayvanın peşinden gitmiştir?",
        dogruCevap: 'Beyaz Tavşan',
        yanlisSecenekler: ['Sırıtan Kedi', 'Renkli Kuş', 'Küçük Fare'],
      ),
      const KitapSoru(
        soru: "Sürekli gülümseyen ve aniden kaybolan kedinin adı nedir?",
        dogruCevap: 'Çeşir Kedisi',
        yanlisSecenekler: ['Pamuk', 'Boncuk', 'Şapkacı'],
      ),
      const KitapSoru(
        soru: "Harikalar Diyarı'nın kraliçesi kimdir?",
        dogruCevap: 'Kupa Kraliçesi',
        yanlisSecenekler: ['Çiçek Kraliçesi', 'Uyuyan Güzel', 'Pamuk Prenses'],
      ),
    ],
  ),
];
