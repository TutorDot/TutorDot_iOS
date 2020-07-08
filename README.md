# TutorDot iOS



> iOS 류세화, 최인정
>
> 🔴 메일 : [develop@sopt.org](mailto:develop@sopt.org)
>



## I-1. 팀별 컨벤션 정리 (README 파일 or 간단한 페이지로 정리)

### 1️⃣ 세화 & 인정 역할 분담

| View            | Git Branch      | 담당자 | 데드라인 |
| --------------- | --------------- | ------ | -------- |
| CalendarView    | calendar_branch | 세화   | ~ 7/6    |
| AlertView       | alert_branch    | 세화   | ~ 7/6    |
| JournalView     | journal_branch  | 인정   | ~ 7/8    |
| MyPageView      | mypage_branch   | 인정   | ~ 7/8    |
| SplashView      | splash_branch   | -      | ~ 7/10   |
| LoginSignUpView | login_branch    | -      | ~7/10    |

*서버연결은 7/13 ~ 7/17*



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
    - Format : Message + filename + comment
- 우리의 Git Workflow 최종 정리 [노션 링크][https://www.notion.so/inddoni/Git-workflow-7e9d12b5cc6a49ca8c0dcebe0d7ff434] 🔥



### 3️⃣ Coding convention 정하기

- view controller : Upper Camel Case 탭 이름 + VC

    - eg. `CalendarVC`, `NotesVC`

- UI 요소 네이밍 : Upper Camel Case UI요소 이름 + View Cell

    - eg. `CalendarCollectionViewCell`

    - Xib 파일은 ViewCell 파일이랑 똑같이 네이밍

- 변수명, 상수명, 함수명 : Lower Camel Case <u>*(이것만 Lower임!!!!!!)*</u>

- Extension 이름 : Extensions+확장클래스

    - eg.`Extensions+String`

- Optional은 gaurd let 으로 선언하기



### 4️⃣ 개발 환경 통일

![](https://img.shields.io/badge/Xcode-11.5-3C7DE6){:.alignleft}

![](https://img.shields.io/badge/Swift-5.0-ff69b4)



### 5️⃣ 라이브러리

✔️ Alamofire

✔️ Kingfisher

✔️ DropDown



### 6️⃣ 폴더링 방식

**Tutor_Dot_iOS**

<img width="348" alt="KakaoTalk_Photo_2020-07-08-18-42-01" src="https://user-images.githubusercontent.com/46921003/86914193-d3a14380-c15a-11ea-94a1-315d60653a02.png">



### 7️⃣ iOS 진행상황 ~7/8

‼️ **ING** **~**

- 캘린더뷰, 알림뷰: 세화
- 마이페이지뷰, 수업일지뷰: 인정

‼️ **TO DO**

- 스플래시

- 스플래시 애니메이션

- 회원가입, 로그인

  

#### 🍏 최강아요 **노션 링크!!**

> 🌟 [뷰 별 구현 방식 논의]([https://www.notion.so/4abe8a6eefae4334a31b76b61e53db15](https://www.notion.so/4abe8a6eefae4334a31b76b61e53db15))  
>
> 🌟 [새로 배운 기능들]([https://www.notion.so/66619e7b8f214fdda8580e2eb4f3d083](https://www.notion.so/66619e7b8f214fdda8580e2eb4f3d083)) 
>
> 🌟 [아요 내 데드라인]( [https://www.notion.so/197c5ae921fe40398b638cb194b7d593](https://www.notion.so/197c5ae921fe40398b638cb194b7d593)) 
>



🗒 TutorDot **기능 명세서** & iOS **진행 상황**

**<img width="1386" alt="image_1" src="https://user-images.githubusercontent.com/46921003/86914655-a3a67000-c15b-11ea-99de-7377708ed1cc.png">**

<img width="1381" alt="image_2" src="https://user-images.githubusercontent.com/46921003/86914654-a2754300-c15b-11ea-9cb9-39fe72aaded4.png">

<img width="1376" alt="image_3" src="https://user-images.githubusercontent.com/46921003/86914642-9e492580-c15b-11ea-92b6-689b44b91a62.png">

