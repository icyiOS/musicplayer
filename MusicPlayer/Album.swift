//
//  Album.swift
//  MusicPlayer
//
//  Created by ebuser on 2018/03/16.
//  Copyright © 2018 ebuser. All rights reserved.
//

import Foundation

struct FileRoot: Codable {
    let albums: [Album]
}

struct Album: Codable {
    let name: String
    let artist: String
    let publish: String
    let cover: String
    let brief: String
    let songs: [Song]
}

struct Song: Codable {
    let name: String
}
