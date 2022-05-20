//
//  ContentView.swift
//  tempApp
//
//  Created by satoshi yamashita on 2022/03/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(1..<20) { index in
                NavigationLink(destination: Text("\(index)番目のView")) {
                    Text("\(index)行目")
                }
            }
            .navigationTitle("NavigationView")
            .navigationBarTitleDisplayMode(.inline)

            .toolbar {
                /// ナビゲーションバー左
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                    }
                }

                /// ナビゲーションバー右１
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "trash")
                    }
                }

                /// ナビゲーションバー右２
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {}
                }

                /// ボトムバー
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {}) {
                        Label("送信", systemImage: "paperplane")
                    }
                } // ToolbarItemここまで
            } // .toolbarここまで
        } // NavigationViewここまで
    } // bodyここまで
} // ContentViewここまで

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
