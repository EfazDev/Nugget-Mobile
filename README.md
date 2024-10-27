Main app is made by [leminlimez](https://github.com/leminlimez/Nugget-Mobile)<br>
edited by efazdev<br>

> [!WARNING]
> THIS APP IS UNOFFICIALLY EDITED BY EFAZDEV, LEMIN MAY NOT TAKE COVERAGE OR SUPPORT FOR THIS APP VERSION AS ITS NOT DIRECTLY MADE BY HIM.
> Current version of Nugget made officially is 2.0!!

![Artboard](https://github.com/leminlimez/Nugget-Mobile/blob/1881fdc2b721fd2675a2909e7fbc24769d11bb53/readme-images/icon.png)

# Nugget (mobile)
Unlock your device's full potential! Should work on all versions iOS 16.0 - 18.1 beta 4 with partial support for 18.1 beta 5 - iOS 18.2 beta 1.

A `.mobiledevicepairing` file and wireguard are required in order to use this. Read the [sections](#getting-your-mobiledevicepairing-file) below to see how to get those.

If you are having issues with minimuxer, see the [Solving Minimuxer Issues](#solving-minimuxer-issues) thread.

This uses the sparserestore exploit to write to files outside of the intended restore location, like mobilegestalt.

Note: I am not responsible if your device bootloops, use this software with caution. Please back up your data before using!

## Download
IPA File: [Download Latest Version](https://raw.githubusercontent.com/EfazDev/nugget-mobile/refs/heads/main/build/Nugget.ipa)<br>
LeminLimez GitHub: [Nugget-Mobile](https://github.com/leminlimez/Nugget-Mobile), [leminlimez](https://github.com/leminlimez)

## Getting Your mobiledevicepairing File
To get the pairing file, use the following steps:
1. Download `jitterbugpair` for your system from here: <https://github.com/osy/Jitterbug/releases/latest>
    - **Note:** On mac or linux, you may have to run the terminal command `chmod +x ./jitterbugpair` in the same directory.
2. Run the program by either double clicking it or using terminal/powershell
3. Share the `.mobiledevicepairing` file to your iOS device
4. Open the app and select the pairing file

You should only have to do this once unless you lose the file and delete the app's data.

## Setting Up WireGuard
1. Download [WireGuard](<https://apps.apple.com/us/app/wireguard/id1441195209>) on the iOS App Store.
2. Download [SideStore's config file](https://github.com/sidestore/sidestore/releases/download/0.1.1/sidestore.conf) on your iOS device
3. Share the config file to WireGuard using the share menu
4. Enable it and run Nugget

## Solving Minimuxer Issues
Try reading a new mobiledevicepairing file. If that doesn't work, try using `Cowabunga Lite` and clicking the `Deep Clean` button, then try the steps again.
If not even that works, the only solution I know is to wipe the device (not ideal). I would recommend using [Nugget Python](https://github.com/leminlimez/Nugget) instead in this case.

## Rebuilding Process
1. In order for rebuilding, install Xcode 15.3 with Swift 5.10 and modules gmake, git, Homebrew and theos.
2. Once they're installed, run `fullbuild.sh`. This will build the ipa into the ./build folder
3. Done!

## Credits
- [leminlimez](https://github.com/leminlimez) Original creator of Nugget!
- [JJTech](https://github.com/JJTech0130) for Sparserestore/[TrollRestore](https://github.com/JJTech0130/TrollRestore)
- khanhduytran for [Sparsebox](https://github.com/khanhduytran0/SparseBox)
- [pymobiledevice3](https://github.com/doronz88/pymobiledevice3)
- [disfordottie](https://x.com/disfordottie) for some global flag features
- f1shy-dev for [AI Enabler](https://gist.github.com/f1shy-dev/23b4a78dc283edd30ae2b2e6429129b5#file-eligibility-plist)
- [SideStore](https://sidestore.io/) for em_proxy and minimuxer
- [libimobiledevice](https://libimobiledevice.org) for the restore library