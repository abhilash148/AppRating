//
//  ContentView.swift
//  AppRating
//
//  Created by Sai Abhilash Gudavalli on 23/04/23.
//

import SwiftUI
import CoreML

struct ContentView: View {
    
    let categories: [String: Int] = ["ART_AND_DESIGN": 0,
                                     "AUTO_AND_VEHICLES": 1,
                                     "BEAUTY": 2,
                                     "BOOKS_AND_REFERENCE": 3,
                                     "BUSINESS": 4,
                                     "COMICS": 5,
                                     "COMMUNICATION": 6,
                                     "DATING": 7,
                                     "EDUCATION": 8,
                                     "ENTERTAINMENT": 9,
                                     "EVENTS": 10,
                                     "FINANCE": 11,
                                     "FOOD_AND_DRINK": 12,
                                     "HEALTH_AND_FITNESS": 13,
                                     "HOUSE_AND_HOME": 14,
                                     "LIBRARIES_AND_DEMO": 15,
                                     "LIFESTYLE": 16,
                                     "GAME": 17,
                                     "FAMILY": 18,
                                     "MEDICAL": 19,
                                     "SOCIAL": 20,
                                     "SHOPPING": 21,
                                     "PHOTOGRAPHY": 22,
                                     "SPORTS": 23,
                                     "TRAVEL_AND_LOCAL": 24,
                                     "TOOLS": 25,
                                     "PERSONALIZATION": 26,
                                     "PRODUCTIVITY": 27,
                                     "PARENTING": 28,
                                     "WEATHER": 29,
                                     "VIDEO_PLAYERS": 30,
                                     "NEWS_AND_MAGAZINES": 31,
                                     "MAPS_AND_NAVIGATION": 32]
    @State private var selectedCategory: String = ""
    
    @State private var pickedSize: Double = 100.0
    
    let appTypes: [String: Int] = ["Free": 0, "Paid": 1]
    @State private var selectedAppType = "Free"
    
    var isPaid: Bool {
        selectedAppType == "Paid"
    }
    
    @State private var pickedPrize: Double = 0.0
    
    let genres: [String: Int] = ["Beauty": 14,
                                 "Books & Reference": 19,
                                 "Business": 22,
                                 "Comics": 34,
                                 "Comics_Creativity": 35,
                                 "Communication": 36,
                                 "Dating": 38,
                                 "Education": 39,
                                 "Education_Creativity": 42,
                                 "Education_Music & Video": 44,
                                 "Education_Action & Adventure": 40,
                                 "Education_Pretend Play": 45,
                                 "Education_Brain Games": 41,
                                 "Entertainment": 52,
                                 "Entertainment_Music & Video": 57,
                                 "Entertainment_Brain Games": 54,
                                 "Entertainment_Creativity": 55,
                                 "Events": 59,
                                 "Finance": 60,
                                 "Food & Drink": 61,
                                 "Health & Fitness": 62,
                                 "House & Home": 65,
                                 "Libraries & Demo": 66,
                                 "Lifestyle": 67,
                                 "Lifestyle_Pretend Play": 69,
                                 "Adventure_Action & Adventure": 3,
                                 "Arcade": 6,
                                 "Casual": 27,
                                 "Card": 23,
                                 "Casual_Pretend Play": 33,
                                 "Action": 0,
                                 "Strategy": 104,
                                 "Puzzle": 83,
                                 "Sports": 102
    ]
    @State private var selectedGenre: String = ""
    
    let contentRatings: [String: Int] = ["Everyone": 1, "Teen": 4, "Everyone 10+": 2, "Mature 17+": 3, "Adults only 18+": 0, "Unrated": 5]
    @State private var selectedCR: String = ""
    
    @State private var pickedReviewsCount: Double = 10.0
    
    @State private var showAlert: Bool = false
    @State private var alertText: String = "Your App Rating: 4.3"
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Picker("Select a category", selection: $selectedCategory) {
                        ForEach(categories.keys.sorted(), id: \.self) { index in
                            Text(index)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                    Picker("Select a Genre", selection: $selectedGenre) {
                        ForEach(genres.keys.sorted(), id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                    Picker("Content Rating", selection: $selectedCR) {
                        ForEach(contentRatings.keys.sorted(), id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                    Picker("App Type", selection: $selectedAppType) {
                        ForEach(appTypes.keys.sorted(), id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    if isPaid {
                        VStack {
                            Text("Pick Price:")
                            HStack {
                                Text("$0")
                                    .font(.footnote)
                                Slider(value: $pickedPrize, in: 0...50)
                                Text("$50")
                                    .font(.footnote)
                            }
                            Text("$\(String(format: "%.f", pickedPrize))")
                        }
                    }
                    
                } header: {
                    Text("")
                }
                
                Section {
                    VStack {
                        HStack {
                            Text("100 MB")
                                .font(.footnote)
                            Slider(value: $pickedSize, in: 100...500)
                            Text("500 MB")
                                .font(.footnote)
                        }
                        Text("\(String(format: "%.1f", pickedSize)) MB")
                    }
                } header: {
                    Text("Pick App Size")
                }
                
                Section {
                    VStack {
                        HStack {
                            Text("10")
                                .font(.footnote)
                            Slider(value: $pickedReviewsCount, in: 10...100)
                            Text("100")
                                .font(.footnote)
                        }
                        Text("\(String(format: "%.f", pickedReviewsCount))")
                    }
                } header: {
                    Text("Number of Reviews")
                }
                
                Section {
                    Text("Selected category: \(categories[selectedCategory, default: 0])")
                }

            }
            .navigationTitle("App Rating")
            .alert(alertText, isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
            .toolbar {
                Button("Predict") {
                    // predict part goes here
                    showAlert = true
                }
            }

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
