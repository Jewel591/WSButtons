# WSButtons

WSButtons是一个Swift Package，提供基于语义的按钮内容样式，适用于SwiftUI项目。

## 功能特点

- 基于语义的按钮设计（confirm、cancel、close等）
- 多种预设按钮样式（primary、secondary、destructive等）
- 支持Apple风格的Material材质按钮
- 可与标准SwiftUI Button组件无缝配合
- 简单易用的API
- 完全支持SwiftUI

## 系统要求

- iOS 17.0+
- macOS 14.0+
- watchOS 10.0+
- tvOS 17.0+
- Swift 6.0+

## 安装方法

### 通过Swift Package Manager安装

1. 在Xcode中，选择`File > Add Packages...`
2. 输入包的URL: `https://github.com/yourusername/WSButtons.git`
3. 选择版本规则（建议使用最新版本）
4. 点击"Add Package"

### 在Package.swift中添加依赖

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/WSButtons.git", from: "1.0.0")
]
```

## 使用方法

导入包：

```swift
import SwiftUI
import WSButtons
```

### 基本用法

WSButtons不再是一个完整的按钮组件，而是提供按钮的内容样式。你需要将它与标准的SwiftUI `Button` 结合使用：

```swift
// 确认按钮
Button {
    // 处理点击事件
} label: {
    WSButton.confirm
}

// 取消按钮
Button {
    // 处理点击事件
} label: {
    WSButton.cancel
}

// 删除按钮
Button {
    // 处理点击事件
} label: {
    WSButton.delete
}
```

### 自定义按钮

```swift
// 使用语义函数创建按钮内容
Button {
    // 处理点击事件
} label: {
    WSButton.semantic(.add, style: .tertiary)
}

// 创建自定义文本按钮
Button {
    // 处理点击事件
} label: {
    WSButton.custom("开始游戏")
}

// 控制图标显示
Button {
    // 处理点击事件
} label: {
    WSButton.semantic(.edit, showIcon: false)
}
```

### Material风格按钮

```swift
// Material样式按钮
Button {
    // 处理点击事件
} label: {
    WSButton.semantic(.confirm, style: .material)
}

// Material图标按钮
Button {
    // 处理点击事件
} label: {
    WSButton.icon(.close)
}

// 直接应用Material图标样式到任意图标
Button {
    // 处理点击事件
} label: {
    Image(systemName: "bell.fill")
        .materialIconStyle()
}
```

### 样式修饰器

你也可以直接使用样式修饰器来应用按钮样式：

```swift
Button("确认") {
    // 处理点击事件
}
.buttonStyle(.borderedProminent) // SwiftUI自带的按钮样式

Text("自定义样式")
    .primaryStyle()   // WSButtons提供的样式修饰器

HStack {
    Image(systemName: "star.fill") 
    Text("收藏")
}
.secondaryStyle()
```

## 可用的预定义按钮

- `WSButton.confirm` - 确认按钮
- `WSButton.cancel` - 取消按钮
- `WSButton.close` - 关闭按钮
- `WSButton.delete` - 删除按钮
- `WSButton.add` - 添加按钮
- `WSButton.edit` - 编辑按钮
- `WSButton.save` - 保存按钮
- `WSButton.back` - 返回按钮
- `WSButton.next` - 下一步按钮

## 可用的样式修饰器

- `.primaryStyle()` - 主要按钮样式
- `.secondaryStyle()` - 次要按钮样式
- `.tertiaryStyle()` - 第三级按钮样式
- `.destructiveStyle()` - 危险操作按钮样式
- `.plainStyle()` - 无样式
- `.materialStyle()` - 材质风格样式
- `.materialIconStyle()` - 材质图标样式

## 示例

查看`ButtonExamples.swift`文件获取更多使用示例。

## 许可证

MIT 