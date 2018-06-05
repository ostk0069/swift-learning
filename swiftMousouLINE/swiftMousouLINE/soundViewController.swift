//
//  soundViewController.swift
//  swiftMousouLINE
//
//  Created by Takuma Osada on 2018/06/05.
//  Copyright © 2018年 Takuma Osada. All rights reserved.
//

import UIKit
import AVFoundation

class soundViewController: UIViewController {

  @IBOutlet var timeLabel: UILabel!
  
  @IBOutlet var imageView2: UIImageView!
  
  var audioPlayer: AVAudioPlayer!
  
  var count = 0
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
        //画面がはじめに表示されたときに非表示しておく
        imageView2.isHidden = true
    
        //ラベルを非表示
        timeLabel.isHidden = true
    
        //音声(callMusic.mp3)を再生する
        if let url = Bundle.main.url(forResource: "callMusic", withExtension: "mp3") {
          do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            
          } catch {
            // プレイヤー作成失敗
            // その場合は、プレイヤーをnilとする
            audioPlayer = nil
          }
          
        } else {
          // urlがnilなので再生できない
          fatalError("Url is nil.")
        }
      
    }
  
  @IBAction func tap(_ sender: Any) {
    
    //show the view2
    imageView2.isHidden = false
    
    //start the timer
    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(timerCountUp), userInfo: nil, repeats: true)
    
    playBabySound()
    
    // hide the label of time
    timeLabel.isHidden = false
    
  }
  
  func playBabySound() {
    
    // start sound
    if let url = Bundle.main.url(forResource: "baby", withExtension: "mp3") {
      do {
        audioPlayer = try AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
        
      } catch {
        // プレイヤー作成失敗
        // その場合は、プレイヤーをnilとする
        audioPlayer = nil
      }
      
    } else {
      // urlがnilなので再生できない
      fatalError("Url is nil.")
    }
    
  }
  
  func timerCountUp() {
    
    count = count + 1
    timeLabel.text = String(count)
    
  }
  
  @IBAction func deny(_ sender: Any) {
    
    //stop and end the sound(music)
    audioPlayer.stop()
    
    //show the landing display on viewController
    dismiss(animated: true, completion: nil)
    
    
  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
      
    }
}
