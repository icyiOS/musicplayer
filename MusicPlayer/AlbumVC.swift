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

    @IBOutlet weak var albumThumbImageView: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var albumArtistLabel: UILabel!
    @IBOutlet weak var albumPublishLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumNameLabel.text = album.name
        albumArtistLabel.text = album.artist
        albumPublishLabel.text = album.publish
        albumThumbImageView.image = UIImage(named: album.cover)
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        if let cell = cell as? SongCell {
            let song = album.songs[indexPath.row]
            cell.serialLabel.text = "\(indexPath.row + 1)"
            cell.nameLabel.text = song.name
            cell.artistLabel.text = album.artist
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "playSong", sender: nil)
    }

}
