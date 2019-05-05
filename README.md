# YFAPIKit

[![Version](https://img.shields.io/cocoapods/v/YFAPIKit.svg?style=flat)](https://cocoapods.org/pods/YFAPIKit)
[![License](https://img.shields.io/cocoapods/l/YFAPIKit.svg?style=flat)](https://cocoapods.org/pods/YFAPIKit)
[![Platform](https://img.shields.io/cocoapods/p/YFAPIKit.svg?style=flat)](https://cocoapods.org/pods/YFAPIKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

NavigationController is required ！

## Installation

YFAPIKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YFAPIKit'
```

## How to use

> 生成 Demo 界面

1. 导入头文件 `#import<YFAPIKit/YFAPIKit.h>`
2. 让 viewController 继承自 `YFAPIBaseVC`
3. 创建一个 Plist 文件， 参考 Demo
   1. TableHeaderView，标题，子标题，长按跳转的地址等
   2. TableView， 必传参数，可选参数，section header/footer
   3. TableFooterView, 下一步按钮
4. 调用 YFAPIBaseVC 的方法 `[self userInterfaceWithPlist:@"PlistName"];`

即可生成一个 demo 界面



> 配置每个参数的输入方式

可以在工程目录下建一个 plist, plist 名字为 InputFields， type = Array

添加 item: Dictionary

| key             | value（String）                                              |
| --------------- | ------------------------------------------------------------ |
| key             | 参数名                                                       |
| keyboardType    | 键盘类型（数字字符串，DatePicker: 20--yyyyMMdd,  21--yyyyMMddHHmmss） |
| placeholder     | placeholder                                                  |
| title           | 标题（textfield.leftView)                                    |
| text            | 文字（如果是 Array 类型， 会变为选择框）@[@{field:text,picker:选择栏的名字}] |
| rightViewText   | TextField RightView Text                                     |
| rightViewAction | 点击输入框右视图时候调用的方法                               |
| booleanText     | 设置为 text1:text2 使用 UISwitch 控制，switch.isOn?text1:text2 |
| shouldRemove    | 取值时是否忽略                                               |

> 说明

- `- (void)checkUpdate` 检查更新
- `- (void)yfNextAction`点击下一步
- `(void)alertWithMsg:(NSString*)msg ` Alert
- `YFAPIUtil` 可以设置主题色

> 获取数据

获取页面所有输入框，`[self.tableView fieldsData]`--> NSDictionary

获取单个输入框: `[self text:@"key"]` || `[self.tableView field:@"key"].text`

获取多个输入框的数据: `[self.tableView fieldsDataFromArray: (NSArray *)array] ` --> NSDictionary

## Author

EvenLin, evenlinyf@163.com

## License

YFAPIKit is available under the MIT license. See the LICENSE file for more info.
