import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:final_project_edspert/presentation/utils/border_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/html_style_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:final_project_edspert/presentation/utils/widgets/app_bar_default.dart';
import 'package:final_project_edspert/presentation/utils/widgets/text_button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class KerjakanSoalPage extends StatefulWidget {
  final String namaPelajaran;
  final String namaPaketSoal;

  const KerjakanSoalPage({
    super.key,
    required this.namaPelajaran,
    required this.namaPaketSoal,
  });

  @override
  State<KerjakanSoalPage> createState() => _KerjakanSoalPageState();
}

class _KerjakanSoalPageState extends State<KerjakanSoalPage> {
  int _currentSoal = 1;
  final _exercises = [
    {
      "exercise_id_fk": "28",
      "bank_question_id": "217",
      "question_title":
          "<p style=\"text-align: justify;\">Kalimat manakah yang memuat kesalahan penggunaan huruf kapital, <em>kecuali</em>?</p>",
      "question_title_img": null,
      "option_a":
          "<p>Penyakit kencing manis dapat diatasi menggunakan ramuan dari petai Cina.</p>",
      "option_a_img": null,
      "option_b":
          "<p>Donald Trump adalah petahana dari Partai Republik dalam Pemilihan Presiden Amerika Serikat.</p>",
      "option_b_img": null,
      "option_c":
          "<p>Pemerintah menetapkan bahasa Indonesia sebagai mata pelajaran wajib bagi semua jenjang.</p>",
      "option_c_img": null,
      "option_d":
          "<p>Undang-Undang Cipta Kerja baru saja ditandatangani presiden Joko Widodo.</p>",
      "option_d_img": null,
      "option_e":
          "<p>Satgas Penanganan Covid-19 mengimbau Puskesmas agar melakukan pendataan awal pasien.</p>",
      "option_e_img": null,
      "student_answer": "D"
    },
    {
      "exercise_id_fk": "28",
      "bank_question_id": "218",
      "question_title":
          "<p style=\"text-align: justify;\"><strong><em>Perhatikan penggunaan huruf kapital pada kutipan di bawah ini!</em></strong></p>\r\n<p style=\"text-align: justify;\">Salah satu tempat populer di kabupaten Magelang adalah gunung tidar. Gunung ini berada pada ketinggian 503 Meter di atas permukaan laut dan dikenal dengan sebutan paku tanah Jawa. Gunung tidar menjadi pusat latihan akademi militer untuk mengamalkan sapta marga.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Perbaikan huruf kapital yang tepat adalah ....</p>",
      "question_title_img": null,
      "option_a":
          "<p style=\"text-align: justify;\">Kabupaten Magelang, gunung Tidar, 503 meter di atas permukaan laut, paku Tanah Jawa, Akademi Militer, Sapta marga</p>",
      "option_a_img": null,
      "option_b":
          "<p style=\"text-align: justify;\">Kabupaten Magelang, Gunung Tidar, 503 Meter di atas permukaan laut, paku tanah Jawa, akademi militer, Sapta Marga</p>",
      "option_b_img": null,
      "option_c":
          "<p style=\"text-align: justify;\">Kabupaten Magelang, Gunung Tidar, 503 meter di atas permukaan laut, Paku Tanah Jawa, Akademi Militer, Sapta Marga</p>",
      "option_c_img": null,
      "option_d":
          "<p style=\"text-align: justify;\">Kabupaten Magelang, gunung Tidar, 503 Meter di Atas Permukaan Laut, Paku Tanah Jawa, akademi militer, sapta marga</p>",
      "option_d_img": null,
      "option_e":
          "<p style=\"text-align: justify;\">Kabupaten Magelang, Gunung Tidar, 503 meter di atas permukaan laut, paku Tanah Jawa, akademi militer, sapta marga</p>",
      "option_e_img": null,
      "student_answer": "D"
    },
    {
      "exercise_id_fk": "28",
      "bank_question_id": "219",
      "question_title":
          "<p><strong><em>Cermati kutipan di bawah ini!</em></strong></p>\r\n<p style=\"text-align: justify;\">Lubang hitam adalah objek paling misterius di alam. Lubang ini membelokkan ruang dan waktu dengan cara ekstrem dan mengandung sebuah ketidakmungkinan Matematika. Pada 6 Oktober lalu, Komite Lembaga Hadiah Nobel mengumumkan bahwa Penghargaan Nobel 2020 bidang Fisika diberikan kepada tiga orang, yaitu Sir Roger Penrose, Reinhard Genzel, dan Andrea Ghez.&nbsp;</p>\r\n<p><em>Diadaptasi dari: theconversation.com</em></p>\r\n<p>&nbsp;</p>\r\n<p style=\"text-align: justify;\">Perbaikan penulisan huruf kapital yang tepat adalah ....</p>",
      "question_title_img": null,
      "option_a": "<p>Lubang Hitam</p>",
      "option_a_img": null,
      "option_b": "<p>matematika</p>",
      "option_b_img": null,
      "option_c": "<p>komite Lembaga Hadiah Nobel</p>",
      "option_c_img": null,
      "option_d": "<p>Penghargaan nobel</p>",
      "option_d_img": null,
      "option_e": "<p>sir Roger Penrose</p>",
      "option_e_img": null,
      "student_answer": "D"
    },
    {
      "exercise_id_fk": "28",
      "bank_question_id": "220",
      "question_title":
          "<p><strong><em>Bacalah paragraf berikut!</em></strong></p>\r\n<p style=\"text-align: justify;\">&nbsp; &nbsp; (1) Koalisi Masyarakat Sipil untuk Akses Vaksinasi bagi Masyarakat Adat dan Kelompok Rentan mengapresiasi terbitnya Surat Edaran Kementerian Kesehatan yang menghapus nomor induk kependudukan dari persyaratan&nbsp;vaksinasi. (2) Dengan demikian, masyarakat adat dan kelompok rentan lainnya yang belum memiliki NIK dapat mengikuti vaksinasi. (3) \"Tanpa juknis dan juklak yang terpadu, surat edaran itu berisiko menjadi kertas kosong yang tak ampuh menjawab tantangan akses vaksinasi bagi masyarakat adat, disabilitas, dan kelompok rentan lain,\" ujar Sekretaris Jenderal Aliansi Masyarakat Adat Nusantara, Rukka Sombolinggi,&nbsp;lewat keterangan tertulis, Selasa, 17 Agustus 2021.&nbsp;</p>\r\n<p style=\"text-align: justify;\">&nbsp; &nbsp; (4) Awal Agustus lalu, Kementerian Kesehatan telah mengeluarkan Surat Edaran Nomor HK.02.02/III/15242/2021 tentang Pelaksanaan Vaksinasi bagi Masyarakat Rentan dan Masyarakat Lainnya yang Belum Memiliki NIK. (5) Lewat edaran tersebut, dinas kesehatan diminta berkoordinasi dengan instansi perangkat daerah provinsi dan perangkat daerah kabupaten/kota terkait pelaksanaan vaksinasi bagi masyarakat rentan, salah satunya kelompok masyarakat adat.<br /><em>Diadaptasi dari: </em><a href=\"https://nasional.tempo.co/\"><em>https://nasional.tempo.co/</em></a></p>\r\n<p>&nbsp;</p>\r\n<p>Kesalahan penulisan huruf kapital terdapat pada kalimat nomor ....</p>",
      "question_title_img": null,
      "option_a": "<p>1</p>",
      "option_a_img": null,
      "option_b": "<p>2</p>",
      "option_b_img": null,
      "option_c": "<p>3</p>",
      "option_c_img": null,
      "option_d": "<p>4</p>",
      "option_d_img": null,
      "option_e": "<p>5</p>",
      "option_e_img": null,
      "student_answer": "D"
    },
    {
      "exercise_id_fk": "28",
      "bank_question_id": "221",
      "question_title":
          "<p>Kalimat manakah yang terdapat kesalahan penggunaan huruf kapital?</p>",
      "question_title_img": null,
      "option_a":
          "<p style=\"text-align: justify;\">Gubernur Daerah Istimewa Yogyakarta&nbsp;memimpin Peringatan Ulang Tahun ke-76 Republik Indonesia di Istana Kepresidenan Gedung Agung Yogyakarta.</p>",
      "option_a_img": null,
      "option_b":
          "<p style=\"text-align: justify;\">Perdana Menteri Inggris Boris Johnson membela rute yang diambil oleh kapal perusak Angkatan Laut Kerajaan.</p>",
      "option_b_img": null,
      "option_c":
          "<p style=\"text-align: justify;\">Lembaga Penerbangan dan Antariksa Nasional Sumedang berhasil melakukan pengamatan terhadap Planet Saturnus dan Jupiter.</p>",
      "option_c_img": null,
      "option_d":
          "<p style=\"text-align: justify;\">Berdasarkan data&nbsp; Lembaga Ilmu Pengetahuan Indonesia,&nbsp;tumbuhan kantong semar&nbsp;tersebar mulai dari Australia Bagian Utara, Asia Tenggara, hingga Cina Bagian Selatan.&nbsp;</p>",
      "option_d_img": null,
      "option_e":
          "<p style=\"text-align: justify;\">Tari piring yang berasal dari Provinsi Sumatera Barat telah ada sejak delapan ratus tahun lalu dan terus berkembang dalam budaya Minangkabau.&nbsp;</p>",
      "option_e_img": null,
      "student_answer": "D"
    },
    {
      "exercise_id_fk": "28",
      "bank_question_id": "222",
      "question_title":
          "<p>Penulisan huruf kapital yang tidak tepat adalah ....</p>",
      "question_title_img": null,
      "option_a":
          "<p style=\"text-align: justify;\">Menteri Keuangan memproyeksikan defisit Anggaran Pendapatan Belanja Negara (APBN) akan lebih kecil hingga akhir tahun 2021.</p>",
      "option_a_img": null,
      "option_b":
          "<p style=\"text-align: justify;\">Televisi Republik Indonesia (TVRI) merupakan jaringan televisi pertama di Indonesia yang mulai mengudara pada 24 Agustus 1962.</p>",
      "option_b_img": null,
      "option_c":
          "<p style=\"text-align: justify;\">Ketentuan mengenai surat izin mengemudi (SIM) kategori C resmi berubah pada Agustus 2021 dibagi dalam tiga jenis golongan.</p>",
      "option_c_img": null,
      "option_d":
          "<p style=\"text-align: justify;\">Badan Perencanaan Pembangunan Nasional (BAPPENAS) menyelenggarakan Konferensi Air Minum dan Sanitasi (KSAN) 2021.</p>",
      "option_d_img": null,
      "option_e":
          "<p style=\"text-align: justify;\">Komisi Pemilihan Umum (KPU) menegaskan pemilihan umum (pemilu) dan pemilihan kepala daerah (pilkada) digelar serentak pada 2024.</p>",
      "option_e_img": null,
      "student_answer": "D"
    },
    {
      "exercise_id_fk": "28",
      "bank_question_id": "223",
      "question_title":
          "<p><strong><em>Cermati penggunaan huruf kapital paragraf di bawah!</em></strong></p>\r\n<p style=\"text-align: justify;\">&nbsp; &nbsp; &nbsp;(1) Rusia segera uji coba tahap akhir senjata nuklir hipersonik barunya sebagai sinyal peringatan kepada NATO yang dianggap \"memprovokasi konflik\" karena melakukan latihan perang di Laut Hitam. (2) Peringatan Rusia kepada NATO digambarkan saat Moskwa mengumumkan rencana uji coba akhir senjata nuklir hipersonik terbaru yang memiliki kecepatan 15.880 mph. (3) Senjata nuklir hipersonik baru Rusia itu digadang tidak dapat dihindari oleh perisai pertahanan militer AS dan dapat menghancurkan area seluas Inggris dan Wales atau Texas. (4) Senjata nuklir hipersonik baru milik Rusia itu adalah generasi kelima dari Peluru Kendali (rudal) balistik antarbenua dengan propelan cair berbasis silo yang disebut RS-28 Sarmat, tetapi dijuluki di Barat sebagai Satan-2.(5) Melansir <em>The Sun</em> pada Jumat (6/8/2021), pengumuman mengejutkan dari Rusia itu keluar beberapa hari setelah diketahui bahwa ada lebih dari dua ribu pasukan dan tiga puluh kapal, termasuk dari Inggris, ambil bagian dalam latihan NATO <em>Breeze</em> 2021 di Laut Hitam.</p>\r\n<p><em>Diadaptasi dari: kompas.com</em></p>\r\n<p>&nbsp;</p>\r\n<p>Kesalahan penulisan huruf kapital terdapat pada kalimat bernomor ....</p>",
      "question_title_img": null,
      "option_a": "<p>1</p>",
      "option_a_img": null,
      "option_b": "<p>2</p>",
      "option_b_img": null,
      "option_c": "<p>3</p>",
      "option_c_img": null,
      "option_d": "<p>4</p>",
      "option_d_img": null,
      "option_e": "<p>5</p>",
      "option_e_img": null,
      "student_answer": "D"
    },
    {
      "exercise_id_fk": "28",
      "bank_question_id": "224",
      "question_title": "<p>Penulisan huruf kapital yang tepat, yaitu ....</p>",
      "question_title_img": null,
      "option_a":
          "<p style=\"text-align: justify;\">Keberagaman sosial budaya (sosbud) disebabkan oleh beragamnya suku bangsa serta kekayaan budaya di Indonesia.</p>",
      "option_a_img": null,
      "option_b":
          "<p style=\"text-align: justify;\">Menteri Kesehatan (Menkes) Budi Gunadi Sadikin adalah mantan wakil menteri BUMN.</p>",
      "option_b_img": null,
      "option_c":
          "<p style=\"text-align: justify;\">Warga memadati toko serba ada (Toserba) untuk memenuhi kebutuhan sehari-hari selama masa pandemi.&nbsp;</p>",
      "option_c_img": null,
      "option_d":
          "<p style=\"text-align: justify;\">Menko Marves Luhut Binsar mengatakan bahwa isolasi paling baik dilakukan di lokasi Isolasi Terpusat (Isoter).</p>",
      "option_d_img": null,
      "option_e":
          "<p style=\"text-align: justify;\">Ketua perhimpunan hotel dan restoran Indonesia (PHRI) mengeluhkan PPKM darurat.</p>",
      "option_e_img": null,
      "student_answer": "D"
    },
    {
      "exercise_id_fk": "28",
      "bank_question_id": "225",
      "question_title":
          "<p style=\"text-align: justify;\">Melalui Surat Menteri Sekretaris Negara Nomor B.446/M/S/TU.00.04/06/2021 tertanggal 16 Juni 2021, Menteri Sekretaris Negara (Mensesneg) Pratikno menyampaikan tema dan logo Peringatan HUT ke-76 RI kepada seluruh jajaran pemerintah daerah (Pemda).</p>\r\n<p>&nbsp;</p>\r\n<p>Perbaikan penggunaan huruf kapital yang sesuai ialah ....</p>",
      "question_title_img": null,
      "option_a": "<p><em>Nomor</em> seharusnya ditulis <em>nomor</em></p>",
      "option_a_img": null,
      "option_b":
          "<p><em>Mensesneg</em> seharusnya ditulis <em>mensesneg</em></p>",
      "option_b_img": null,
      "option_c":
          "<p><em>Peringatan</em> seharusnya ditulis <em>peringatan</em></p>",
      "option_c_img": null,
      "option_d":
          "<p>&nbsp;</p>\r\n<p><em>HUT</em> seharusnya ditulis <em>hut</em></p>\r\n<p>&nbsp;</p>",
      "option_d_img": null,
      "option_e": "<p><em>Pemda</em> seharusnya ditulis <em>pemda</em></p>",
      "option_e_img": null,
      "student_answer": "D"
    },
    {
      "exercise_id_fk": "28",
      "bank_question_id": "226",
      "question_title":
          "<p>Berikut adalah penulisan judul yang tepat, <em>kecuali </em>....</p>",
      "question_title_img": null,
      "option_a":
          "<p style=\"text-align: justify;\">Kisah Perang: Invasi Soviet ke Afghanistan yang Berujung Lahirnya Taliban</p>",
      "option_a_img": null,
      "option_b":
          "<p style=\"text-align: justify;\">RAPBN 2022, Pemulihan dan Keberlanjutan ke Depan</p>",
      "option_b_img": null,
      "option_c":
          "<p style=\"text-align: justify;\">Serba-Serbi Harapan di Tengah Karut-Marut Pandemi</p>",
      "option_c_img": null,
      "option_d":
          "<p style=\"text-align: justify;\">iPhone Kuasai Transaksi Uang dari Penjualan Gawai</p>",
      "option_d_img": null,
      "option_e":
          "<p style=\"text-align: justify;\">Pengaruh Pandemi Covid-19 terhadap Kesehatan Fisik hingga Mental&nbsp;</p>",
      "option_e_img": null,
      "student_answer": "D"
    }
  ]
      .map(
        (e) => {
          ...e,
          "choosed": null,
        },
      )
      .toList();
  final _onBottomSheetDelay = const Duration(milliseconds: 350);
  final _onPressDurationDelay = const Duration(milliseconds: 150);

  bool _isModalKumpulkanActive = false;
  double _opacityBottomSheet = 0;
  double _bottomSheetPositionedBottom = -308;

  @override
  Widget build(BuildContext context) {
    final isAllChoosed = _exercises.fold(
      true,
      (previousValue, element) => previousValue && element["choosed"] != null,
    );
    return Scaffold(
      appBar: AppBarDefault.make(
        title: 'Latihan Soal',
      ),
      body: SafeArea(
        child: Container(
          color: ColorsApp.backgroundPage,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 46,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var i = 1; i <= _exercises.length; i++) ...[
                          SizedBox(
                            width: 23,
                            height: 23,
                            child: TextButton(
                              onPressed: () {
                                _currentSoal = i;
                                setState(() {});
                              },
                              style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(
                                  EdgeInsets.zero,
                                ),
                                shape: MaterialStatePropertyAll(
                                  CircleBorder(
                                    side: BorderSide(
                                      color: ColorsApp.secondary,
                                      width: i == _currentSoal ? 3 : 1,
                                    ),
                                  ),
                                ),
                                overlayColor: MaterialStateColor.resolveWith(
                                  (states) {
                                    const Set<MaterialState> interactiveStates =
                                        <MaterialState>{
                                      MaterialState.pressed,
                                    };
                                    if (states
                                        .any(interactiveStates.contains)) {
                                      return ColorsApp.secondary
                                          .withOpacity(0.375);
                                    }
                                    return ColorsApp.secondary
                                        .withOpacity(0.25);
                                  },
                                ),
                                iconColor: MaterialStateColor.resolveWith(
                                  (states) {
                                    return Colors.black.withOpacity(0.5);
                                  },
                                ),
                                backgroundColor: MaterialStatePropertyAll(
                                  _exercises[i - 1]["choosed"] != null
                                      ? ColorsApp.primary
                                      : ColorsApp.offWhite,
                                ),
                                foregroundColor: MaterialStatePropertyAll(
                                  _exercises[i - 1]["choosed"] != null
                                      ? ColorsApp.offWhite
                                      : ColorsApp.primary,
                                ),
                                textStyle: MaterialStatePropertyAll(
                                  TextStyleApp.largeTextDefault.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.5,
                                  ),
                                ),
                              ),
                              child: Text(i.toString()),
                            ),
                          ),
                          if (i < 20) const SizedBox(width: 10),
                        ]
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 25,
                      ),
                      children: [
                        Text(
                          'Soal Nomor $_currentSoal',
                          style: TextStyleApp.largeTextDefault.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: ColorsApp.titleDisable,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Html(
                          onLinkTap: (url, _, __, ___) async => url != null
                              ? await launchUrl(
                                  Uri.parse(url),
                                  mode: LaunchMode.externalApplication,
                                )
                              : () {},
                          data: _exercises[_currentSoal - 1]["question_title"]
                              as String,
                          style: HtmlStyleApp.soalStyle,
                        ),
                        const SizedBox(height: 25.5),
                        for (var i = 65,
                                choosed =
                                    _exercises[_currentSoal - 1]["choosed"];
                            i < 70;
                            i++) ...[
                          TextButton(
                            onPressed: () async {
                              return await Future.delayed(
                                _onPressDurationDelay,
                                () {
                                  _exercises[_currentSoal - 1]["choosed"] =
                                      choosed == String.fromCharCode(i)
                                          ? null
                                          : String.fromCharCode(i);
                                  setState(() {});
                                },
                              );
                            },
                            style: ButtonStyle(
                              padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                  vertical: 23,
                                  horizontal: 23,
                                ),
                              ),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 1,
                                    color: ColorsApp.line,
                                  ),
                                  borderRadius: BorderApp.radius1,
                                ),
                              ),
                              overlayColor: MaterialStateColor.resolveWith(
                                (states) {
                                  const Set<MaterialState> interactiveStates =
                                      <MaterialState>{
                                    MaterialState.pressed,
                                  };
                                  if (states.any(interactiveStates.contains)) {
                                    return ColorsApp.secondary
                                        .withOpacity(0.375);
                                  }
                                  return ColorsApp.secondary.withOpacity(0.25);
                                },
                              ),
                              iconColor: MaterialStateColor.resolveWith(
                                (states) {
                                  return Colors.black.withOpacity(0.5);
                                },
                              ),
                              backgroundColor: MaterialStatePropertyAll(
                                String.fromCharCode(i) == choosed
                                    ? ColorsApp.primary
                                    : ColorsApp.background,
                              ),
                              foregroundColor: MaterialStatePropertyAll(
                                String.fromCharCode(i) == choosed
                                    ? ColorsApp.offWhite
                                    : ColorsApp.titleActive,
                              ),
                              textStyle: MaterialStatePropertyAll(
                                TextStyleApp.largeTextDefault.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${String.fromCharCode(i)}.'),
                                const SizedBox(width: 7),
                                Flexible(
                                  child: Html(
                                    data: _exercises[_currentSoal - 1][
                                            "option_${String.fromCharCode(i).toLowerCase()}"]
                                        as String,
                                    style: String.fromCharCode(i) == choosed
                                        ? HtmlStyleApp.jawabanChoosedStyle
                                        : HtmlStyleApp.jawabanStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                        const SizedBox(height: 14),
                        if (isAllChoosed || _currentSoal < _exercises.length)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 135,
                                child: TextButtonApp.textButtonCustom2(
                                  isAllChoosed ? 'Kumpulkan' : 'Selanjutnya',
                                  textStyle:
                                      TextStyleApp.largeTextDefault.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                  onPressed: () async {
                                    return await Future.delayed(
                                        _onPressDurationDelay,
                                        isAllChoosed
                                            ? _onBottomSheetOpen
                                            : _onSelanjutnya);
                                  },
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              if (_isModalKumpulkanActive) ...[
                Positioned.fill(
                  child: AnimatedContainer(
                    color: Colors.black.withOpacity(_opacityBottomSheet),
                    duration: _onBottomSheetDelay,
                  ),
                ),
                AnimatedPositioned(
                  duration: _onBottomSheetDelay,
                  bottom: _bottomSheetPositionedBottom,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onVerticalDragUpdate: (details) {
                      if (details.localPosition.dy > 0) {
                        setState(() {
                          _bottomSheetPositionedBottom =
                              -details.localPosition.dy;
                        });
                      }
                    },
                    onVerticalDragEnd: (_) {
                      final needClose = _bottomSheetPositionedBottom < -308 / 2;
                      if (needClose) {
                        _onBottomSheetClose();
                      } else {
                        setState(() {
                          _bottomSheetPositionedBottom = 0;
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 308,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 36,
                        vertical: 10,
                      ),
                      decoration: const BoxDecoration(
                        color: ColorsApp.offWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 89,
                            height: 6,
                            decoration: BoxDecoration(
                              color: const Color(0xFFC4C4C4),
                              borderRadius: BorderApp.radius0,
                            ),
                          ),
                          const SizedBox(height: 22),
                          Image.asset("assets/illustrations/kumpulkan.png"),
                          const SizedBox(height: 9),
                          Text(
                            'Kumpulkan latihan soal sekarang?',
                            style: TextStyleApp.largeTextDefault.copyWith(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Boleh langsung kumpulin dong',
                            style: TextStyleApp.largeTextDefault.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: ColorsApp.titleDisable,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButtonApp.textButtonCustom3(
                                'Nanti dulu',
                                onPressed: _onBottomSheetClose,
                              ),
                              const SizedBox(width: 13),
                              TextButtonApp.textButtonCustom2(
                                'Ya',
                                onPressed: () => Navigator.popAndPushNamed(
                                  context,
                                  RouterApp.hasilPage,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  _onSelanjutnya() {
    _currentSoal++;
    setState(() {});
  }

  _onBottomSheetOpen() {
    _isModalKumpulkanActive = true;
    setState(() {});
    Future.delayed(_onPressDurationDelay - const Duration(milliseconds: 100),
        () {
      setState(() {
        _opacityBottomSheet = 0.5;
        _bottomSheetPositionedBottom = 0;
      });
    });
  }

  _onBottomSheetClose() {
    setState(() {
      _opacityBottomSheet = 0.0;
      _bottomSheetPositionedBottom = -380.0;
    });
    Future.delayed(_onBottomSheetDelay + _onPressDurationDelay, () {
      _isModalKumpulkanActive = false;
      setState(() {});
    });
  }
}
