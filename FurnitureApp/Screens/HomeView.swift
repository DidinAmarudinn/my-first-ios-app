//
//  HomeView.swift
//  FurnitureApp
//
//  Created by didin amarudin on 09/02/22.
//

import SwiftUI

struct HomeView: View {
    private let categories = ["All" , "Chair", "Sofa", "Lamp" , "Kitchen", "Table"]
    
    @State private var selectedIndex: Int = 0
    
    @State private var isShow: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack (alignment: .leading){
                        AppBarView()
                        
                        TagLineView()
                            .padding()
                        
                        SearchView()
                       
                        ScrollView (.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(categories.indices){
                                    index in
                                    CategorieView(label: categories[index], isActive: index == selectedIndex)
                                        .onTapGesture {
                                            selectedIndex = index
                                        }
                                }
                            }.padding()
                        }
                        
                        Text("Popular")
                            .font(.custom("PlayFairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .foregroundColor(Color.black)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (){
                                ForEach(0 ..< 4){
                                    index in
                                   NavigationLink(destination: DetailProductView(image: "chair_\(index+1)"), label:{
                                       ProductCardView(image: "chair_\(index+1)", size: 210)
                                   })
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                }
                                .padding(.trailing)
                            }.padding(.leading)
                        }
                        
                        
                        Text("Best")
                            .font(.custom("PlayFairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .foregroundColor(Color.black)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (){
                                ForEach(0 ..< 4){
                                    index in
                                    ProductCardView(image: "chair_\(index+1)", size: 180)
                                }
                                .padding(.trailing)
                            }.padding(.leading)
                        }

                    }
                }
                .gesture(
                    DragGesture().onChanged{
                        value in
                        if value.translation.height > 0 {
                                isShow = true
                            print("scroll down")
                        }else {
                           isShow = false
                            print("scroll up")
                        }
                    }
                )
                
                
                if(isShow){
                    HStack{
                        BottomNavbarItem(image: "house",action: {}, isFromImageSystem: true)
                        BottomNavbarItem(image: "heart",action: {}, isFromImageSystem: true)
                        BottomNavbarItem(image: "cart",action: {},isFromImageSystem: true)
                        BottomNavbarItem(image: "person",action: {}, isFromImageSystem: true)
                    }
                    .padding()
                    .background(Color.white)
                    .clipShape(Capsule())
                    .padding()
                    .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
                    .frame(maxHeight:.infinity, alignment: .bottom)
                }
            }
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct AppBarView: View {
    var body: some View {
        HStack{
            Button(action: {
                
            }) {
                Image("menu")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10)
                
            }
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image("Profile")
                    .resizable()
                    .frame(width:42, height: 42)
                .cornerRadius(10)                    }
            
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchView: View {
    @State private var searchText: String = ""
    var body: some View {
        HStack{
            HStack {
                Image("Search")
                    .padding(.trailing,0)
                TextField("Search Furniture", text: $searchText)
                
            }
            .padding()
            .background(Color(.white))
            .cornerRadius(10)
            .padding(.trailing)
            
            Image(systemName: "viewfinder")
                .foregroundColor(.white)
                .padding()
                .background(Color("Primary"))
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

struct CategorieView: View {
    let label: String
    let isActive: Bool
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            Text(label)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.6))
            
            if (isActive) {
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let image: String
    let size: CGFloat
    var body: some View {
        VStack{
            Image(image)
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20)
            
            Text("Luxury Swedian Chair")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            
            
            HStack (spacing:2){
                ForEach(0 ..< 5){
                    item in
                    Image("star")
                }
                
                Spacer()
                
                Text("$129")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
            }
            
            
            
        }
        .frame(minWidth:0, maxWidth: size)
        .padding()
        .background(Color(.white))
        .cornerRadius(20)
    }
}

struct BottomNavbarItem: View {
    let image: String
    let action: ()-> Void
    let isFromImageSystem: Bool
    var body: some View {
        Button(action:action) {
            if isFromImageSystem{
                Image(systemName: image)
                .resizable()
                .frame(width:26, height: 25)
                .foregroundColor(.black)
                .frame(maxWidth:.infinity)
            }else{
                Image(image)
                .frame(maxWidth: .infinity)
            }
            
        }
    }
}
