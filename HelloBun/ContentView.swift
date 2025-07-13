//
//  ContentView.swift
//  HelloBun
//
//  Created by Maverick Ventura on 6/25/25.
//

import SwiftUI
import AVFAudio
import SpriteKit

struct ContentView: View {
    @State private var message = "Hello, my Bunny 💛"
    @State var boopCount = 0
    @State private var audioPlayer: AVAudioPlayer!
    @StateObject private var scene = sparkleScene()
    var body: some View {
        VStack(spacing: 20) {
            Text(message)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
            Text("\(boopCount)")
                .font(.largeTitle)
                .padding()
            
            ZStack {
                Image("BunnyBean")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                SpriteView(scene: scene)
                    .frame(width: 200, height: 200)
                    .allowsTransparency(true)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onEnded { value in
                                let location = CGPoint(x: value.location.x,
                                                      y: scene.size.height - value.location.y)
                                boopCount += 1
                                message = "Bunny Booped! 💖🐰"
                                playBoopSound()
                                scene.emitSparkle(at: location)
                            }
                    )
            }


            Button("Boop") {
                message = "Boop received! :D"
            }
            .padding()
            .font(.title)
            .background(Color.pink)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
    func playBoopSound() {
        guard let url = Bundle.main.url(forResource: "squeak", withExtension: "mp3") else {
            print("Boop sound not found")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing boop sound: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}


