//
//  ContentView.swift
//  AppRating
//
//  Created by Sai Abhilash Gudavalli on 23/04/23.
//

import SwiftUI

struct ContentView: View {
    
    let categories: [String: Int] = ["Category1": 3, "Category2": 2, "Category3": 1]
    @State private var selectedCategory: String = ""
    
    @State private var pickedSize: Double = 100.0
    
    let appTypes = ["Free", "Paid"]
    @State private var selectedAppType = "Free"
    
    var isPaid: Bool {
        selectedAppType == "Paid"
    }
    
    @State private var pickedPrize: Double = 10.0
    
    let genres = ["Genre1", "Genre2", "Genre3"]
    @State private var selectedGenre: String = ""
    
    let contentRatings = ["contentRating1", "contentRating2", "contentRating3"]
    @State private var selectedCR: String = ""
    
    @State private var pickedReviewsCount: Double = 10.0
    
    @State private var showAlert: Bool = false
    @State private var alertText: String = "Your App Rating: 1.9"
    
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
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                    Picker("Content Rating", selection: $selectedCR) {
                        ForEach(contentRatings, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                    Picker("App Type", selection: $selectedAppType) {
                        ForEach(appTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    if isPaid {
                        VStack {
                            Text("Pick Price:")
                            HStack {
                                Text("$10")
                                    .font(.footnote)
                                Slider(value: $pickedPrize, in: 1...50)
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
