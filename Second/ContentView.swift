//
//  ContentView.swift
//  Second
//
//  Created by Daksh on 19/02/35.
//

import SwiftUI
import CoreData


struct Value: Identifiable{
    let id = UUID()
    var value:Int
    var ascii:String
}

struct ContentView: View {
    @State var sliderVal = 0.0
    @State var dakshTitle = "Aashish"
    @State var dakshBorder = Color(.black)
    @State var goToPage2 = false
    @State var data:[Value] = []
    @State var temp = Page2()
    
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: temp, isActive: $goToPage2){
                    Text("Next >")
                }.padding(.leading, 300).padding(.top, 5)
                var daksh = Text(dakshTitle).multilineTextAlignment(.center).frame(width: 100.0).border(dakshBorder, width: 3).foregroundColor(.purple).cornerRadius(10).padding(.bottom, 20).onAppear(){
                    print(goToPage2)
                    if(goToPage2 == false){
                        data = []
                        
                        for var j in 0...25{
                            data.append(Value(value: j, ascii: "" + String(UnicodeScalar(j+65)!) ))
                        }
                        
                        Page2.onCompletition = { received in
                            print(received)
                        }
                        
                    }
                }
                daksh
                Image(uiImage: UIImage(named: "Image1")!).resizable().scaledToFit().frame(width: 350).foregroundColor(.red).border(.gray, width: 5)
                
                
                
                
                Slider(value: $sliderVal, onEditingChanged: { _ in
                    print(sliderVal)
                }).rotationEffect(.degrees(270)).padding().frame(width: 100)
                
                Button("Click Me", action: {
                    sliderVal = 1.0
                    dakshTitle = "Daksh"
                    dakshBorder = .purple
                }).fontWeight(.bold).fontWidth(.expanded).font(.system(size: 40)).background(.gray).cornerRadius(18).padding(.trailing, 100).shadow(color: .red, radius: 20, x:10, y: 10)
                
                Table(data) {
                    TableColumn("Counting") { val in
                        HStack{
                            Text("\(val.value)")
                            Spacer()
                            Text("\(val.ascii)")
                            Spacer()
                            Image(uiImage: UIImage(named: "Image1")!).resizable().scaledToFit().frame(width: 50).foregroundColor(.red).border(.gray, width: 5)
                        }.contentShape(Rectangle()).onTapGesture {
                            temp.clickedIdx = val.id
                            temp.data = self.data
                            goToPage2 = true
                        }
                    }
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
