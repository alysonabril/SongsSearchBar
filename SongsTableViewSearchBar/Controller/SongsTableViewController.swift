//
//  SongsTableViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Alyson Abril on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class SongsTableViewController: UITableViewController {
    
    @IBOutlet weak var songSearchBar: UISearchBar!
    
    let songs = Song.loveSongs
    
    var songSearchResult: [Song] {
        get {
            guard let searchString = searchString else {
                return songs
            }
            guard searchString != "" else {
                return songs
            }
            if let scopeTitles = songSearchBar.scopeButtonTitles {
                let currentScopeIndex = songSearchBar.selectedScopeButtonIndex
                
                switch scopeTitles[currentScopeIndex] {
                case "Song":
                    return songs.filter{$0.name.contains(searchString.lowercased())}
                case "Artist":
                    return songs.filter{$0.artist.contains(searchString.lowercased())}
                default:
                    return songs
                }
            }
            return songs
        }
    }
    
    var searchString: String? = nil {
        didSet {
            print(searchString as Any)
            //this function makes the tableView
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songSearchBar.delegate = self
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songSearchResult.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = songSearchResult[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        cell.textLabel?.textColor = UIColor(red: 99/255, green: 184/255, blue: 162/255, alpha: 1)
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.textColor = UIColor(red: 242/255, green: 197/255, blue: 194/255, alpha: 1)
        cell.detailTextLabel?.text = song.artist
        
        return cell
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destination = segue.destination as?
            SongViewController,
            let cellSelected = tableView.indexPathForSelectedRow else {
                return
        }
        destination.songIWant = songs[cellSelected.row]
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}

extension SongsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text
    }
}
