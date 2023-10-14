//
//  MusicController.swift
//  MusicPlayerApp
//
//  Created by Rajkumar nag on 14/10/23.
//

import UIKit
import AVKit

class MusicController: UIViewController {

    var player : AVPlayer?
    
    var viewModel : MusicControllerViewModel?
    
    @IBOutlet weak var playPauseBtn: UIButton!
    
    @IBOutlet weak var bgImage: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAlizeVC()
    }
    
    func initAlizeVC() {
        playPauseBtn.setTitle("Play", for: .normal)
        viewModel = MusicControllerViewModel()
    }
    
    func play(model:SongsModel) {
        print("playing \(model.musicUrl)")
        if let mUrl = URL(string: model.musicUrl) {
            let playerItem = AVPlayerItem(url: mUrl)
            self.player = AVPlayer(playerItem:playerItem)
            player!.play()
        }
        bgImage.downloaded(from: model.imageUrl)
    }
    
    
    @IBAction func playPauseClicked(_ sender: Any) {
//        playPauseBtn.setTitle("", for: .normal)
        if self.player == nil {
            if let model = viewModel?.getCurrrentModel() {
                play(model: model)
            }
            return
        }
        
        if self.player?.isPlaying == true {
            playPauseBtn.setTitle("Pause", for: .normal)
            self.player?.pause()
        } else {
            playPauseBtn.setTitle("Play", for: .normal)
            self.player?.play()
        }
    }
    
    
    @IBAction func nextClicked(_ sender: Any) {
        if let model = viewModel?.nextButtonClicked() {
           play(model: model)
        }
    }
    
    @IBAction func prevClicked(_ sender: Any) {
        if let model = viewModel?.prevbuttonClicked() {
           play(model: model)
        }
    }
}



extension AVPlayer {
    var isPlaying: Bool {
        return rate != 0 && error == nil
    }
}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
