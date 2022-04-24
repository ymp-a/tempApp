//
//  ContentView.swift
//  tempApp
//
//  Created by satoshi yamashita on 2022/03/17.
//

import SwiftUI

struct ContentView: View {
    // ボタンフラグを管理
    @State private var isNextEnable: Bool = true

    var body: some View {
        // 縦のレイアウト10ずつあけてオブジェクト配置する
        VStack(spacing: 10) {

            // ■ボタンスタイルプロパティを使う書き方
            // isNextEnableがtrueかfalseでテキスト表示を切り替える三項演算子を利用
            // ボタン1　テキスト、ロール、アクションを先に記入する方法
            Button("Tap Me!!(\(isNextEnable ? "Enable": "Disable"))", role: .none, action: {
                // ボタンタップでフラグオフ
                isNextEnable = false
            })
            // テキストサイズ
            .font(.largeTitle)
            // 背景側がOSのアクセントカラー（青）に、文字色が白になる便利
            // ボタン無効化すると色がライトグレーになる
            .buttonStyle(.borderedProminent)
            // ボタンのpaddingと丸みを(端末ごとに)自動調整してくれる便利
            .controlSize(.regular)
            // 1番目のボタン無効化(!enable)となっているのはtrue時に無効にしないため
            .disabled(!isNextEnable)

            // ボタン2 アクション先行入力の方法
            Button(action: {
                isNextEnable = false
            }) {
                Text("Tap Me!!(\(isNextEnable ? "Enable": "Disable"))")
                    // 文字サイズ
                    .font(.largeTitle)
                    // 文字の余白(top & bottom)
                    .padding(.vertical, 5.5)
                    // 文字の余白(trailing & leading)
                    .padding(.horizontal, 10.0)
                    // 文字色
                    .foregroundColor(Color.white)
                    // 三項演算子で背景色を管理
                    .background(isNextEnable ? Color.orange: Color(UIColor.lightGray))
                    // 角の丸みは高さに依存している
                    .cornerRadius(10)
            } // 2番目のボタンレイアウトここまで
            // 2番目のボタン無効化
            .disabled(!isNextEnable)

            // ボタン3 アクション先行入力かつボタンスタイルプロパティで記入する方法
            Button(action: {
                isNextEnable = false
            }) {
                Text("Tap Me!!(\(isNextEnable ? "Enable": "Disable"))")
                // 文字サイズはどっちでもよさそう？
                //   .font(.largeTitle)
            } // 3番目のボタンレイアウト以下から
            .font(.largeTitle)
            // 背景側がOSのアクセントカラー（青）に、文字色が白になる便利
            // ボタン無効化すると色がライトグレーになる
            .buttonStyle(.borderedProminent)
            // ボタンのpaddingと丸みを(端末ごとに)自動調整してくれる便利
            .controlSize(.regular)
            // 3番目のボタン無効化
            .disabled(!isNextEnable)

            Button("リセット", role: .none, action: {
                // フラグリセット
                isNextEnable = true
            })
        } // VStackここまで
    } // bodyここまで
} // ContentViewここまで

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
