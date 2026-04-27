//
//  SymbolsView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/26.
//

import SwiftUI

// SF Symbols 版本对应关系：
// SF1 = SF Symbols 1.0 → iOS 13+
// SF2 = SF Symbols 2.0 → iOS 14+
// SF3 = SF Symbols 3.0 → iOS 15+
// SF4 = SF Symbols 4.0 → iOS 16+
// SF5 = SF Symbols 5.0 → iOS 17+
// SF6 = SF Symbols 6.0 → iOS 18+
// SF7 = SF Symbols 7.0 → iOS 26+
enum SymbolsVersion: String, Identifiable, CaseIterable, CategoryItem {
    
    var id: String { rawValue }
    case SF1
    case SF2
    case SF3
    case SF4
    case SF5
    case SF6
    case SF7
    
    var title: String {
        switch self {
        case .SF1: return "iOS 13+"
        case .SF2: return "iOS 14+"
        case .SF3: return "iOS 15+"
        case .SF4: return "iOS 16+"
        case .SF5: return "iOS 17+"
        case .SF6: return "iOS 18+"
        case .SF7: return "iOS 26+"
        }
    }
    
    // 兼容版本
    var compatibleVersion: [SymbolsVersion] {
        switch self {
        case .SF1:
            [.SF1]
        case .SF2:
            [.SF1, .SF2]
        case .SF3:
            [.SF1, .SF2, .SF3]
        case .SF4:
            [.SF1, .SF2, .SF3, .SF4]
        case .SF5:
            [.SF1, .SF2, .SF3, .SF4, .SF5]
        case .SF6:
            [.SF1, .SF2, .SF3, .SF4, .SF5, .SF6]
        case .SF7:
            [.SF1, .SF2, .SF3, .SF4, .SF5, .SF6, .SF7]
        }
    }
}

struct SingleSymbols: Identifiable {
    var id: String { name }
    var name: String
    var version: SymbolsVersion
    var keywords: [String]
    
    // MARK: - 完整符号列表
    static let listSymbols: [SingleSymbols] = [
        
        // ========== 书写与编辑 ==========
        SingleSymbols(name: "pencil",                    version: .SF1, keywords: ["铅笔", "写字", "编辑", "绘图", "修改", "注释"]),
        SingleSymbols(name: "pencil.tip",                version: .SF1, keywords: ["铅笔头", "笔尖", "绘图", "写作", "标注"]),
        SingleSymbols(name: "eraser",                    version: .SF4, keywords: ["橡皮", "擦除", "清除", "撤销", "删除"]),
        SingleSymbols(name: "square.and.pencil",         version: .SF1, keywords: ["编辑", "修改", "写作", "新建", "起草", "Edit"]),
        SingleSymbols(name: "scribble",                  version: .SF1, keywords: ["笔迹", "涂鸦", "手写", "绘图", "草稿", "线条"]),
        SingleSymbols(name: "highlighter",               version: .SF2, keywords: ["高亮", "荧光笔", "标注", "标记", "记号"]),
        SingleSymbols(name: "trash",                     version: .SF1, keywords: ["垃圾桶", "删除", "移除", "废纸篓", "清除", "丢弃", "DELETE"]),
        SingleSymbols(name: "scissors",                  version: .SF1, keywords: ["剪刀", "剪切", "裁剪", "删除", "编辑"]),
        SingleSymbols(name: "crop",                      version: .SF1, keywords: ["修剪", "裁剪", "裁切", "调整", "编辑图片"]),
        
        // ========== 文件与存储 ==========
        SingleSymbols(name: "folder",                    version: .SF1, keywords: ["文件夹", "目录", "整理", "归档", "分类"]),
        SingleSymbols(name: "tray",                      version: .SF1, keywords: ["托盘", "收件箱", "存储", "收纳"]),
        SingleSymbols(name: "externaldrive",             version: .SF2, keywords: ["外置硬盘", "移动硬盘", "存储设备", "备份"]),
        SingleSymbols(name: "archivebox",                version: .SF1, keywords: ["存档盒", "归档", "存储", "压缩", "打包", "盒子"]),
        SingleSymbols(name: "document",                  version: .SF6, keywords: ["文件", "文档", "页面", "档案"]),
        SingleSymbols(name: "arrow.down.document",       version: .SF6, keywords: ["下载文件", "保存文件", "文档导入", "获取"]),
        SingleSymbols(name: "text.document",             version: .SF6, keywords: ["文本文件", "文字文档", "TXT", "纯文本"]),
        SingleSymbols(name: "zipper.page",               version: .SF6, keywords: ["打包文件", "压缩包", "ZIP", "归档"]),
        SingleSymbols(name: "document.on.document",      version: .SF6, keywords: ["拷贝文件", "复制文档", "复制", "副本", "拷贝"]),
        SingleSymbols(name: "clipboard",                 version: .SF4, keywords: ["剪贴板", "粘贴", "复制", "记录", "任务"]),
        SingleSymbols(name: "text.page",                 version: .SF6, keywords: ["文本页", "文档页", "页面", "文章", "内容"]),
        SingleSymbols(name: "note",                      version: .SF2, keywords: ["笔记", "便签", "备忘", "记录", "提醒"]),
        SingleSymbols(name: "scroll",                    version: .SF2, keywords: ["卷轴", "历史", "古卷", "文本", "文件"]),
        SingleSymbols(name: "checklist",                 version: .SF3, keywords: ["清单", "列表", "待办", "任务", "勾选"]),
        SingleSymbols(name: "square.text.square",        version: .SF3, keywords: ["文本方块", "内容框", "文字", "卡片"]),
        
        // ========== 阅读与书籍 ==========
        SingleSymbols(name: "book",                      version: .SF1, keywords: ["书本", "阅读", "图书", "教材", "学习"]),
        SingleSymbols(name: "books.vertical",            version: .SF2, keywords: ["书架", "图书馆", "多本书", "藏书", "阅读"]),
        SingleSymbols(name: "book.closed",               version: .SF2, keywords: ["关闭书本", "合上", "书籍", "未读", "封面"]),
        SingleSymbols(name: "menucard",                  version: .SF3, keywords: ["菜单", "点餐", "餐厅", "选项", "列表"]),
        SingleSymbols(name: "greetingcard",              version: .SF2, keywords: ["贺卡", "问候", "节日", "祝福", "卡片"]),
        SingleSymbols(name: "magazine",                  version: .SF3, keywords: ["杂志", "期刊", "阅读", "资讯", "出版"]),
        SingleSymbols(name: "newspaper",                 version: .SF1, keywords: ["报纸", "新闻", "资讯", "媒体", "阅读"]),
        SingleSymbols(name: "bookmark",                  version: .SF1, keywords: ["书签", "收藏", "标记", "记录位置", "保存"]),
        
        // ========== 教育与办公 ==========
        SingleSymbols(name: "graduationcap",             version: .SF2, keywords: ["毕业帽", "毕业", "学校", "教育", "学术", "大学"]),
        SingleSymbols(name: "ruler",                     version: .SF2, keywords: ["尺子", "测量", "长度", "标尺", "设计"]),
        SingleSymbols(name: "backpack",                  version: .SF4, keywords: ["背包", "书包", "学生", "旅行", "携带"]),
        SingleSymbols(name: "paperclip",                 version: .SF1, keywords: ["曲别针", "附件", "夹子", "文件夹附", "连接"]),
        SingleSymbols(name: "studentdesk",               version: .SF1, keywords: ["学生桌", "书桌", "学习", "课堂", "教室"]),
        SingleSymbols(name: "link",                      version: .SF1, keywords: ["链接", "超链接", "URL", "连接", "网址"]),
        SingleSymbols(name: "apple.terminal",            version: .SF5, keywords: ["终端", "命令行", "控制台", "开发", "代码", "Shell"]),
        
        // ========== 人物与社交 ==========
        SingleSymbols(name: "person",                    version: .SF1, keywords: ["个人", "用户", "账户", "联系人", "个人资料"]),
        SingleSymbols(name: "person.2",                  version: .SF1, keywords: ["两人", "双人", "好友", "联系人", "分享", "团队"]),
        SingleSymbols(name: "person.3",                  version: .SF1, keywords: ["三人", "团队", "群组", "多人", "协作"]),
        SingleSymbols(name: "lanyardcard",               version: .SF3, keywords: ["挂绳卡", "工牌", "证件", "身份", "员工"]),
        SingleSymbols(name: "person.crop.circle",        version: .SF1, keywords: ["用户头像", "个人头像", "账户", "联系人", "个人资料"]),
        SingleSymbols(name: "photo.artframe",            version: .SF3, keywords: ["相框", "图片", "照片", "展示", "艺术"]),
        SingleSymbols(name: "person.crop.artframe",      version: .SF3, keywords: ["个人相框", "头像框", "联系人图片", "照片"]),
        SingleSymbols(name: "person.crop.rectangle",     version: .SF1, keywords: ["用户图片", "身份证件", "证件照", "截图"]),
        SingleSymbols(name: "person.text.rectangle",     version: .SF3, keywords: ["驾照", "身份证", "证件", "个人信息", "名片"]),
        SingleSymbols(name: "rectangle.pattern.checkered", version: .SF6, keywords: ["棋盘", "格子图案", "纹理", "棋格"]),
        
        // ========== 人物动作 ==========
        SingleSymbols(name: "figure.stand",              version: .SF2, keywords: ["站立人", "人物", "用户", "个人", "站立"]),
        SingleSymbols(name: "figure.stand.dress",        version: .SF6, keywords: ["站立人女", "女性人物", "用户", "个人"]),
        SingleSymbols(name: "figure.stand.dress.line.vertical.figure", version: .SF6, keywords: ["厕所", "卫生间", "洗手间", "男女", "标识"]),
        SingleSymbols(name: "figure.arms.open",          version: .SF4, keywords: ["张开双臂", "欢迎", "拥抱", "开放", "人物"]),
        SingleSymbols(name: "figure.2.arms.open",        version: .SF4, keywords: ["双人张臂", "欢迎", "家庭", "人物", "双人"]),
        SingleSymbols(name: "figure.2.and.child.holdinghands", version: .SF4, keywords: ["家庭", "亲子", "父母子女", "牵手", "三人"]),
        SingleSymbols(name: "figure",                    version: .SF5, keywords: ["人物", "用户", "个人", "行人", "形象"]),
        SingleSymbols(name: "accessibility",             version: .SF5, keywords: ["辅助功能", "无障碍", "残障", "轮椅", "包容"]),
        SingleSymbols(name: "figure.walk",               version: .SF2, keywords: ["行走", "步行", "散步", "行人", "走路"]),
        SingleSymbols(name: "figure.walk.diamond",       version: .SF2, keywords: ["行人警告", "注意行人", "过马路", "交通"]),
        SingleSymbols(name: "figure.wave",               version: .SF2, keywords: ["打招呼", "挥手", "问候", "欢迎", "人物"]),
        SingleSymbols(name: "figure.fall",               version: .SF4, keywords: ["滑倒", "跌倒", "摔跤", "危险", "警告"]),
        SingleSymbols(name: "figure.run",                version: .SF4, keywords: ["奔跑", "跑步", "运动", "健身", "速度"]),
        SingleSymbols(name: "figure.roll",               version: .SF3, keywords: ["轮椅", "残障", "辅助", "无障碍", "滚动"]),
        SingleSymbols(name: "figure.highintensity.intervaltraining", version: .SF4, keywords: ["热身", "间歇训练", "高强度", "健身", "运动"]),
        SingleSymbols(name: "figure.hiking",             version: .SF4, keywords: ["徒步", "登山", "爬山", "户外", "远足"]),
        SingleSymbols(name: "figure.mind.and.body",      version: .SF4, keywords: ["静坐", "冥想", "瑜伽", "放松", "正念"]),
        SingleSymbols(name: "figure.mixed.cardio",       version: .SF4, keywords: ["有氧运动", "健身", "展臂", "锻炼", "运动"]),
        SingleSymbols(name: "figure.outdoor.cycle",      version: .SF4, keywords: ["骑行", "自行车", "户外", "运动", "骑车"]),
        SingleSymbols(name: "figure.pool.swim",          version: .SF4, keywords: ["游泳", "水上运动", "健身", "泳池"]),
        SingleSymbols(name: "figure.seated.seatbelt",    version: .SF4, keywords: ["安全带", "驾驶", "坐姿", "安全", "系安全带"]),
        
        // ========== 运动与健身 ==========
        SingleSymbols(name: "dumbbell",                  version: .SF4, keywords: ["哑铃", "健身", "力量训练", "举重", "锻炼"]),
        SingleSymbols(name: "sportscourt",               version: .SF1, keywords: ["运动场", "球场", "体育", "比赛", "健身"]),
        SingleSymbols(name: "soccerball",                version: .SF4, keywords: ["足球", "球类", "运动", "体育", "世界杯"]),
        SingleSymbols(name: "baseball",                  version: .SF4, keywords: ["棒球", "球类", "运动", "体育"]),
        SingleSymbols(name: "basketball",                version: .SF4, keywords: ["篮球", "球类", "运动", "体育", "NBA"]),
        SingleSymbols(name: "american.football",         version: .SF6, keywords: ["橄榄球", "美式足球", "NFL", "球类", "运动"]),
        SingleSymbols(name: "tennis.racket",             version: .SF4, keywords: ["网球拍", "网球", "运动", "球拍", "体育"]),
        SingleSymbols(name: "hockey.puck",               version: .SF4, keywords: ["冰球", "冰上运动", "球类", "体育"]),
        SingleSymbols(name: "tennisball",                version: .SF4, keywords: ["网球", "球类", "运动", "体育"]),
        SingleSymbols(name: "volleyball",                version: .SF4, keywords: ["排球", "球类", "运动", "体育"]),
        SingleSymbols(name: "skateboard",                version: .SF5, keywords: ["滑板", "极限运动", "户外", "娱乐"]),
        SingleSymbols(name: "snowboard",                 version: .SF5, keywords: ["单板滑雪", "滑雪", "冬季运动", "雪地"]),
        SingleSymbols(name: "surfboard",                 version: .SF5, keywords: ["冲浪板", "冲浪", "水上运动", "海浪"]),
        SingleSymbols(name: "duffle.bag",                version: .SF6, keywords: ["旅行包", "运动包", "行李", "健身包"]),
        SingleSymbols(name: "rosette",                   version: .SF1, keywords: ["玫瑰花结", "荣誉", "勋章", "装饰", "认证"]),
        SingleSymbols(name: "trophy",                    version: .SF4, keywords: ["奖杯", "冠军", "获奖", "荣誉", "第一名"]),
        SingleSymbols(name: "medal",                     version: .SF4, keywords: ["勋章", "奖牌", "荣誉", "获奖", "成就"]),
        
        // ========== 键盘与输入 ==========
        SingleSymbols(name: "command",                   version: .SF1, keywords: ["Command", "键盘", "快捷键", "macOS", "Cmd"]),
        SingleSymbols(name: "space",                     version: .SF4, keywords: ["空格", "空格键", "键盘", "输入"]),
        SingleSymbols(name: "option",                    version: .SF1, keywords: ["Option", "Alt", "键盘", "快捷键", "macOS"]),
        SingleSymbols(name: "alt",                       version: .SF1, keywords: ["Alt", "Option", "键盘", "快捷键"]),
        SingleSymbols(name: "control",                   version: .SF1, keywords: ["Control", "Ctrl", "键盘", "快捷键", "macOS"]),
        SingleSymbols(name: "restart",                   version: .SF2, keywords: ["重启", "重新开始", "循环", "刷新", "重置"]),
        SingleSymbols(name: "fn",                        version: .SF2, keywords: ["功能键", "Fn", "键盘", "快捷键"]),
        SingleSymbols(name: "power",                     version: .SF1, keywords: ["电源", "开机", "关机", "电源键", "开关"]),
        SingleSymbols(name: "poweron",                   version: .SF2, keywords: ["开机", "电源", "竖线", "开启"]),
        SingleSymbols(name: "powersleep",                version: .SF2, keywords: ["睡眠", "月亮", "休眠", "省电", "待机"]),
        SingleSymbols(name: "alternatingcurrent",        version: .SF3, keywords: ["交流电", "电源", "波浪", "电力", "AC"]),
        SingleSymbols(name: "clear",                     version: .SF1, keywords: ["清除", "删除", "重置", "清空", "取消"]),
        SingleSymbols(name: "delete.left",               version: .SF1, keywords: ["退格", "删除", "删左", "清除", "Backspace"]),
        SingleSymbols(name: "delete.right",              version: .SF1, keywords: ["向右删除", "Delete", "清除", "删右"]),
        SingleSymbols(name: "shift",                     version: .SF1, keywords: ["Shift", "上档键", "大写", "键盘", "快捷键"]),
        SingleSymbols(name: "capslock",                  version: .SF1, keywords: ["大写锁定", "Caps Lock", "键盘", "大写"]),
        SingleSymbols(name: "mount",                     version: .SF2, keywords: ["滚动", "挂载", "磁盘", "移动"]),
        SingleSymbols(name: "progress.indicator",        version: .SF6, keywords: ["加载", "进度", "等待", "转圈", "Loading"]),
        SingleSymbols(name: "cursorarrow",               version: .SF2, keywords: ["鼠标光标", "指针", "箭头", "光标"]),
        SingleSymbols(name: "keyboard",                  version: .SF1, keywords: ["键盘", "输入法", "打字", "输入设备"]),
        SingleSymbols(name: "beziercurve",               version: .SF6, keywords: ["贝塞尔曲线", "曲线", "路径", "设计", "绘图"]),
        
        // ========== 天气与自然 ==========
        SingleSymbols(name: "peacesign",                 version: .SF3, keywords: ["和平", "和平标志", "反战", "符号"]),
        SingleSymbols(name: "globe",                     version: .SF1, keywords: ["地球", "全球", "国际化", "语言", "世界", "互联网"]),
        SingleSymbols(name: "sun.max",                   version: .SF1, keywords: ["太阳", "晴天", "亮度", "白天", "光照"]),
        SingleSymbols(name: "sun.horizon",               version: .SF5, keywords: ["地平线", "日出", "日落", "黄昏", "清晨"]),
        SingleSymbols(name: "zzz",                       version: .SF1, keywords: ["睡眠", "休眠", "打盹", "安静", "勿扰"]),
        SingleSymbols(name: "moon",                      version: .SF1, keywords: ["月亮", "夜晚", "深色模式", "夜间", "勿扰"]),
        SingleSymbols(name: "sparkle",                   version: .SF2, keywords: ["星星", "闪光", "高亮", "特效", "AI", "新功能"]),
        SingleSymbols(name: "cloud",                     version: .SF1, keywords: ["云", "云端", "天气", "存储", "iCloud"]),
        SingleSymbols(name: "cloud.drizzle",             version: .SF1, keywords: ["毛毛雨", "小雨", "天气", "降水"]),
        SingleSymbols(name: "cloud.sun",                 version: .SF1, keywords: ["多云", "晴间多云", "天气", "云和太阳"]),
        SingleSymbols(name: "wind",                      version: .SF1, keywords: ["风", "大风", "天气", "空气", "吹风"]),
        SingleSymbols(name: "snowflake",                 version: .SF3, keywords: ["雪花", "下雪", "冬天", "低温", "冰冻"]),
        SingleSymbols(name: "tornado",                   version: .SF1, keywords: ["龙卷风", "旋风", "风暴", "天气", "危险"]),
        SingleSymbols(name: "tropicalstorm",             version: .SF1, keywords: ["热带风暴", "台风", "飓风", "天气"]),
        SingleSymbols(name: "thermometer.variable",      version: .SF6, keywords: ["温度计", "温度", "气温", "测量", "冷热"]),
        SingleSymbols(name: "degreesign.fahrenheit",     version: .SF6, keywords: ["华氏度", "温度", "°F", "气温", "美国"]),
        SingleSymbols(name: "degreesign.celsius",        version: .SF6, keywords: ["摄氏度", "温度", "°C", "气温"]),
        SingleSymbols(name: "humidity",                  version: .SF3, keywords: ["湿度", "潮湿", "天气", "水分", "空气湿度"]),
        SingleSymbols(name: "rainbow",                   version: .SF5, keywords: ["彩虹", "天气", "颜色", "美丽", "雨后"]),
        SingleSymbols(name: "water.waves",               version: .SF4, keywords: ["水波", "波浪", "海洋", "水流", "湖泊"]),
        SingleSymbols(name: "drop",                      version: .SF2, keywords: ["水滴", "雨滴", "液体", "水", "滴落"]),
        SingleSymbols(name: "flame",                     version: .SF1, keywords: ["火焰", "火苗", "热门", "趋势", "燃烧"]),
        SingleSymbols(name: "fire.extinguisher",         version: .SF6, keywords: ["灭火器", "消防", "安全", "紧急", "灭火"]),
        SingleSymbols(name: "umbrella",                  version: .SF1, keywords: ["雨伞", "下雨", "防水", "遮阳", "保护"]),
        
        // ========== 媒体播放 ==========
        SingleSymbols(name: "play",                      version: .SF1, keywords: ["播放", "开始", "运行", "开启", "音视频"]),
        SingleSymbols(name: "pause",                     version: .SF1, keywords: ["暂停", "停顿", "等待", "中断"]),
        SingleSymbols(name: "stop",                      version: .SF1, keywords: ["停止", "结束", "中止", "终止"]),
        SingleSymbols(name: "record.circle",             version: .SF2, keywords: ["录制", "录音", "录屏", "录像", "REC"]),
        SingleSymbols(name: "playpause",                 version: .SF1, keywords: ["播放暂停", "切换", "媒体控制"]),
        SingleSymbols(name: "backward",                  version: .SF1, keywords: ["后退", "回退", "上一首", "倒退", "快退"]),
        SingleSymbols(name: "forward",                   version: .SF1, keywords: ["前进", "下一首", "快进", "跳过"]),
        SingleSymbols(name: "memories",                  version: .SF1, keywords: ["回忆", "相册", "照片", "记忆", "历史"]),
        SingleSymbols(name: "shuffle",                   version: .SF1, keywords: ["随机播放", "乱序", "打乱", "洗牌"]),
        SingleSymbols(name: "repeat",                    version: .SF1, keywords: ["循环", "重复", "单曲循环", "全部循环"]),
        SingleSymbols(name: "infinity",                  version: .SF2, keywords: ["无限", "循环", "永久", "无限制", "∞"]),
        SingleSymbols(name: "SOS",                       version: .SF4, keywords: ["SOS", "紧急", "求救", "帮助", "安全"]),
        SingleSymbols(name: "megaphone",                 version: .SF2, keywords: ["喇叭", "广播", "公告", "通知", "宣传"]),
        SingleSymbols(name: "speaker",                   version: .SF1, keywords: ["扬声器", "声音", "音量", "静音", "喇叭"]),
        SingleSymbols(name: "speaker.wave.3",            version: .SF2, keywords: ["声音最大", "音量最高", "扬声器", "响声"]),
        SingleSymbols(name: "music.note",                version: .SF1, keywords: ["音乐", "音符", "歌曲", "旋律", "播放"]),
        SingleSymbols(name: "music.quarternote.3",       version: .SF2, keywords: ["音符", "乐谱", "节拍", "音乐", "节奏"]),
        SingleSymbols(name: "music.microphone",          version: .SF6, keywords: ["麦克风", "歌唱", "录音", "演唱", "卡拉OK"]),
        
        // ========== 旋转与方向箭头 ==========
        SingleSymbols(name: "arrow.trianglehead.clockwise",         version: .SF6, keywords: ["顺时针", "旋转", "刷新", "循环", "更新"]),
        SingleSymbols(name: "arrow.trianglehead.counterclockwise",  version: .SF6, keywords: ["逆时针", "旋转", "撤销", "回退", "反转"]),
        SingleSymbols(name: "arrow.trianglehead.2.clockwise.rotate.90", version: .SF6, keywords: ["双向旋转", "同步", "刷新", "循环"]),
        
        // ========== 搜索与查找 ==========
        SingleSymbols(name: "swift",                     version: .SF2, keywords: ["Swift", "开发", "编程", "iOS", "苹果语言"]),
        SingleSymbols(name: "magnifyingglass",           version: .SF1, keywords: ["放大镜", "搜索", "查找", "查询", "检索"]),
        SingleSymbols(name: "plus.magnifyingglass",      version: .SF1, keywords: ["放大", "缩放", "搜索", "查找", "扩大"]),
        SingleSymbols(name: "minus.magnifyingglass",     version: .SF1, keywords: ["缩小", "缩放", "搜索", "查找", "缩减"]),
        SingleSymbols(name: "loupe",                     version: .SF2, keywords: ["放大镜", "精确搜索", "查找", "特写"]),
        SingleSymbols(name: "microphone",                version: .SF6, keywords: ["麦克风", "录音", "语音", "声音输入", "话筒"]),
        SingleSymbols(name: "microphone.slash",          version: .SF6, keywords: ["静音", "麦克风关闭", "禁用麦克风", "无声"]),
        
        // ========== 线条与形状基础 ==========
        SingleSymbols(name: "line.diagonal",             version: .SF2, keywords: ["线条", "斜线", "分隔", "设计元素"]),
        SingleSymbols(name: "line.diagonal.arrow",       version: .SF2, keywords: ["斜向箭头", "方向", "对角线", "移动"]),
        SingleSymbols(name: "righttriangle",             version: .SF5, keywords: ["直角三角形", "三角形", "几何", "形状"]),
        SingleSymbols(name: "circle",                    version: .SF1, keywords: ["圆圈", "圆形", "形状", "选择", "状态"]),
        SingleSymbols(name: "circle.dashed",             version: .SF2, keywords: ["虚线圆", "虚线", "未完成", "草稿"]),
        SingleSymbols(name: "circlebadge",               version: .SF2, keywords: ["小圆圈", "徽标", "点", "状态", "提示"]),
        SingleSymbols(name: "circle.grid.2x2",           version: .SF1, keywords: ["2x2网格", "点阵", "布局", "网格"]),
        SingleSymbols(name: "circle.grid.3x3",           version: .SF1, keywords: ["3x3网格", "九宫格", "点阵", "布局"]),
        SingleSymbols(name: "square",                    version: .SF1, keywords: ["方块", "正方形", "形状", "选框"]),
        SingleSymbols(name: "square.split.2x2",          version: .SF1, keywords: ["四等分", "网格", "分割", "布局"]),
        SingleSymbols(name: "square.dashed",             version: .SF2, keywords: ["虚线方块", "选区", "草稿", "占位"]),
        SingleSymbols(name: "square.on.square",          version: .SF1, keywords: ["复制", "叠加方块", "副本", "重叠"]),
        SingleSymbols(name: "square.on.circle",          version: .SF1, keywords: ["方块和圆", "形状组合", "叠加"]),
        SingleSymbols(name: "square.stack",              version: .SF1, keywords: ["方块堆叠", "图层", "多页", "卡片"]),
        SingleSymbols(name: "squareshape",               version: .SF2, keywords: ["矩形", "方框", "形状", "区域"]),
        
        // ========== 应用图标形状 ==========
        SingleSymbols(name: "app",                       version: .SF1, keywords: ["App", "应用", "图标", "软件", "程序"]),
        SingleSymbols(name: "plus.app",                  version: .SF1, keywords: ["添加App", "安装", "下载应用", "新增"]),
        SingleSymbols(name: "arrow.down.app",            version: .SF2, keywords: ["下载App", "安装", "下载应用"]),
        SingleSymbols(name: "questionmark.app",          version: .SF3, keywords: ["未知应用", "帮助", "问号", "未安装"]),
        SingleSymbols(name: "app.badge",                 version: .SF1, keywords: ["消息提示", "角标", "通知", "未读", "红点"]),
        SingleSymbols(name: "rectangle",                 version: .SF1, keywords: ["矩形", "长方形", "形状", "区域"]),
        SingleSymbols(name: "rectangle.split.3x3",       version: .SF1, keywords: ["九宫格", "网格", "分割", "表格"]),
        SingleSymbols(name: "rectangle.on.rectangle",    version: .SF1, keywords: ["矩形叠加", "复制", "图层", "重叠"]),
        SingleSymbols(name: "rectangle.portrait",        version: .SF2, keywords: ["竖向矩形", "纵向", "手机", "竖屏"]),
        SingleSymbols(name: "rectangle.grid.1x2",        version: .SF1, keywords: ["双矩形", "分栏", "布局", "分割"]),
        SingleSymbols(name: "capsule",                   version: .SF1, keywords: ["胶囊形状", "按钮", "标签", "药片"]),
        SingleSymbols(name: "oval",                      version: .SF2, keywords: ["椭圆", "形状", "圆弧", "设计"]),
        SingleSymbols(name: "triangle",                  version: .SF1, keywords: ["三角形", "形状", "箭头", "方向"]),
        SingleSymbols(name: "diamond",                   version: .SF2, keywords: ["钻石形", "菱形", "形状", "精华"]),
        SingleSymbols(name: "checkmark.seal",            version: .SF1, keywords: ["认证", "完成", "已验证", "八角形", "勾选"]),
        SingleSymbols(name: "xmark.seal",                version: .SF1, keywords: ["错误", "关闭", "删除", "未认证", "拒绝", "不通过", "八角形"]),
        SingleSymbols(name: "heart",                     version: .SF1, keywords: ["心形", "喜欢", "收藏", "爱", "关注"]),
        SingleSymbols(name: "suit.club",                 version: .SF1, keywords: ["梅花", "扑克", "卡牌", "游戏"]),
        SingleSymbols(name: "suit.diamond",              version: .SF1, keywords: ["方块", "扑克", "卡牌", "游戏"]),
        SingleSymbols(name: "suit.spade",                version: .SF1, keywords: ["黑桃", "扑克", "卡牌", "游戏"]),
        SingleSymbols(name: "star",                      version: .SF1, keywords: ["星星", "收藏", "评分", "五角星", "精选"]),
        SingleSymbols(name: "rhombus",                   version: .SF1, keywords: ["菱形", "钻石", "形状", "宝石"]),
        SingleSymbols(name: "shield",                    version: .SF1, keywords: ["盾牌", "护盾", "防御", "安全", "保护", "防护", "隐私"]),
        SingleSymbols(name: "shield.lefthalf.filled",    version: .SF3, keywords: ["半盾", "部分保护", "安全", "防护"]),
        SingleSymbols(name: "shield.pattern.checkered",  version: .SF6, keywords: ["格子盾", "竞技", "赛车", "保护", "游戏"]),
        SingleSymbols(name: "flag",                      version: .SF1, keywords: ["旗帜", "标志", "标记", "举报", "里程碑"]),
        SingleSymbols(name: "flag.pattern.checkered",    version: .SF6, keywords: ["方格旗", "赛车", "终点", "完成", "冠军"]),
        SingleSymbols(name: "flag.2.crossed",            version: .SF3, keywords: ["交叉旗", "信号", "通信", "国际"]),
        
        // ========== 位置与导航 ==========
        SingleSymbols(name: "location",                  version: .SF1, keywords: ["位置", "定位", "GPS", "地理位置", "导航"]),
        SingleSymbols(name: "location.slash",            version: .SF1, keywords: ["禁用定位", "关闭GPS", "不定位", "隐私"]),
        SingleSymbols(name: "location.north",            version: .SF1, keywords: ["北方", "导航", "指北", "方向", "指南针"]),
        SingleSymbols(name: "pin",                       version: .SF1, keywords: ["别针", "图钉", "固定", "标记", "钉住"]),
        SingleSymbols(name: "mappin",                    version: .SF1, keywords: ["地图标记", "位置点", "定位", "地点"]),
        SingleSymbols(name: "map",                       version: .SF1, keywords: ["地图", "导航", "地点", "路线", "地理"]),
        SingleSymbols(name: "signpost.left",             version: .SF2, keywords: ["路标", "指路", "方向", "导航"]),
        SingleSymbols(name: "signpost.right.and.left",   version: .SF4, keywords: ["路标", "双向", "交叉口", "导航", "方向"]),
        SingleSymbols(name: "mountain.2",                version: .SF4, keywords: ["山", "山脉", "户外", "登山", "风景"]),
        SingleSymbols(name: "safari",                    version: .SF1, keywords: ["Safari", "浏览器", "网络", "指南针", "探索"]),
        
        // ========== 通知与提醒 ==========
        SingleSymbols(name: "bell",                      version: .SF1, keywords: ["铃铛", "通知", "提醒", "铃声", "消息"]),
        SingleSymbols(name: "bell.slash",                version: .SF1, keywords: ["静音", "关闭通知", "勿扰", "禁止响铃"]),
        SingleSymbols(name: "bell.badge",                version: .SF2, keywords: ["有通知", "未读消息", "提醒", "角标"]),
        SingleSymbols(name: "bell.and.waves.left.and.right", version: .SF4, keywords: ["闹铃", "振动", "响铃", "提醒"]),
        SingleSymbols(name: "tag",                       version: .SF1, keywords: ["标签", "分类", "价格", "标记", "归类"]),
        SingleSymbols(name: "bolt",                      version: .SF1, keywords: ["闪电", "快速", "充电", "能量", "电力"]),
        SingleSymbols(name: "bolt.horizontal",           version: .SF2, keywords: ["水平闪电", "快速", "充电", "连接"]),
        
        // ========== iCloud 与同步 ==========
        SingleSymbols(name: "icloud",                    version: .SF1, keywords: ["iCloud", "云同步", "云端", "备份", "存储"]),
        SingleSymbols(name: "icloud.slash",              version: .SF1, keywords: ["iCloud关闭", "无网络", "未同步", "断开"]),
        SingleSymbols(name: "checkmark.icloud",          version: .SF2, keywords: ["已同步", "iCloud完成", "备份成功"]),
        SingleSymbols(name: "xmark.icloud",              version: .SF1, keywords: ["同步失败", "iCloud错误", "未完成"]),
        SingleSymbols(name: "icloud.and.arrow.down",     version: .SF1, keywords: ["从iCloud下载", "云端下载", "同步", "获取"]),
        
        // ========== 数学 ==========
        SingleSymbols(name: "squareroot",                version: .SF6, keywords: ["平方根", "开根号", "数学", "计算", "根式"]),
        SingleSymbols(name: "x.squareroot",              version: .SF1, keywords: ["x的平方根", "数学", "开方", "运算"]),
        
        // ========== 相机与照片 ==========
        SingleSymbols(name: "flashlight.off.fill",       version: .SF1, keywords: ["手电筒", "闪光灯", "照明", "亮光"]),
        SingleSymbols(name: "camera",                    version: .SF1, keywords: ["相机", "拍照", "摄影", "拍摄", "镜头"]),
        SingleSymbols(name: "camera.macro",              version: .SF3, keywords: ["微距", "花朵", "特写", "摄影"]),
        SingleSymbols(name: "pano",                      version: .SF1, keywords: ["全景", "宽幅", "广角", "风景", "摄影"]),
        SingleSymbols(name: "viewfinder.rectangular",    version: .SF5, keywords: ["矩形取景器", "拍摄", "对焦", "相机"]),
        SingleSymbols(name: "viewfinder",                version: .SF1, keywords: ["取景器", "对焦", "拍摄", "相机", "扫描"]),
        SingleSymbols(name: "plus.viewfinder",           version: .SF2, keywords: ["扫描", "添加", "二维码", "扫码"]),
        SingleSymbols(name: "photo",                     version: .SF1, keywords: ["图片", "照片", "图像", "相册", "媒体"]),
        SingleSymbols(name: "photo.on.rectangle.angled", version: .SF2, keywords: ["图库", "多张图片", "相册", "批量"]),
        SingleSymbols(name: "photo.stack",               version: .SF4, keywords: ["图片堆叠", "相册", "多张照片", "图库"]),
        SingleSymbols(name: "mosaic",                    version: .SF2, keywords: ["马赛克", "拼贴", "像素化", "模糊", "隐私"]),
        SingleSymbols(name: "camera.filters",            version: .SF2, keywords: ["滤镜", "相机效果", "颜色叠加", "美化"]),
        
        // ========== 消息与通信 ==========
        SingleSymbols(name: "message",                   version: .SF1, keywords: ["消息", "短信", "聊天", "对话", "通讯"]),
        SingleSymbols(name: "bubble",                    version: .SF5, keywords: ["气泡", "对话", "评论", "聊天", "消息"]),
        SingleSymbols(name: "quote.opening",             version: .SF3, keywords: ["开引号", "引用", "引文", "引号"]),
        SingleSymbols(name: "quote.closing",             version: .SF3, keywords: ["关引号", "引用结束", "引文", "引号"]),
        SingleSymbols(name: "text.bubble",               version: .SF1, keywords: ["文字气泡", "消息", "聊天", "评论"]),
        SingleSymbols(name: "ellipsis.bubble",           version: .SF2, keywords: ["省略气泡", "正在输入", "聊天", "等待"]),
        SingleSymbols(name: "bubble.middle.bottom",      version: .SF1, keywords: ["底部气泡", "对话", "消息", "聊天"]),
        SingleSymbols(name: "phone",                     version: .SF1, keywords: ["电话", "通话", "拨打", "联系", "打电话"]),
        SingleSymbols(name: "phone.down",                version: .SF1, keywords: ["挂断", "结束通话", "拒接", "电话"]),
        SingleSymbols(name: "video",                     version: .SF1, keywords: ["视频", "视频通话", "摄像头", "FaceTime"]),
        SingleSymbols(name: "field.of.view.ultrawide",   version: .SF5, keywords: ["超广角", "视野", "广角镜头", "全景"]),
        SingleSymbols(name: "envelope",                  version: .SF1, keywords: ["信封", "邮件", "发送", "邮件", "联系"]),
        SingleSymbols(name: "envelope.front",            version: .SF6, keywords: ["信封正面", "邮件", "发送", "写信"]),
        SingleSymbols(name: "envelope.open",             version: .SF1, keywords: ["打开信封", "已读", "邮件", "阅读"]),
        SingleSymbols(name: "mail",                      version: .SF2, keywords: ["邮件", "Mail", "电子邮件", "收件"]),
        SingleSymbols(name: "paperplane",                version: .SF1, keywords: ["发送", "纸飞机", "分享", "投递", "传递"]),
        
        // ========== 设置与系统 ==========
        SingleSymbols(name: "gear",                      version: .SF1, keywords: ["齿轮", "设置", "选项", "配置", "系统"]),
        SingleSymbols(name: "gearshape",                 version: .SF2, keywords: ["齿轮", "设置", "选项", "偏好", "系统"]),
        SingleSymbols(name: "line.3.crossed.swirl.circle", version: .SF2, keywords: ["漩涡", "清理", "平滑", "滤镜", "效果"]),
        SingleSymbols(name: "apple.intelligence",        version: .SF6, keywords: ["Apple智能", "AI", "人工智能", "机器学习"]),
        SingleSymbols(name: "ellipsis",                  version: .SF1, keywords: ["更多", "省略号", "选项", "菜单", "扩展"]),
        SingleSymbols(name: "ellipsis.circle",           version: .SF1, keywords: ["更多选项", "菜单", "圆形", "省略"]),
        SingleSymbols(name: "nosign",                    version: .SF1, keywords: ["禁止", "不允许", "拒绝", "禁用", "无"]),
        SingleSymbols(name: "switch.2",                  version: .SF2, keywords: ["开关", "切换", "Toggle", "启用禁用"]),
        SingleSymbols(name: "slider.horizontal.3",       version: .SF1, keywords: ["水平滑块", "设置", "调节", "参数"]),
        SingleSymbols(name: "slider.vertical.3",         version: .SF2, keywords: ["垂直滑块", "调节", "设置", "参数"]),
        SingleSymbols(name: "lineweight",                version: .SF2, keywords: ["线宽", "粗细", "设计", "样式"]),
        SingleSymbols(name: "perspective",               version: .SF1, keywords: ["透视", "视角", "3D", "校正", "变换"]),
        SingleSymbols(name: "skew",                      version: .SF1, keywords: ["倾斜", "变形", "透视", "校正"]),
        SingleSymbols(name: "grid",                      version: .SF1, keywords: ["网格", "格子", "对齐", "布局"]),
        
        // ========== 购物与支付 ==========
        SingleSymbols(name: "bag",                       version: .SF1, keywords: ["购物袋", "购物", "商店", "袋子", "手提"]),
        SingleSymbols(name: "cart",                      version: .SF1, keywords: ["购物车", "购物", "加购", "下单", "商城"]),
        SingleSymbols(name: "basket",                    version: .SF4, keywords: ["购物篮", "购物", "商店", "菜篮"]),
        SingleSymbols(name: "creditcard",                version: .SF1, keywords: ["信用卡", "支付", "银行卡", "付款", "金融"]),
        SingleSymbols(name: "giftcard",                  version: .SF2, keywords: ["礼品卡", "礼物", "充值", "代金券"]),
        SingleSymbols(name: "wallet.pass",               version: .SF2, keywords: ["钱包", "票务", "通行证", "Apple Pay"]),
        SingleSymbols(name: "wallet.bifold",             version: .SF6, keywords: ["对折钱包", "钱包", "支付", "卡片"]),
        SingleSymbols(name: "banknote",                  version: .SF2, keywords: ["钞票", "现金", "钱", "纸币", "金融"]),
        SingleSymbols(name: "dollarsign",                version: .SF4, keywords: ["美元", "金钱", "价格", "货币", "收入"]),
        SingleSymbols(name: "eurosign",                  version: .SF4, keywords: ["欧元", "货币", "欧洲", "金钱"]),
        SingleSymbols(name: "chineseyuanrenminbisign",   version: .SF5, keywords: ["人民币", "元", "￥", "货币", "中国"]),
        SingleSymbols(name: "purchased",                 version: .SF1, keywords: ["已购买", "购买记录", "已付款", "订单"]),
        SingleSymbols(name: "gift",                      version: .SF1, keywords: ["礼物", "礼品", "赠送", "节日", "惊喜"]),
        
        // ========== 工具与创作 ==========
        SingleSymbols(name: "wand.and.rays",             version: .SF1, keywords: ["魔杖", "魔法", "AI增强", "自动", "一键"]),
        SingleSymbols(name: "paintbrush",                version: .SF1, keywords: ["画笔", "绘画", "美化", "设计", "艺术"]),
        SingleSymbols(name: "paintbrush.pointed",        version: .SF2, keywords: ["尖头画笔", "精细绘画", "艺术", "描边"]),
        SingleSymbols(name: "paintpalette",              version: .SF2, keywords: ["调色盘", "颜色", "绘画", "艺术", "配色"]),
        SingleSymbols(name: "pianokeys",                 version: .SF2, keywords: ["钢琴键", "音乐", "乐器", "演奏"]),
        SingleSymbols(name: "tuningfork",                version: .SF1, keywords: ["音叉", "调音", "音调", "乐器", "校准"]),
        SingleSymbols(name: "level",                     version: .SF2, keywords: ["水平仪", "水平", "对齐", "校准", "工具"]),
        SingleSymbols(name: "wrench.adjustable",         version: .SF4, keywords: ["扳手", "维修", "设置", "工具", "调整"]),
        SingleSymbols(name: "hammer",                    version: .SF1, keywords: ["锤子", "构建", "开发", "工具", "维修"]),
        SingleSymbols(name: "screwdriver",               version: .SF3, keywords: ["螺丝刀", "维修", "工具", "组装"]),
        SingleSymbols(name: "eyedropper",                version: .SF1, keywords: ["滴管", "取色", "颜色选择", "吸管"]),
        SingleSymbols(name: "wrench.and.screwdriver",    version: .SF2, keywords: ["设置", "维修", "工具", "修复", "开发"]),
        SingleSymbols(name: "applescript",               version: .SF2, keywords: ["AppleScript", "脚本", "自动化", "开发"]),
        
        // ========== 医疗与健康 ==========
        SingleSymbols(name: "stethoscope",               version: .SF2, keywords: ["听诊器", "医疗", "医生", "诊断", "健康"]),
        SingleSymbols(name: "inhaler",                   version: .SF6, keywords: ["吸入器", "哮喘", "医疗", "药物", "肺部"]),
        SingleSymbols(name: "lungs",                     version: .SF2, keywords: ["肺", "呼吸", "健康", "医疗", "胸部"]),
        SingleSymbols(name: "apple.meditate",            version: .SF5, keywords: ["冥想", "正念", "健康", "放松", "Apple"]),
        SingleSymbols(name: "microbe",                   version: .SF4, keywords: ["微生物", "病菌", "病毒", "感染", "健康"]),
        SingleSymbols(name: "medical.thermometer",       version: .SF4, keywords: ["体温计", "发烧", "医疗", "温度", "健康"]),
        SingleSymbols(name: "bandage",                   version: .SF1, keywords: ["绷带", "创可贴", "医疗", "伤口", "修复"]),
        SingleSymbols(name: "syringe",                   version: .SF4, keywords: ["注射器", "打针", "疫苗", "医疗", "血液"]),
        SingleSymbols(name: "facemask",                  version: .SF3, keywords: ["口罩", "防护", "医疗", "卫生", "防疫"]),
        SingleSymbols(name: "pill",                      version: .SF4, keywords: ["药丸", "药片", "医疗", "服药", "健康"]),
        SingleSymbols(name: "cross",                     version: .SF2, keywords: ["十字架", "医疗", "急救", "红十字", "加号"]),
        SingleSymbols(name: "flask",                     version: .SF5, keywords: ["烧瓶", "实验", "化学", "科学", "研究"]),
        SingleSymbols(name: "testtube.2",                version: .SF3, keywords: ["试管", "实验室", "化学", "科学", "检测"]),
        SingleSymbols(name: "staroflife",                version: .SF1, keywords: ["生命之星", "急救", "医疗", "救护"]),
        SingleSymbols(name: "brain",                     version: .SF3, keywords: ["大脑", "智能", "AI", "思考", "神经"]),
        SingleSymbols(name: "brain.head.profile",        version: .SF3, keywords: ["大脑轮廓", "思维", "心理", "智能"]),
        
        // ========== 办公设备 ==========
        SingleSymbols(name: "printer",                   version: .SF1, keywords: ["打印机", "打印", "输出", "纸张", "文档"]),
        SingleSymbols(name: "scanner",                   version: .SF2, keywords: ["扫描仪", "扫描", "数字化", "OCR"]),
        SingleSymbols(name: "faxmachine",                version: .SF2, keywords: ["传真机", "传真", "发送文件", "通讯"]),
        
        // ========== 包类与旅行 ==========
        SingleSymbols(name: "handbag",                   version: .SF4, keywords: ["手提包", "购物", "时尚", "女包", "包"]),
        SingleSymbols(name: "briefcase",                 version: .SF1, keywords: ["公文包", "工作", "商务", "职场", "办公"]),
        SingleSymbols(name: "case",                      version: .SF2, keywords: ["箱子", "手提箱", "收纳", "保护套"]),
        SingleSymbols(name: "cross.case",                version: .SF2, keywords: ["急救包", "医疗包", "急救", "户外"]),
        SingleSymbols(name: "suitcase",                  version: .SF3, keywords: ["手提箱", "旅行", "出行", "行李"]),
        SingleSymbols(name: "suitcase.rolling",          version: .SF4, keywords: ["拉杆箱", "旅行", "行李", "出行"]),
        SingleSymbols(name: "theatermasks",              version: .SF3, keywords: ["戏剧", "面具", "表演", "喜剧悲剧", "艺术"]),
        SingleSymbols(name: "puzzlepiece.extension",     version: .SF3, keywords: ["拼图扩展", "插件", "扩展", "组合"]),
        SingleSymbols(name: "puzzlepiece",               version: .SF2, keywords: ["拼图", "组合", "模块", "部件", "插件"]),
        
        // ========== 家居与智能家庭 ==========
        SingleSymbols(name: "homekit",                   version: .SF2, keywords: ["HomeKit", "智能家居", "家庭自动化"]),
        SingleSymbols(name: "house",                     version: .SF1, keywords: ["房子", "主页", "首页", "家", "返回主页"]),
        SingleSymbols(name: "storefront",                version: .SF5, keywords: ["店面", "商店", "零售", "商铺", "营业"]),
        SingleSymbols(name: "building.columns",          version: .SF2, keywords: ["建筑", "政府", "银行", "博物馆", "机构"]),
        SingleSymbols(name: "building",                  version: .SF2, keywords: ["建筑", "楼房", "城市", "公司", "大楼"]),
        SingleSymbols(name: "lightbulb",                 version: .SF1, keywords: ["灯泡", "想法", "提示", "点子", "创意"]),
        SingleSymbols(name: "fan",                       version: .SF5, keywords: ["风扇", "电扇", "降温", "散热", "家电", "电风扇"]),
        SingleSymbols(name: "fan.ceiling",               version: .SF4, keywords: ["吊扇", "天花板风扇", "家电", "散热"]),
        SingleSymbols(name: "lamp.desk",                 version: .SF4, keywords: ["台灯", "桌灯", "照明", "学习", "办公"]),
        SingleSymbols(name: "lamp.floor",                version: .SF4, keywords: ["落地灯", "照明", "家居", "装饰"]),
        SingleSymbols(name: "lamp.ceiling",              version: .SF4, keywords: ["吊灯", "天花板灯", "照明", "家居"]),
        SingleSymbols(name: "light.panel",               version: .SF4, keywords: ["灯光面板", "面板灯", "照明", "智能家居"]),
        SingleSymbols(name: "chandelier",                version: .SF4, keywords: ["枝形吊灯", "吊灯", "豪华", "照明"]),
        SingleSymbols(name: "powerplug",                 version: .SF3, keywords: ["电源插头", "充电", "电力", "插座"]),
        SingleSymbols(name: "powercord",                 version: .SF5, keywords: ["电源线", "充电线", "连接", "电力"]),
        SingleSymbols(name: "door.left.hand.open",       version: .SF4, keywords: ["开门", "退出", "出口", "进入", "门"]),
        SingleSymbols(name: "dehumidifier",              version: .SF4, keywords: ["除湿机", "除湿", "家电", "空气"]),
        SingleSymbols(name: "humidifier",                version: .SF4, keywords: ["加湿器", "加湿", "家电", "空气", "湿度"]),
        SingleSymbols(name: "sprinkler",                 version: .SF4, keywords: ["洒水器", "灌溉", "消防喷头", "浇水"]),
        SingleSymbols(name: "spigot",                    version: .SF4, keywords: ["水龙头", "水管", "用水", "开关"]),
        SingleSymbols(name: "shower",                    version: .SF4, keywords: ["淋浴", "洗澡", "浴室", "花洒"]),
        SingleSymbols(name: "bathtub",                   version: .SF4, keywords: ["浴缸", "洗澡", "浴室", "泡澡"]),
        SingleSymbols(name: "party.popper",              version: .SF4, keywords: ["庆祝", "派对", "爆竹", "节日", "喜庆"]),
        SingleSymbols(name: "wifi.router",               version: .SF4, keywords: ["WiFi路由器", "无线网络", "路由器", "网络"]),
        SingleSymbols(name: "balloon",                   version: .SF4, keywords: ["气球", "庆祝", "节日", "派对", "生日"]),
        SingleSymbols(name: "laser.burst",               version: .SF5, keywords: ["激光", "特效", "爆发", "光线", "炫酷"]),
        SingleSymbols(name: "fireworks",                 version: .SF5, keywords: ["烟花", "庆典", "节日", "新年", "庆祝"]),
        SingleSymbols(name: "frying.pan",                version: .SF4, keywords: ["煎锅", "烹饪", "厨房", "炒菜", "厨具"]),
        SingleSymbols(name: "popcorn",                   version: .SF4, keywords: ["爆米花", "电影", "零食", "影院"]),
        SingleSymbols(name: "bed.double",                version: .SF1, keywords: ["双人床", "卧室", "睡眠", "家居", "休息"]),
        SingleSymbols(name: "sofa",                      version: .SF4, keywords: ["沙发", "客厅", "休息", "家居", "坐"]),
        SingleSymbols(name: "chair.lounge",              version: .SF4, keywords: ["休闲椅", "躺椅", "休息", "家居"]),
        SingleSymbols(name: "chair",                     version: .SF4, keywords: ["椅子", "座位", "坐", "家居", "桌椅"]),
        SingleSymbols(name: "table.furniture",           version: .SF4, keywords: ["桌子", "家具", "餐桌", "办公桌"]),
        SingleSymbols(name: "cabinet",                   version: .SF4, keywords: ["柜子", "橱柜", "收纳", "储物", "家具"]),
        SingleSymbols(name: "fireplace",                 version: .SF4, keywords: ["壁炉", "暖炉", "取暖", "冬天", "家居"]),
        SingleSymbols(name: "washer",                    version: .SF4, keywords: ["洗衣机", "洗衣", "清洗", "家电"]),
        SingleSymbols(name: "oven",                      version: .SF4, keywords: ["烤箱", "烘焙", "烹饪", "家电"]),
        SingleSymbols(name: "stove",                     version: .SF4, keywords: ["炉灶", "煤气灶", "烹饪", "厨房"]),
        SingleSymbols(name: "microwave",                 version: .SF4, keywords: ["微波炉", "加热", "烹饪", "家电"]),
        SingleSymbols(name: "refrigerator",              version: .SF4, keywords: ["冰箱", "冷藏", "保鲜", "家电"]),
        SingleSymbols(name: "robotic.vacuum",            version: .SF6, keywords: ["扫地机器人", "清洁", "自动打扫", "家电"]),
        SingleSymbols(name: "sink",                      version: .SF4, keywords: ["水槽", "洗手台", "洗碗", "厨房"]),
        SingleSymbols(name: "toilet",                    version: .SF4, keywords: ["马桶", "厕所", "卫生间", "洗手间"]),
        SingleSymbols(name: "stairs",                    version: .SF4, keywords: ["楼梯", "上下楼", "台阶", "建筑"]),
        SingleSymbols(name: "tent",                      version: .SF4, keywords: ["帐篷", "露营", "户外", "野营"]),
        SingleSymbols(name: "house.lodge",               version: .SF4, keywords: ["小屋", "木屋", "度假屋", "户外"]),
        SingleSymbols(name: "square.split.bottomrightquarter", version: .SF2, keywords: ["分割方块", "布局", "分区", "区域"]),
        SingleSymbols(name: "globe.desk",                version: .SF4, keywords: ["地球仪", "全球", "教育", "地理"]),
        
        // ========== 安全与锁定 ==========
        SingleSymbols(name: "lock",                      version: .SF1, keywords: ["锁", "加锁", "安全", "私密", "密码"]),
        SingleSymbols(name: "lock.open",                 version: .SF1, keywords: ["解锁", "开锁", "允许", "访问", "开放"]),
        SingleSymbols(name: "key",                       version: .SF2, keywords: ["钥匙", "密码", "解锁", "权限", "访问"]),
        SingleSymbols(name: "wifi",                      version: .SF1, keywords: ["WiFi", "无线网络", "网络连接", "互联网"]),
        SingleSymbols(name: "faceid",                    version: .SF1, keywords: ["面容ID", "人脸识别", "生物识别", "解锁"]),
        SingleSymbols(name: "touchid",                   version: .SF2, keywords: ["指纹", "Touch ID", "生物识别", "解锁"]),
        SingleSymbols(name: "opticid",                   version: .SF5, keywords: ["虹膜识别", "Optic ID", "Vision Pro", "认证"]),
        
        // ========== 三维与空间 ==========
        SingleSymbols(name: "move.3d",                   version: .SF2, keywords: ["3D移动", "空间", "三维", "AR", "坐标"]),
        SingleSymbols(name: "torus",                     version: .SF2, keywords: ["环面", "甜甜圈形", "3D", "几何"]),
        SingleSymbols(name: "rotate.left",               version: .SF1, keywords: ["向左旋转", "旋转", "翻转", "顺序"]),
        SingleSymbols(name: "cube",                      version: .SF1, keywords: ["立方体", "3D", "方块", "AR", "模型"]),
        SingleSymbols(name: "shippingbox",               version: .SF2, keywords: ["快递箱", "包裹", "物流", "运输", "发货"]),
        SingleSymbols(name: "arkit",                     version: .SF1, keywords: ["ARKit", "增强现实", "AR", "空间"]),
        SingleSymbols(name: "cone",                      version: .SF2, keywords: ["锥体", "3D", "几何", "形状"]),
        SingleSymbols(name: "square.stack.3d.down.right", version: .SF1, keywords: ["3D堆叠", "图层", "多页", "通用"]),
        SingleSymbols(name: "square.stack.3d.up",        version: .SF1, keywords: ["3D堆叠上", "图层", "多项目", "通用"]),
        SingleSymbols(name: "square.2.layers.3d",        version: .SF4, keywords: ["双层3D", "叠加", "图层", "深度"]),
        SingleSymbols(name: "square.3.layers.3d.down.right", version: .SF3, keywords: ["三层3D", "图层", "堆叠"]),
        SingleSymbols(name: "cylinder",                  version: .SF2, keywords: ["圆柱", "3D", "几何", "数据库"]),
        
        // ========== 设备 ==========
        SingleSymbols(name: "cpu",                       version: .SF2, keywords: ["CPU", "处理器", "芯片", "性能", "计算"]),
        SingleSymbols(name: "memorychip",                version: .SF2, keywords: ["内存", "芯片", "存储", "RAM", "硬件"]),
        SingleSymbols(name: "opticaldisc",               version: .SF2, keywords: ["光盘", "CD", "DVD", "存储介质"]),
        SingleSymbols(name: "sensor.tag.radiowaves.forward", version: .SF3, keywords: ["传感器", "NFC", "无线", "标签"]),
        SingleSymbols(name: "airtag",                    version: .SF3, keywords: ["AirTag", "追踪", "定位", "防丢"]),
        SingleSymbols(name: "display",                   version: .SF2, keywords: ["显示器", "屏幕", "外接屏", "Mac"]),
        SingleSymbols(name: "pc",                        version: .SF2, keywords: ["PC", "台式机", "电脑", "Mac"]),
        SingleSymbols(name: "xserve",                    version: .SF2, keywords: ["服务器", "Xserve", "机架", "数据中心"]),
        SingleSymbols(name: "server.rack",               version: .SF2, keywords: ["服务器机架", "数据中心", "云服务器"]),
        SingleSymbols(name: "laptopcomputer",            version: .SF2, keywords: ["笔记本", "MacBook", "电脑", "便携"]),
        SingleSymbols(name: "macmini",                   version: .SF2, keywords: ["Mac mini", "台式机", "苹果电脑"]),
        SingleSymbols(name: "ipod",                      version: .SF2, keywords: ["iPod", "音乐播放器", "苹果设备"]),
        SingleSymbols(name: "flipphone",                 version: .SF2, keywords: ["翻盖手机", "老式手机", "手机"]),
        SingleSymbols(name: "candybarphone",             version: .SF2, keywords: ["直板手机", "老式手机", "功能机"]),
        SingleSymbols(name: "iphone.gen1.crop.circle",   version: .SF6, keywords: ["iPhone圆圈", "手机图标", "应用"]),
        SingleSymbols(name: "iphone.gen1.radiowaves.left.and.right", version: .SF4, keywords: ["iPhone振动", "信号", "通话"]),
        SingleSymbols(name: "iphone.gen1.and.arrow.left", version: .SF6, keywords: ["iPhone操作", "点击", "滑动", "手势"]),
        SingleSymbols(name: "iphone.gen2.and.arrow.left.and.arrow.right.inward", version: .SF6, keywords: ["关机", "滑动关机", "iPhone"]),
        SingleSymbols(name: "iphone.and.arrow.right.outward", version: .SF6, keywords: ["退出", "迁移", "导出", "iPhone"]),
        SingleSymbols(name: "iphone.rear.camera",        version: .SF3, keywords: ["后置摄像头", "iPhone相机", "拍照"]),
        SingleSymbols(name: "platter.filled.top.iphone", version: .SF3, keywords: ["顶部通知", "iPhone顶部", "状态栏"]),
        SingleSymbols(name: "ipad",                      version: .SF2, keywords: ["iPad", "平板", "苹果平板"]),
        SingleSymbols(name: "ipad.landscape",            version: .SF2, keywords: ["iPad横屏", "横向", "平板"]),
        SingleSymbols(name: "iphone.case",               version: .SF5, keywords: ["手机壳", "保护壳", "配件"]),
        SingleSymbols(name: "vision.pro",                version: .SF6, keywords: ["Vision Pro", "空间计算", "XR", "头显"]),
        SingleSymbols(name: "smartphone",                version: .SF5, keywords: ["智能手机", "手机", "移动设备"]),
        SingleSymbols(name: "applepencil",               version: .SF3, keywords: ["Apple Pencil", "手写笔", "绘图", "书写", "笔"]),
        SingleSymbols(name: "magicmouse",                version: .SF3, keywords: ["Magic Mouse", "鼠标", "苹果鼠标"]),
        SingleSymbols(name: "computermouse",             version: .SF3, keywords: ["鼠标", "电脑鼠标", "输入设备"]),
        SingleSymbols(name: "applewatch",                version: .SF2, keywords: ["Apple Watch", "智能手表", "健康", "穿戴"]),
        SingleSymbols(name: "applewatch.side.right",     version: .SF2, keywords: ["Apple Watch侧面", "表盘", "数码表冠"]),
        SingleSymbols(name: "headphones",                version: .SF1, keywords: ["耳机", "音乐", "听歌", "头戴", "降噪"]),
        SingleSymbols(name: "headset",                   version: .SF6, keywords: ["头戴耳机", "通话耳机", "客服", "游戏"]),
        SingleSymbols(name: "airpods.max",               version: .SF6, keywords: ["AirPods Max", "头戴耳机", "降噪", "音乐"]),
        SingleSymbols(name: "earbuds",                   version: .SF3, keywords: ["有线耳机", "耳塞", "音乐"]),
        SingleSymbols(name: "earbuds.case",              version: .SF3, keywords: ["耳机盒", "收纳", "充电盒"]),
        SingleSymbols(name: "earpods",                   version: .SF2, keywords: ["EarPods", "耳机", "苹果有线耳机"]),
        SingleSymbols(name: "airpods",                   version: .SF2, keywords: ["AirPods", "无线耳机", "蓝牙耳机"]),
        SingleSymbols(name: "airpods.gen3",              version: .SF3, keywords: ["AirPods第三代", "无线耳机", "蓝牙"]),
        SingleSymbols(name: "homepod",                   version: .SF2, keywords: ["HomePod", "智能音箱", "Siri", "家居"]),
        SingleSymbols(name: "hifispeaker",               version: .SF1, keywords: ["Hi-Fi音箱", "扬声器", "音响", "音乐"]),
        SingleSymbols(name: "appletv",                   version: .SF2, keywords: ["Apple TV", "流媒体", "机顶盒", "影音"]),
        SingleSymbols(name: "appletvremote.gen1",        version: .SF3, keywords: ["Apple TV遥控器", "遥控", "媒体"]),
        SingleSymbols(name: "mediastick",                version: .SF3, keywords: ["媒体棒", "流媒体", "机顶盒"]),
        SingleSymbols(name: "cable.connector",           version: .SF3, keywords: ["电缆接口", "数据线", "连接线"]),
        SingleSymbols(name: "audio.jack.mono",           version: .SF5, keywords: ["耳机插孔", "3.5mm", "音频接口"]),
        SingleSymbols(name: "tv",                        version: .SF1, keywords: ["电视", "屏幕", "影音", "媒体", "显示"]),
        SingleSymbols(name: "4k.tv",                     version: .SF2, keywords: ["4K电视", "高清", "超清", "影音"]),
        SingleSymbols(name: "airplay.video",             version: .SF6, keywords: ["AirPlay", "投屏", "无线投影", "分享屏幕"]),
        SingleSymbols(name: "radio",                     version: .SF2, keywords: ["收音机", "广播", "音频", "AM/FM"]),
        SingleSymbols(name: "dot.radiowaves.left.and.right", version: .SF1, keywords: ["无线电波", "广播", "信号", "WiFi"]),
        SingleSymbols(name: "antenna.radiowaves.left.and.right", version: .SF1, keywords: ["天线", "信号", "无线", "通信"]),
        SingleSymbols(name: "pip",                       version: .SF2, keywords: ["画中画", "小窗播放", "悬浮窗", "视频"]),
        SingleSymbols(name: "rectangle.arrowtriangle.2.outward", version: .SF2, keywords: ["全屏", "扩展", "展开", "滚动"]),
        SingleSymbols(name: "rectangle.portrait.arrowtriangle.2.outward", version: .SF2, keywords: ["竖屏全屏", "展开", "滚动"]),
        SingleSymbols(name: "guitars",                   version: .SF1, keywords: ["吉他", "乐器", "音乐", "演奏"]),
        SingleSymbols(name: "simcard",                   version: .SF2, keywords: ["SIM卡", "手机卡", "通话", "运营商"]),
        SingleSymbols(name: "sdcard",                    version: .SF2, keywords: ["SD卡", "存储卡", "扩容", "内存卡"]),
        SingleSymbols(name: "esim",                      version: .SF2, keywords: ["eSIM", "虚拟SIM卡", "电子SIM", "手机"]),
        
        // ========== 交通工具 ==========
        SingleSymbols(name: "airplane",                  version: .SF1, keywords: ["飞机", "航班", "飞行", "旅行", "航空"]),
        SingleSymbols(name: "car",                       version: .SF1, keywords: ["汽车", "驾驶", "出行", "交通", "自驾"]),
        SingleSymbols(name: "bus",                       version: .SF2, keywords: ["公交车", "巴士", "公共交通", "出行"]),
        SingleSymbols(name: "tram",                      version: .SF2, keywords: ["电车", "有轨电车", "公共交通"]),
        SingleSymbols(name: "ferry",                     version: .SF3, keywords: ["轮渡", "渡船", "船只", "水运"]),
        SingleSymbols(name: "sailboat",                  version: .SF4, keywords: ["帆船", "航海", "水上", "旅行"]),
        SingleSymbols(name: "train.side.front.car",      version: .SF3, keywords: ["列车", "高铁", "火车", "铁路", "交通"]),
        SingleSymbols(name: "truck.box",                 version: .SF5, keywords: ["卡车", "货运", "物流", "运输"]),
        SingleSymbols(name: "drone",                     version: .SF6, keywords: ["无人机", "飞行", "航拍", "遥控"]),
        SingleSymbols(name: "wheelchair",                version: .SF6, keywords: ["轮椅", "无障碍", "残障", "辅助出行"]),
        SingleSymbols(name: "bicycle",                   version: .SF2, keywords: ["自行车", "骑行", "单车", "环保"]),
        SingleSymbols(name: "helmet",                    version: .SF6, keywords: ["头盔", "安全帽", "防护", "骑行"]),
        SingleSymbols(name: "moped",                     version: .SF6, keywords: ["轻便摩托", "电动车", "代步", "小型摩托"]),
        SingleSymbols(name: "motorcycle",                version: .SF6, keywords: ["摩托车", "骑行", "两轮", "交通"]),
        SingleSymbols(name: "scooter",                   version: .SF3, keywords: ["踏板车", "代步", "滑板车", "电动"]),
        SingleSymbols(name: "stroller",                  version: .SF4, keywords: ["婴儿车", "推车", "宝宝", "亲子"]),
        SingleSymbols(name: "parkingsign",               version: .SF3, keywords: ["停车", "停车场", "P标志", "交通"]),
        SingleSymbols(name: "fuelpump",                  version: .SF3, keywords: ["加油", "油泵", "燃油", "加油站"]),
        
        // ========== 汽车零部件 ==========
        SingleSymbols(name: "engine.combustion",         version: .SF4, keywords: ["发动机", "引擎", "燃油", "汽车"]),
        SingleSymbols(name: "headlight.high.beam",       version: .SF4, keywords: ["远光灯", "大灯", "车灯", "照明"]),
        SingleSymbols(name: "parkinglight",              version: .SF4, keywords: ["停车灯", "示廓灯", "车灯"]),
        SingleSymbols(name: "glowplug",                  version: .SF4, keywords: ["预热塞", "柴油", "发动机", "启动"]),
        SingleSymbols(name: "tirepressure",              version: .SF5, keywords: ["胎压", "轮胎气压", "安全", "维保"]),
        SingleSymbols(name: "heat.waves",                version: .SF5, keywords: ["热浪", "高温", "暖风", "空调"]),
        SingleSymbols(name: "windshield.front.and.wiper", version: .SF4, keywords: ["雨刮器", "挡风玻璃", "清洁", "雨天"]),
        SingleSymbols(name: "mirror.side.left",          version: .SF4, keywords: ["侧镜", "后视镜", "驾驶", "安全"]),
        SingleSymbols(name: "brakesignal",               version: .SF4, keywords: ["刹车", "制动", "减速", "安全"]),
        SingleSymbols(name: "transmission",              version: .SF4, keywords: ["变速箱", "档位", "传动", "汽车"]),
        SingleSymbols(name: "oilcan",                    version: .SF4, keywords: ["机油", "润滑油", "维保", "加油"]),
        SingleSymbols(name: "hazardsign",                version: .SF4, keywords: ["危险", "警告", "警示", "注意"]),
        SingleSymbols(name: "yieldsign",                 version: .SF5, keywords: ["让行", "让路标志", "减速", "交通"]),
        SingleSymbols(name: "wrongwaysign",              version: .SF4, keywords: ["错误方向", "禁止通行", "道路", "交通"]),
        SingleSymbols(name: "steeringwheel",             version: .SF4, keywords: ["方向盘", "驾驶", "汽车", "掌舵"]),
        SingleSymbols(name: "tire",                      version: .SF6, keywords: ["轮胎", "车轮", "汽车", "维保"]),
        SingleSymbols(name: "tow.hitch",                 version: .SF6, keywords: ["拖车钩", "牵引", "拖挂", "连接"]),
        SingleSymbols(name: "carseat.left",              version: .SF5, keywords: ["汽车座椅", "儿童座椅", "安全座椅"]),
        SingleSymbols(name: "car.side",                  version: .SF4, keywords: ["汽车侧面", "轿车", "出行", "车型"]),
        SingleSymbols(name: "car.side.front.open.crop",  version: .SF6, keywords: ["车门", "前排", "上车", "汽车"]),
        SingleSymbols(name: "car.side.rear.open.crop",   version: .SF6, keywords: ["后备箱", "行李", "尾门", "汽车"]),
        SingleSymbols(name: "suv.side",                  version: .SF4, keywords: ["SUV", "越野车", "汽车", "车型"]),
        SingleSymbols(name: "truck.pickup.side",         version: .SF5, keywords: ["皮卡", "货车", "越野", "车型", "汽车"]),
        SingleSymbols(name: "convertible.side",          version: .SF6, keywords: ["敞篷车", "跑车", "车型", "豪车", "汽车"]),
        SingleSymbols(name: "car.top.door.front.left.open", version: .SF4, keywords: ["开车门", "进入", "汽车俯视", "汽车"]),
        SingleSymbols(name: "suspension.shock",          version: .SF6, keywords: ["减震器", "悬架", "弹簧", "汽车"]),
        SingleSymbols(name: "axle.2",                    version: .SF4, keywords: ["车轴", "驱动轴", "4WD", "汽车"]),
        SingleSymbols(name: "batteryblock",              version: .SF4, keywords: ["电池组", "新能源", "电动车", "充电"]),
        SingleSymbols(name: "tachometer",                version: .SF6, keywords: ["转速表", "仪表盘", "发动机", "RPM"]),
        SingleSymbols(name: "horn",                      version: .SF5, keywords: ["喇叭", "鸣笛", "警报", "汽车"]),
        SingleSymbols(name: "abs",                       version: .SF4, keywords: ["ABS", "防抱死", "制动", "安全"]),
        
        // ========== 动植物 ==========
        SingleSymbols(name: "hare",                      version: .SF1, keywords: ["兔子", "快速", "速度", "动物", "性能"]),
        SingleSymbols(name: "tortoise",                  version: .SF1, keywords: ["乌龟", "缓慢", "低速", "节能", "动物"]),
        SingleSymbols(name: "dog",                       version: .SF5, keywords: ["狗", "宠物", "可爱", "动物", "汪"]),
        SingleSymbols(name: "cat",                       version: .SF5, keywords: ["猫", "宠物", "可爱", "动物", "喵"]),
        SingleSymbols(name: "lizard",                    version: .SF4, keywords: ["蜥蜴", "爬行动物", "动物"]),
        SingleSymbols(name: "bird",                      version: .SF4, keywords: ["鸟", "飞鸟", "动物", "Twitter"]),
        SingleSymbols(name: "ant",                       version: .SF1, keywords: ["蚂蚁", "昆虫", "调试", "Debug", "Bug"]),
        SingleSymbols(name: "ladybug",                   version: .SF2, keywords: ["瓢虫", "昆虫", "Debug", "Bug", "调试"]),
        SingleSymbols(name: "fish",                      version: .SF4, keywords: ["鱼", "海鲜", "水产", "动物", "钓鱼"]),
        SingleSymbols(name: "pawprint",                  version: .SF3, keywords: ["爪印", "宠物", "足迹", "动物"]),
        SingleSymbols(name: "teddybear",                 version: .SF4, keywords: ["泰迪熊", "玩具", "礼物", "可爱"]),
        SingleSymbols(name: "leaf",                      version: .SF2, keywords: ["叶子", "绿色", "环保", "自然", "植物"]),
        SingleSymbols(name: "laurel.leading",            version: .SF4, keywords: ["月桂", "荣耀", "胜利", "装饰"]),
        SingleSymbols(name: "camera.macro",              version: .SF3, keywords: ["花朵", "微距", "植物", "自然", "摄影"]),
        SingleSymbols(name: "tree",                      version: .SF4, keywords: ["树", "植物", "自然", "绿色", "环保"]),
        SingleSymbols(name: "fossil.shell",              version: .SF4, keywords: ["化石", "贝壳", "古生物", "自然", "科学"]),
        
        // ========== 服装与时尚 ==========
        SingleSymbols(name: "hanger",                    version: .SF5, keywords: ["衣架", "衣物", "晾衣", "整理", "时尚"]),
        SingleSymbols(name: "crown",                     version: .SF2, keywords: ["王冠", "皇冠", "会员", "VIP", "高级"]),
        SingleSymbols(name: "hat.widebrim",              version: .SF6, keywords: ["宽檐帽", "遮阳帽", "时尚", "夏天"]),
        SingleSymbols(name: "hat.cap",                   version: .SF6, keywords: ["鸭舌帽", "棒球帽", "休闲", "时尚"]),
        SingleSymbols(name: "tshirt",                    version: .SF3, keywords: ["T恤", "衣服", "服装", "穿搭"]),
        SingleSymbols(name: "jacket",                    version: .SF6, keywords: ["夹克", "外套", "服装", "穿搭"]),
        SingleSymbols(name: "coat",                      version: .SF6, keywords: ["大衣", "外套", "冬装", "服装"]),
        SingleSymbols(name: "shoe",                      version: .SF5, keywords: ["鞋子", "球鞋", "服装", "穿搭"]),
        SingleSymbols(name: "shoeprints.fill",           version: .SF4, keywords: ["脚印", "步骤", "行走", "足迹"]),
        
        // ========== 娱乐与影视 ==========
        SingleSymbols(name: "film",                      version: .SF1, keywords: ["电影", "胶片", "影视", "视频", "录像"]),
        SingleSymbols(name: "movieclapper",              version: .SF5, keywords: ["场记板", "电影", "导演", "拍摄", "影视"]),
        SingleSymbols(name: "ticket",                    version: .SF2, keywords: ["门票", "票务", "活动", "电影票", "演出"]),
        SingleSymbols(name: "lifepreserver",             version: .SF2, keywords: ["救生圈", "帮助", "支持", "安全", "援助"]),
        SingleSymbols(name: "recordingtape",             version: .SF1, keywords: ["录音带", "磁带", "音乐", "复古"]),
        SingleSymbols(name: "binoculars",                version: .SF2, keywords: ["望远镜", "观察", "远处", "搜索", "侦查"]),
        
        // ========== 面部与身体 ==========
        SingleSymbols(name: "face.smiling",              version: .SF2, keywords: ["笑脸", "表情", "Emoji", "开心", "微笑"]),
        SingleSymbols(name: "eye",                       version: .SF1, keywords: ["眼睛", "查看", "预览", "可见", "观察"]),
        SingleSymbols(name: "eyes",                      version: .SF2, keywords: ["双眼", "注意", "监视", "关注"]),
        SingleSymbols(name: "nose",                      version: .SF2, keywords: ["鼻子", "面部", "嗅觉", "Memoji"]),
        SingleSymbols(name: "comb",                      version: .SF2, keywords: ["梳子", "美发", "整理", "理发"]),
        SingleSymbols(name: "mustache",                  version: .SF2, keywords: ["胡须", "胡子", "面部", "Memoji"]),
        SingleSymbols(name: "mouth",                     version: .SF2, keywords: ["嘴", "嘴唇", "口语", "发音", "语音"]),
        SingleSymbols(name: "eyeglasses",                version: .SF1, keywords: ["眼镜", "近视", "阅读", "视力"]),
        SingleSymbols(name: "sunglasses",                version: .SF5, keywords: ["太阳镜", "墨镜", "时尚", "防晒"]),
        SingleSymbols(name: "ear",                       version: .SF1, keywords: ["耳朵", "听觉", "听力", "音频", "辅助听力"]),
        SingleSymbols(name: "hand.raised",               version: .SF1, keywords: ["举手", "请求", "询问", "警告", "停止"]),
        SingleSymbols(name: "xmark.triangle.circle.square", version: .SF6, keywords: ["多图形", "组合", "快捷键", "多操作"]),
        SingleSymbols(name: "hand.raised.palm.facing",   version: .SF6, keywords: ["手掌", "停止", "阻止", "禁止"]),
        SingleSymbols(name: "hand.raised.fingers.spread", version: .SF4, keywords: ["手指展开", "招手", "五指", "手势"]),
        SingleSymbols(name: "hand.thumbsup",             version: .SF1, keywords: ["点赞", "好", "赞", "喜欢", "认可"]),
        SingleSymbols(name: "hand.thumbsdown",           version: .SF1, keywords: ["不喜欢", "踩", "反对", "差评"]),
        SingleSymbols(name: "hand.point.up",             version: .SF2, keywords: ["点击", "触控", "手指点击", "交互"]),
        SingleSymbols(name: "hand.wave",                 version: .SF2, keywords: ["挥手", "打招呼", "再见", "问候"]),
        SingleSymbols(name: "hands.clap",                version: .SF2, keywords: ["鼓掌", "拍手", "称赞", "庆祝"]),
        
        // ========== 二维码与扫描 ==========
        SingleSymbols(name: "qrcode",                    version: .SF1, keywords: ["二维码", "QR码", "扫码", "链接"]),
        SingleSymbols(name: "barcode",                   version: .SF1, keywords: ["条形码", "商品码", "扫描", "识别"]),
        SingleSymbols(name: "livephoto",                 version: .SF1, keywords: ["Live Photo", "动态照片", "相机"]),
        SingleSymbols(name: "f.cursive",                 version: .SF1, keywords: ["F字母", "草书", "字体", "Facebook"]),
        SingleSymbols(name: "scope",                     version: .SF1, keywords: ["瞄准", "范围", "目标", "精确"]),
        SingleSymbols(name: "rectangle.stack",           version: .SF1, keywords: ["矩形堆叠", "卡片", "图层", "多页"]),
        
        // ========== 图表与数据 ==========
        SingleSymbols(name: "chart.xyaxis.line",         version: .SF3, keywords: ["折线图", "图表", "数据", "趋势"]),
        SingleSymbols(name: "gauge.with.needle",         version: .SF5, keywords: ["仪表盘", "计量", "速度", "性能"]),
        SingleSymbols(name: "chart.bar",                 version: .SF1, keywords: ["柱状图", "统计", "信号", "数据"]),
        SingleSymbols(name: "chart.line.uptrend.xyaxis", version: .SF3, keywords: ["上升趋势图", "股市", "增长", "数据"]),
        SingleSymbols(name: "chart.dots.scatter",        version: .SF4, keywords: ["散点图", "数据", "分布", "统计"]),
        SingleSymbols(name: "chart.pie",                 version: .SF1, keywords: ["饼图", "占比", "数据", "统计"]),
        SingleSymbols(name: "burst",                     version: .SF1, keywords: ["爆炸形", "新品", "特卖", "热点"]),
        SingleSymbols(name: "waveform.path.ecg",         version: .SF1, keywords: ["心电图", "心率", "医疗", "健康"]),
        SingleSymbols(name: "waveform",                  version: .SF1, keywords: ["波形", "音频", "声波", "信号"]),
        
        // ========== 时间 ==========
        SingleSymbols(name: "clock",                     version: .SF1, keywords: ["时钟", "时间", "钟表", "小时", "分钟"]),
        SingleSymbols(name: "alarm",                     version: .SF1, keywords: ["闹钟", "提醒", "起床", "闹铃"]),
        SingleSymbols(name: "stopwatch",                 version: .SF1, keywords: ["秒表", "计时", "比赛", "速度"]),
        SingleSymbols(name: "timer",                     version: .SF1, keywords: ["定时器", "倒计时", "计时", "时间"]),
        SingleSymbols(name: "hourglass",                 version: .SF1, keywords: ["沙漏", "倒计时", "等待", "时间流逝"]),
        
        // ========== 游戏 ==========
        SingleSymbols(name: "arcade.stick.console",      version: .SF5, keywords: ["街机", "摇杆主机", "游戏", "复古"]),
        SingleSymbols(name: "arcade.stick",              version: .SF5, keywords: ["街机摇杆", "操控杆", "游戏", "复古"]),
        SingleSymbols(name: "dpad",                      version: .SF2, keywords: ["方向键", "游戏手柄", "上下左右", "控制"]),
        SingleSymbols(name: "playstation.logo",          version: .SF4, keywords: ["PlayStation", "PS", "索尼", "游戏主机"]),
        SingleSymbols(name: "xbox.logo",                 version: .SF4, keywords: ["Xbox", "微软", "游戏主机"]),
        SingleSymbols(name: "gamecontroller",            version: .SF1, keywords: ["游戏手柄", "游戏", "控制器", "主机游戏"]),
        
        // ========== 食品与饮品 ==========
        SingleSymbols(name: "cup.and.saucer",            version: .SF3, keywords: ["杯子", "茶", "咖啡", "餐饮", "热饮"]),
        SingleSymbols(name: "cup.and.heat.waves",        version: .SF6, keywords: ["热咖啡", "热饮", "蒸汽", "咖啡"]),
        SingleSymbols(name: "mug",                       version: .SF4, keywords: ["马克杯", "咖啡杯", "饮品", "办公"]),
        SingleSymbols(name: "wineglass",                 version: .SF4, keywords: ["酒杯", "红酒", "饮品", "聚餐"]),
        SingleSymbols(name: "waterbottle",               version: .SF5, keywords: ["水瓶", "饮水", "运动水壶", "健康"]),
        SingleSymbols(name: "birthday.cake",             version: .SF4, keywords: ["蛋糕", "生日", "庆祝", "节日", "甜品"]),
        SingleSymbols(name: "carrot",                    version: .SF4, keywords: ["胡萝卜", "蔬菜", "食物", "健康"]),
        SingleSymbols(name: "fork.knife",                version: .SF3, keywords: ["刀叉", "餐饮", "吃饭", "餐厅", "美食"]),
        
        // ========== 科学与数学 ==========
        SingleSymbols(name: "bonjour",                   version: .SF2, keywords: ["Bonjour", "局域网", "网络发现", "服务"]),
        SingleSymbols(name: "scalemass",                 version: .SF2, keywords: ["质量", "重量", "平衡", "秤"]),
        SingleSymbols(name: "angle",                     version: .SF4, keywords: ["角度", "几何", "度数", "数学"]),
        SingleSymbols(name: "compass.drawing",           version: .SF4, keywords: ["圆规", "绘图", "几何", "设计"]),
        SingleSymbols(name: "atom",                      version: .SF2, keywords: ["原子", "物理", "科学", "化学"]),
        SingleSymbols(name: "wave.3.up",                 version: .SF6, keywords: ["波浪", "信号", "无线", "振动"]),
        
        // ========== 其他杂项 ==========
        SingleSymbols(name: "point.bottomleft.forward.to.point.topright.scurvepath", version: .SF5, keywords: ["路径", "连接", "曲线", "流程", "线路"]),
        SingleSymbols(name: "battery.100percent",        version: .SF5, keywords: ["电量", "满电", "电池", "充电", "能量"]),
        SingleSymbols(name: "burn",                      version: .SF1, keywords: ["燃烧", "删除", "销毁", "Hot"]),
        SingleSymbols(name: "perspective",               version: .SF1, keywords: ["透视", "视角", "3D", "变换"]),
        SingleSymbols(name: "skew",                      version: .SF1, keywords: ["倾斜", "变形", "透视"]),
        SingleSymbols(name: "shadow",                    version: .SF2, keywords: ["阴影", "投影", "效果", "设计"]),
        SingleSymbols(name: "view.2d",                   version: .SF1, keywords: ["2D视图", "平面", "二维"]),
        SingleSymbols(name: "view.3d",                   version: .SF1, keywords: ["3D视图", "立体", "三维", "空间"]),
        SingleSymbols(name: "numbers",                   version: .SF6, keywords: ["数字", "数值", "计算", "Number"]),
        
        // ========== 文字排版 ==========
        SingleSymbols(name: "character",                 version: .SF2, keywords: ["字符", "文字", "字体", "文本"]),
        SingleSymbols(name: "bold",                      version: .SF1, keywords: ["粗体", "加粗", "字体", "强调"]),
        SingleSymbols(name: "italic",                    version: .SF1, keywords: ["斜体", "字体", "排版"]),
        SingleSymbols(name: "underline",                 version: .SF1, keywords: ["下划线", "强调", "链接", "排版"]),
        SingleSymbols(name: "strikethrough",             version: .SF1, keywords: ["删除线", "删除", "完成", "划掉"]),
        SingleSymbols(name: "sum",                       version: .SF1, keywords: ["求和", "总计", "数学", "Σ"]),
        SingleSymbols(name: "percent",                   version: .SF1, keywords: ["百分比", "%", "比例", "折扣"]),
        SingleSymbols(name: "function",                  version: .SF1, keywords: ["函数", "方法", "编程", "数学", "f(x)"]),
        SingleSymbols(name: "paragraphsign",             version: .SF2, keywords: ["段落符号", "¶", "排版", "文本"]),
        
        // ========== 信息符号 ==========
        SingleSymbols(name: "info",                      version: .SF1, keywords: ["信息", "关于", "详情", "说明"]),
        SingleSymbols(name: "info.circle",               version: .SF1, keywords: ["信息", "帮助", "详情", "关于"]),
        SingleSymbols(name: "at",                        version: .SF1, keywords: ["@", "At", "邮件", "提及", "标记"]),
        SingleSymbols(name: "questionmark",              version: .SF1, keywords: ["问号", "帮助", "疑问", "未知"]),
        SingleSymbols(name: "questionmark.circle",       version: .SF1, keywords: ["问号", "帮助", "疑问", "提示"]),
        SingleSymbols(name: "exclamationmark",           version: .SF1, keywords: ["感叹号", "警告", "重要", "注意"]),
        SingleSymbols(name: "exclamationmark.2",         version: .SF2, keywords: ["双感叹号", "警告", "紧急", "重要"]),
        SingleSymbols(name: "exclamationmark.3",         version: .SF2, keywords: ["三感叹号", "严重警告", "紧急"]),
        SingleSymbols(name: "exclamationmark.circle",    version: .SF1, keywords: ["警告", "错误", "感叹号", "圆形"]),
        
        // ========== 数学运算符号 ==========
        SingleSymbols(name: "plus",                      version: .SF1, keywords: ["加号", "添加", "新建", "增加"]),
        SingleSymbols(name: "plus.circle",               version: .SF1, keywords: ["圆形加号", "添加", "新建"]),
        SingleSymbols(name: "plus.square",               version: .SF1, keywords: ["方形加号", "添加", "新建"]),
        SingleSymbols(name: "minus",                     version: .SF1, keywords: ["减号", "删除", "移除", "减少"]),
        SingleSymbols(name: "minus.circle",              version: .SF1, keywords: ["圆形减号", "删除", "移除"]),
        SingleSymbols(name: "minus.square",              version: .SF1, keywords: ["方形减号", "删除", "移除"]),
        SingleSymbols(name: "plusminus",                 version: .SF1, keywords: ["加减号", "正负", "差值", "±"]),
        SingleSymbols(name: "plus.forwardslash.minus",   version: .SF3, keywords: ["加减", "正负", "切换", "对比"]),
        SingleSymbols(name: "multiply",                  version: .SF1, keywords: ["乘号", "关闭", "删除", "退出", "×"]),
        SingleSymbols(name: "multiply.circle",           version: .SF1, keywords: ["圆形关闭", "删除", "取消", "清除"]),
        SingleSymbols(name: "multiply.square",           version: .SF1, keywords: ["方形关闭", "删除", "取消"]),
        SingleSymbols(name: "divide",                    version: .SF1, keywords: ["除号", "除法", "分割", "÷"]),
        SingleSymbols(name: "equal",                     version: .SF1, keywords: ["等号", "等于", "相等", "="]),
        SingleSymbols(name: "notequal",                  version: .SF6, keywords: ["不等号", "不等于", "≠", "差异"]),
        SingleSymbols(name: "chevron.left.forwardslash.chevron.right", version: .SF3, keywords: ["代码", "HTML", "标签", "</>", "编程"]),
        SingleSymbols(name: "ellipsis.curlybraces",      version: .SF3, keywords: ["代码省略", "函数体", "编程", "{...}"]),
        
        // ========== 操作符号 ==========
        SingleSymbols(name: "xmark",                     version: .SF1, keywords: ["关闭", "删除", "错误", "退出", "取消"]),
        SingleSymbols(name: "xmark.circle",              version: .SF1, keywords: ["圆形关闭", "取消", "删除", "错误"]),
        SingleSymbols(name: "xmark.square",              version: .SF1, keywords: ["方形关闭", "取消", "删除"]),
        SingleSymbols(name: "checkmark",                 version: .SF1, keywords: ["对号", "完成", "确认", "选中", "成功"]),
        SingleSymbols(name: "checkmark.circle",          version: .SF1, keywords: ["圆形对号", "完成", "确认", "成功"]),
        SingleSymbols(name: "checkmark.square",          version: .SF1, keywords: ["方形对号", "完成", "勾选", "选中"]),
        
        // ========== 方向箭头 ==========
        SingleSymbols(name: "chevron.left",              version: .SF1, keywords: ["返回", "左箭头", "上一步", "退出"]),
        SingleSymbols(name: "chevron.forward",           version: .SF2, keywords: ["前进", "右箭头", "下一步", "更多"]),
        SingleSymbols(name: "chevron.up",                version: .SF1, keywords: ["向上", "上箭头", "收起", "折叠"]),
        SingleSymbols(name: "chevron.down",              version: .SF1, keywords: ["向下", "下箭头", "展开", "下拉"]),
        SingleSymbols(name: "chevron.up.chevron.down",   version: .SF1, keywords: ["上下箭头", "排序", "选择", "滚动"]),
        SingleSymbols(name: "arrow.uturn.left",          version: .SF1, keywords: ["返回", "撤销", "回退", "上一步"]),
        SingleSymbols(name: "arrow.up.and.down.and.arrow.left.and.right", version: .SF2, keywords: ["移动", "拖动", "选中", "全向"]),
        SingleSymbols(name: "arrow.down.left.and.arrow.up.right", version: .SF5, keywords: ["放大", "全屏", "展开", "扩大"]),
        SingleSymbols(name: "arrow.down.right.and.arrow.up.left", version: .SF1, keywords: ["缩小", "退出全屏", "收起"]),
        SingleSymbols(name: "arrow.3.trianglepath",      version: .SF1, keywords: ["三向循环", "刷新", "循环", "重复"]),
        SingleSymbols(name: "arrow.trianglehead.merge",  version: .SF6, keywords: ["合并", "Git合并", "汇聚", "连接"]),
        SingleSymbols(name: "arrow.trianglehead.branch", version: .SF6, keywords: ["分支", "Git分支", "派生", "分叉"]),
        SingleSymbols(name: "arrow.trianglehead.swap",   version: .SF6, keywords: ["交换", "互换", "切换", "连接"]),
        SingleSymbols(name: "arrow.down.left.arrow.up.right", version: .SF5, keywords: ["传输", "转换", "双向", "箭头"]),
        SingleSymbols(name: "arrowtriangle.left",        version: .SF1, keywords: ["左三角", "后退", "上一个", "左"]),
        SingleSymbols(name: "arrowtriangle.right",       version: .SF1, keywords: ["右三角", "前进", "下一个", "右"]),
        SingleSymbols(name: "arrowtriangle.up",          version: .SF1, keywords: ["上三角", "向上", "顶部", "上"]),
        SingleSymbols(name: "arrowtriangle.down",        version: .SF1, keywords: ["下三角", "向下", "底部", "下拉"]),
        
        // ========== 方向形状箭头 ==========
        SingleSymbols(name: "arrowshape.left",           version: .SF4, keywords: ["左箭头", "返回", "后退", "方向"]),
        SingleSymbols(name: "arrowshape.right",          version: .SF4, keywords: ["右箭头", "前进", "发送", "方向"]),
        SingleSymbols(name: "arrowshape.up",             version: .SF5, keywords: ["上箭头", "向上", "方向", "提交"]),
        SingleSymbols(name: "arrowshape.down",           version: .SF5, keywords: ["下箭头", "向下", "下载", "方向"]),
        SingleSymbols(name: "arrowshape.left.arrowshape.right", version: .SF5, keywords: ["左右箭头", "双向", "切换"]),
        SingleSymbols(name: "arrowshape.turn.up.left",   version: .SF1, keywords: ["转弯箭头", "回复", "返回", "撤销"]),
        SingleSymbols(name: "arrowshape.turn.up.left.2", version: .SF1, keywords: ["双回复", "全部回复", "撤销"]),
        SingleSymbols(name: "arrowkeys",                 version: .SF5, keywords: ["方向键", "上下左右", "键盘", "控制"]),
        
        // ========== 系统品牌 ==========
        SingleSymbols(name: "apple.logo",                version: .SF4, keywords: ["苹果", "Apple", "Logo", "品牌"]),
        
        // ========== 取出与存入 ==========
        SingleSymbols(name: "square.and.arrow.up",       version: .SF1, keywords: ["分享", "导出", "上传", "发送", "共享"]),
        SingleSymbols(name: "rectangle.portrait.and.arrow.right", version: .SF3, keywords: ["退出", "退出应用", "导出", "右出"]),
        SingleSymbols(name: "square.and.arrow.down",     version: .SF1, keywords: ["导入", "下载", "存储", "保存"]),
    ]
}

struct SymbolsView: View {
    @EnvironmentObject var appStorage: AppStorageManager
    // 搜索类型和内容
    @State private var selectedCategory: SymbolsVersion? = nil
    @State private var searchText = ""
    
    let columns = [
        GridItem(.adaptive(minimum: 90, maximum: 140), spacing: 20, alignment: .leading)
    ]
    
    let availableSymbols: [SingleSymbols] = SingleSymbols.listSymbols.filter {
        UIImage(systemName: $0.name) != nil
    }
    
    var filteredSymbols: [SingleSymbols] {
        
        // 计算兼容的版本类型
        var compatibleCategory:[SymbolsVersion]
        
        if let selectedCategory = selectedCategory {
            compatibleCategory = selectedCategory.compatibleVersion
        } else {
            compatibleCategory = SymbolsVersion.allCases
        }
        
        // 返回筛选后的 SF Symbols
        return availableSymbols.filter { item in
            // 如果没有选择搜索类型，或者当前搜索类型和当前组件类型一致，或者当前搜索类型高于其他搜索类型时，则类型返回 true
            
            let matchCategory = compatibleCategory.contains(item.version)
            
            // 本地化名称和关键词数组
            let localizedKeywords = item.keywords.map {
                NSLocalizedString($0, comment: "")
            }
            
            // 如果输入内容为空，或者 Symbols 的英文名称、本地化描述和输入内容相匹配，返回 true
            let matchSearch =
            searchText.isEmpty ||
            item.name.localizedCaseInsensitiveContains(searchText) ||
            localizedKeywords.contains { $0.localizedCaseInsensitiveContains(searchText) }
            
            return matchCategory && matchSearch
            
        }
    }
    
    var body: some View {
        ScrollView {
            // 导航组件
            ToolCategoryView(tool: .Symbols, searchTips: "Search icons...", searchText: $searchText, selectedCategory: $selectedCategory)
            // 图标
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(filteredSymbols) { symbol in
                    SymbolsItemView(symbol: symbol)
                }
            }
            .padding(.vertical, 30)
        }
        .navigationTitle("Symbols")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(BackgroundModifiers())
        .onDisappear {
            print("关闭课程")
            print("检测是否满足打开评分窗口")
            AppRating.checkReviewIfNeeded(appStorage: appStorage)
        }
    }
}

struct SymbolsItemView: View {
    @State private var didCopy = false
    var symbol: SingleSymbols
    
    var body: some View {
        Button(action: copyCode) {
            VStack(spacing: 16) {
                Image(systemName: symbol.name)
                    .font(.system(size: 22).weight(.bold))
                    .imageScale(.large)
                    .foregroundStyle(Color.accentColor)
                Text(symbol.name)
                    .modifier(NotesText())
                    .lineLimit(1)
                    .frame(width: 60)
            }
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(Color("WhiteAndBlack"))
            .overlay {
                if didCopy {
                    ZStack {
                        Color.accentColor
                        Image(systemName: "checkmark")
                            .font(.system(size: 24).bold())
                            .foregroundStyle(.white)
                    }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(radius: 0.5)
        }
    }
    
    private func copyCode() {
        UIPasteboard.general.string = symbol.name
        withAnimation(.easeInOut(duration: 0.2)) { didCopy = true }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.easeInOut(duration: 0.2)) { didCopy = false }
        }
    }
}

#Preview {
    SymbolsView()
        .environmentObject(AppStorageManager.shared)
}
