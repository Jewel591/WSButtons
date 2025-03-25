# WSButtons

WSButtons是一个Swift Package，提供基于语义的按钮内容样式，适用于SwiftUI项目。使用流畅的链式调用API，可以轻松创建各种样式的按钮。

## 功能特点

- 基于语义的按钮设计（confirm、cancel、close等）
- 流畅的链式调用API
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

### 基本用法 - 图标按钮

默认情况下，WSButtons创建的是只包含图标的Material风格按钮：

```swift
// 确认按钮（默认Material风格）
Button {
    // 处理点击事件
} label: {
    WSButton.confirm()
}

// 关闭按钮
Button {
    // 处理点击事件
} label: {
    WSButton.close()
}
```

### 链式调用设置样式

你可以通过链式调用来改变按钮样式：

```swift
// 危险操作风格的删除按钮
Button {
    // 处理点击事件
} label: {
    WSButton.delete().destructive()
}

// 主要风格的确认按钮
Button {
    // 处理点击事件
} label: {
    WSButton.confirm().primary()
}

// 次要风格的编辑按钮
Button {
    // 处理点击事件
} label: {
    WSButton.edit().secondary()
}
```

### 添加文本内容

你可以使用`.text()`方法来添加文本内容：

```swift
// 添加默认文本
Button {
    // 处理点击事件
} label: {
    WSButton.confirm().text()
}

// 自定义文本
Button {
    // 处理点击事件
} label: {
    WSButton.close().text("关闭窗口")
}
```

### 控制图标显示

使用`.icon()`方法控制是否显示图标：

```swift
// 不显示图标的按钮
Button {
    // 处理点击事件
} label: {
    WSButton.add().text().icon(false)
}
```

### 组合调用

你可以组合多个方法来创建完全自定义的按钮：

```swift
// 自定义文本，主要样式，不显示图标
Button {
    // 处理点击事件
} label: {
    WSButton.custom("登录账号").primary().icon(false)
}

// 添加项目按钮，次要样式，带默认图标
Button {
    // 处理点击事件
} label: {
    WSButton.add().secondary().text("添加项目")
}
```

## 可用的预定义按钮

- `WSButton.confirm()` - 确认按钮
- `WSButton.cancel()` - 取消按钮
- `WSButton.close()` - 关闭按钮
- `WSButton.delete()` - 删除按钮
- `WSButton.add()` - 添加按钮
- `WSButton.edit()` - 编辑按钮
- `WSButton.save()` - 保存按钮
- `WSButton.back()` - 返回按钮
- `WSButton.next()` - 下一步按钮
- `WSButton.custom(text)` - 自定义按钮

## 可用的样式方法

- `.primary()` - 主要按钮样式
- `.secondary()` - 次要按钮样式
- `.tertiary()` - 第三级按钮样式
- `.destructive()` - 危险操作按钮样式
- `.plain()` - 无样式
- `.material()` - 材质风格样式

## 内容控制方法

- `.text(String?)` - 添加文本（默认使用语义对应的文本）
- `.icon(Bool)` - 控制是否显示图标

## 示例

查看`ButtonExamples.swift`文件获取更多使用示例。

## 许可证

MIT 