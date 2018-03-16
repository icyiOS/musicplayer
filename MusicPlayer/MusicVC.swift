//
//  MusicVC.swift
//  MusicPlayer
//
//  Created by ebuser on 2018/03/16.
//  Copyright © 2018 ebuser. All rights reserved.
//

import UIKit

private let promotionReuseIdentifier = "promotionCell"
private let buttonReuseIdentifier = "buttonCell"
private let albumReuseIdentifier = "albumCell"

class MusicVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        case 2:
            return 21
        default:
            return 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell
        switch indexPath.section {
        case 0:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: promotionReuseIdentifier, for: indexPath)
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: buttonReuseIdentifier, for: indexPath)
        case 2:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: albumReuseIdentifier, for: indexPath)
        default:
            fatalError()
        }
        return cell
    }

}

extension MusicVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.size.width
        switch indexPath.section {
        case 0:
            let ratio = CGFloat(170) / CGFloat(740)
            return CGSize(width: screenWidth, height: screenWidth * ratio)
        case 1:
            let cellWidth = screenWidth / 4 - 10
            let cellHeight = cellWidth
            return CGSize(width: cellWidth, height: cellHeight)
        case 2:
            let cellWidth = screenWidth / 3 - 5
            let cellHeight = cellWidth + 44
            return CGSize(width: cellWidth, height: cellHeight)
        default:
            return .zero
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 1:
            return 10
        case 2:
            return 5
        default:
            return 0
        }
    }
}
