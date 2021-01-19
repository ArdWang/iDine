//
//  CheckoutView.swift
//  iDine
//
//  Created by RND on 2021/1/19.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash","Credit Card","iDine Points"]
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    static let tipAmounts = [10,15,20,25,0]
    @State private var tipAmount = 1
    //显示和隐藏 Alert 弹窗
    @State private var showingPaymentAlert = false
    
    var totalPrice:Double{
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        // 必须使用 Form 不然差别特别的大
        Form {
            Section(header: Text("Add a tip?")) {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
            }
            
            // 产生动画的效果
            Toggle(isOn: $addLoyaltyDetails.animation()) {
                Text("Add iDine loyalty card")
            }

            if addLoyaltyDetails {
                TextField("Enter your iDine ID", text: $loyaltyNumber)
            }
            
            Section(header:Text("Add a tip?")){
                Picker("Percentage:", selection:$tipAmount){
                    ForEach(0 ..< Self.tipAmounts.count){
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            //这里指的是 进行
            Section(header:Text("TOTAL:$\(totalPrice, specifier: "%.2f")").font(.none)){
                Button("Confirm order"){
                    //显示和隐藏对话框
                    self.showingPaymentAlert.toggle()
                }
            }
        }.alert(isPresented: $showingPaymentAlert){
          // more to come
          Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f")"))
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}


struct CheckoutView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
