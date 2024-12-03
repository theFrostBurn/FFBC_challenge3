# 음악 플레이어 앱 PRD


### Project Overview 

**프로젝트 이름**: 음악 플레이어 앱 (Flutter Cupertino 위젯 활용)

**목표**: YouTube Music의 iOS 스타일 재해석 버전으로, 직관적인 UX와 세련된 UI를 제공하는 음악 플레이어 앱 구현



### Core Functionalities

1. **홈 화면**:
- 상단 바
  • YouTube Music 스타일 로고
  • 알림, 검색, 프로필 아이콘
- 카테고리 필터 바
  • 운동, 에너지 충전, 팟캐스트 등 가로 스크롤
- 콘텐츠 영역
  • 빠른 선곡 섹션 (3x3 그리드 레이아웃)
  • 추천 플레이리스트 섹션
- 하단 미니 플레이어
  • 현재 재생곡 정보
  • 간단한 재생 컨트롤

2. **음악 재생 화면**:
- 대형 앨범아트 표시
- 곡 정보 (제목, 아티스트)
- 재생 컨트롤
  • 이전/다음 트랙
  • 재생/일시정지
  • 셔플, 반복 모드
- CupertinoSlider 기반 진행바
- 좋아요 버튼

3. **하단 네비게이션 바**:
- 홈, 샘플, 둘러보기, 보관함 탭
- CupertinoTabBar 사용
- 선택된 탭 하이라이트 효과

4. **음악 재생 기능**:
- YouTube URL 기반 음원 재생
- 백그라운드 재생 지원



### Doc

필요한 주요 패키지:
- youtube_explode_dart: ^2.0.2 (YouTube URL 파싱)
- just_audio: ^0.9.36 (오디오 재생)
- cached_network_image: ^3.3.1 (이미지 캐싱)
- provider: ^6.1.1 (상태 관리)
- flutter_bloc: ^8.1.3 (상태 관리)

UI 관련:
- cupertino_icons: ^1.0.6
- flutter_svg: ^2.0.9 (SVG 아이콘)



### File Structure

lib/
├── main.dart
├── app.dart
├── config/
│ ├── theme.dart
│ └── routes.dart
├── core/
│ ├── constants/
│ ├── errors/
│ └── utils/
├── data/
│ ├── models/
│ ├── repositories/
│ └── services/
├── domain/
│ ├── entities/
│ └── usecases/
├── presentation/
│ ├── bloc/
│ ├── pages/
│ │ ├── home/
│ │ ├── player/
│ │ ├── explore/
│ │ └── library/
│ └── widgets/
│ ├── common/
│ ├── home/
│ └── player/
└── di/
└── injection.dart

```

이 구조는 클린 아키텍처를 따르며, UI 컴포넌트와 비즈니스 로직을 명확히 분리합니다.
특히 홈 화면과 플레이어 화면의 복잡한 UI 요소들을 효율적으로 관리할 수 있도록 설계되었습니다.