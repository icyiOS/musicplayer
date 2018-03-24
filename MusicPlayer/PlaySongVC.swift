//
//  PlaySongVC.swift
//  MusicPlayer
//
//  Created by 李超逸 on 2018/03/24.
//  Copyright © 2018 ebuser. All rights reserved.
//

import UIKit

class PlaySongVC: UIViewController {

    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Player.main.prepareAndPlay()
        Player.main.play()
        Player.main.delegate = self
        
        durationLabel.text = Player.main.duration.minutFormat
    }

    @IBAction func playButtonPressed(_ sender: UIButton) {
        if Player.main.isPlaying {
            Player.main.pause()
            sender.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        } else {
            Player.main.play()
            sender.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
        }
    }
}

extension PlaySongVC: PlayerDelegate {
    
    func player(_ player: Player, onProgress progress: Float) {
        progressView.progress = progress
    }
    
    func player(_ player: Player, onTime currentTime: Int) {
        currentTimeLabel.text = currentTime.minutFormat
    }
}

extension Int {
    var minutFormat: String {
        let minute = self / 60
        let second = self % 60
        return String(format: "%d:%02d", minute, second)
    }
}
