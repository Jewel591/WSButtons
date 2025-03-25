import SwiftUI

/// 按钮使用示例
public struct ButtonExamples: View {
    @State private var showMessage = false

    public init() {}

    public var body: some View {
        VStack(spacing: 20) {
            Group {
                // 基本用法 - 图标按钮
                Text("图标按钮（Material风格）")
                    .font(.headline)
                    .padding(.top)

                HStack(spacing: 20) {
                    Button {
                        showMessage.toggle()
                    } label: {
                        WSButton.confirm().material()

                    }

                    Button {
                        showMessage.toggle()
                    } label: {
                        WSButton.add()
                    }

                    Button {
                        showMessage.toggle()
                    } label: {
                        WSButton.close()
                    }

                    Button {
                        showMessage.toggle()
                    } label: {
                        WSButton.delete()
                    }
                }
                .padding()
                .buttonStyle(.plain)
                .background(Color.blue, in: .capsule)

                // 样式链式调用
                Text("样式链式调用")
                    .font(.headline)
                    .padding(.top)

                Button {
                    showMessage.toggle()
                } label: {
                    WSButton.delete().destructive()
                }

                Button {
                    showMessage.toggle()
                } label: {
                    WSButton.confirm().primary()
                }

                Button {
                    showMessage.toggle()
                } label: {
                    WSButton.edit().secondary()
                }

                // 添加文本内容
                Text("带有文本的按钮")
                    .font(.headline)
                    .padding(.top)

                Button {
                    showMessage.toggle()
                } label: {
                    WSButton.confirm().text()
                }

                Button {
                    showMessage.toggle()
                } label: {
                    WSButton.delete().destructive().text()
                }

                // 自定义文本
                Button {
                    showMessage.toggle()
                } label: {
                    WSButton.close().text("关闭窗口")
                }

                // 组合调用
                Text("组合调用示例")
                    .font(.headline)
                    .padding(.top)

                Button {
                    showMessage.toggle()
                } label: {
                    WSButton.custom("登录账号").primary().icon(false)
                }

                Button {
                    showMessage.toggle()
                } label: {
                    WSButton.add().secondary().text("添加项目")
                }
            }

            if showMessage {
                Text("按钮被点击了！")
                    .foregroundStyle(.green)
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    ButtonExamples()
}
