//
//  ContentView.swift
//  TwitchDummy
//
//  Created by Przemysław Woźny on 19/10/2021.
//

import SwiftUI
    //145 red, 70 green, and 255 blue
extension Color{
    static var twitchPurple: Color = Color(red: 145/255, green: 70/255, blue: 255/255)
}
private let categories: [Categories] = [
    Categories(name: "League of Legends", viewers: "200,8 tys."),
    Categories(name: "VALORANT", viewers: "94,9 tys."),
    Categories(name: "Minecraft", viewers: "90,9 tys."),
    Categories(name: "Baloons TD 6", viewers: "428"),
    Categories(name: "Rozmowy", viewers: "370,1 tys.")]

private let followed: [FollowedLiveTransmition] = [FollowedLiveTransmition(name: "Trash Taste Manga Game Show #ad | !BW", user: TwitchUser(name: "TrashTastePodcast", iconName: "TTIcon"),category: Categories(name: "Rozmowy", viewers: "370,1 tys."), filters: ["angielski"])
    ]

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
        VStack{
            HStack{
                Button(action: {})
            {
                Image("sona").resizable()
                    .frame(width: 30, height: 30)
                .clipShape(Circle())}.padding(.leading)
                Spacer()
                rightIcons().padding(.trailing)
                
            }.padding(.top, 10)
        ZStack{
            TabView(selection: $selectedTab){
                if #available(iOS 15.0, *) {
                    FeedView(categories: categories, followed: followed).tabItem{
                        VStack{
                            Image(systemName: "suit.heart.fill")
                            Text("Śledzenie")
                        }
                        
                    }.tag(0)
                } else {
                    // Fallback on earlier versions
                }
                Text("tab2").tabItem{
                    VStack{
                    Image(systemName: "location.circle")
                    Text("Odkrycie")
                    }
                }.tag(1)
                Text("tab3").tabItem{
                    VStack{
                    Image(systemName: "rectangle.portrait.on.rectangle.portrait")
                    Text("Przeglądaj")
                    }
                }.tag(2)
            }.accentColor(.twitchPurple)
                
            
        
            
        }
    }
    }
}

@available(iOS 15.0, *)
struct FeedView: View {
    let categories: [Categories]
    let followed: [FollowedLiveTransmition]
    var body: some View {
        VStack{
        NavigationView{
            List() {
                Text("Śledzenie")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .listRowSeparator(.hidden)
                Text("Obserwowane kategorie")
                    .font(.headline)
                    .fontWeight(.bold).listRowSeparator(.hidden)
                    
                ScrollView (.horizontal, showsIndicators: false) {
                     HStack {
                         ForEach(categories){ category in
                             CategoryView(category: category).frame(maxWidth: 143)
                         }
                     }
                }.listRowSeparator(.hidden)
                Text("Twoje kanały na żywo")
                    .font(.headline)
                    .fontWeight(.bold).listRowSeparator(.hidden)
                ForEach(followed){follow in
                    FollowedLiveView(followed: follow)
                }
                Text("Kanały polecane dla ciebie")
                    .font(.headline)
                    .fontWeight(.bold).listRowSeparator(.hidden)
                Text("Kontynuuj oglądanie")
                    .font(.headline)
                    .fontWeight(.bold).listRowSeparator(.hidden)
                Text("Twoje Kanały offline")
                    .font(.headline)
                    .fontWeight(.bold).listRowSeparator(.hidden)
            }
            .navigationBarHidden(true)            .listStyle(PlainListStyle())
        }
        }
    }
}

struct CategoryView: View{
    let category: Categories
    var body: some View{
        VStack{
            Image("\(category.name)").resizable()
                .frame(width: 142.5, height: 190)
            HStack{Text("\(category.name)")
                .fontWeight(.bold)
                .lineLimit(1)
                Spacer()
            }
            HStack{
                Text("●").font(.caption).foregroundColor(.red)
                Text("\(category.viewers)")
                    .foregroundColor(.secondary)
                Spacer()
            }
        }
    }
}

struct FollowedLiveView: View{
    let followed: FollowedLiveTransmition
    var body: some View{
        HStack{
            VStack{
                Image("\(followed.user.name)").resizable()
                    .frame(width: 111, height: 63)
                Spacer()
            }
            VStack{
                HStack{
//                    Image("\(followed.user.iconName)")
                    Image("sona").resizable()
                        .frame(width: 15, height: 15)
                    .clipShape(Circle())
                    Text("\(followed.user.name)")
                        .fontWeight(.bold)
                    Spacer()
                }
                HStack{
                Text("\(followed.name)").fontWeight(.light).lineLimit(1)
                Spacer()
                }
                HStack{
                Text("\(followed.category.name)")
                .fontWeight(.light).lineLimit(1)
                    Spacer()
                }
                HStack{
                    ForEach(followed.filters, id: \.self){filter in
                        Text("\(filter)").padding(.horizontal,8)
                            .padding(.vertical,2)
                            .background(.secondary)
                            .cornerRadius(15)
                    }
                    Spacer()
                }
            }.padding(.leading, 8)
        }
    }
}


struct rightIcons: View {
    
    var body: some View{
        HStack{
            Image(systemName: "video")
                .foregroundColor(Color("Ikonki")).padding(.trailing,6)
            Image(systemName: "tray")
            .foregroundColor(Color("Ikonki")).padding(.trailing,6)
            Image(systemName: "bubble.right")
            .foregroundColor(Color("Ikonki")).padding(.trailing,6)
            Image(systemName: "magnifyingglass")
            .foregroundColor(Color("Ikonki")).padding(.trailing,6)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
