//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func playSound(soundName: String){
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }

            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)

                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

                guard let player = player else { return }

                player.play()

            } catch let error {
                print(error.localizedDescription)
            }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let soundName = sender.titleLabel?.text ?? ""
        
        print("Started playing \(soundName)")
        sender.layer.opacity = 0.5
        playSound(soundName: soundName)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            print("Finished playing \(soundName)")
            sender.layer.opacity = 1
        }
    }
    

}

