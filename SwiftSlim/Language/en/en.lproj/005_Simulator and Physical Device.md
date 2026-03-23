# Simulator and Physical Device

Up to this point, we have already completed some basic views. The main topic of this lesson is learning how to run an app in the simulator and on a physical device.

I still remember how happy I was the first time I installed an app on my iPhone, because I could see my development result in a much more direct way. It was a kind of positive feedback. When we can actually use an app that we developed ourselves, that sense of interest naturally pushes us to learn more.

Now, please open the personal resume project we completed in the previous lesson and get ready to run it in the simulator and on a real device.

## Simulator

Xcode includes many built-in simulators, covering different models of iPhone, iPad, and Apple Watch. The simulator can help verify layout differences on different device models or system versions.

### Choose a Simulator

In the device list in the top toolbar of Xcode, choose a simulator, such as `iPhone 16`.

![Swift](../../RESOURCE/005_xcode.png)

### Run the Simulator

Then click the Run button in the upper-left corner.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode will automatically build the project and launch the simulator.

![Swift](../../RESOURCE/005_xcode2.png)

### Closing the Simulator

If you want to stop it, click the Stop button in the Xcode toolbar.

![Swift](../../RESOURCE/005_xcode3.png)

You can also close the simulator directly:

![Swift](../../RESOURCE/005_xcode17.png)

If you close the simulator directly, Xcode may show:

```text
Thread 1: signal SIGTERM
```

This is usually not a logic error in your app. It normally means the debug process was terminated externally. In most cases, it can be ignored.

Compared with the Xcode preview, the simulator is closer to a real runtime environment. However, it is still not a full device environment. It is suitable for layout verification and multi-device adaptation testing.

## About the Priority of Testing Environments

In a real development workflow, the recommended testing order is:

`Physical device > Simulator > Xcode Preview`

Preview is suitable for quick UI adjustment. The simulator is suitable for more structural testing. Final verification should always be done on a physical device, especially for features related to iCloud.

## Physical Device

Both Xcode Preview and the simulator can display things inaccurately in some situations, so physical devices are decisive. System permissions, performance, notification behavior, and many other details can only be fully verified on an actual device.

### Turn On Developer Mode

On your iPhone:

`Settings -> Privacy & Security -> Developer Mode -> On`

![Swift](../../RESOURCE/005_xcode4.png)

The system will force the device to restart. If Developer Mode is not enabled, you will not be able to run and debug apps from Xcode.

### Configure the Development Team

Xcode must have a development team configured, otherwise it cannot sign the app and install it.

Path:

`Project Name -> TARGETS -> Signing & Capabilities -> Team`

If you see `Add Account...`, it means you have not added your Apple account yet.

![Swift](../../RESOURCE/005_xcode5.png)

Click the add button and sign in with your Apple ID.

![Swift](../../RESOURCE/005_xcode6.png)

After signing in, choose the corresponding account to complete the development team configuration.

![Swift](../../RESOURCE/005_xcode7.png)

### Connect the Device

Use a cable to connect your iPhone to your Mac.

The first time you connect:

- macOS may ask whether you want to connect the iPhone to this Mac
- the iPhone will ask whether you trust this computer

You must tap `Trust` on the iPhone and enter the lock-screen passcode. After that, select your iPhone in Xcode's device list.

![Swift](../../RESOURCE/005_xcode9.png)

Then click the Run button in the upper-left corner.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode will build the app and install it on the iPhone.

![Swift](../../RESOURCE/005_view.png)

**Wireless debugging**

Starting with iOS 11 and later, Xcode supports wireless debugging.

![Swift](../../RESOURCE/005_xcode18.png)

Prerequisites:

1. The first pairing between iPhone and Mac must be completed with a cable
2. The iPhone and Mac must be on the same Wi-Fi network
3. Both devices should remain unlocked

After the first successful wired pairing, you can unplug the cable and still run the app directly as long as both devices stay on the same network.

Things to note:

- If the device does not appear in the device list, reconnect the cable
- Wi-Fi debugging is occasionally unstable, so if the connection fails, plugging the cable back in usually helps
- Some company networks or isolated networks may restrict this feature

## Common Errors and Solutions

When connecting an iPhone to Xcode for debugging, you may encounter different kinds of errors. Below are some common problems and the corresponding solutions, which can help you quickly identify and fix connection issues.

**1. Pairing not completed**

```text
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

This means the debugging pairing between Xcode and the iPhone has not been completed yet.

Solution: make sure you tapped `Trust` on the iPhone. If the error still appears, restart Xcode and reconnect.

**2. Development team not configured**

```text
Signing for "SwiftSlimTest" requires a development team.
```

This usually means no development team has been configured.

Solution: choose a signed-in account in `Signing & Capabilities`.

**3. Developer Disk Image could not be mounted**

```text
Previous preparation error: The developer disk image could not be mounted on this device.
```

This often happens when the installation process was interrupted, such as by unplugging the cable or force stopping the run, which causes restrictions during the next install attempt.

Solution: restart the iPhone and reconnect the cable.

**4. Tunnel connection failed**

```text
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

This error is commonly caused by interference from a VPN or network proxy.

Solution: turn off the VPN or network proxy and try again.

**5. Device is locked**

```text
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

This means the device is locked. Unlock the iPhone and try again.

**6. Device is not registered**

```text
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

This means the device has not been added to the list of devices in your developer account, so Xcode cannot generate a valid provisioning profile to sign and install the app for it.

Solution: click `Register Device` to register it automatically.

**7. Deployment version mismatch**

```text
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

This means the system version of the device is lower than the minimum deployment target of the project.

Path to modify it:

`TARGETS -> General -> Deployment Info -> Deployment Target`

![Swift](../../RESOURCE/005_xcode15.png)

Change the version so that it is not higher than the device's system version.

After changing it, clean the build folder:

`Product -> Clean Build Folder Immediately`

![Swift](../../RESOURCE/005_xcode16.png)

After cleaning is complete, run the app again.
