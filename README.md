# TutorDot_iOS
핵멋있는 iOS part👩🏻‍💻



## 중간평가

### 1️⃣ 세화 & 인정 역할 정하기

- view 분배 (크게 탭바 4개, 메인뷰 두개)
  - 세화 : 캘린더 탭, 알림 탭
  - 인정 : 과외일지 탭, 마이페이지 탭
  - 추후에 역할 정할 뷰 : 스플래쉬, 로그인/회원가입 뷰
- 개발일지(노션) 작성
  - 각자 필요할 때 자유롭게 최대한 자세히 작성하기! (자주자주 기록하는 습관🤓)

### 2️⃣ Git 관련 협의 (워크플로우, 브랜치, 리드미 등)

- 워크플로우 : master(최종본) - dev(통합관리) - 각 기능별 브랜치(담당자가 관리)
- dev
  - calender_branch
  - journal_branch
  - alert_branch
  - mypage_branch
  - splash_branch
  - login_branch
- readme 작성에 대해서
  - 결론 : 틈틈히 최대한 자세히 적기 (나중에 정리)
  - 미루지 말고 작업할 때마다 기록해놓자! (기록하는 습관 잊지말긩!)
- Git commit message 형식에 대해서
  - Message는 3가지 라벨만 사용
    - **Add** : 아예 **새로운 파일(swift, storyboard, VC 파일 등)** 추가
    - **Update** : 기존 파일에 **기능, UI요소 추가**
    - **Fix** : 기존 기능 수정이나 에러 해결 등
  - Format : Message + filename + comment
- [Git Repository](https://github.com/TutorDot/TutorDot_iOS) - Project 탭에 칸반보드 이용하자!
  - Notion에는 기본적인 todo 리스트 위주
  - Git 칸반보드에는 기능 위주로 좀 더 자세히 정리하기
- 우리의 Git Workflow 최종 정리 [노션 링크](https://www.notion.so/inddoni/Git-workflow-7e9d12b5cc6a49ca8c0dcebe0d7ff434)!



### 3️⃣ code convention 정하기

- view controller : Upper Camel Case name +VC
  - `LoginVC, SplashVC`
- UI 요소 네이밍 : 이름은 Upper Camel Case
  - Collection View : 탭이름 + CV
    - `CalendarCV`
  - Table View : 탭이름 + TV
    - `JournalTV`
  - Picker View : 탭이름 : PV
- 변수명, 상수명, 함수명 : Lower Camel Case   ***(이것만 Lower임!!!!!!)\***
  - `leftButtonSelected`
- Extension 이름 : 확장클래스+Extention
  - `UIColor+Addition`
- **Optional**은 gaurd let 으로 선언하기

### 4️⃣ 개발 환경 통일

- Xcode 버전 맞추기
  - 인정 : Xcode version 11.5
  - 세화 : Xcode version 11.5
- Swift5

