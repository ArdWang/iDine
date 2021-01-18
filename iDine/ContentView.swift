//
//  ContentView.swift
//  iDine
//
//  Created by RND on 2021/1/18.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView{
            List{
                ForEach(menu){ section in
//                    Text(section.name)
//
//                    ForEach(section.items){ item in
//                        Text(item.name)
//                    }
                    Section(header: Text(section.name)){
                        ForEach(section.items){ item in
                            ItemRow(item: item)
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
