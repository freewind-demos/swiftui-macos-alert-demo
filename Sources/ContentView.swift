import SwiftUI

struct ContentView: View {
    @State private var showAlert1 = false
    @State private var showAlert2 = false
    @State private var showAlert3 = false
    @State private var showAlert4 = false
    @State private var lastAction = "无"

    var body: some View {
        VStack(spacing: 25) {
            Text("Alert 警告弹窗示例")
                .font(.title)

            // 1. 简单 Alert
            Button("显示简单 Alert") {
                showAlert1 = true
            }
            .alert("提示", isPresented: $showAlert1) {
                Button("确定") { lastAction = "点击了确定" }
            } message: {
                Text("这是一个简单的提示信息")
            }

            // 2. 带取消的 Alert
            Button("显示确认 Alert") {
                showAlert2 = true
            }
            .alert("确认操作", isPresented: $showAlert2) {
                Button("取消", role: .cancel) { lastAction = "点击了取消" }
                Button("确认", role: .destructive) { lastAction = "点击了确认" }
            } message: {
                Text("确定要执行此操作吗？")
            }

            // 3. 带标题和消息
            Button("显示详细信息 Alert") {
                showAlert3 = true
            }
            .alert("文件已保存", isPresented: $showAlert3) {
                Button("好的") { lastAction = "点击了好的" }
            } message: {
                Text("您的更改已保存到 /Users/demo/document.txt")
            }

            // 4. 危险操作确认
            Button("删除文件（危险）") {
                showAlert4 = true
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .alert("确认删除", isPresented: $showAlert4) {
                Button("取消", role: .cancel) { lastAction = "取消删除" }
                Button("删除", role: .destructive) { lastAction = "已删除" }
            } message: {
                Text("此操作无法撤销，确定要删除吗？")
            }

            Divider()

            Text("最后操作: \(lastAction)")
                .foregroundColor(.secondary)
                .padding(.top, 20)
        }
        .padding(40)
    }
}
