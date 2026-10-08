# iOS PIP

A small UIKit demo app showing **Picture in Picture (PiP)** video playback on iOS with `AVKit`. It streams an HLS test video and lets the video keep playing in a floating window when you leave the app.

## Features

- Plays an HLS (`.m3u8`) stream with `AVPlayer` and `AVPlayerLayer`
- **Picture in Picture** button to start PiP manually
- PiP starts automatically when the app goes to the background
- Audio keeps playing in the background (`playback` audio session + `audio` background mode)


## Getting started

1. Clone the repo:
   ```bash
   git clone https://github.com/spereira-cci/ios-PIP.git
   cd ios-PIP
   ```
2. Open `ios PIP.xcodeproj` in Xcode.
3. Select the **ios PIP** target, then **Signing & Capabilities**, and choose your own Team (needed to run on a physical device).
4. Select a simulator or a connected device and press **Run** (`⌘R`).

PiP behaves most reliably on a physical device. If the button does nothing, check the Xcode console for the `PiP supported:` line.

## How it works

| File | Role |
| --- | --- |
| `AppDelegate.swift` | Sets the `AVAudioSession` category to `playback`, which PiP requires |
| `ViewController.swift` | Creates the `AVPlayer`, shows it in a 16:9 `AVPlayerLayer`, and wires up `AVPictureInPictureController` and the PiP button |
| `Info.plist` | Enables the `audio` background mode |



https://github.com/user-attachments/assets/9c51f829-e469-4878-a6e2-817a2d8d0b1c




