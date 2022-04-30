//
//  ContentView.swift
//  tempApp
//
//  Created by satoshi yamashita on 2022/03/17.
//

import SwiftUI

// 参考 https://dev.classmethod.jp/articles/focusstate-keyboard/
// @FocusStateとは、フォーカスが変更があった時にSwiftUIが更新する値を読み書きできるプロパティラッパーです。
struct ContentView: View {
    // フォーカスが当たるTextFieldを判断するためのenumを作成します。
    // @FocusStateの定義にもある通り、ValueはHashableである必要がある為、準拠しています。
    enum Field: Hashable {
        case title
        case message
    }

    @State private var titleText = ""
    @State private var messageText = ""
    // @FocusStateを付与した値をnilにするとキーボードが閉じてくれるのでオプショナルにしています。
    @FocusState private var focusedField: Field?

    var body: some View {

        VStack {
            // TextFieldにフォーカスが当たった時に@FocusStateを更新する
            TextField("タイトル", text: $titleText)
                .padding()
                .border(Color("borderColor"))
                .padding()
                // 第一引数には@FocusStateの値を渡し、第二引数には今回はどのfocusedFieldを指しているのかを渡しています。
                .focused($focusedField, equals: .title)
                .onTapGesture {
                    focusedField = .title
                }

            TextField("メッセージ", text: $messageText)
                .padding()
                .border(Color("borderColor"))
                .padding()
                .focused($focusedField, equals: .message)
                // キーボードが一度閉じてしまう問題はフィールドからフィールドへのフォーカス移動にはfocusedField指定で対応してる
                .onTapGesture {
                    focusedField = .message
                }
        } // VStackここまで
        // タップフォーカス内の範囲を設定している
        .frame(width: UIScreen.main.bounds.width,
               height: UIScreen.main.bounds.height)
        // 範囲内ならタップでできるようになっている
        .contentShape(RoundedRectangle(cornerRadius: 10))
        // タップした時の処理
        .onTapGesture {
            focusedField = nil
        } // onTapGesture
    } // bodyここまで
} // ContentViewここまで

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
