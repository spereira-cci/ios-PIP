//
//  ViewController.swift
//  ios PIP
//
//  Created by Shane Pereira on 02/10/26.
//

import UIKit
import AVKit

class ViewController: UIViewController {

   
    private let player = AVPlayer(url: URL(string: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8")!)
    private let playerLayer = AVPlayerLayer()
    private var pip: AVPictureInPictureController?

    override func viewDidLoad() {
        super.viewDidLoad()

        print("PiP supported:", AVPictureInPictureController.isPictureInPictureSupported())

        playerLayer.player = player
        view.layer.addSublayer(playerLayer)
        // nil on devices without PiP support, so the button below is then a no-op
        pip = AVPictureInPictureController(playerLayer: playerLayer)
        pip?.canStartPictureInPictureAutomaticallyFromInline = true  // PiP starts by itself when the app goes to the background

        var config = UIButton.Configuration.filled()
        config.title = "Picture in Picture"
        let button = UIButton(configuration: config, primaryAction: UIAction { [weak self] _ in
            self?.pip?.startPictureInPicture()
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
        ])

        player.play()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer.frame = CGRect(x: 0, y: view.safeAreaInsets.top,
                                   width: view.bounds.width, height: view.bounds.width * 9 / 16)
    }
}
