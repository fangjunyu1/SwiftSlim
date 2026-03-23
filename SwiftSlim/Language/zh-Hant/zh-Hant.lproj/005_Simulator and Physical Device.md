# 模擬器和實體設備

到目前為止，我們已經完成了基礎視圖的構建。本節課的主要內容是學習如何在模擬器和實體設備（Physical Device）上運行 App。

我還記得第一次安裝 App 到 iPhone 上時，我非常高興，因為我可以更直觀地看到我的開發成果。這是一種正向反饋，當我們可以使用自己開發的 App 時，興趣就會推動我們自發地學習更多知識。

現在，請打開上節課完成的個人簡歷項目，準備運行模擬器和實體設備。

## 模擬器

Xcode 內置多種模擬器，涵蓋不同型號的 iPhone、iPad 以及 Apple Watch。模擬器可以驗證 App 在不同型號或版本上的界面佈局差異。

### 選擇模擬器

在 Xcode 頂部工具欄的設備列表中，選擇一個模擬器（例如 iPhone 16）。

![Swift](../../RESOURCE/005_xcode.png)

### 運行模擬器

然後點擊左上角運行按鈕。

![Swift](../../RESOURCE/005_xcode1.png)

Xcode 會自動構建項目並啓動模擬器。

![Swift](../../RESOURCE/005_xcode2.png)

### 關閉模擬器

如果需要關閉模擬器，點擊 Xcode 工具欄中的停止按鈕。

![Swift](../../RESOURCE/005_xcode3.png)

也可以直接關閉模擬器：

![Swift](../../RESOURCE/005_xcode17.png)

如果直接關閉模擬器，Xcode 可能會提示：

```
Thread 1: signal SIGTERM
```

這通常不是程式邏輯錯誤，而是因為調試進程被外部終止。通常可以忽略，不屬於應用邏輯錯誤。

相比 Xcode 預覽，模擬器更接近真實運行環境。但仍然不是完整設備環境。它適用於佈局驗證、多機型適配測試。

## 關於測試環境的優先級

在真實開發流程中，應遵循如下測試順序：

實體設備 > 模擬器 > Xcode 預覽

預覽適合快速調整 UI；模擬器適合結構性測試；最終驗證必須在實體設備上完成，特別是 iCloud 相關操作。

## 實體設備

Xcode 預覽和模擬器都可能存在顯示不準確的情況，因此實體設備具有決定性意義。系統權限、性能、通知機制等行為，只有在實體設備上才能完全驗證。

### 打開開發者模式

在 iPhone 中：

設置 → 隱私與安全性 → 開發者模式 → 開啓

![Swift](../../RESOURCE/005_xcode4.png)

系統會強制重啓設備。未開啓開發者模式將無法調試運行。

### 配置開發者團隊

Xcode 必須配置開發者團隊，否則無法對應用進行簽名並安裝。

配置流程：

項目名稱 → TARGETS → Signing & Capabilities → Team

如果顯示 "Add Account..."，說明尚未添加 Apple 賬號。

![Swift](../../RESOURCE/005_xcode5.png)

點擊添加按鈕，登錄 Apple ID。

![Swift](../../RESOURCE/005_xcode6.png)

登錄 Apple ID 後，選擇對應賬號完成開發者團隊配置。

![Swift](../../RESOURCE/005_xcode7.png)

### 連接設備

使用連接線連接 iPhone 和 Mac。

首次連接時：

- Mac 會提示是否要將 iPhone 連接到這台 Mac
- iPhone 會提示是否信任該電腦。

必須在 iPhone 上點擊“信任”並輸入鎖屏密碼。隨後，在 Xcode 設備列表中選擇你的 iPhone。

![Swift](../../RESOURCE/005_xcode9.png)

點擊左上角的運行按鈕。

![Swift](../../RESOURCE/005_xcode1.png)

Xcode 會構建並將 App 安裝到 iPhone 上。

![Swift](../../RESOURCE/005_view.png)

**無線調試**

在 iOS 11 及之後版本，Xcode 支持無線調試。

![Swift](../../RESOURCE/005_xcode18.png)

前提條件：

1. iPhone 與 Mac 首次必須使用資料線完成配對
2. iPhone 與 Mac 處於同一 Wi-Fi 網路
3. 兩台設備保持解鎖狀態

第一次使用資料線完成配對後，之後即使拔掉資料線，只要在同一網路環境中，也可以直接運行。

注意事項：

- 如果設備未出現在設備列表中，可以重新插入資料線進行連接
- Wi-Fi 調試偶爾不穩定，出現連接異常時重新插線即可
- 公司網路或隔離網路環境下可能被限制

## 常見錯誤與解決方案

在 Xcode 連接 iPhone 進行調試時，可能會遇到不同類型的報錯資訊。下面列出幾種常見問題及對應處理方式，可幫助快速定位並解決連接異常。

**1. 配對未完成**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

說明 Xcode 與 iPhone 調試配對尚未完成。

解決方案：確認 iPhone 已點擊"信任"，如果仍然報錯，重啓 Xcode 後重新連接。

**2. 未配置開發者團隊**

```
Signing for "SwiftSlimTest" requires a development team.
```

可能是未配置開發者團隊。

解決方案：在 Signing & Capabilities 中選擇已登錄的賬號。

**3. Developer Disk Image 無法掛載**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

通常出現在安裝過程中中斷（如拔線、強制停止），導致重新安裝時存在限制並報錯。

解決方案：重啓 iPhone，重新插線連接。

**4. 調試隧道連接失敗**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

該報錯常見於 VPN 或網路代理干擾。

解決方案：關閉 VPN 或網路代理後重試。

**5. 設備未解鎖**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

設備處於鎖屏狀態，解鎖 iPhone 即可。

**6. 設備未註冊**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

說明該設備未加入開發者賬號設備列表，Xcode 不能為它生成合法的描述文件來簽名並安裝 app。

解決方案：點擊 "Register Device" 自動註冊即可。

**7. 部署版本不匹配**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

表示設備系統版本低於項目最低部署版本。

修改路徑：

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

將版本調整為不高於設備系統版本。

修改後，清理構建文件夾：

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

清理完成後重新運行。