//
//  ContentView.swift
//  tempApp
//
//  Created by satoshi yamashita on 2022/03/17.
//

import SwiftUI

// 列挙型を試した
enum Fruits: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case apple = "りんご"
    case banana = "ばなな"
    case grape = "ぶどう"
}

struct ContentView: View {
    // enum型を宣言＆初期化している
    @State var fruit: Fruits = .apple

    var body: some View {
        // ピッカー時にも必須？
        VStack {
            // "picker名",selection:enum変数を指定
            Picker("Select Fruit", selection: $fruit) {
                // enum内の全要素分繰り返す
                // id: \.selfの部分で.appleとかが初期化されてる気がする
                ForEach(Fruits.allCases, id: \.self) { value in
                    Text(value.rawValue)
                        // picker選択できるようにタグ付け
                        .tag(value)
                }
            }
            // ホイールピッカースタイル
            .pickerStyle(WheelPickerStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
