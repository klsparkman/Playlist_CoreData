//
//  SongController.swift
//  PlaylistCoredata
//
//  Created by Kelsey Sparkman on 3/4/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import Foundation

class SongController {
    
    //Mark: - CRUD
    static func createSong(songName: String, and artistName: String, addTo playlist: Playlist) {
        Song(songName: songName, artistName: artistName, playlist: playlist)
    }
    
    static func deleteSong(song: Song) {
        CoreDataStack.contextMOC.delete(song)
        PlaylistController.sharedInstance.saveToPersistentStore()
    }
    
}//End of class
