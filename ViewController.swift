//
//  ViewController.swift
//  Aula-Imagem-Audio
//
//  Created by Usuário Convidado on 26/04/19.
//  Copyright © 2019 Usuário Convidado. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initAudio()
        // Do any additional setup after loading the view, typically from a nib.
    }

    var audioURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: "audio", ofType: "mp3")!)
    
    var player:AVAudioPlayer?
    
    func initAudio(){
        do{
            try AVAudioSession.sharedInstance().setActive(true)
            try
                AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options:AVAudioSession.CategoryOptions.defaultToSpeaker)
            
            try player = AVAudioPlayer(contentsOf: audioURL as URL)
            
        }catch _ as NSError{
            print("Falha")
        }
    }
    
    @IBAction func playAudio(_ sender: Any) {
        if(!((player?.isPlaying)!)){
            player?.play()
        }
    }
    
    @IBAction func pauseAudio(_ sender: Any) {
        player?.pause()
    }

}

