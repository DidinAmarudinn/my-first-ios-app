//
//  DetailProductView.swift
//  FurnitureApp
//
//  Created by didin amarudin on 09/02/22.
//

import SwiftUI

struct DetailProductView: View {
    @Environment (\.dismiss) var dismiss
    @State private var qty: Int = 0
    
    var image: String
    
    var body: some View {
        VStack {
            ZStack{
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView (){
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.top)
                       
                    DescriptionView(qty: $qty)
                        .offset(y:-40)
                        .padding(.bottom,40)
                    
                }.edgesIgnoringSafeArea(.top)
                
                HStack{
                    Text("$129")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Add to Cart")
                            .padding()
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(10)
                            .foregroundColor(Color("Primary"))
                    }
                }
                .padding()
                .padding(.horizontal)
                .background(Color("Primary"))
                .cornerRadius(50, corners: .topLeft)
                .frame(maxHeight:.infinity, alignment: .bottom)
                
                
    
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                BackButtonView(action: {dismiss()})
            }
            ToolbarItem(placement: .navigationBarTrailing){
                Image("threeDot")
                
                
            }
        }
    }
}
struct DetailProductView_Previews: PreviewProvider {
    static var previews: some View {
        DetailProductView(image: "chair_1")
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


struct DescriptionView: View {
    @Binding var qty: Int
    var body: some View {
        VStack (alignment: .leading){
            Text("Luruxy Swedia \nChair")
                .font(.title)
                .foregroundColor(.black)
                .fontWeight(.bold)
               
            
            
            HStack (spacing: 4){
                ForEach(0 ..< 5){
                    item in
                    Image("star")
                }
                Text("4.9")
                    .opacity(0.5)
                    .padding(.leading, 8)
                
                Spacer()
            }
            Text("Description")
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding(.vertical, 8)
            
            Text("Luruxy Swedian Chair is contemporary chair based on the virtus of moder craft. It carries on the simplicity and honestly of the archetypical chair.")
                .lineSpacing(8.0)
                .foregroundColor(.black)
                .opacity(0.6)
                .lineLimit(4)
            
            HStack (alignment:.top){
                VStack (alignment: .leading, spacing: 8){
                    Text("Size")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text("Height: 120 cm")
                        .foregroundColor(.black)
                        .opacity(0.6)
                    Text("Width: 80 cm")
                        .foregroundColor(.black)
                        .opacity(0.6)
                    Text("Diameter: 72 cm")
                        .foregroundColor(.black)
                        .opacity(0.6)
                    
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                VStack (alignment: .leading, spacing: 8){
                    Text("Treatment")
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                    
                    Text("Jati Woods, Canvas\nAmazing")
                        .foregroundColor(.black)
                        .opacity(0.6)
                        
                 
 
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            
            HStack (alignment: .bottom){
                VStack(alignment: .leading) {
                    Text("Color")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    HStack{
                        ColorDotView(color: .white)
                        ColorDotView(color: .black)
                        ColorDotView(color: Color("Primary"))
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                
                VStack (alignment: .leading){
                    Text("Quantiy")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    HStack{
                        Button(action: {
                            if(qty > 0){
                                qty -= 1
                            }
                        }) {
                            Image(systemName: "minus")
                                .padding(.all, 8)
                            
                            
                        }.frame(width: 30, height: 30, alignment: .center)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                            .foregroundColor(.black)
                        
                        Text(String(qty))
                            .font(.title2)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .padding(.horizontal,8)
                        
                        Button(action: {
                            qty += 1
                        }) {
                            Image(systemName: "plus")
                                .padding(.all, 8)
                            
                            
                        }.background(Color("Primary"))
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
        .padding(.top, 20)
        .background(Color("Bg"))
        .cornerRadius(40)
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 30, height: 30, alignment: .center)
            .clipShape(Circle())
    }
}


struct BackButtonView: View {
    let action: ()-> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .padding(.all, 10)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(8)
        }
    }
}
