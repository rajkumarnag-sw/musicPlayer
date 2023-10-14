//
//  MViewModel.swift
//  MusicPlayerApp
//
//  Created by Rajkumar nag on 14/10/23.
//

import Foundation


class MusicControllerViewModel {
    
    private var currentCount = 0
    
    init() {
        getSongsModel()
    }
    
    private var songsArr : [SongsModel]?
    
    private func getSongsModel() {
        let m1 = SongsModel(musicUrl: "http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3", imageUrl: "https://source.unsplash.com/user/c_v_r/100x100")
        
        let m2 = SongsModel(musicUrl: "http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Sevish_-__nbsp_.mp3", imageUrl: "https://picsum.photos/200/300")
        let m3 = SongsModel(musicUrl: "http://codeskulptor-demos.commondatastorage.googleapis.com/GalaxyInvaders/theme_01.mp3", imageUrl: "https://picsum.photos/200/300")
        songsArr = [m1,m2,m3]
    }
    
    func nextButtonClicked() -> SongsModel? {
        currentCount += 1
        currentCount = currentCount % (songsArr?.count ?? 0)
        return songsArr?[currentCount]
    }
    
    func prevbuttonClicked() -> SongsModel? {
        currentCount -= 1
        if currentCount < 0 {
            currentCount = currentCount + (songsArr?.count ?? 0)
        }
        
        currentCount = currentCount % (songsArr?.count ?? 0)
        return songsArr?[currentCount]
    }
    
    func getCurrrentModel() -> SongsModel? {
        return songsArr?[currentCount]
    }
}


struct SongsModel {
    let musicUrl : String
    let imageUrl : String
}
