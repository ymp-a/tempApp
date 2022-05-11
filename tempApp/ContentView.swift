//
//  ContentView.swift
//  tempApp
//
//  Created by satoshi yamashita on 2022/03/17.
//

import SwiftUI

struct ContentView: View {
    // 画像タップで画像をAPIから取得する

    var body: some View {
        // 画像配置
        VStack(spacing: 50) {
            Image("cat")
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(30)
            Image("cat")
                .resizable()
                .frame(width: 100, height: 100)
            Image("cat")
                .resizable()
                .frame(width: 100, height: 100)
        } // VStackここまで
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
