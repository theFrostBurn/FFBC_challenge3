import '../../domain/entities/track.dart';

/// 카테고리별 트랙 데이터
class TrackData {
  /// 전체 트랙 리스트
  static const allTracks = <Track>[
    Track(
      id: '1',
      title: 'Perfect Night',
      artist: 'LE SSERAFIM',
      thumbnailUrl: 'https://i.ytimg.com/vi/V6TEcoNUmc8/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=V6TEcoNUmc8&si=cDUBl2Nld3QG21gE',
    ),
    Track(
      id: '2',
      title: 'Seven (feat. Latto)',
      artist: 'Jung Kook',
      thumbnailUrl: 'https://i.ytimg.com/vi/G7Vixoao0bM/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=G7Vixoao0bM&si=FfJtPnkL3LHtLDZG',
    ),
    Track(
      id: '3',
      title: 'Super Shy',
      artist: 'NewJeans',
      thumbnailUrl: 'https://i.ytimg.com/vi/KHouJsSH4PM/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=KHouJsSH4PM&si=E2Qa3IpamrSQXX02',
    ),
    Track(
      id: '4',
      title: 'Smoke (feat. 창모)',
      artist: '다이나믹 듀오',
      thumbnailUrl: 'https://i.ytimg.com/vi/Dk9L4P1qP2g/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=Dk9L4P1qP2g&si=Enw4_NS8ln2qCI47',
    ),
    Track(
      id: '5',
      title: 'Anti-Hero',
      artist: 'Taylor Swift',
      thumbnailUrl: 'https://i.ytimg.com/vi/w14rSMl35ro/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=w14rSMl35ro&si=POKYjt12LgrZ9Pwz',
    ),
    Track(
      id: '6',
      title: 'River Flows in You',
      artist: 'Yiruma',
      thumbnailUrl: 'https://i.ytimg.com/vi/8INLhu9Dh60/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=8INLhu9Dh60&si=a3CyGKw8ClTvA_eW',
    ),
  ];

  /// K-POP 트랙 리스트
  static const kpopTracks = <Track>[
    Track(
      id: 'k1',
      title: 'ETA',
      artist: 'NewJeans',
      thumbnailUrl: 'https://i.ytimg.com/vi/-2FO1giGos4/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=-2FO1giGos4&si=nDBaxvOH1kqKV0KH',
    ),
    Track(
      id: 'k2',
      title: 'Queencard',
      artist: '(G)I-DLE',
      thumbnailUrl: 'https://i.ytimg.com/vi/VsOAxkSPy2w/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=VsOAxkSPy2w&si=RoMOftrDFSZxQwCb',
    ),
    Track(
      id: 'k3',
      title: 'Spicy',
      artist: 'aespa',
      thumbnailUrl: 'https://i.ytimg.com/vi/u4KggZ2_U8E/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=u4KggZ2_U8E&si=tTw53z8xUb_-RHVr',
    ),
    Track(
      id: 'k4',
      title: 'Fast Forward',
      artist: 'Jungkook',
      thumbnailUrl: 'https://i.ytimg.com/vi/2xAFQKfQs90/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=2xAFQKfQs90&si=wttbcVOG18-W6Weq',
    ),
    Track(
      id: 'k5',
      title: 'ISTJ',
      artist: 'NCT DREAM',
      thumbnailUrl: 'https://i.ytimg.com/vi/c7BFBVIACEs/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=c7BFBVIACEs&si=Ji2xGTruk7hi-Rs3',
    ),
    Track(
      id: 'k6',
      title: 'Butter',
      artist: 'BTS',
      thumbnailUrl: 'https://i.ytimg.com/vi/5M5mpnpElv0/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=5M5mpnpElv0&si=TVEUmSEPhQFyfZzs',
    ),
  ];

  /// Hip-hop 트랙 리스트
  static const hiphopTracks = <Track>[
    Track(
      id: 'h1',
      title: 'Ditto',
      artist: '염따',
      thumbnailUrl: 'https://i.ytimg.com/vi/X_oKpbSTax0/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=X_oKpbSTax0&si=XPeu7cDeajlVfe7s',
    ),
    Track(
      id: 'h2',
      title: '쉬어 (feat. MINO)',
      artist: 'BE\'O',
      thumbnailUrl: 'https://i.ytimg.com/vi/BfI89YxNzVY/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=BfI89YxNzVY&si=tEX3jifaZUsDyFHD',
    ),
    Track(
      id: 'h3',
      title: 'ASAP',
      artist: '식케이 (Sik-K)',
      thumbnailUrl: 'https://i.ytimg.com/vi/h9R33iFMBbY/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=h9R33iFMBbY&si=glsF_NWZ4-eQ_2O6',
    ),
    Track(
      id: 'h4',
      title: 'IndiGO',
      artist: '저스디스 (JUSTHIS)',
      thumbnailUrl: 'https://i.ytimg.com/vi/HBqH4uJS0PU/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=HBqH4uJS0PU&si=6-ZSRNRBtMZRtTU7',
    ),
    Track(
      id: 'h5',
      title: 'ZOOM',
      artist: 'Jessi',
      thumbnailUrl: 'https://i.ytimg.com/vi/HkiaLCniIj8/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=HkiaLCniIj8&si=o1Gj-cIdKvcSRDRz',
    ),
    Track(
      id: 'h6',
      title: '잠수이별 (Dive)',
      artist: 'GSoul',
      thumbnailUrl: 'https://i.ytimg.com/vi/cJ-KtgbuId0/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=cJ-KtgbuId0&si=R3vYqLCNzmIQQr-s',
    ),
  ];

  /// POP 트랙 리스트
  static const popTracks = <Track>[
    Track(
      id: 'p1',
      title: 'Vampire',
      artist: 'Olivia Rodrigo',
      thumbnailUrl: 'https://i.ytimg.com/vi/-hUX3-eXmUE/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=-hUX3-eXmUE&si=HGXzoZT552ZUrJZZ',
    ),
    Track(
      id: 'p2',
      title: 'Anti-Hero',
      artist: 'Taylor Swift',
      thumbnailUrl: 'https://i.ytimg.com/vi/kdOS94IjzzE/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=kdOS94IjzzE&si=1A0t1FIyvOuPEbf8',
    ),
    Track(
      id: 'p3',
      title: 'Flowers',
      artist: 'Miley Cyrus',
      thumbnailUrl: 'https://i.ytimg.com/vi/SZiwpL62to8/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=SZiwpL62to8&si=wHIcaUVwXCPZZRUl',
    ),
    Track(
      id: 'p4',
      title: 'Cruel Summer',
      artist: 'Taylor Swift',
      thumbnailUrl: 'https://i.ytimg.com/vi/XCkpalH6Ppk/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=XCkpalH6Ppk&si=tSo3oNbetxShE-dc',
    ),
    Track(
      id: 'p5',
      title: 'Paint The Town Red',
      artist: 'Doja Cat',
      thumbnailUrl: 'https://i.ytimg.com/vi/aFoqCI75WoY/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=aFoqCI75WoY&si=LOhcGZU2t9qXsXTb',
    ),
    Track(
      id: 'p6',
      title: 'Last Night',
      artist: 'Morgan Wallen',
      thumbnailUrl: 'https://i.ytimg.com/vi/kkI_K_rvfa0/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=kkI_K_rvfa0&si=2OoRMnvP-pF0pvFN',
    ),
  ];

  /// Indie 트랙 리스트
  static const indieTracks = <Track>[
    Track(
      id: 'i1',
      title: '우리의 밤은 당신의 낮보다 아름답다',
      artist: '새소년',
      thumbnailUrl: 'https://i.ytimg.com/vi/cWN7SD7kX5k/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=cWN7SD7kX5k&si=Atrtgyxo-ZH2FGLK',
    ),
    Track(
      id: 'i2',
      title: '긴 밤',
      artist: '서동환',
      thumbnailUrl: 'https://i.ytimg.com/vi/cWN7SD7kX5k/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=cWN7SD7kX5k&si=Atrtgyxo-ZH2FGLK',
    ),
    Track(
      id: 'i3',
      title: '파도',
      artist: '혁오',
      thumbnailUrl: 'https://i.ytimg.com/vi/DhQyzPJf0X4/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=DhQyzPJf0X4&si=3Di-eRP2pNutkErd',
    ),
    Track(
      id: 'i4',
      title: '시간을 거슬러',
      artist: '잔나비',
      thumbnailUrl: 'https://i.ytimg.com/vi/DhQyzPJf0X4/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=DhQyzPJf0X4&si=3Di-eRP2pNutkErd',
    ),
    Track(
      id: 'i5',
      title: '너의 번호를 누르고',
      artist: '#안녕',
      thumbnailUrl: 'https://i.ytimg.com/vi/R9TPed_ohKM/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=R9TPed_ohKM&si=O5hnUO_1FU61as8j',
    ),
    Track(
      id: 'i6',
      title: '나의 사춘기에게',
      artist: '볼빨간사춘기',
      thumbnailUrl: 'https://i.ytimg.com/vi/yfPFy7i7XjY/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=yfPFy7i7XjY&si=HHJNWWE2nRRoYVqz',
    ),
  ];

  /// 릴렉스 트랙 리스트
  static const relaxTracks = <Track>[
    Track(
      id: 'r1',
      title: 'Kiss The Rain',
      artist: 'Yiruma',
      thumbnailUrl: 'https://i.ytimg.com/vi/ZYua8nujCFU/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=ZYua8nujCFU&si=e6716_o8dLn7n204',
    ),
    Track(
      id: 'r2',
      title: 'River Flows in You',
      artist: 'Yiruma',
      thumbnailUrl: 'https://i.ytimg.com/vi/XLj72wrprlM/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=XLj72wrprlM&si=C1oklm11a7qyGkkU',
    ),
    Track(
      id: 'r3',
      title: 'Comptine d\'un autre été',
      artist: 'Yann Tiersen',
      thumbnailUrl: 'https://i.ytimg.com/vi/Rrj8SG-x4tY/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=Rrj8SG-x4tY&si=mvC8vUWe_IxL97l2',
    ),
    Track(
      id: 'r4',
      title: 'Experience',
      artist: 'Ludovico Einaudi',
      thumbnailUrl: 'https://i.ytimg.com/vi/PEFsO4YgC4k/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=PEFsO4YgC4k&si=GrkrqNrXjqpub9pR',
    ),
    Track(
      id: 'r5',
      title: 'Nuvole Bianche',
      artist: 'Ludovico Einaudi',
      thumbnailUrl: 'https://i.ytimg.com/vi/tQRt_P_-EHg/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=tQRt_P_-EHg&si=7qpu-K93KXM7NtSW',
    ),
    Track(
      id: 'r6',
      title: 'Summer',
      artist: 'Joe Hisaishi',
      thumbnailUrl: 'https://i.ytimg.com/vi/7Jan-2W-IdY/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=7Jan-2W-IdY&si=iI2M7WkCaZYhRXko',
    ),
  ];

  /// Trend Hot 6 트랙 리스트
  static const trendTracks = <Track>[
    Track(
      id: 't1',
      title: 'Seven (feat. Latto)',
      artist: 'Jung Kook',
      thumbnailUrl: 'https://i.ytimg.com/vi/G7Vixoao0bM/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=G7Vixoao0bM&si=FfJtPnkL3LHtLDZG',
    ),
    Track(
      id: 't2',
      title: 'Super Shy',
      artist: 'NewJeans',
      thumbnailUrl: 'https://i.ytimg.com/vi/5McUFZz2s-w/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=5McUFZz2s-w&si=sQinDA6xbaTWQzay',
    ),
    Track(
      id: 't3',
      title: 'ETA',
      artist: 'NewJeans',
      thumbnailUrl: 'https://i.ytimg.com/vi/MR2ela9evnk/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=MR2ela9evnk&si=M5UsQaNYmqcLTqo8',
    ),
    Track(
      id: 't4',
      title: 'Fast Forward',
      artist: 'Jungkook',
      thumbnailUrl: 'https://i.ytimg.com/vi/tkzYyEp4zB4/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=tkzYyEp4zB4&si=-wJu0WbKWa4pkEjA',
    ),
    Track(
      id: 't5',
      title: 'Queencard',
      artist: '(G)I-DLE',
      thumbnailUrl: 'https://i.ytimg.com/vi/B1kJ9RnHZ9o/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=B1kJ9RnHZ9o&si=tiMVaG6vX1Iu3yvD',
    ),
    Track(
      id: 't6',
      title: 'Spicy',
      artist: 'aespa',
      thumbnailUrl: 'https://i.ytimg.com/vi/Rkbc16ExAFY/hqdefault.jpg',
      videoUrl:
          'https://music.youtube.com/watch?v=Rkbc16ExAFY&si=ahBVqm7RVlmtrNlh',
    ),
  ];
}
