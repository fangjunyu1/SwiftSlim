# 시뮬레이터와 실제 기기

지금까지 우리는 기본적인 뷰 구성을 완성했습니다. 이번 수업의 주요 내용은 시뮬레이터와 실제 기기(Physical Device)에서 App을 실행하는 방법을 배우는 것입니다.

제가 처음으로 App을 iPhone에 설치했을 때를 아직도 기억합니다. 제 개발 결과를 더 직관적으로 확인할 수 있어서 정말 기뻤습니다. 이것은 일종의 긍정적인 피드백입니다. 우리가 직접 만든 App을 실제로 사용할 수 있게 되면, 흥미가 더 많은 지식을 자발적으로 배우게 하는 원동력이 됩니다.

이제 지난 수업에서 완성한 개인 이력서 프로젝트를 열고, 시뮬레이터와 실제 기기 실행을 준비해 봅시다.

## 시뮬레이터

Xcode에는 다양한 시뮬레이터가 내장되어 있으며, 여러 모델의 iPhone, iPad, Apple Watch를 지원합니다. 시뮬레이터는 서로 다른 기종이나 버전에서 App의 화면 레이아웃 차이를 확인하는 데 유용합니다.

### 시뮬레이터 선택

Xcode 상단 툴바의 기기 목록에서 하나의 시뮬레이터(예: iPhone 16)를 선택합니다.

![Swift](../../RESOURCE/005_xcode.png)

### 시뮬레이터 실행

그다음 왼쪽 상단의 실행 버튼을 클릭합니다.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode가 자동으로 프로젝트를 빌드하고 시뮬레이터를 실행합니다.

![Swift](../../RESOURCE/005_xcode2.png)

### 시뮬레이터 종료

시뮬레이터를 종료해야 할 경우, Xcode 툴바의 정지 버튼을 클릭합니다.

![Swift](../../RESOURCE/005_xcode3.png)

또는 시뮬레이터를 직접 닫을 수도 있습니다:

![Swift](../../RESOURCE/005_xcode17.png)

시뮬레이터를 직접 닫으면, Xcode에 다음과 같은 메시지가 표시될 수 있습니다:

```
Thread 1: signal SIGTERM
```

이것은 보통 프로그램 로직 오류가 아니라, 디버깅 프로세스가 외부에서 종료되었기 때문에 나타나는 현상입니다. 일반적으로 무시해도 되며, 앱 로직 문제에 해당하지 않습니다.

Xcode 미리보기와 비교하면, 시뮬레이터는 실제 실행 환경에 더 가깝습니다. 하지만 여전히 완전한 실제 기기 환경은 아닙니다. 시뮬레이터는 레이아웃 확인, 여러 기기 대응 테스트에 적합합니다.

## 테스트 환경 우선순위에 대해

실제 개발 흐름에서는 다음 순서로 테스트하는 것이 좋습니다:

실제 기기 > 시뮬레이터 > Xcode 미리보기

미리보기는 UI를 빠르게 조정하는 데 적합하고, 시뮬레이터는 구조적 테스트에 적합합니다. 최종 검증은 반드시 실제 기기에서 해야 하며, 특히 iCloud 관련 기능은 꼭 실제 기기에서 확인해야 합니다.

## 실제 기기

Xcode 미리보기와 시뮬레이터는 모두 표시가 부정확한 경우가 있을 수 있으므로, 실제 기기는 결정적인 의미를 가집니다. 시스템 권한, 성능, 알림 메커니즘 같은 동작은 실제 기기에서만 완전히 검증할 수 있습니다.

### 개발자 모드 켜기

iPhone에서:

설정 → 개인정보 보호 및 보안 → 개발자 모드 → 켜기

![Swift](../../RESOURCE/005_xcode4.png)

시스템이 기기를 강제로 재시동합니다. 개발자 모드를 켜지 않으면 디버깅 실행을 할 수 없습니다.

### 개발자 팀 설정

Xcode는 반드시 개발자 팀이 설정되어 있어야 하며, 그렇지 않으면 앱에 서명해서 설치할 수 없습니다.

설정 경로:

프로젝트 이름 → TARGETS → Signing & Capabilities → Team

"Add Account..."가 보이면, 아직 Apple 계정이 추가되지 않았다는 뜻입니다.

![Swift](../../RESOURCE/005_xcode5.png)

추가 버튼을 눌러 Apple ID로 로그인합니다.

![Swift](../../RESOURCE/005_xcode6.png)

Apple ID에 로그인한 뒤, 해당 계정을 선택해 개발자 팀 설정을 완료합니다.

![Swift](../../RESOURCE/005_xcode7.png)

### 기기 연결

케이블을 사용해 iPhone과 Mac을 연결합니다.

처음 연결할 때는:

- Mac에서 이 iPhone을 이 Mac에 연결할 것인지 묻는 메시지가 나옵니다
- iPhone에서는 이 컴퓨터를 신뢰할 것인지 묻는 메시지가 나옵니다

iPhone에서 반드시 "신뢰"를 누르고 잠금 해제 암호를 입력해야 합니다. 그 후 Xcode의 기기 목록에서 자신의 iPhone을 선택합니다.

![Swift](../../RESOURCE/005_xcode9.png)

왼쪽 상단의 실행 버튼을 클릭합니다.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode가 App을 빌드하여 iPhone에 설치합니다.

![Swift](../../RESOURCE/005_view.png)

**무선 디버깅**

iOS 11 및 이후 버전에서는 Xcode가 무선 디버깅을 지원합니다.

![Swift](../../RESOURCE/005_xcode18.png)

전제 조건:

1. iPhone과 Mac은 처음 한 번은 반드시 케이블로 페어링해야 합니다
2. iPhone과 Mac이 같은 Wi-Fi 네트워크에 있어야 합니다
3. 두 기기 모두 잠금 해제 상태여야 합니다

한 번 케이블로 페어링을 완료하면, 이후에는 케이블을 뽑아도 같은 네트워크 환경 안에서 직접 실행할 수 있습니다.

주의 사항:

- 기기가 목록에 나타나지 않으면 케이블을 다시 연결해 보세요
- Wi-Fi 디버깅은 가끔 불안정할 수 있으므로, 연결 이상이 생기면 다시 케이블을 꽂으면 됩니다
- 회사 네트워크나 분리된 네트워크 환경에서는 제한될 수 있습니다

## 자주 만나는 오류와 해결 방법

Xcode에서 iPhone을 연결해 디버깅할 때, 여러 종류의 오류 메시지를 만날 수 있습니다. 아래에는 자주 보이는 문제와 그에 대한 처리 방법을 정리했습니다. 빠르게 원인을 파악하고 연결 문제를 해결하는 데 도움이 됩니다.

**1. 페어링이 완료되지 않음**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

이는 Xcode와 iPhone의 디버깅 페어링이 아직 끝나지 않았다는 뜻입니다.

해결 방법: iPhone에서 "신뢰"를 눌렀는지 확인하고, 그래도 오류가 나면 Xcode를 재시작한 뒤 다시 연결합니다.

**2. 개발자 팀이 설정되지 않음**

```
Signing for "SwiftSlimTest" requires a development team.
```

개발자 팀이 설정되지 않았을 수 있습니다.

해결 방법: Signing & Capabilities에서 로그인된 계정을 선택합니다.

**3. Developer Disk Image를 마운트할 수 없음**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

보통 설치 과정이 중단되었을 때(예: 케이블 분리, 강제 중지) 발생하며, 다시 설치할 때 제한이 생겨 오류가 나타납니다.

해결 방법: iPhone을 재시동하고 케이블을 다시 연결합니다.

**4. 디버그 터널 연결 실패**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

이 오류는 VPN이나 네트워크 프록시의 간섭으로 자주 발생합니다.

해결 방법: VPN 또는 네트워크 프록시를 끄고 다시 시도합니다.

**5. 기기가 잠겨 있음**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

기기가 잠금 화면 상태이므로, iPhone의 잠금을 해제하면 됩니다.

**6. 기기가 등록되지 않음**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

이것은 해당 기기가 개발자 계정의 기기 목록에 추가되지 않았다는 뜻이며, Xcode가 유효한 provisioning profile을 만들어 App에 서명하고 설치할 수 없습니다.

해결 방법: "Register Device"를 클릭해 자동 등록하면 됩니다.

**7. 배포 버전 불일치**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

이 메시지는 기기 시스템 버전이 프로젝트 최소 배포 버전보다 낮다는 뜻입니다.

수정 경로:

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

버전을 기기 시스템 버전보다 높지 않게 조정합니다.

수정 후에는 빌드 폴더를 정리합니다:

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

정리가 끝난 뒤 다시 실행합니다。
