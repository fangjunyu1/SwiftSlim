# Xcode 알아보기

## Xcode란 무엇인가

Xcode는 Apple이 공식적으로 제공하는 통합 개발 환경(IDE, Integrated Development Environment)으로, iOS, macOS, watchOS, tvOS 등 Apple 플랫폼 앱을 개발하는 데 사용됩니다.

![Swift](../../RESOURCE/001_xcode.png)

이후의 전체 학습 과정에서도 우리는 계속 Xcode를 사용해 코드를 작성하고 프로그램을 실행하게 됩니다.

이번 수업에서는 Xcode를 다운로드하는 방법, 첫 번째 iOS 앱 프로젝트를 만드는 방법, 그리고 Xcode 화면 구성을 처음으로 익히는 내용을 배웁니다.

## Xcode 다운로드

현재 Xcode는 두 가지 방법으로 설치할 수 있습니다.

1、[Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12)에서 다운로드

2、[Apple Developer 공식 웹사이트](https://developer.apple.com/xcode/)에서 다운로드

두 방식 모두 Xcode를 다운로드할 수 있습니다. 차이점은 Apple Developer 공식 웹사이트에서는 정식 버전 외에도 [Beta](https://developer.apple.com/download/all/?q=Xcode) 버전이나 과거 버전도 받을 수 있다는 점입니다.

단순히 개발을 배우는 목적이라면 정식 버전을 사용하는 것을 권장합니다. Beta 버전은 주로 새로운 기능을 테스트하기 위한 것이며, 불안정할 수 있습니다.

## 첫 번째 프로젝트 만들기

Xcode를 열면 시작 화면이 보입니다.

![Swift](../../RESOURCE/001_xcode1.png)

왼쪽에는 자주 사용하는 세 가지 옵션이 있습니다.

- Create New Project —— 새 프로젝트 만들기  
- Clone Git Repository —— Git 저장소 복제  
- Open Existing Project —— 기존 프로젝트 열기

오른쪽에는 최근에 연 Xcode 프로젝트가 표시됩니다.

우리는 "Create New Project" 옵션을 선택합니다.

### 프로젝트 템플릿 선택

![Swift](../../RESOURCE/001_xcode2.png)

프로젝트 템플릿 선택 화면으로 들어가면, 여러 플랫폼(iOS, macOS 등)과 다양한 유형의 프로젝트 템플릿이 표시됩니다.

자주 보게 되는 템플릿 설명:
- App —— 가장 기본적인 앱 유형(추천)
- Document App —— 문서 기반 앱
- Game —— 게임 개발용
- Framework —— 재사용 가능한 모듈

입문 단계에서는 "iOS" - "App" 템플릿만 선택하면 됩니다. 이것이 가장 기본적인 화면형 앱 프로젝트이기 때문입니다.

"Next"를 클릭합니다.

### 프로젝트 정보 입력

이제 프로젝트 정보 입력 화면으로 들어갑니다. 각 항목의 의미에 따라 내용을 입력해야 합니다.

![Swift](../../RESOURCE/001_xcode3.png)

각 필드의 의미:

- Product Name —— 프로젝트 이름, 예: SwiftSlimTest
- Team —— 개발자 팀. 유료 Apple Developer 계정이 없다면 선택하지 않아도 됩니다
- Organization Identifier —— 조직 식별자. 일반적으로 역방향 도메인 형식을 사용합니다. 예:
  - com.yourname
  - com.yourcompany
  - 도메인이 없다면 자신의 영문 이름을 식별자로 사용할 수 있습니다
- Bundle Identifier —— 앱의 고유 식별자. Organization Identifier와 Product Name을 기반으로 자동 생성됩니다
- Interface —— 화면 기술. SwiftUI 선택
- Language —— 개발 언어. Swift 선택
- Testing System —— 기본적으로 테스트 타깃(Unit Tests)이 생성되며, 입문 단계에서는 무시해도 됩니다
- Storage —— 로컬 데이터 영속화 프레임워크. SwiftData 또는 Core Data를 자동 통합할 수 있으며, 입문 단계에서는 무시해도 됩니다

입력을 마친 뒤 "Next"를 클릭합니다.

### 프로젝트 저장

![Swift](../../RESOURCE/001_xcode4.png)

적절한 폴더를 선택해 저장합니다.

"Create" 버튼을 클릭하면 Xcode가 자동으로 프로젝트 구조를 생성합니다.

## Xcode 프로젝트 구조

Xcode 프로젝트를 저장한 뒤 Finder에서 생성된 프로젝트 폴더를 확인할 수 있습니다.

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— 이미지, App 아이콘 등 리소스를 저장하는 폴더

- ContentView.swift —— 기본으로 생성되는 SwiftUI view 파일이며, 이후 여기에서 화면 코드를 작성하게 됩니다

- SwiftSlimTestApp.swift —— 앱 진입 파일(App Entry Point)로, 앱 실행을 담당합니다. 지금은 아직 자세히 알 필요 없습니다

- SwiftSlimTest.xcodeproj —— Xcode 프로젝트 파일로, 이 파일을 더블 클릭하면 프로젝트가 열립니다

## Xcode 화면 알아보기

.xcodeproj 파일을 더블 클릭해 프로젝트를 열고, 왼쪽 Navigator 영역에서 ContentView.swift 파일을 선택합니다.

Xcode 화면은 크게 다섯 영역으로 구성됩니다.

- Navigator —— 파일 구조 확인, 검색 등을 위한 탐색 영역
- Editor —— Swift 또는 SwiftUI 코드를 작성하는 편집 영역
- Canvas —— SwiftUI 미리보기를 표시하는 캔버스 영역
- Inspector —— 파일 속성을 보고 수정하는 속성 검사 영역
- Debug Area —— 로그 출력을 확인하는 디버그 영역

![Swift](../../RESOURCE/001_xcode6.png)

주의: Canvas는 주로 SwiftUI view 미리보기에 사용됩니다. Xcode의 공식 구조 관점에서 보면, 이것은 Editor를 보조하는 Preview Pane입니다. SwiftUI view 파일을 열었을 때만 Canvas를 활성화할 수 있으며, 다른 유형의 파일에서는 미리보기 기능이 표시되지 않습니다.

이후 수업에서는 주로 Editor 영역에서 Swift와 SwiftUI 코드를 작성하게 됩니다.

처음 Xcode 프로젝트를 열었을 때는 Inspector와 Debug Area가 기본적으로 숨겨져 있을 수 있습니다. 이 경우 오른쪽 위와 오른쪽 아래의 버튼을 클릭해 표시할 수 있습니다.

![Swift](../../RESOURCE/001_xcode7.png)

팁: Inspector 영역은 주로 파일 속성을 확인하고 수정하는 데 사용됩니다. 실제 개발에서는 더 넓은 편집 공간을 확보하기 위해 보통 이 영역을 숨겨 두는 경우가 많습니다.

## 정리

이번 수업에서는 Xcode를 다운로드하는 방법, 첫 번째 Xcode 프로젝트를 만드는 방법, 그리고 기본적인 Xcode 화면 구성을 배웠습니다.

이제는 자유롭게 둘러볼 시간입니다:
- Navigator 영역에서 파일을 생성하고 삭제해 보기  
- Editor 영역의 코드를 살펴보며 구조를 관찰해 보기
- Canvas 영역의 버튼을 눌러 미리보기 화면을 확대하거나 축소해 보기

다음 수업에서는 간단한 코드를 직접 써 보면서 Xcode를 더 자세히 이해해 보겠습니다。  
