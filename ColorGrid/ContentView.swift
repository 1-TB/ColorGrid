//
//  ContentView.swift
//  ColorGrid
//
//  Created by Jordan Carter on 4/1/24.
//

import SwiftUI


struct ContentView: View {
    // Layout for the grid
    let columnLayout = Array(repeating: GridItem(), count: 3)
    
    // State for the selected color
    @State private var selectedColor = Color.gray

    // Array of all colors
    let allColors: [Color] = [
        .pink,
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .teal,
        .cyan,
        .blue,
        .indigo,
        .purple,
        .brown,
        .gray
    ]


    var body: some View {
        // Main content view
        ZStack{
            //Changes the background color to the selected color
            selectedColor.ignoresSafeArea()
            VStack {
                // Text to display the selected color
                Text("Selected Color: \(selectedColor.description)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(10)
                // ScrollView for the grid
                ScrollView {
                    // LazyVGrid to display the colors, using the layout from above
                    LazyVGrid(columns: columnLayout) {
                        // ForEach loop to display each color
                        ForEach(allColors, id: \.description) { color in
                            //make each color a button
                            Button {
                                //change the selected color to the color that was clicked
                                selectedColor = color
                            } label: {
                                //display the color as a button
                                RoundedRectangle(cornerRadius: 4.0)
                                    .aspectRatio(1.0, contentMode: ContentMode.fit)
                                    .foregroundColor(color)
                                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                    .shadow(radius: 10)
                            }
                            //button style
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .padding(10)
        }
    }
}

#Preview {
    ContentView()
}
