//
//  ViewController.swift
//  UITestsWithSoundOutput
//
//  Created by Kubilay Erdogan on 17.11.22.
//

import UIKit
import AVFoundation

final class ViewController: UIViewController {

    @IBOutlet var statusLabel: UILabel!

    let item = AVPlayerItem(
        url: URL(string: "https://d32oopmphic0po.cloudfront.net/v1/videos/program/332/5e0e1e208f224e4fabfb6c81c4806fdd_toe-reach-loop-v1.mp4")!
    )
    lazy var player = AVPlayer(playerItem: item)

    override func viewDidLoad() {
        super.viewDidLoad()

        statusLabel.text = "initial"

        item.addObserver(
            self,
            forKeyPath: #keyPath(AVPlayerItem.status),
            options: [.initial, .old, .new],
            context: nil
        )
        if player.currentItem?.status == .readyToPlay {
            videoDidLoad()
        }
        player.play()
    }

    private func videoDidLoad() {
        statusLabel.text = "videoDidLoad"
    }

    override func observeValue(
        forKeyPath keyPath: String?,
        of object: Any?,
        change: [NSKeyValueChangeKey : Any]?,
        context: UnsafeMutableRawPointer?
    ) {
        guard let item = object as? AVPlayerItem else {
            return
        }
        
        if item.status == .readyToPlay {
            DispatchQueue.main.async {
                self.videoDidLoad()
            }
        }
    }
}
