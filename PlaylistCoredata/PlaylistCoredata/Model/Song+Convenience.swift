//
//  Song+Convenience.swift
//  PlaylistCoredata
//
//  Created by Kelsey Sparkman on 3/4/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import Foundation
import CoreData


extension Song {
   @discardableResult
    convenience init(songName: String, artistName: String, playlist: Playlist, moc: NSManagedObjectContext = CoreDataStack.contextMOC) {
        self.init(context: moc)
        self.title = songName
        self.artist = artistName
        self.playlist = playlist
    }
}


