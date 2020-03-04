//
//  SongDetailViewController.swift
//  PlaylistCoredata
//
//  Created by Kelsey Sparkman on 3/4/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {
    
    
    @IBOutlet weak var artistNameTextField: UITextField!
    @IBOutlet weak var songNameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let playlist = playlist, let artistName = artistNameTextField.text, let songTitle = songNameTextField.text else {return}
        SongController.createSong(songName: songTitle, and: artistName, addTo: playlist)
        
        songNameTextField.text = ""
        artistNameTextField.text = ""
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
}//End of class


extension SongDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let playlist = self.playlist else {return 0}
        return playlist.songs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        guard let playlist = self.playlist else {return UITableViewCell()}
        if let song = playlist.songs?[indexPath.row] as? Song{
            cell.textLabel?.text = song.artist
            cell.detailTextLabel?.text = song.title
        }
        return cell
    }
}//EoE

extension SongDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            guard let playlist = playlist, let song = playlist.songs?[indexPath.row] as? Song else {return}
            SongController.deleteSong(song: song)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}//EoE
