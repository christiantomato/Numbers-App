//
//  ContentView.swift
//  idk
//
//  Created by Christian Tamayo on 2024-09-26.
//

import SwiftUI

struct ContentView: View {
    //important variables in the program
    
    //screen booleans
    @State var mainmenu: Bool = true
    @State var randomNumScreen: Bool = false
    @State var guessNumScreen: Bool = false
    
    //other
    @State var randomNumString: String = "69"
    @State var guessNumString: String = ""
    @State var randomGuessNum: Int = Int.random(in: 1...10)
    @State var youWinText: Bool = false
    @State var tryAgainText: Bool = false
    
    //user interface
    var body: some View {
        ZStack {
            //background
            Rectangle()
                .foregroundColor(Color(hue: 0.563, saturation: 0.331, brightness: 1.0))
                .ignoresSafeArea()
            
            //main menu
            if(mainmenu) {
                VStack {
                    Text("Numbers")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 40.0)
                    Spacer()
                    
                    //vstack with buttons
                    VStack {
                        
                        //random numbers button
                        Button {
                            //button action
                            randomNumButton()
                        } label: {
                            //button view
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                    .frame(width: 300.0, height: 50.0)
                                    .shadow(radius: 10)
                                
                                Text("random")
                                    .foregroundColor(.black)
                            }
                        }
                        
                        //guess the number button
                        Button {
                            //button action
                            guessNumButton()
                        } label: {
                            //button view
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                    .frame(width: 300.0, height: 50.0)
                                    .shadow(radius: 10)
                                
                                Text("guess the number")
                                    .foregroundColor(.black)
                            }
                                
                        }
                        
                        //coming soon button
                        Button {
                            //button action
                            
                        } label: {
                            //button view
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                    .frame(width: 300.0, height: 50.0)
                                    .shadow(radius: 10)
                                
                                Text("coming soon")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .font(.title)
                    Spacer()
                }
            }
            
            //random numbers screen
            if(randomNumScreen) {
                VStack {
                    HStack {
                        Button {
                            //bring back to main menu
                            mainmenuButton()
                        } label: {
                            ZStack {
                                Rectangle()
                                    .padding()
                                    .foregroundColor(.white)
                                    .frame(width: 75.0, height: 75.0)
                                    .shadow(radius: 10)
                                
                                Image(systemName: "arrowshape.backward.fill")
                                    .foregroundColor(.black)
                            }
                        }
                        Spacer()
                    }
                    Spacer()
                    ZStack {
                        Rectangle()
                            .frame(width: 150.0, height: 150.0)
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                        
                        Text(randomNumString)
                            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                            .fontWeight(.heavy)
                    }
                    Spacer()
                    Text("Press to generate a random number!")
                        .font(.title2)
                        
                    //generate random button
                    Button {
                        //action
                        randomNumString = String(generateRandomNum(low: 1, high: 1000))
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 50.0, height: 50.0)
                                .shadow(radius: 10)
                            
                            Image(systemName: "button.programmable")
                                .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                                .foregroundColor(Color(hue: 0.632, saturation: 0.449, brightness: 0.92))
                                .frame(width: 40.0, height: 40.0)
                        }
                    }
                    Spacer()
                }
            }
            
            //guess the number screen
            if(guessNumScreen) {
                VStack{
                    HStack {
                        Button {
                            //bring back to main menu
                            mainmenuButton()
                        } label: {
                            ZStack {
                                Rectangle()
                                    .padding()
                                    .foregroundColor(.white)
                                    .frame(width: 75.0, height: 75.0)
                                    .shadow(radius: 10)
                                
                                Image(systemName: "arrowshape.backward.fill")
                                    .foregroundColor(.black)
                            }
                        }
                        Spacer()
                    }
                    Spacer()
                    
                    if(youWinText) {
                        Text("You Win")
                            .font(.largeTitle)
                    }
                    else if(tryAgainText) {
                        Text("Try Again")
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    Text("Guess the number between 1 and 10...")
                        .multilineTextAlignment(.center)
                    
                    //enter in guess
                    TextField(/*@START_MENU_TOKEN@*/"Enter guess here"/*@END_MENU_TOKEN@*/, text: $guessNumString)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 50.0)
                        .onSubmit {
                            //action
                            if(checkGuess(guess: guessNumString)) {
                                tryAgainText = false
                                youWinText = true
                                randomGuessNum = generateRandomNum(low: 1, high: 10)
                            }
                            else {
                                youWinText = false
                                tryAgainText = true
                            }
                        }
                    
                    Spacer()
                    
                }
            }
        }
    }
    
    
    //functions
    func mainmenuButton() {
        randomNumScreen = false
        guessNumScreen = false
        mainmenu = true
    }
    
    func randomNumButton() {
        mainmenu = false
        guessNumScreen = false
        randomNumScreen = true
        
    }
    
    func guessNumButton() {
        mainmenu = false
        randomNumScreen = false
        guessNumScreen = true
    }
    
    func generateRandomNum(low: Int, high: Int) -> Int {
        var randomNum = 0
        randomNum = Int.random(in: low...high)
        return randomNum
    }
    
    func checkGuess(guess: String) -> Bool {
        //check if the guess matches the random num
        if guess == String(randomGuessNum) {
            //they have won
            return true
        }
        //not win
        return false
    }
}



#Preview {
    ContentView()
}
