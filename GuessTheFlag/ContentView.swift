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
            LinearGradient(colors: [.red, .blue], startPoint: .top, endPoint: .bottom)
            VStack(spacing : 10)
            {
                Text("Tap the flag of")
                    .font(.largeTitle)
                Text(countries[correctAnswer])
                    .foregroundColor(.primary)
                    .font(.largeTitle.weight(.semibold))
                    
                
                VStack(spacing : 50)
                {
                    ForEach(0..<3)
                    { number in
                        Button()
                        {
                           flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 50)
                        }
                    }
                }
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
            scoreTitle = "Correct"
            score += 1
        }
        else
        {
            scoreTitle = "Wrong"
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
