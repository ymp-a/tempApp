//
//  ContentView.swift
//  tempApp
//
//  Created by satoshi yamashita on 2022/03/17.
//

import SwiftUI

// カレンダーから日付を選択する
struct ContentView: View {
    @State private var selectionDate = Date()
    var body: some View {
        VStack {
            Text("カレンダーから\n日付を選択する")
                .font(.title)
            // 何もdisplayedComponentsを指定しないとラベル、日付(.date)、時間(.hourAndMinute)が表示される
            // カレンダー選択時の表記が混在するのはシミュレータバグ？実機では問題なし
            DatePicker("ラベル部分",selection: $selectionDate, displayedComponents: .date)
                // タップ時の選択方式を指定
                .datePickerStyle(DefaultDatePickerStyle())
                // フレーム幅でラベルの表記が変化、小さすぎるとラベル消滅するがDate部分は変化なし
                .frame(width: 150, height: 200)
                // ラベルを消す
//                .labelsHidden()
                // Dateテキスト色の変更セット
                .colorInvert()
                .colorMultiply(.blue)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
