//
//  GameViewController.swift
//  SuperSpaceMan
//
//  Created by Guanglei Dai on 2015-05-30.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var scene: GameScene!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = view as! SKView
        skView.showsFPS = true
        
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
    }
}
