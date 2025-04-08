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
    case search  // 搜索
    case menu  // 菜单
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
        case .search:
            return "搜索"
        case .menu:
            return "更多"
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
        case .search:
            return "magnifyingglass"
        case .menu:
            return "ellipsis"
        case .custom:
            return nil
        }
    }
}

/// 按钮样式类型
public enum WSButtonStyleType {
    case primary  // 主要按钮
    case secondary  // 次要按钮
    case tertiary  // 第三级按钮（文本风格）
    case destructive  // 危险操作
    case plain  // 无样式
    case material  // 材质风格
}

/// 按钮构建器 - 支持链式调用
public struct WSButtonBuilder {
    // 按钮语义
    private let semantic: WSButtonSemantic
    // 按钮样式
    private var styleType: WSButtonStyleType = .material
    // 是否仅显示图标
    private var iconOnly: Bool = true
    // 是否显示图标
    private var showIcon: Bool = true
    // 自定义文本
    private var customText: String?

    /// 初始化按钮构建器
    /// - Parameter semantic: 按钮语义
    fileprivate init(semantic: WSButtonSemantic) {
        self.semantic = semantic
    }

    /// 显示文本
    /// - Parameter text: 按钮文本
    /// - Returns: 更新后的构建器
    public func text(_ text: String? = nil) -> WSButtonBuilder {
        var builder = self
        builder.iconOnly = false
        builder.customText = text
        return builder
    }

    /// 主要样式
    public func primary() -> WSButtonBuilder {
        var builder = self
        builder.styleType = .primary
        return builder
    }

    /// 次要样式
    public func secondary() -> WSButtonBuilder {
        var builder = self
        builder.styleType = .secondary
        return builder
    }

    /// 第三级样式
    public func tertiary() -> WSButtonBuilder {
        var builder = self
        builder.styleType = .tertiary
        return builder
    }

    /// 危险操作样式
    public func destructive() -> WSButtonBuilder {
        var builder = self
        builder.styleType = .destructive
        return builder
    }

    /// 无样式
    public func plain() -> WSButtonBuilder {
        var builder = self
        builder.styleType = .plain
        return builder
    }

    /// 材质样式
    public func material() -> WSButtonBuilder {
        var builder = self
        builder.styleType = .material
        return builder
    }

    /// 控制图标显示
    /// - Parameter show: 是否显示图标
    /// - Returns: 更新后的构建器
    public func icon(_ show: Bool) -> WSButtonBuilder {
        var builder = self
        builder.showIcon = show
        return builder
    }

    /// 创建图标视图
    fileprivate func makeIconView() -> some View {
        if let iconName = semantic.iconName {
            // 根据样式决定图标尺寸
            let iconSize: CGFloat = styleType == .material ? 32 : 32

            return AnyView(
                Image(systemName: iconName)
                    //                    .resizable()
                    //                    .scaledToFit()
                    //                    .font(.title2)
                    //                    .frame(width: iconSize, height: iconSize)
                    .applyIconStyle(styleType)
            )
        } else {
            return AnyView(
                Text(semantic.defaultText)
                    .applyStyle(styleType)
            )
        }
    }
}

/// 按钮内容命名空间
public enum WSButton {
    /// 确认按钮
    public static func confirm() -> WSButtonBuilder {
        WSButtonBuilder(semantic: .confirm)
    }

    /// 取消按钮
    public static func cancel() -> WSButtonBuilder {
        WSButtonBuilder(semantic: .cancel)
    }

    /// 关闭按钮
    public static func close() -> WSButtonBuilder {
        WSButtonBuilder(semantic: .close)
    }

    /// 删除按钮
    public static func delete() -> WSButtonBuilder {
        WSButtonBuilder(semantic: .delete)
    }

    /// 添加按钮
    public static func add() -> WSButtonBuilder {
        WSButtonBuilder(semantic: .add)
    }

    /// 编辑按钮
    public static func edit() -> WSButtonBuilder {
        WSButtonBuilder(semantic: .edit)
    }

    /// 保存按钮
    public static func save() -> WSButtonBuilder {
        WSButtonBuilder(semantic: .save)
    }

    /// 返回按钮
    public static func back() -> WSButtonBuilder {
        WSButtonBuilder(semantic: .back)
    }

    /// 下一步按钮
    public static func next() -> WSButtonBuilder {
        WSButtonBuilder(semantic: .next)
    }

    /// 搜索按钮
    public static func search() -> WSButtonBuilder {
        WSButtonBuilder(semantic: .search)
    }

    /// 菜单按钮
    public static func menu() -> WSButtonBuilder {
        WSButtonBuilder(semantic: .menu)
    }

    /// 自定义按钮
    /// - Parameter text: 按钮文本
    /// - Returns: 按钮构建器
    public static func custom(_ text: String) -> WSButtonBuilder {
        WSButtonBuilder(semantic: .custom(text))
    }
}

// MARK: - 按钮构建器的视图转换

extension WSButtonBuilder: View {
    public var body: some View {
        Group {
            if iconOnly {
                // 仅图标
                makeIconView()
            } else {
                // 带文本（可选带图标）
                HStack(spacing: 4) {
                    if showIcon, let iconName = semantic.iconName {
                        Image(systemName: iconName)
                    }

                    Text(customText ?? semantic.defaultText)
                }
                .applyStyle(styleType)
            }
        }
    }
}

// MARK: - 样式应用扩展

extension View {
    /// 应用按钮样式
    /// - Parameter styleType: 按钮样式类型
    /// - Returns: 修饰后的视图
    @ViewBuilder
    nonisolated fileprivate func applyStyle(_ styleType: WSButtonStyleType)
        -> some View
    {
        switch styleType {
        case .primary:
            self.primaryStyle()
        case .secondary:
            self.secondaryStyle()
        case .tertiary:
            self.tertiaryStyle()
        case .destructive:
            self.destructiveStyle()
        case .plain:
            self.plainStyle()
        case .material:
            self.materialStyle()
        }
    }

    /// 应用图标样式
    /// - Parameter styleType: 按钮样式类型
    /// - Returns: 修饰后的视图
    @ViewBuilder
    nonisolated fileprivate func applyIconStyle(_ styleType: WSButtonStyleType)
        -> some View
    {
        self
            .symbolRenderingMode(.hierarchical)
            // 对Material样式应用circle.fill变体
            .if(styleType == .material) { view in
                view.symbolVariant(.circle.fill)
                    // 使用环境色值以适应深色/浅色模式
                    .foregroundStyle(
                        //            .primary.opacity(0.9),  // 主色调使用primary适应当前模式
                        //            .secondary.opacity(0.3)  // 次色调使用secondary适应当前模式
                        .white,
                        .white.tertiary
                    )
                    // 添加投影以提高在任何背景下的可见度
                    .shadow(color: .black.opacity(0.1), radius: 1)
            }
            // 对Primary样式应用普通变体
            .if(styleType == .primary && styleType != .material) { view in
                view.foregroundStyle(
                    Material.ultraThick,
                    Material.ultraThinMaterial
                )
            }
            .if(styleType == .destructive) { view in
                view.symbolVariant(.fill)
                    .foregroundStyle(
                        Color.red,
                        Color.red.opacity(0.3)
                    )
            }
            .if(styleType == .secondary) { view in
                view.foregroundStyle(
                    Color.blue,
                    Color.blue.opacity(0.3)
                )
            }
            .if(styleType == .tertiary) { view in
                view.foregroundStyle(
                    Color.blue
                )
            }
            .if(styleType == .plain) { view in
                view.foregroundStyle(
                    Color.primary
                )
            }
    }

    /// 应用主要按钮样式
    @ViewBuilder
    nonisolated fileprivate func primaryStyle() -> some View {
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
    nonisolated fileprivate func secondaryStyle() -> some View {
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
    nonisolated fileprivate func tertiaryStyle() -> some View {
        self
            .font(.headline)
            .foregroundStyle(Color.blue)
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
    }

    /// 应用危险操作按钮样式
    @ViewBuilder
    nonisolated fileprivate func destructiveStyle() -> some View {
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
    nonisolated fileprivate func plainStyle() -> some View {
        self
    }

    /// 应用材质样式
    @ViewBuilder
    nonisolated fileprivate func materialStyle() -> some View {
        self
            .font(.headline)
            .foregroundStyle(
                .white, .blue
            )
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.ultraThinMaterial)
                    .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
            }

    }
}

// MARK: - 工具扩展

extension View {
    /// 条件修饰器
    @ViewBuilder
    nonisolated fileprivate func `if`<Content: View>(
        _ condition: Bool, transform: (Self) -> Content
    )
        -> some View
    {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
