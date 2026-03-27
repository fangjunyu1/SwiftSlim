# シミュレータと実機

ここまでで、私たちは基本的なビューの構築を完了しました。このレッスンの主な内容は、シミュレータと実機（Physical Device）上で App を実行する方法を学ぶことです。

私は初めて App を iPhone にインストールしたときのことを今でも覚えています。自分の開発成果をより直感的に確認できて、とても嬉しかったです。これは一種のポジティブなフィードバックです。自分で開発した App を使えるようになると、興味がさらに学習意欲を後押ししてくれます。

では、前回完成させた個人履歴プロジェクトを開いて、シミュレータと実機での実行準備をしましょう。

## シミュレータ

Xcode にはさまざまなシミュレータが内蔵されており、異なるモデルの iPhone、iPad、Apple Watch をカバーしています。シミュレータでは、異なる機種やバージョンにおける App の UI レイアウト差異を確認できます。

### シミュレータを選ぶ

Xcode 上部ツールバーのデバイス一覧で、シミュレータを 1 つ選びます（たとえば iPhone 16）。

![Swift](../../RESOURCE/005_xcode.png)

### シミュレータを実行する

その後、左上の実行ボタンをクリックします。

![Swift](../../RESOURCE/005_xcode1.png)

Xcode は自動的にプロジェクトをビルドし、シミュレータを起動します。

![Swift](../../RESOURCE/005_xcode2.png)

### シミュレータを閉じる

シミュレータを閉じたい場合は、Xcode ツールバーの停止ボタンをクリックします。

![Swift](../../RESOURCE/005_xcode3.png)

また、シミュレータ自体を直接閉じることもできます：

![Swift](../../RESOURCE/005_xcode17.png)

もしシミュレータを直接閉じた場合、Xcode は次のように表示することがあります：

```
Thread 1: signal SIGTERM
```

これは通常、プログラムロジックのエラーではなく、デバッグプロセスが外部から終了させられたことによるものです。通常は無視して問題ありません。アプリのロジックエラーには当たりません。

Xcode プレビューと比べると、シミュレータはより実機に近い実行環境です。ただし、それでも完全な実機環境ではありません。レイアウト確認や複数機種対応テストに適しています。

## テスト環境の優先順位について

実際の開発フローでは、次の順序でテストするべきです：

実機 > シミュレータ > Xcode プレビュー

プレビューは UI を素早く調整するのに向いており、シミュレータは構造的なテストに向いています。最終確認は必ず実機で行う必要があります。特に iCloud 関連の操作はそうです。

## 実機

Xcode プレビューとシミュレータは、どちらも表示が完全には正確でないことがあります。そのため、実機には決定的な意味があります。システム権限、パフォーマンス、通知メカニズムなどの挙動は、実機上でしか完全に検証できません。

### 開発者モードを有効にする

iPhone で：

設定 → プライバシーとセキュリティ → 開発者モード → オン

![Swift](../../RESOURCE/005_xcode4.png)

システムは端末を強制再起動します。開発者モードを有効にしていないと、デバッグ実行はできません。

### 開発者チームを設定する

Xcode には開発者チームの設定が必要です。そうでないと、アプリに署名してインストールすることができません。

設定の流れ：

プロジェクト名 → TARGETS → Signing & Capabilities → Team

"Add Account..." と表示される場合は、まだ Apple アカウントが追加されていないことを意味します。

![Swift](../../RESOURCE/005_xcode5.png)

追加ボタンをクリックして、Apple ID でログインします。

![Swift](../../RESOURCE/005_xcode6.png)

Apple ID にログインしたあと、対応するアカウントを選択して開発者チーム設定を完了します。

![Swift](../../RESOURCE/005_xcode7.png)

### デバイスを接続する

ケーブルを使って iPhone と Mac を接続します。

初回接続時には：

- Mac は、その iPhone をこの Mac に接続するかどうかを尋ねます
- iPhone は、そのコンピュータを信頼するかどうかを尋ねます

iPhone 側で必ず「信頼」をタップし、ロック解除パスコードを入力する必要があります。その後、Xcode のデバイス一覧から自分の iPhone を選択します。

![Swift](../../RESOURCE/005_xcode9.png)

左上の実行ボタンをクリックします。

![Swift](../../RESOURCE/005_xcode1.png)

Xcode はビルドを行い、App を iPhone にインストールします。

![Swift](../../RESOURCE/005_view.png)

**ワイヤレスデバッグ**

iOS 11 以降では、Xcode はワイヤレスデバッグに対応しています。

![Swift](../../RESOURCE/005_xcode18.png)

前提条件：

1. iPhone と Mac の初回ペアリングは、必ずケーブルで完了していること
2. iPhone と Mac が同じ Wi-Fi ネットワーク上にあること
3. 両方のデバイスがロック解除状態であること

初回にケーブルでペアリングを完了した後は、ケーブルを抜いても、同じネットワーク環境内にいればそのまま実行できます。

注意事項：

- デバイスが一覧に表示されない場合は、ケーブルを挿し直して接続し直します
- Wi-Fi デバッグはときどき不安定なので、接続異常が出たらケーブルを挿し直せば大丈夫です
- 会社のネットワークや隔離ネットワーク環境では制限される場合があります

## よくあるエラーと解決方法

Xcode で iPhone に接続してデバッグするとき、さまざまな種類のエラーメッセージに遭遇することがあります。ここでは代表的な問題とその対処方法を挙げ、接続異常を素早く特定して解決できるようにします。

**1. ペアリングが完了していない**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

これは、Xcode と iPhone のデバッグ用ペアリングがまだ完了していないことを意味します。

解決方法：iPhone 側で「信頼」をタップ済みか確認してください。それでもエラーが出る場合は、Xcode を再起動して接続し直します。

**2. 開発者チームが設定されていない**

```
Signing for "SwiftSlimTest" requires a development team.
```

開発者チームが設定されていない可能性があります。

解決方法：`Signing & Capabilities` でログイン済みのアカウントを選択します。

**3. Developer Disk Image をマウントできない**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

通常、インストール途中で中断された場合（ケーブルを抜く、強制停止するなど）に発生し、再インストール時に制限が生じてエラーになります。

解決方法：iPhone を再起動し、ケーブルを差し直して接続します。

**4. デバッグトンネル接続に失敗する**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

このエラーは、VPN やネットワークプロキシの干渉でよく発生します。

解決方法：VPN またはネットワークプロキシをオフにしてから再試行します。

**5. デバイスがロック解除されていない**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

デバイスがロック画面状態です。iPhone をロック解除すれば大丈夫です。

**6. デバイスが登録されていない**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

これは、そのデバイスが開発者アカウントのデバイス一覧に追加されていないことを意味します。そのため、Xcode はそのデバイス用の有効なプロビジョニングプロファイルを生成できず、app に署名してインストールできません。

解決方法："Register Device" をクリックして自動登録します。

**7. デプロイ対象バージョンが一致しない**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

これは、デバイスのシステムバージョンがプロジェクトの最小デプロイ対象バージョンより低いことを意味します。

変更場所：

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

バージョンをデバイスのシステムバージョン以下に調整します。

変更後はビルドフォルダをクリーンします：

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

クリーン完了後にもう一度実行します。
