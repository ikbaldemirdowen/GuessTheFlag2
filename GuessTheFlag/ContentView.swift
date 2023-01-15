//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ikbal Demirdoven on 2023-01-13.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var scoreTitle = ""
    @State private var showingScore = false
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score : Int = 0
    var body: some View
    {
        ZStack
        {
            RadialGradient(colors: [.red, .blue, .yellow, .green, .purple, .mint, .pink, .brown, .indigo], center: .center, startRadius: 1, endRadius: 500)
            VStack
            {
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    VStack(spacing : 10)
                    {
                        Text("Tap the flag of")
                            .font(.largeTitle.weight(.semibold))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .foregroundStyle(.primary)
                            .font(.largeTitle.weight(.heavy))
                        ForEach(0..<3)
                        { number in
                            Button()
                            {
                                flagTapped(number)
                            } label: {
                                Image(countries[number])
                                    .renderingMode(.original)
                                    .clipShape(Capsule())
                                    .shadow(radius: 99)
                            }
                            .padding()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 40)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Score")
                    .font(.largeTitle.bold())
                }
            }
        .ignoresSafeArea()
        .alert(scoreTitle, isPresented: $showingScore)
        {
            Button("Continue", action: askQuestion)
        } message: {
            Text("\(score)")
        }
    }
    
    func flagTapped(_ number : Int)
    {
        if number == correctAnswer
        {
            scoreTitle = "Correct!"
            score += 1
        }
        else
        {
            scoreTitle = "Wrong!"
        }
        showingScore = true
    }
    
    func askQuestion()
    {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
