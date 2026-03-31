# SwiftUI macOS Alert 警告弹窗

## 简介

演示 SwiftUI 中 Alert 的用法，显示警告/确认对话框。

## 快速开始

```bash
cd swiftui-macos-alert-demo
xcodegen generate
open SwiftUIAlertDemo.xcodeproj
# Cmd+R 运行
```

## 概念讲解

### 基础 Alert

```swift
@State private var showAlert = false

Button("显示") {
    showAlert = true
}
.alert("标题", isPresented: $showAlert) {
    Button("确定") { }
}
```

### 带消息的 Alert

```swift
.alert("标题", isPresented: $showAlert) {
    Button("确定") { }
    Button("取消", role: .cancel) { }
} message: {
    Text("这是详细的提示信息")
}
```

### Button 角色

| 角色 | 用途 | 样式 |
|------|------|------|
| `.cancel` | 取消按钮 | 默认 |
| `.destructive` | 危险操作 | 红色 |

## 完整示例

```swift
struct ContentView: View {
    @State private var showAlert = false

    var body: some View {
        Button("删除") {
            showAlert = true
        }
        .alert("确认删除", isPresented: $showAlert) {
            Button("取消", role: .cancel) { }
            Button("删除", role: .destructive) { }
        } message: {
            Text("确定要删除吗？此操作无法撤销。")
        }
    }
}
```

## 完整讲解（中文）

### Alert 用途

- 重要信息提示
- 危险操作确认
- 需要用户决策的场景

### Alert vs Sheet

| 组件 | 用途 | 特点 |
|------|------|------|
| Alert | 简单提示/确认 | 模态，阻塞 |
| Sheet | 复杂表单/编辑 | 非模态，可包含任意 UI |
