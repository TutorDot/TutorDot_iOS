# 👩🏻‍🏫 과외 관리의 마침표, TutorDot

![](https://user-images.githubusercontent.com/22907830/86105632-8b4ea980-bafa-11ea-8b2d-dc329635ea07.png)



## 🍎 iOS - YB 류세화, YB 최인정 🍏

> SOPT 26기 Appjam 'TutorDot'
>
> 프로젝트 기간 2020.6.27 ~ 2020.7.18



### 1️⃣ 역할 분담

| View            | Git Branch      | 담당자 | 데드라인 |
| --------------- | --------------- | ------ | -------- |
| CalendarView    | calendar_branch | 세화   | ~ 7/6    |
| AlertView       | alert_branch    | 세화   | ~ 7/6    |
| JournalView     | journal_branch  | 인정   | ~ 7/8    |
| MyPageView      | mypage_branch   | 인정   | ~ 7/8    |
| SplashView      | splash_branch   | 인정   | ~ 7/10   |
| LoginSignUpView | login_branch    | 세화   | ~ 7/10   |



### 2️⃣ Git 관련 협의 (워크플로우, 브랜치, 리드미 등)

- 워크플로우 : master(최종본) - dev(통합관리) - 각 기능별 브랜치(담당자가 관리)
- readme 작성에 대해서
    - 결론 : 틈틈히 최대한 자세히 적기 (나중에 정리)
    - 미루지 말고 작업할 때마다 기록해놓자! (기록하는 습관 잊지말긩!)
- Git commit message 형식 통일
    - Message는 3가지 라벨만 사용
        - **Add** : 아예 **새로운 파일(swift, storyboard, VC 파일 등)** 추가
        - **Update** : 기존 파일에 **기능, UI요소 추가**
        - **Fix** : 기존 기능 수정이나 에러 해결 등
    - Format : 라벨 + commit comment
- 우리의 Git Workflow 최종 정리 [노션 링크](https://www.notion.so/inddoni/Git-workflow-7e9d12b5cc6a49ca8c0dcebe0d7ff434) 🔥





### 3️⃣ Coding Convention 정하기

- view controller : Upper Camel Case 탭 이름 + VC

    - eg. `CalendarVC`, `NotesVC`

- UI 요소 네이밍 : Upper Camel Case UI요소 이름 + View Cell

    - eg. `CalendarCollectionViewCell`

    - Xib 파일은 ViewCell 파일이랑 똑같이 네이밍

- 변수명, 상수명 : Lower Camel Case

    ```swift
    // 변수명
    var dropDownButton: UIButton!
    // 상수명
    let headerView = JournalDateHeaderView(frame: CGRect(x:0, y:0, width: 375, height: 16))
    ```

- 함수명: Lower Camel Case

    - Action 함수 네이밍: '주어+동사+목적어'

    ```swift
    func backButtonDidTap() {
      // ...
    }
    ```

- Extension 이름 : Extensions+확장클래스

    - eg.`Extensions+String`

- Optional은 gaurd let 으로 선언하기







### 4️⃣ 개발 환경 통일

​    ![](https://img.shields.io/badge/Xcode-11.5-3C7DE6)   

​    ![](https://img.shields.io/badge/Swift-5.0-ff69b4)



### 5️⃣ 라이브러리 

​    ![](https://img.shields.io/badge/Alamofire-4.8.2-B16CE6)

​    ![](https://img.shields.io/badge/Kingfisher-5.0-yellow)

​    ![](https://img.shields.io/badge/DropDown-2.3.13-E6A860)

BEMCheckBox

Lottie-iOS



### 6️⃣ 폴더링 방식

<img width="348" alt="KakaoTalk_Photo_2020-07-08-18-42-01" src="https://user-images.githubusercontent.com/46921003/86914193-d3a14380-c15a-11ea-94a1-315d60653a02.png">



### 7️⃣ 실행화면 캡쳐, 화면별 설명 & 새로 알게된 것들, 어려운 기능들



##### Splash

(이미지)

▶️ <u>키보드 열릴 때의 Animation</u>

> 아이폰 8 처럼 화면이 작거나 텍스트 필드가 뷰의 밑에 위치해있을 경우 키보드가 열렸을 때 텍스트 필드가 가려진다. 그럴때 필요한 기능 두가지인 1. 뷰의 아무곳이나 터치했을 때 키보드 닫히기 2. 텍스트필드 위로 밀리기 기능들을 로그인, 회원가입 화면에 추가했다!

```

```



##### Onboarding

<div><img width="250" alt="온보딩1" src="https://user-images.githubusercontent.com/46644241/87786200-7ef57b00-c874-11ea-9200-a87242bd0c75.png">
<img width="250" alt="온보딩2" src="https://user-images.githubusercontent.com/46644241/87786208-84eb5c00-c874-11ea-955a-cc63d5e8bfea.png">
<img width="250" alt="온보딩3" src="https://user-images.githubusercontent.com/46644241/87786212-861c8900-c874-11ea-8b47-7498b43f6944.png">
  <img width="250" alt="온보딩4" src="https://user-images.githubusercontent.com/46644241/87786218-874db600-c874-11ea-93c4-1a2ddaff77a8.png"></div>

▶️ <u>키보드 열릴 때의 Animation</u>

> 아이폰 8 처럼 화면이 작거나 텍스트 필드가 뷰의 밑에 위치해있을 경우 키보드가 열렸을 때 텍스트 필드가 가려진다. 그럴때 필요한 기능 두가지인 1. 뷰의 아무곳이나 터치했을 때 키보드 닫히기 2. 텍스트필드 위로 밀리기 기능들을 로그인, 회원가입 화면에 추가했다!

```

```



##### Login & SignUp

<div>
<img width="250" alt="로그인" src="https://user-images.githubusercontent.com/46644241/87786134-64230680-c874-11ea-9dd0-bfd101e65a14.png"> <img width="250" alt="회원가입-기본" src="https://user-images.githubusercontent.com/46644241/87787202-35a62b00-c876-11ea-846f-22c682de743b.png">
<img width="250" alt="회원가입-키보드" src="https://user-images.githubusercontent.com/46644241/87787478-aa796500-c876-11ea-8076-7aee9cb74017.png">
</div>





▶️ <u>키보드 열릴 때의 Animation</u>

> 아이폰 8 처럼 화면이 작거나 텍스트 필드가 뷰의 밑에 위치해있을 경우 키보드가 열렸을 때 텍스트 필드가 가려진다. 그럴때 필요한 기능 두가지인 1. 뷰의 아무곳이나 터치했을 때 키보드 닫히기 2. 텍스트필드 위로 밀리기 기능들을 로그인, 회원가입 화면에 추가했다!

```swift
    // 탭했을 때 키보드 action
    func initGestureRecognizer() { //
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        self.view.addGestureRecognizer(textFieldTap)
    }
    
    // 다른 위치 탭했을 때 키보드 없어지는 코드
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) { //
        self.emailTextField.resignFirstResponder()
        self.passWordTextField.resignFirstResponder()
    }
    
    func registerForKeyboardNotifications() { //
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // 키보드가 생길 떄 텍스트 필드 위로 밀기
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return }
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardHeight: CGFloat // 키보드의 높이
        if #available(iOS 11.0, *) {
            keyboardHeight = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
        } else {
            keyboardHeight = keyboardFrame.cgRectValue.height
        }
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            self.imageView.alpha = 0 // 이미지뷰 숨기기
            self.imageToTextHeightConstraint.constant = 0 // constraint 조정
            self.bottomViewConstraint.constant = +keyboardHeight/2 + 100 // constraint 조정
        })
        self.view.layoutIfNeeded()
    }
    
```



##### Calendar

<div><img width="250" alt="캘린더-오늘날짜,다른날짜" src="https://user-images.githubusercontent.com/46644241/87786381-d1369c00-c874-11ea-8916-53be21a62a8f.png">
<img width="250" alt="캘린더-일정없는날" src="https://user-images.githubusercontent.com/46644241/87786389-d398f600-c874-11ea-81a6-7512d30bc176.png">
<img width="250" alt="캘린더-토글버튼" src="https://user-images.githubusercontent.com/46644241/87786402-d7c51380-c874-11ea-95ec-93103d015faa.png">
<img width="250" alt="캘린더-일정편집" src="https://user-images.githubusercontent.com/46644241/87786925-c7616880-c875-11ea-967a-cba8d91502d6.png">
<img width="250" alt="캘린더-일정추가피커뷰" src="https://user-images.githubusercontent.com/46644241/87786942-ccbeb300-c875-11ea-85aa-e70ee5ab4621.png">
<img width="250" alt="캘린더-일정추가" src="https://user-images.githubusercontent.com/46644241/87786946-cf210d00-c875-11ea-8f82-f6e755803070.png"></div>



▶️ <u>키보드 열릴 때의 Animation</u>

> 아이폰 8 처럼 화면이 작거나 텍스트 필드가 뷰의 밑에 위치해있을 경우 키보드가 열렸을 때 텍스트 필드가 가려진다. 그럴때 필요한 기능 두가지인 1. 뷰의 아무곳이나 터치했을 때 키보드 닫히기 2. 텍스트필드 위로 밀리기 기능들을 로그인, 회원가입 화면에 추가했다!

```

```



**Alert**

<div> <img width="250" alt="알림-기본" src="https://user-images.githubusercontent.com/46644241/87786475-edd2d400-c874-11ea-817b-715ab61d38a2.png">
<img width="250" alt="알림-토글버튼" src="https://user-images.githubusercontent.com/46644241/87786487-f2978800-c874-11ea-85ec-9835b11c27cb.png"> </div>



**Notes**

<div><img width="250" alt="일지-처음" src="https://user-images.githubusercontent.com/46644241/87787120-160f0280-c876-11ea-81d1-4c995c7c55e2.png">
<img width="250" alt="수업일지-일지수정" src="https://user-images.githubusercontent.com/46644241/87786565-16f36480-c875-11ea-92f6-547b28a0d789.png">
<img width="250" alt="수업일지-일지수정(입력)" src="https://user-images.githubusercontent.com/46644241/87786572-1955be80-c875-11ea-8bb7-f416889076b5.png">
<img width="250" alt="수업일지-토글" src="https://user-images.githubusercontent.com/46644241/87786580-1bb81880-c875-11ea-92ec-11d220d653e8.png">
<img width="250" alt="수업일지-프로그래스,버튼" src="https://user-images.githubusercontent.com/46644241/87786582-1eb30900-c875-11ea-86c4-eadd6b948ff8.png"> </div>



▶️ <u>키보드 열릴 때의 Animation</u>

> 아이폰 8 처럼 화면이 작거나 텍스트 필드가 뷰의 밑에 위치해있을 경우 키보드가 열렸을 때 텍스트 필드가 가려진다. 그럴때 필요한 기능 두가지인 1. 뷰의 아무곳이나 터치했을 때 키보드 닫히기 2. 텍스트필드 위로 밀리기 기능들을 로그인, 회원가입 화면에 추가했다!

```

```



**MyPage**



<div>
<img width="250" alt="마이페이지-개발자정보" src="https://user-images.githubusercontent.com/46644241/87786619-37bbba00-c875-11ea-94fc-eb2b957e40b4.png">
<img width="250" alt="마이페이지-기본" src="https://user-images.githubusercontent.com/46644241/87786630-3d190480-c875-11ea-820c-4c2927366c30.png">
<img width="250" alt="마이페이지-로그아웃" src="https://user-images.githubusercontent.com/46644241/87786634-4013f500-c875-11ea-8ed2-665e1e65bc3f.png">
<img width="250" alt="마이페이지-서비스탈퇴" src="https://user-images.githubusercontent.com/46644241/87786640-430ee580-c875-11ea-827b-178e799ea31f.png">
<img width="250" alt="마이페이지-수업정보" src="https://user-images.githubusercontent.com/46644241/87786655-4c984d80-c875-11ea-9569-e1f5fa9adc29.png">
<img width="250" alt="마이페이지-수업추가" src="https://user-images.githubusercontent.com/46644241/87786665-4efaa780-c875-11ea-9f54-b24b1af4159c.png">
<img width="250" alt="마이페이지-수업해제" src="https://user-images.githubusercontent.com/46644241/87786674-528e2e80-c875-11ea-8100-361d8e5a14a7.png">
<img width="250" alt="마이페이지-프로필수정" src="https://user-images.githubusercontent.com/46644241/87786679-55891f00-c875-11ea-97c3-c8f866fda237.png">
<img width="250" alt="초대코드" src="https://user-images.githubusercontent.com/46644241/87787342-700fc800-c876-11ea-8def-951c250b9b1e.png">
</div>





▶️ <u>키보드 열릴 때의 Animation</u>

> 아이폰 8 처럼 화면이 작거나 텍스트 필드가 뷰의 밑에 위치해있을 경우 키보드가 열렸을 때 텍스트 필드가 가려진다. 그럴때 필요한 기능 두가지인 1. 뷰의 아무곳이나 터치했을 때 키보드 닫히기 2. 텍스트필드 위로 밀리기 기능들을 로그인, 회원가입 화면에 추가했다!

```

```





### 8️⃣ **TutorDot 간단한 기능 명세서 & 기능별 개발 여부, 기능별 담당자**



| 기능 이름                        | 우선 순위 | 담당자 |        뷰         | 기능 구현 여부 | 서버 연동 여부 |
| -------------------------------- | :-------: | :----: | :---------------: | -------------- | -------------- |
| 스플래시                         |    P1     |  인정  |                   | O              | -              |
| 스플래시 애니메이션              |    P3     |  인정  |                   | O              | -              |
| 앱 설명 온보딩                   |    P2     |  인정  | 회원가입 & 로그인 | O              | -              |
| 회원가입  & 역할 선택            |    P1     |  세화  | 회원가입 & 로그인 | O              | O              |
| 이용약관, 개인정보보호정책       |    P3     |  세화  | 회원가입 & 로그인 | O              | △              |
| 로그인                           |    P1     |  세화  | 회원가입 & 로그인 | O              | O              |
| 자동 로그인                      |    P3     |  세화  | 회원가입 & 로그인 | O              | △              |
| 회원가입/로그인 서버 연동        |    P3     |  세화  | 회원가입 & 로그인 | O              | O              |
| 캘린더토글                       |    P1     |  세화  |      캘린더       | O              | O              |
| 캘린더 월 변경 (좌우  화살표)    |    P1     |  세화  |      캘린더       | O              | O              |
| 캘린더에 수업 일정 표시          |    P1     |  세화  |      캘린더       | O              | O              |
| 선택 날짜의 일정 표시            |    P1     |  세화  |      캘린더       | O              | O              |
| 플로팅 버튼 +                    |    P1     |  세화  |      캘린더       | O              | O              |
| 일정 정보 화면                   |    P1     |  세화  |      캘린더       | O              | O              |
| 일정 편집/삭제                   |    P2     |  세화  |      캘린더       | O              | X              |
| 일정 추가                        |    P1     |  세화  |      캘린더       | O              | △              |
| 캘린더 서버 연동                 |    P3     |  세화  |      캘린더       | O              | O              |
| 수업일지토글                     |    P1     |  인정  |     수업일지      | O              | X              |
| 수업 일지 (월 단위)              |    P1     |  인정  |     수업일지      | △              | X              |
| 수업 일지 수정 (입력)            |    P1     |  인정  |     수업일지      | O              | X              |
| 수업 일지 월 변경 (좌우  화살표) |    P3     |  인정  |     수업일지      | △              | X              |
| 과외 시간 달성률  (막대그래프)   |    P2     |  인정  |     수업일지      | △              | X              |
| 튜티 일지 편집 방지              |    P3     |  인정  |     수업일지      | X              | X              |
| 수업 일지 서버 연동              |    P3     |  인정  |     수업일지      | X              | X              |
| 알림토글                         |    P1     |  세화  |       알림        | O              | △              |
| 알림                             |    P1     |  세화  |       알림        | O              | X              |
| 알림 삭제, 확인 기능             |    P2     |  세화  |       알림        | O              | X              |
| 데이터에 따른 알림 메시지        |    P2     |  세화  |       알림        | X              | X              |
| 간편 프로필                      |    P1     |  인정  |      내정보       | O              | X              |
| 프로필 편집                      |    P2     |  인정  |      내정보       | O              | X              |
| 수업 버튼                        |    P1     |  인정  |      내정보       | O              | X              |
| 수업 버튼의 프로필               |    P2     |  인정  |      내정보       | O              | X              |
| 수업 추가                        |    P1     |  인정  |      내정보       | O              | △              |
| 수업 초대                        |    P1     |  인정  |      내정보       | O              | X              |
| 초대 코드                        |    P1     |  인정  |      내정보       | △              | X              |
| 수업 정보                        |    P1     |  인정  |      내정보       | O              | X              |
| 수업 정보 편집                   |    P2     |  인정  |      내정보       | O              | X              |
| 계좌 정보 복사 버튼              |    P2     |  인정  |      내정보       | X              | -              |
| 내정보 서버 연동                 |    P3     |  인정  |      내정보       | X              | X              |
| 버전 정보                        |    P3     |  인정  |      내정보       | O              | -              |
| 개발자 정보                      |    P3     |  인정  |      내정보       | O              | -              |
| 로그아웃                         |    P3     |  인정  |      내정보       | O              | -              |

