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
        VStack {
            Image("cat")
                .resizable(capInsets: EdgeInsets(top: -5.0, leading: -5.0, bottom: -5.0, trailing: -5.0))
            Image("cat")
                .resizable(capInsets: EdgeInsets(top: -5.0, leading: -5.0, bottom: -5.0, trailing: -5.0))
            Image("cat")
                .resizable(capInsets: EdgeInsets(top: -5.0, leading: -5.0, bottom: -5.0, trailing: -5.0))
        } // VStackここまで
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
