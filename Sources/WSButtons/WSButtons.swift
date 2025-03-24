// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

/// 按钮语义类型
public enum WSButtonSemantic {
  case confirm  // 确认
  case cancel  // 取消
  case close  // 关闭
  case delete  // 删除
  case add  // 添加
  case edit  // 编辑
  case save  // 保存
  case back  // 返回
  case next  // 下一步
  case custom(String)  // 自定义文本

  /// 获取语义对应的默认文本
  public var defaultText: String {
    switch self {
    case .confirm:
      return "确认"
    case .cancel:
      return "取消"
    case .close:
      return "关闭"
    case .delete:
      return "删除"
    case .add:
      return "添加"
    case .edit:
      return "编辑"
    case .save:
      return "保存"
    case .back:
      return "返回"
    case .next:
      return "下一步"
    case .custom(let text):
      return text
    }
  }

  /// 获取语义对应的默认图标（如果有）
  public var iconName: String? {
    switch self {
    case .confirm:
      return "checkmark"
    case .cancel:
      return "xmark"
    case .close:
      return "xmark.circle"
    case .delete:
      return "trash"
    case .add:
      return "plus"
    case .edit:
      return "pencil"
    case .save:
      return "square.and.arrow.down"
    case .back:
      return "chevron.left"
    case .next:
      return "chevron.right"
    case .custom:
      return nil
    }
  }
}

/// 按钮样式类型
public enum WSButtonStyle {
  case primary  // 主要按钮
  case secondary  // 次要按钮
  case tertiary  // 第三级按钮（文本风格）
  case destructive  // 危险操作
  case plain  // 无样式
  case material  // 材质风格
  case materialIcon  // 材质图标按钮
}

/// 按钮内容样式命名空间
public enum WSButton {
  // MARK: - 预定义按钮样式

  /// 确认按钮样式
  @ViewBuilder
  nonisolated public static var confirm: some View {
    buttonContent(for: .confirm)
  }

  /// 取消按钮样式
  @ViewBuilder
  nonisolated public static var cancel: some View {
    buttonContent(for: .cancel, style: .secondary)
  }

  /// 关闭按钮样式
  @ViewBuilder
  nonisolated public static var close: some View {
    buttonContent(for: .close)
  }

  /// 删除按钮样式
  @ViewBuilder
  nonisolated public static var delete: some View {
    buttonContent(for: .delete, style: .destructive)
  }

  /// 添加按钮样式
  @ViewBuilder
  nonisolated public static var add: some View {
    buttonContent(for: .add)
  }

  /// 编辑按钮样式
  @ViewBuilder
  nonisolated public static var edit: some View {
    buttonContent(for: .edit, style: .secondary)
  }

  /// 保存按钮样式
  @ViewBuilder
  nonisolated public static var save: some View {
    buttonContent(for: .save)
  }

  /// 返回按钮样式
  @ViewBuilder
  nonisolated public static var back: some View {
    buttonContent(for: .back, style: .tertiary)
  }

  /// 下一步按钮样式
  @ViewBuilder
  nonisolated public static var next: some View {
    buttonContent(for: .next)
  }

  // MARK: - 自定义按钮样式

  /// 创建自定义文本按钮内容
  /// - Parameters:
  ///   - text: 按钮文本
  ///   - style: 按钮样式
  ///   - showIcon: 是否显示图标
  /// - Returns: 按钮内容视图
  @ViewBuilder
  nonisolated public static func custom(
    _ text: String,
    style: WSButtonStyle = .primary,
    showIcon: Bool = false
  ) -> some View {
    buttonContent(for: .custom(text), style: style, showIcon: showIcon)
  }

  /// 创建特定语义的按钮内容
  /// - Parameters:
  ///   - semantic: 按钮语义
  ///   - style: 按钮样式
  ///   - showIcon: 是否显示图标
  /// - Returns: 按钮内容视图
  @ViewBuilder
  nonisolated public static func semantic(
    _ semantic: WSButtonSemantic,
    style: WSButtonStyle = .primary,
    showIcon: Bool = true
  ) -> some View {
    buttonContent(for: semantic, style: style, showIcon: showIcon)
  }

  /// 创建Material图标按钮
  /// - Parameter semantic: 按钮语义
  /// - Returns: 按钮内容视图
  @ViewBuilder
  nonisolated public static func icon(_ semantic: WSButtonSemantic) -> some View {
    if let iconName = semantic.iconName {
      Image(systemName: iconName)
        .font(.title2)
        .padding(8)
        .contentShape(Circle())
        .symbolRenderingMode(.hierarchical)
        .foregroundStyle(
          Material.ultraThick,
          Material.ultraThinMaterial
        )
    } else {
      Text(semantic.defaultText)
        .font(.headline)
        .foregroundStyle(Material.ultraThick)
    }
  }

  // MARK: - 私有辅助方法

  /// 创建按钮内容视图
  /// - Parameters:
  ///   - semantic: 按钮语义
  ///   - style: 按钮样式
  ///   - showIcon: 是否显示图标
  /// - Returns: 按钮内容视图
  @ViewBuilder
  nonisolated private static func buttonContent(
    for semantic: WSButtonSemantic,
    style: WSButtonStyle = .primary,
    showIcon: Bool = true
  ) -> some View {
    HStack(spacing: 4) {
      if showIcon, let iconName = semantic.iconName {
        Image(systemName: iconName)
      }

      Text(semantic.defaultText)
    }
    .applyStyle(style)
  }
}

// MARK: - 样式应用扩展

extension View {
  /// 应用按钮样式
  /// - Parameter style: 按钮样式
  /// - Returns: 修饰后的视图
  @ViewBuilder
  nonisolated public func applyStyle(_ style: WSButtonStyle) -> some View {
    switch style {
    case .primary:
      primaryStyle()
    case .secondary:
      secondaryStyle()
    case .tertiary:
      tertiaryStyle()
    case .destructive:
      destructiveStyle()
    case .plain:
      plainStyle()
    case .material:
      materialStyle()
    case .materialIcon:
      materialIconStyle()
    }
  }

  /// 应用主要按钮样式
  @ViewBuilder
  nonisolated public func primaryStyle() -> some View {
    self
      .font(.headline)
      .foregroundStyle(.white)
      .padding(.vertical, 12)
      .padding(.horizontal, 16)
      .background(
        RoundedRectangle(cornerRadius: 10)
          .fill(Color.blue)
      )
  }

  /// 应用次要按钮样式
  @ViewBuilder
  nonisolated public func secondaryStyle() -> some View {
    self
      .font(.headline)
      .foregroundStyle(Color.blue)
      .padding(.vertical, 12)
      .padding(.horizontal, 16)
      .background(
        RoundedRectangle(cornerRadius: 10)
          .stroke(Color.blue, lineWidth: 1)
      )
  }

  /// 应用第三级按钮样式
  @ViewBuilder
  nonisolated public func tertiaryStyle() -> some View {
    self
      .font(.headline)
      .foregroundStyle(Color.blue)
      .padding(.vertical, 8)
      .padding(.horizontal, 12)
  }

  /// 应用危险操作按钮样式
  @ViewBuilder
  nonisolated public func destructiveStyle() -> some View {
    self
      .font(.headline)
      .foregroundStyle(.white)
      .padding(.vertical, 12)
      .padding(.horizontal, 16)
      .background(
        RoundedRectangle(cornerRadius: 10)
          .fill(Color.red)
      )
  }

  /// 应用无样式
  @ViewBuilder
  nonisolated public func plainStyle() -> some View {
    self
  }

  /// 应用材质样式
  @ViewBuilder
  nonisolated public func materialStyle() -> some View {
    self
      .font(.headline)
      .foregroundStyle(Color.primary)
      .padding(.vertical, 10)
      .padding(.horizontal, 14)
      .background {
        RoundedRectangle(cornerRadius: 10)
          .fill(.ultraThinMaterial)
          .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
      }
      .overlay {
        self
          .blendMode(.overlay)
          .opacity(0.8)
      }
  }

  /// 应用材质图标样式
  @ViewBuilder
  nonisolated public func materialIconStyle() -> some View {
    self
      .font(.title2)
      .padding(8)
      .contentShape(Circle())
      .symbolRenderingMode(.hierarchical)
      .foregroundStyle(
        Material.ultraThick,
        Material.ultraThinMaterial
      )
  }
}

// MARK: - 工具扩展

extension View {
  /// 条件修饰器
  @ViewBuilder
  func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
    if condition {
      transform(self)
    } else {
      self
    }
  }
}
