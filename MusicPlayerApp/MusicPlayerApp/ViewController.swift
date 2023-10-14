//
//  ViewController.swift
//  MusicPlayerApp
//
//  Created by Rajkumar nag on 14/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func playMusicClicked(_ sender: Any) {
        let vc = MusicController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

