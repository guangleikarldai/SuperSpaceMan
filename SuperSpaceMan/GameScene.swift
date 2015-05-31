//
//  GameScene.swift
//  SuperSpaceMan
//
//  Created by Guanglei Dai on 2015-05-30.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var backgroundNode : SKSpriteNode?
    var playerNode : SKSpriteNode?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        backgroundNode = SKSpriteNode(imageNamed: "Background")
        backgroundNode!.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        backgroundNode!.position = CGPoint(x: size.width / 2.0, y: 0.0)
        addChild(backgroundNode!)

        playerNode = SKSpriteNode(imageNamed: "Player")
        playerNode!.position = CGPoint(x: size.width / 2.0, y: 80.0)
        addChild(playerNode!)
    }
}
