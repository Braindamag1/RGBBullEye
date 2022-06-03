//
//  ContentView.swift
//  RGBBullEye
//
//  Created by YJ.Lee on 2022/6/3.
//

import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var guess: RGB
    var body: some View {
        VStack {
            Color(game.target)
            Text("R: ??? G: ??? B: ???")
                .padding()
            Color(guess)
            Text(guess.intString())
                .padding()
            ColorSlider(value: $guess.red, trackColor: .red)
            ColorSlider(value: $guess.green, trackColor: .green)
            ColorSlider(value: $guess.blue, trackColor: .blue)

            Button(action: {}) {
                Text("Hit Me !")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(guess: .init())
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var trackColor: Color
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
                .accentColor(trackColor)
            Text("255")
        }
        .padding(.horizontal)
    }
}
