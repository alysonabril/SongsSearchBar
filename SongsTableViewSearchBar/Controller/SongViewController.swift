//
//  SongViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Alyson Abril on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class SongViewController: UIViewController {

    var songIWant: Song!
    
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songDetail()
    }
    
    private func songDetail() {
        songTitleLabel.text = songIWant.name
        artistNameLabel.text = songIWant.artist
    }
}
