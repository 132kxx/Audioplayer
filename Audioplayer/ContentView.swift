//
//  ContentView.swift
//  Audioplayer
//
//  Created by kxx: on 2022/07/29.
//

import SwiftUI
import AVKit



struct ContentView: View {
    
    @State private var volume: Double = 0.0
    @State private var isEditing: Bool = false
    @State private var isPlaying: Bool = false
    @State private var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        VStack {
            Button {
                //action
                isPlaying.toggle()
                if isPlaying {
                    self.audioPlayer.play()
                } else {
                    self.audioPlayer.pause()
                }
                
            } label: {
                if isPlaying {
                    Image(systemName: "pause.fill")
                        .resizable()
                        .frame(width: 200, height: 200)
                } else {
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
            }
            .padding(.bottom, 50)
            .onAppear {
                let sound = Bundle.main.path(forResource: "", ofType: "mp3")
                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            }
            //volume show
            Slider(
                value: $volume,
                in: 0 ... 100,
                step: 1
            ) {
                Text("Volume")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("100")
            } onEditingChanged: { editing in
                isEditing = editing
            }
            
            let volumeInt: Int = Int(volume.rounded(.towardZero))
            Text("\(volumeInt)")

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
