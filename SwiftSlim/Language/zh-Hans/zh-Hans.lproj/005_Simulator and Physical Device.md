# 模拟器和实体设备

到目前为止，我们已经完成了基础视图的构建。本节课的主要内容是学习如何在模拟器和实体设备（Physical Device）上运行 App。

我还记得第一次安装 App 到 iPhone 上时，我非常高兴，因为我可以更直观地看到我的开发成果。这是一种正向反馈，当我们可以使用自己开发的 App 时，兴趣就会推动我们自发地学习更多知识。

现在，请打开上节课完成的个人简历项目，准备运行模拟器和实体设备。

## 模拟器

Xcode 内置多种模拟器，涵盖不同型号的 iPhone、iPad 以及 Apple Watch。模拟器可以验证 App 在不同型号或版本上的界面布局差异。

### 选择模拟器

在 Xcode 顶部工具栏的设备列表中，选择一个模拟器（例如 iPhone 16）。

![Swift](005_xcode.png)

### 运行模拟器

然后点击左上角运行按钮。

![Swift](005_xcode1.png)

Xcode 会自动构建项目并启动模拟器。

![Swift](005_xcode2.png)

### 关闭模拟器

如果需要关闭模拟器，点击 Xcode 工具栏中的停止按钮。

![Swift](005_xcode3.png)

也可以直接关闭模拟器：

![Swift](005_xcode17.png)

如果直接关闭模拟器，Xcode 可能会提示：

```
Thread 1: signal SIGTERM
```

这通常不是程序逻辑错误，而是因为调试进程被外部终止。通常可以忽略，不属于应用逻辑错误。

相比 Xcode 预览，模拟器更接近真实运行环境。但仍然不是完整设备环境。它适用于布局验证、多机型适配测试。

## 关于测试环境的优先级

在真实开发流程中，应遵循如下测试顺序：

实体设备 > 模拟器 > Xcode 预览

预览适合快速调整 UI；模拟器适合结构性测试；最终验证必须在实体设备上完成，特别是 iCloud 相关操作。

## 实体设备

Xcode 预览和模拟器都可能存在显示不准确的情况，因此实体设备具有决定性意义。系统权限、性能、通知机制等行为，只有在实体设备上才能完全验证。

### 打开开发者模式

在 iPhone 中：

设置 → 隐私与安全性 → 开发者模式 → 开启

![Swift](005_xcode4.png)

系统会强制重启设备。未开启开发者模式将无法调试运行。

### 配置开发者团队

Xcode 必须配置开发者团队，否则无法对应用进行签名并安装。

配置流程：

项目名称 → TARGETS → Signing & Capabilities → Team

如果显示 "Add Account..."，说明尚未添加 Apple 账号。

![Swift](005_xcode5.png)

点击添加按钮，登录 Apple ID。

![Swift](005_xcode6.png)

登录 Apple ID 后，选择对应账号完成开发者团队配置。

![Swift](005_xcode7.png)

### 连接设备

使用连接线连接 iPhone 和 Mac。

首次连接时：

- Mac 会提示是否要将 iPhone 连接到这台 Mac
- iPhone 会提示是否信任该电脑。

必须在 iPhone 上点击“信任”并输入锁屏密码。随后，在 Xcode 设备列表中选择你的 iPhone。

![Swift](005_xcode9.png)

点击左上角的运行按钮。

![Swift](005_xcode1.png)

Xcode 会构建并将 App 安装到 iPhone 上。

![Swift](005_view.png)

**无线调试**

在 iOS 11 及之后版本，Xcode 支持无线调试。

![Swift](005_xcode18.png)

前提条件：

1. iPhone 与 Mac 首次必须使用数据线完成配对
2. iPhone 与 Mac 处于同一 Wi-Fi 网络
3. 两台设备保持解锁状态

第一次使用数据线完成配对后，之后即使拔掉数据线，只要在同一网络环境中，也可以直接运行。

注意事项：

- 如果设备未出现在设备列表中，可以重新插入数据线进行连接
- Wi-Fi 调试偶尔不稳定，出现连接异常时重新插线即可
- 公司网络或隔离网络环境下可能被限制

## 常见错误与解决方案

在 Xcode 连接 iPhone 进行调试时，可能会遇到不同类型的报错信息。下面列出几种常见问题及对应处理方式，可帮助快速定位并解决连接异常。

**1. 配对未完成**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](005_xcode10.png)

说明 Xcode 与 iPhone 调试配对尚未完成。

解决方案：确认 iPhone 已点击"信任"，如果仍然报错，重启 Xcode 后重新连接。

**2. 未配置开发者团队**

```
Signing for "SwiftSlimTest" requires a development team.
```

可能是未配置开发者团队。

解决方案：在 Signing & Capabilities 中选择已登录的账号。

**3. Developer Disk Image 无法挂载**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

通常出现在安装过程中中断（如拔线、强制停止），导致重新安装时存在限制并报错。

解决方案：重启 iPhone，重新插线连接。

**4. 调试隧道连接失败**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](005_xcode11.png)

该报错常见于 VPN 或网络代理干扰。

解决方案：关闭 VPN 或网络代理后重试。

**5. 设备未解锁**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](005_xcode12.png)

设备处于锁屏状态，解锁 iPhone 即可。

**6. 设备未注册**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](005_xcode13.png)

说明该设备未加入开发者账号设备列表，Xcode 不能为它生成合法的描述文件来签名并安装 app。

解决方案：点击 "Register Device" 自动注册即可。

**7. 部署版本不匹配**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](005_xcode14.png)

表示设备系统版本低于项目最低部署版本。

修改路径：

TARGETS → General → Deployment Info → Deployment Target

![Swift](005_xcode15.png)

将版本调整为不高于设备系统版本。

修改后，清理构建文件夹：

Product → Clean Build Folder Immediately

![Swift](005_xcode16.png)

清理完成后重新运行。
