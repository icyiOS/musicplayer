//
//  ButtonCell.swift
//  MusicPlayer
//
//  Created by ebuser on 2018/03/16.
//  Copyright © 2018 ebuser. All rights reserved.
//

import UIKit

class ButtonCell: UICollectionViewCell {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var type: ButtonType = .fm {
        didSet {
            switch type {
            case .fm:
                button.setBackgroundImage(#imageLiteral(resourceName: "fm"), for: .normal)
                button.setTitle(nil, for: .normal)
                label.text = "私人FM"
            case .suggest:
                button.setBackgroundImage(#imageLiteral(resourceName: "suggest"), for: .normal)
                let calendar = Calendar.current
                let now = Date()
                let day = calendar.component(.day, from: now)
                button.setTitle("\(day)", for: .normal)
                label.text = "每日推荐"
            case .list:
                button.setBackgroundImage(#imageLiteral(resourceName: "list"), for: .normal)
                button.setTitle(nil, for: .normal)
                label.text = "歌单"
            case .rank:
                button.setBackgroundImage(#imageLiteral(resourceName: "rank"), for: .normal)
                button.setTitle(nil, for: .normal)
                label.text = "排行榜"
            }
        }
    }

    enum ButtonType: Int {
        case fm
        case suggest
        case list
        case rank
    }
}
