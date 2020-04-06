//
//  SplashScreenViewController.swift
//  GoT-Houses
//
//  Created by Heesu Yun on 4/6/20.
//  Copyright © 2020 Heesu Yun. All rights reserved.
//

import UIKit
import AVFoundation

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var throneImageView: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound(name: "themesong")
        
        let yAtStart = throneImageView.frame.origin.y
        throneImageView.frame.origin.y = self.view.frame.height //starting just at the bottom
        UIView.animate(withDuration: 1.0, delay: 1.0, animations: {self.throneImageView.frame.origin.y = yAtStart}) //need self in front because it's a property of a class

    }
    func playSound(name: String){
        if let sound = NSDataAsset(name: name){
            do{
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            }catch{
                print("ERROR: data in \(name) coudln't be played as a sound.")
            }
            }else{
                print("ERROR: file\(name) didn't load")
            }
    }
    

    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        if audioPlayer != nil {
            audioPlayer.stop()
        }
        performSegue(withIdentifier: "ShowTableView", sender: nil)
    }

    
}

