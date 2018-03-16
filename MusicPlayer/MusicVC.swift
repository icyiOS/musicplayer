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

    var fileData: FileRoot? {
        didSet {
            collectionView?.reloadSections([2])
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let path = Bundle.main.path(forResource: "albums", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                fileData = try decoder.decode(FileRoot.self, from: data)
            } catch {
                print("parse error")
            }
        }

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
            return fileData?.albums.count ?? 0
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
            if let cell = cell as? ButtonCell,
                let cellType = ButtonCell.ButtonType(rawValue: indexPath.row) {
                cell.type = cellType
            }
        case 2:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: albumReuseIdentifier, for: indexPath)
            if let cell = cell as? AlbumCell,
                let data = fileData?.albums[indexPath.row] {
                cell.imageView.image = UIImage(named: data.cover)
                cell.label.text = data.name
            }
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
