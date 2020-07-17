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


​    ![](https://img.shields.io/badge/BEMCheckBox-1.4.1-orange) 


​    ![](https://img.shields.io/badge/lottie--ios-3.1.8-9cf) 

    




### 6️⃣ 폴더링 방식

<img width="348" alt="KakaoTalk_Photo_2020-07-08-18-42-01" src="https://user-images.githubusercontent.com/46921003/86914193-d3a14380-c15a-11ea-94a1-315d60653a02.png">



### 7️⃣ 실행화면 캡쳐, 화면별 설명 & 새로 알게된 것들, 어려운 기능들



##### Splash









▶️ <u>Lottie 라이브러리를 사용하여 스플래시 화면 애니메이션 구현</u>

> Lottie 라이브러리에 animationView()를 사용하여 frame 크기와 aniamteion JSON파일을 지정해줄 수 있다. 반복할 횟수를 한번으로 지정하여 재생하도록 setup함수를 작성하였다.
```swift
let animationView = AnimationView()
func setup(){ //lottie 버전
        animationView.frame = view.bounds //animationView 크기가 view와 같게
        animationView.animation = Animation.named("data2") //어떤 jsonv파일을 쓸지
        animationView.contentMode = .scaleAspectFill //화면에 적합하게
        animationView.loopMode = .playOnce //view안에 Subview로 넣어준다,
        view.addSubview(animationView)
        animationView.play()  //재생
    }
```
▶️ <u>N초 후 자동 화면전환 구현</u>

> 스플래시화면에서 지정된 시간(초)이 지난 후 자동으로 화면이 전환되도록 구현하였다. asyncAfter 메소드에 seconds 파라미터에 시간 초를 지정해주고 함수 블록 안에 전환될 뷰를 정의하면 해당 시간이 지난 후 자동으로 화면전환이 이루어진다.
```swift
DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: { //Code }
```



##### Onboarding

<div><img src="https://user-images.githubusercontent.com/46644241/87788011-8cf8cb00-c877-11ea-9482-c638feb3b1cd.gif" width="200" height="390"/><img width="250" alt="온보딩1" src="https://user-images.githubusercontent.com/46644241/87786200-7ef57b00-c874-11ea-9200-a87242bd0c75.png">
<img width="250" alt="온보딩2" src="https://user-images.githubusercontent.com/46644241/87786208-84eb5c00-c874-11ea-955a-cc63d5e8bfea.png">
<img width="250" alt="온보딩3" src="https://user-images.githubusercontent.com/46644241/87786212-861c8900-c874-11ea-8b47-7498b43f6944.png">
  <img width="250" alt="온보딩4" src="https://user-images.githubusercontent.com/46644241/87786218-874db600-c874-11ea-93c4-1a2ddaff77a8.png"></div>

▶️ <u>오른쪽/왼쪽 Swipe로 이미지 전환</u>

> 오른쪽 / 왼쪽으로 스와이프 제스쳐에 따라 호출되는 함수에 이미지 배열에 있는 온보딩 이미지 4개의 index 값을 계산하여 각 index에 해당하는 이미지 이름을 이미지 뷰에 적용해주었고, 추가로 이미지 전환 효과를 주었다.

```Swift
@objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer
            if swipeGesture.direction == UISwipeGestureRecognizer.Direction.left
                //imege 배열 인덱스 조정하여 이미지 전환 & 알파값 조정 애니메이션 코드
            else if swipeGesture.direction == UISwipeGestureRecognizer.Direction.right
                //imege 배열 인덱스 조정하여 이미지 전환 & 알파값 조정 애니메이션 코드 
 }    
```



##### Login & SignUp

<div>
<img src="https://user-images.githubusercontent.com/46644241/87787940-6fc3fc80-c877-11ea-9ae4-77d121ea458d.gif" width="200" height="390" />
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
<img src="https://user-images.githubusercontent.com/46644241/87788022-9124e880-c877-11ea-97c2-f92d04c23e31.gif" width="200" height="390"/>



▶️ <u>키보드 열릴 때의 Animation</u>

> 아이폰 8 처럼 화면이 작거나 텍스트 필드가 뷰의 밑에 위치해있을 경우 키보드가 열렸을 때 텍스트 필드가 가려진다. 그럴때 필요한 기능 두가지인 1. 뷰의 아무곳이나 터치했을 때 키보드 닫히기 2. 텍스트필드 위로 밀리기 기능들을 로그인, 회원가입 화면에 추가했다!

```

```



**Alert**

<div> <img width="250" alt="알림" src="https://user-images.githubusercontent.com/46644241/87787828-3e4b3100-c877-11ea-9566-1405c209c72a.png"><img width="250" alt="알림-토글버튼" src="https://user-images.githubusercontent.com/46644241/87786487-f2978800-c874-11ea-85ec-9835b11c27cb.png">
<img src="https://user-images.githubusercontent.com/46644241/87787999-85d1bd00-c877-11ea-8da9-f0323f9a15dd.gif" width="200" height="390"/> </div>



<h3>수업일지

<div><img width="250" alt="일지-처음" src="https://user-images.githubusercontent.com/46644241/87787120-160f0280-c876-11ea-81d1-4c995c7c55e2.png">
<img width="250" alt="수업일지-일지수정" src="https://user-images.githubusercontent.com/46644241/87786565-16f36480-c875-11ea-92f6-547b28a0d789.png">
<img width="250" alt="수업일지-일지수정(입력)" src="https://user-images.githubusercontent.com/46644241/87786572-1955be80-c875-11ea-8bb7-f416889076b5.png">
<img width="250" alt="수업일지-토글" src="https://user-images.githubusercontent.com/46644241/87786580-1bb81880-c875-11ea-92ec-11d220d653e8.png">
<img width="250" alt="수업일지-프로그래스,버튼" src="https://user-images.githubusercontent.com/46644241/87786582-1eb30900-c875-11ea-86c4-eadd6b948ff8.png"> </div>



▶️ <u>버튼 아래로 나오는 드롭다운 박스의 offset custom하기!</u>

> ottomOffset로 아래쪽에 펼쳐지는 드롭박스의 위치를 직접 지정할 수 있다. (더 세밀하게 컨트롤 가능!) y축에 아래 코드를 쓰면 버튼 높이 만큼 offset이 지정되어 바로 아래쪽에서 드롭박스가 펼쳐지게 되는데 조금 여유를 두고 펼쳐질 수 있도록 +6(pt)을 해주었다.

```swift
dropDown?.bottomOffset = CGPoint(x: 0, y:(dropDown?.anchorView?.plainView.bounds.height)!+6)
```
▶️ <u>Constraints 조정해서 뷰 숨기기</u>

> 수업일지 뷰에서 과외를 선택했을때만 Progress View가 나오고 선택하지 않으면 Progress View를 숨기는 기능을 구현이 필요했다. 스택뷰에 해당 view를 hidden 시키고 Constranints height를 0으로 조절하는 방법으로 View를 숨기고, 보일 수 있도록 하였다.

```swift
func classHeaderHidden(_ ishide: Bool){
        progressViewWrap.subviews[0].isHidden = ishide
        if ishide  //true(안보일때)
            tableViewTopMargin.constant = 191-117
        else  //false (보일때)
            tableViewTopMargin.constant = 191
}
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
<img src="https://user-images.githubusercontent.com/46644241/87787957-7783a100-c877-11ea-8f51-3b542de82607.gif" width="200" height="390"/>
<img src="https://user-images.githubusercontent.com/46644241/87787972-7d798200-c877-11ea-87e5-5fa9de5a3d54.gif" width="200" height="390"/>
</div>





▶️ <u>테이블 뷰에서 입력된 데이터를 VC에 전달하기</u>

> 마이페이지에서 정규 수업시간을 입력하는 부분은 사용자의 입력에 따라 동적으로 텍스트 필드가 생성되도록 하기 위해 tableView로 구현하였는데, 테이블 뷰 셀 내에서 작성된 데이터를 VC로 전달하는 부분에서 어려움이 있었다. 변수에 직접데이터를 할당해보고, 리스트에 append를 해봐도 VC내 다른 함수에서 데이터를 호출하려고 하면 nil 값이 출력되었다. 이 문제를 해결하기위해 cell에 protocol을 정의하고 delegate를 설정해주었다.

```Swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell.delegate = self  // 매우중요!! tableView cellForRowAt 함수 내부에 delegate 선언
}
// Cell 파일 내부에 protocol 선언
protocol AddRegularClassTimeCellDelegate: class {
    func setScheduler(_ date: String, _ start: String, _ end: String)
}
// Cell 파일에 delegate 변수 선언 및 함수 호출
var delegate: AddRegularClassTimeCellDelegate?
if let delegate = delegate {
    delegate.setScheduler(days, startTime, endTime)
}
// 해당 VC에 extention으로 셀파일 protocol에 정의된 함수부를 구현한다.
extension MyClassAddVC: AddRegularClassTimeCellDelegate {
    func setScheduler(_ date: String, _ start: String, _ end: String) {
        let newSchedule = Schedules(day: date, orgStartTime: start, orgEndTime: end)
        schedule.append(newSchedule)
    }
}
```


▶️ <u>VC 내부의 버튼을 누를 때마다 table view Cell 동적으로 증가 시키기</u>

> VC내에 빈 리스트 regularClassTime을 두고 버튼을 눌렀을 때 리스트에 append를 해서 개수를 늘려 준 다음 tableView.reloadData()를 해주면 (테이블 row 개수는 리스트 regularClassTime.count이다) cell이 동적으로 증가된다.

```Swift
 @IBAction func regularClassAddButton(_ sender: Any) {
        regularClassTime.append("셀 추가")
        tableView.reloadData()
 }
```


▶️ <u>정규 수업시간을 입력받을 Picker View Custom 하기</u>

> 텍스트 필드에 키보드 대신 피커뷰로 입력을 받으며, toolbar의 bar button들과 피커뷰 목록을 커스텀 하여 정규 수업시간을 입력 받도록 했다. 또한 시작시간을 입력했을 때, 끝 시간이 자동으로 시작시간과 맞춰지도록 didSelectRow 함수 내에 아래 소스코드를 구현하였다.

```Swift
pickerView.delegate = self
pickerView.dataSource = self
// 이후 delegate 와 detaSource 함수를 extention으로 컴포먼트 개수 지정 및 목록 데이터 리스트 적용

if startHours[pickerView.selectedRow(inComponent: 1)] != "00" { //시작시간이 입력되었으면 끝나는 시간도 시작시간과 동일하도록 자동으로 해당 component의 wheel이 돌아가면서 설정됨
    startH = startHours[pickerView.selectedRow(inComponent: 1)]
    startrow = row
    pickerView.selectRow(startrow, inComponent: 3, animated: true)
    endH = endHours[pickerView.selectedRow(inComponent: 3)]
}
```





### 8️⃣ **TutorDot 간단한 기능 명세서 & 기능별 개발 여부, 기능별 담당자**



| 기능 이름                        | 우선 순위 | 담당자 |        뷰         | 기능 구현 여부 | 서버 연동 여부 |
| -------------------------------- | :-------: | :----: | :---------------: | -------------- | -------------- |
| 스플래시                         |    P1     |  인정  |  스플래시               | O              | -              |
| 스플래시 애니메이션              |    P3     |  인정  |  스플래시            | O              | -              |
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

