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
    @State var showScore = false
    var body: some View {
        VStack {
            Color(game.target)
            if !showScore {
                Text("R: ??? G: ??? B: ???")
                    .padding()
            } else {
                Text(game.target.intString())
                    .padding()
            }

            Color(guess)
            Text(guess.intString())
                .padding()
            ColorSlider(value: $guess.red, trackColor: .red)
            ColorSlider(value: $guess.green, trackColor: .green)
            ColorSlider(value: $guess.blue, trackColor: .blue)

            Button(action: {
                showScore = true
                game.check(guess: guess)
            }) {
                Text("Hit Me !")
            }
            .alert(isPresented: $showScore) {
                Alert(title: Text("Your Score"), message: Text(String(game.scoreRound)), dismissButton: .default(Text("OK"), action: {
                    game.startNewRound()
                    guess = RGB()
                }))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(guess: .init())
    }
}
