//
//  PlaylistController.swift
//  PlaylistCoredata
//
//  Created by Kelsey Sparkman on 3/4/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    //Mark: - Singleton
    static let sharedInstance = PlaylistController()
    
    //Mark: - Source of Truth
    var playlists: [Playlist] {
        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        return (try? CoreDataStack.contextMOC.fetch(fetchRequest)) ?? []
    }
    //Mark: - Crud
    
    func createPlaylist(with name: String) {
        Playlist(name: name)
        saveToPersistentStore()
    }
    
    func deletePlaylist(playlist: Playlist) {
        CoreDataStack.contextMOC.delete(playlist)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.contextMOC.save()
        } catch {
            print("There was an error saving the data! \(#function) \(error.localizedDescription)")
        }
    }
}//End of class
