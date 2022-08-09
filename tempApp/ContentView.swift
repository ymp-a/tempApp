//
//  ContentView.swift
//  tempApp
//
//  Created by satoshi yamashita on 2022/03/17.
//

import SwiftUI
/// https://dev.classmethod.jp/articles/ios-alert-with-text-field/
struct AlertControllerWithTextFieldContainer: UIViewControllerRepresentable {

    @Binding var textFieldText: String
    @Binding var isPresented: Bool

    let title: String?
    let message: String?
    let placeholderText: String

    func makeUIViewController(context: Context) -> UIViewController {
        return UIViewController()
    }

    // SwiftUIから新しい情報を受け、viewControllerが更新されるタイミングで呼ばれる
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        // TextFieldの追加
        alert.addTextField { textField in
            textField.placeholder = placeholderText
            textField.returnKeyType = .done
        }

        // 決定ボタンアクション
        let doneAction = UIAlertAction(title: "決定", style: .default) { _ in
            if let textField = alert.textFields?.first,
               let text = textField.text {
                textFieldText = text
            }
        }

        // キャンセルボタンアクション
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel)

        alert.addAction(cancelAction)
        alert.addAction(doneAction)

        DispatchQueue.main.async {
            uiViewController.present(alert, animated: true) {
                isPresented = false
            }
        }
    }
}

// カスタムModifierの定義
struct AlertWithTextField: ViewModifier {
    @Binding var textFieldText: String
    @Binding var isPresented: Bool

    let title: String?
    let message: String?
    let placeholderText: String

    func body(content: Content) -> some View {
        ZStack {
            content

            if isPresented {
                AlertControllerWithTextFieldContainer(textFieldText: $textFieldText,
                                                      isPresented: $isPresented,
                                                      title: title,
                                                      message: message,
                                                      placeholderText: placeholderText)
            }
        }
    }
}

extension View {
    // カスタムModifierのメソッド名を alertWithTextField に置き換え
    func alertWithTextField(_ text: Binding<String>, isPresented: Binding<Bool>, title: String?, message: String?, placeholderText: String) -> some View {
        self.modifier(AlertWithTextField(textFieldText: text,
                                         isPresented: isPresented,
                                         title: title,
                                         message: message,
                                         placeholderText: placeholderText))
    }
}

struct ContentView: View {

    @State private var text = "入力されたテキスト"
    @State private var shouldPresentAlert = false

    var body: some View {

        VStack(spacing: 50) {
            Text(text)
                .bold()

            Button {
                shouldPresentAlert.toggle()
            } label: {
                Text("アラート表示")
            }
        }
        .alertWithTextField($text,
                            isPresented: $shouldPresentAlert,
                            title: "テキスト入力",
                            message: "カテゴリをにゅうりょくしてね",
                            placeholderText: "")

    } // bodyここまで
} // ContentViewここまで

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
