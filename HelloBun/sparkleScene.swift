//
//  sparkleScene.swift
//  HelloBun
//
//  Created by Maverick Ventura on 6/27/25.
//

import SpriteKit

class sparkleScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = .clear
        scaleMode = .resizeFill
    }

    func emitSparkle(at position: CGPoint) {
        if let emitter = SKEmitterNode(fileNamed: "sparkleParticle.sks") {
            emitter.position = position
            addChild(emitter)

            emitter.run(SKAction.sequence([
                SKAction.wait(forDuration: 1.0),
                SKAction.removeFromParent()
            ]))
        } else {
            print("⚠️ Failed to load sparkleParticle.sks")
        }
    }
}
