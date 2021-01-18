//
//  ItemDetail.swift
//  iDine
//
//  Created by RND on 2021/1/18.
//

import SwiftUI

struct ItemDetail: View {
    
    var item: MenuItem
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack{
            
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            //Image(item.mainImage)
            Text(item.description)
                .padding()
            
            // 按钮
            Button("Order This"){
                self.order.add(item: self.item)
            }.font(.headline)
            
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode:.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        NavigationView{
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
