//
//  ContentView.swift
//  tempApp
//
//  Created by satoshi yamashita on 2022/03/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
                    Text("1")
                        .tabItem {
                            Image(systemName: "message.fill")
                            Text("メッセージ")
                        }
                    Text("2")
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("さがす")
                        }
                    Text("3")
                        .tabItem {
                            Image(systemName: "face.smiling.fill")
                            Text("スタンプ")
                        }
                }
                .accentColor(.green) //ここで色の指定
    } // bodyここまで
} // ContentViewここまで

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
