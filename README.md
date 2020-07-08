# 7/8 중간점검 제출 자료

Created: Jul 5, 2020 10:02 PM

7/8 수요일 자정까지 이메일로 보내기!!

🔴 메일 : [develop@sopt.org](mailto:develop@sopt.org)

## I-1. 팀별 컨벤션 정리 (README 파일 or 간단한 페이지로 정리)

### 1️⃣ 세화 & 인정 역할 정하기

- view 분배
    - 세화 : 캘린더 뷰, 알림 뷰
    - 인정 : 과외일지 뷰, 마이페이지 뷰
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
- Git Repository - Project 탭에 칸반보드 이용하자!
    - Notion에는 기본적인 todo 리스트 위주
    - Git 칸반보드에는 좀 더 자세히 정리하기

- 우리의 Git Workflow 최종 정리 노션 링크!

 [https://www.notion.so/inddoni/Git-workflow-7e9d12b5cc6a49ca8c0dcebe0d7ff434](https://www.notion.so/inddoni/Git-workflow-7e9d12b5cc6a49ca8c0dcebe0d7ff434)

### 3️⃣ Coding convention 정하기

- view controller : Upper Camel Case name +VC
- UI 요소 네이밍 : 이름은 Upper Camel Case
    - UI요소 + View Cell
- 변수명, 상수명, 함수명 : Lower Camel Case   ***(이것만 Lower임!!!!!!)***
- 구조체
    - View 이름 eg. Tutor.swift
- Extension 이름 : Extensions+확장클래스
- **Optional**은 gaurd let 으로 선언하기

### 4️⃣ 개발 환경 통일

- Xcode Version 11.5
- Swift5

### 5️⃣ 폴더링 방식

**Tutor_Dot_iOS**

![7%208%20addcb365f034456a922399ef215463ab/KakaoTalk_Photo_2020-07-08-18-42-01.png](7%208%20addcb365f034456a922399ef215463ab/KakaoTalk_Photo_2020-07-08-18-42-01.png)

### 6️⃣ iOS 진행상황 ~7/8

‼️ **ING**

- 캘린더뷰, 알림뷰: 세화
- 마이페이지뷰, 수업일지뷰: 인정

‼️ **TO DO**

- 스플래시
- 스플래시 애니메이션
- 회원가입, 로그인

- 최강아요 **노션 링크!!**

🌟 뷰 별 구현 방식 논의 : [https://www.notion.so/4abe8a6eefae4334a31b76b61e53db15](https://www.notion.so/4abe8a6eefae4334a31b76b61e53db15)

🌟 새로 배운 기능들 : [https://www.notion.so/66619e7b8f214fdda8580e2eb4f3d083](https://www.notion.so/66619e7b8f214fdda8580e2eb4f3d083)

🌟 아요 내 데드라인 : [https://www.notion.so/197c5ae921fe40398b638cb194b7d593](https://www.notion.so/197c5ae921fe40398b638cb194b7d593)

[튜터닷 기능 명세서](7%208%20addcb365f034456a922399ef215463ab/Untitled%20775213792350423583af6732e3bf62d7.csv)