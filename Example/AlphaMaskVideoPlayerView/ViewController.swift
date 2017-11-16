//
//  ViewController.swift
//  AlphaMaskVideoPlayerView
//
//  Created by 🦊Tomoya Hirano on 11/16/2017.
//  Copyright (c) 2017 🦊Tomoya Hirano. All rights reserved.
//

import UIKit
import AlphaMaskVideoPlayerView

final class ViewController: UIViewController, AlphaMaskVideoPlayerDelegate {
  let player = AlphaMaskVideoPlayer(mainVideoUrl: Bundle.main.url(forResource: "main", withExtension: "mp4")!,
                                    alphaVideoUrl: Bundle.main.url(forResource: "main_alpha", withExtension: "mp4")!)
  @IBOutlet private weak var playerView: AlphaMaskVideoPlayerView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    playerView.setPlayer(player)
    playerView.contentMode = .scaleAspectFill
    player.delegate = self
    try! player.play()
  }
  
  func playerDidFinishPlaying(_ player: AlphaMaskVideoPlayer) {
    player.cancel()
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    try! player.play()
  }
}

