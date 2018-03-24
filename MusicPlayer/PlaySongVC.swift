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
    @IBOutlet weak var slider: UISlider!
    
    var isSliderDragging = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.setThumbImage(#imageLiteral(resourceName: "sliderThumb"), for: .normal)
        
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
    @IBAction func sliderValueChanged(_ sender: UISlider, forEvent event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            case .began:
                isSliderDragging = true
            case .ended:
                let progress = sender.value
                Player.main.setProgress(progress)
                isSliderDragging = false
            default:
                break
            }
        }
    }
}

extension PlaySongVC: PlayerDelegate {
    
    func player(_ player: Player, onProgress progress: Float) {
        if !isSliderDragging {
            slider.value = progress
        }
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
