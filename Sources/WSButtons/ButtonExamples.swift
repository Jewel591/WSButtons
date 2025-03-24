import SwiftUI

/// 按钮使用示例
public struct ButtonExamples: View {
  @State private var showMessage = false

  public init() {}

  public var body: some View {
    VStack(spacing: 20) {
      Group {
        // 预定义样式
        Text("预定义按钮样式")
          .font(.headline)
          .padding(.top)

        // 使用预定义的按钮内容
        Button {
          showMessage.toggle()
        } label: {
          WSButton.confirm
        }

        Button {
          showMessage.toggle()
        } label: {
          WSButton.cancel
        }

        Button {
          showMessage.toggle()
        } label: {
          WSButton.delete
        }

        // 自定义样式
        Text("自定义按钮样式")
          .font(.headline)
          .padding(.top)

        // 使用语义函数
        Button {
          showMessage.toggle()
        } label: {
          WSButton.semantic(.add, style: .tertiary)
        }

        // 自定义文本
        Button {
          showMessage.toggle()
        } label: {
          WSButton.custom("登录账号")
        }

        // 不显示图标
        Button {
          showMessage.toggle()
        } label: {
          WSButton.semantic(.edit, showIcon: false)
        }

        // 组合SwiftUI修饰符
        Button {
          showMessage.toggle()
        } label: {
          WSButton.custom("开始游戏")
            .shadow(radius: 3)
            .scaleEffect(1.1)
        }
      }

      Divider().padding(.vertical)

      Text("Material 风格按钮")
        .font(.headline)
        .padding(.bottom, 5)

      Group {
        // Material风格按钮
        Button {
          showMessage.toggle()
        } label: {
          WSButton.semantic(.confirm, style: .material)
        }

        // Material图标按钮
        HStack(spacing: 20) {
          ForEach([WSButtonSemantic.close, .add, .delete, .edit], id: \.defaultText) { semantic in
            Button {
              showMessage.toggle()
            } label: {
              WSButton.icon(semantic)
            }
          }
        }
        .padding()

        // 直接使用图标
        Button {
          showMessage.toggle()
        } label: {
          Image(systemName: "bell.fill")
            .materialIconStyle()
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
