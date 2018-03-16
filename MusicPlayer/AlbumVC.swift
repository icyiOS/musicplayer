//
//  AlbumVC.swift
//  MusicPlayer
//
//  Created by ebuser on 2018/03/16.
//  Copyright © 2018 ebuser. All rights reserved.
//

import UIKit

class AlbumVC: UITableViewController {

    var album: Album!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return album.songs.count
    }

}
