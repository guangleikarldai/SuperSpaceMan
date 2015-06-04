//
//  GameScene.swift
//  SuperSpaceMan
//
//  Created by Guanglei Dai on 2015-05-30.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import SpriteKit

struct GlobalConstants {
    static let POWER_UP_NAME = "POWER_UP_ORB"
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    var backgroundNode : SKSpriteNode?
    var playerNode : SKSpriteNode?
    var orbNode : SKSpriteNode?
    
    let CollisionCategoryPlayer      : UInt32 = 0x1 << 1
    let CollisionCategoryPowerUpOrbs : UInt32 = 0x1 << 2

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(size: CGSize) {
        super.init(size: size)
        physicsWorld.gravity = CGVectorMake(0.0, -2.0);
        physicsWorld.contactDelegate = self

        userInteractionEnabled = true
        backgroundNode = SKSpriteNode(imageNamed: "Background")
        backgroundNode!.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        backgroundNode!.position = CGPoint(x: size.width / 2.0, y: 0.0)
        addChild(backgroundNode!)

        playerNode = SKSpriteNode(imageNamed: "Player")
        playerNode!.physicsBody = SKPhysicsBody(circleOfRadius: playerNode!.size.width / 2.0)
        playerNode!.physicsBody!.dynamic = true

        playerNode!.position = CGPoint(x: size.width / 2.0, y: 80.0)
        playerNode!.physicsBody!.linearDamping = 1.0
        playerNode!.physicsBody!.allowsRotation = false
        playerNode!.physicsBody!.categoryBitMask = CollisionCategoryPlayer
        playerNode!.physicsBody!.contactTestBitMask = CollisionCategoryPowerUpOrbs
        playerNode!.physicsBody!.collisionBitMask = 0
        addChild(playerNode!)

        orbNode = SKSpriteNode(imageNamed: "PowerUp")
        orbNode!.position = CGPoint(x: 150.0, y: size.height - 25)
        orbNode!.physicsBody = SKPhysicsBody(circleOfRadius: orbNode!.size.width / 2.0)
        orbNode!.physicsBody!.dynamic = false
        orbNode!.physicsBody!.categoryBitMask = CollisionCategoryPowerUpOrbs
        orbNode!.physicsBody!.collisionBitMask = 0
        orbNode!.name = GlobalConstants.POWER_UP_NAME
        addChild(orbNode!)
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        playerNode!.physicsBody!.applyImpulse(CGVectorMake(0.0, 40.0))
    }

    func didBeginContact(contact: SKPhysicsContact) {
        var nodeB = contact.bodyB!.node!

        if nodeB.name == GlobalConstants.POWER_UP_NAME {
            nodeB.removeFromParent()
        }
    }
}
