//
//  Page2.swift
//  Second
//
//  Created by Daksh on 13/02/23.
//

import SwiftUI

struct Page2: View {
    @Environment(\.presentationMode) var isPresent
    
    var clickedIdx:UUID?
    var data:[Value] = []
    static var onCompletition: ((_ toSend: String) -> ())?
    @State var tf1 = ""
    
    var body: some View {
        NavigationView{
            VStack{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).onAppear(){
                    print(clickedIdx)
                }
                TextField(tf1, text: $tf1).background(.purple)
                Button("Save", action: {
                    self.isPresent.wrappedValue.dismiss()
                    Page2.onCompletition!(tf1)
                })
            }
        }
    }
}

struct Page2_Previews: PreviewProvider {
    static var previews: some View {
        Page2()
            
    }
}
