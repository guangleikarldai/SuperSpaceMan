//
//  GameScene.swift
//  SuperSpaceMan
//
//  Created by Guanglei Dai on 2015-05-30.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = SKColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    }
}
