//
//  ContentView.swift
//  Slots
//
//  Created by Arian Dervishaj on 12.11.22.
//

import SwiftUI

struct Settings{
    static let creditKey = "credit"

}

struct ContentView: View {
    
    private let icons = ["apple", "cherry", "star"]
    @State private var slot1 = "apple"
    @State private var slot2 = "cherry"
    @State private var slot3 = "star"
    @AppStorage(Settings.creditKey) var credit = 1000

    
    var body: some View {
        VStack {
            Spacer()
            Text("Slots")
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            Spacer()
            
            Text("credit : " + String(credit))
                .font(.subheadline)
            
            Spacer()
            HStack{
                Spacer()
                Image(slot1)
                    .resizable()
                    .frame(width:100,
                           height:100)
                Spacer()
                Image(slot2)
                    .resizable()
                    .frame(width:100,
                           height:100)
                Spacer()
                Image(slot3)
                    .resizable()
                    .frame(width:100,
                           height:100)
                Spacer()
            }
            Spacer()
            
            Button {
                //Slot 1 :
                let firstSlotRand = Int.random(in:0...2)
                slot1 = icons[firstSlotRand]
                
                //Slot 2 :
                let secondSlotRand = Int.random(in:0...2)
                slot2 = icons[secondSlotRand]
                
                //Slot 3 :
                let thirdSlotRand = Int.random(in:0...2)
                slot3 = icons[thirdSlotRand]
                
                if(firstSlotRand == secondSlotRand && secondSlotRand == thirdSlotRand){
                    credit += 50
                }
                else{
                    credit -= 10
                }
                
            } label: {
                Text("Launch")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            Spacer()

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
