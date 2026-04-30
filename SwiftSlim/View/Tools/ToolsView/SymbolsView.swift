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
    var keywords_en: [String]
    
    // MARK: - 完整符号列表
    static let listSymbols: [SingleSymbols] = [
        
        // ========== 书写与编辑 ==========
        SingleSymbols(name: "pencil",                    version: .SF1, keywords: ["铅笔", "笔", "书写", "写字", "编辑", "绘图", "画图", "修改", "注释"], keywords_en: ["pen", "pencil", "write", "writing", "draw", "drawing", "edit", "annotate"]),
        SingleSymbols(name: "pencil.tip",                version: .SF1, keywords: ["笔", "铅笔", "铅笔头", "笔尖", "书写", "绘图", "标注", "标记"], keywords_en: ["pen", "pencil", "pencil tip", "tip", "nib", "write", "draw", "annotate", "mark"]),
        SingleSymbols(name: "eraser",                    version: .SF4, keywords: ["橡皮", "橡皮擦", "擦除", "清除", "删除", "移除"], keywords_en: ["eraser", "erase", "clear", "remove", "delete"]),
        SingleSymbols(name: "square.and.pencil",         version: .SF1, keywords: ["笔", "铅笔", "编辑", "修改", "写作", "新建", "起草", ], keywords_en: ["pen", "pencil", "edit", "compose", "write", "create", "new", "draft"]),
        SingleSymbols(name: "scribble",                  version: .SF1, keywords: ["涂鸦", "手写", "笔迹", "草稿", "绘图", "乱画", "线条"], keywords_en: ["scribble", "handwriting", "draw", "sketch", "doodle", "line"]),
        SingleSymbols(name: "highlighter",               version: .SF2, keywords: ["笔", "高亮", "荧光笔", "标注", "标记", "记号", "重点"], keywords_en: ["pen", "highlighter", "highlight", "mark", "marker", "annotate"]),
        SingleSymbols(name: "trash",                     version: .SF1, keywords: ["垃圾桶", "删除", "移除", "清除", "丢弃", "废纸篓"], keywords_en: ["trash", "delete", "remove", "bin", "discard"]),
        SingleSymbols(name: "scissors",                  version: .SF1, keywords: ["剪刀", "剪切", "裁剪", "剪", "编辑"], keywords_en: ["scissors", "cut", "clip", "trim"]),
        SingleSymbols(name: "crop",                      version: .SF1, keywords: ["裁剪", "裁切", "修剪", "截取", "调整"], keywords_en: ["crop", "trim", "cut", "resize"]),
        
        // ========== 文件与存储 ==========
        SingleSymbols(name: "folder",                    version: .SF1, keywords: ["文件夹", "目录", "整理", "归档", "分类", "存储"], keywords_en: ["folder", "directory", "organize", "archive", "storage"]),
        SingleSymbols(name: "tray",                      version: .SF1, keywords: ["托盘", "收件箱", "收纳", "存放"], keywords_en: ["tray", "inbox", "organization", "storage"]),
        SingleSymbols(name: "externaldrive",             version: .SF2, keywords: ["移动硬盘","外接硬盘", "硬盘", "磁盘", "存储设备", "备份"], keywords_en: ["external drive", "portable drive", "hard drive", "disk", "storage", "backup"]),
        SingleSymbols(name: "archivebox",                version: .SF1, keywords: ["归档", "存档", "收纳", "盒子", "打包", "存储"], keywords_en: ["archive", "archive box", "storage", "box", "package", "store", "save"]),
        SingleSymbols(name: "document",                  version: .SF6, keywords: ["文件", "文档", "页面", "档案", "资料", "单页"], keywords_en: ["document", "file", "page", "paper", "record", "material"]),
        SingleSymbols(name: "arrow.down.document",       version: .SF6, keywords: ["下载", "下载文件", "保存", "导入", "获取", "接收"], keywords_en: ["download", "download file", "save", "import", "receive", "document", "file"]),
        SingleSymbols(name: "text.document",             version: .SF6, keywords: ["文本文件", "纯文本", "文档", "文件"], keywords_en: ["text file", "txt", "document", "file"]),
        SingleSymbols(name: "zipper.page",               version: .SF6, keywords: ["压缩", "压缩包", "打包", "归档", "文件"], keywords_en: ["zip", "zip file", "archive", "archiving", "compress", "compressed file", "file"]),
        SingleSymbols(name: "document.on.document",      version: .SF6, keywords: ["复制", "拷贝", "副本", "重复"], keywords_en: ["copy", "duplicate", "document copy", "file copy", "document", "file"]),
        SingleSymbols(name: "clipboard",                 version: .SF4, keywords: ["剪贴板", "粘贴", "复制", "记录", "内容"], keywords_en: ["clipboard", "paste", "copy"]),
        SingleSymbols(name: "text.page",                 version: .SF6, keywords: ["文本", "页面", "文档", "内容", "文章"], keywords_en: ["text", "page", "document", "content", "article"]),
        SingleSymbols(name: "text.page.badge.magnifyingglass",                 version: .SF6, keywords: ["搜索文档", "查找文档", "搜索文本", "查找文本", "页面搜索", "检索"], keywords_en: ["search document", "find document", "search text", "find text", "page search", "lookup"]),
        SingleSymbols(name: "note",                      version: .SF2, keywords: ["笔记", "便签", "备忘", "记录", "注释", "便笺"], keywords_en: ["note", "notes", "memo", "record", "annotation"]),
        SingleSymbols(name: "scroll",                    version: .SF2, keywords: ["卷轴", "古卷", "文本", "文档", "历史", "档案"], keywords_en: ["scroll", "document", "history", "archive", "paper"]),
        SingleSymbols(name: "checklist",                 version: .SF3, keywords: ["清单", "列表", "待办", "任务", "勾选", "核对"], keywords_en: ["checklist", "todo", "list", "task", "check", "items"]),
        SingleSymbols(name: "square.text.square",        version: .SF3, keywords: ["文本框", "内容框", "文字", "文本", "排版", "内容"], keywords_en: ["text box", "text", "content", "layout", "text frame"]),
        
        // =========== 日历 ===========
        SingleSymbols(name: "calendar",version: .SF1,keywords: ["日历", "日期", "日程", "时间", "安排", "计划", "事件", "提醒"],keywords_en: ["calendar", "date", "schedule", "time", "plan", "event", "reminder"]),

        SingleSymbols(name: "calendar.and.person",version: .SF6,keywords: ["日历", "个人日历", "日程", "预约", "会议", "安排"],keywords_en: ["calendar", "personal calendar", "user calendar", "schedule", "appointment", "meeting", "event"]),
        
        // ========== 阅读与书籍 ==========
        SingleSymbols(name: "book",                      version: .SF1, keywords: ["书", "书本", "书籍", "阅读", "图书", "教材", "学习", "课程"], keywords_en: ["book", "read", "reading", "textbook", "study", "course"]),
        SingleSymbols(name: "books.vertical",            version: .SF2, keywords: ["书架", "图书馆", "书籍", "多本书", "藏书", "阅读", "书柜", "图书"], keywords_en: ["books", "library", "collection", "bookshelf", "reading"]),
        SingleSymbols(name: "book.closed",               version: .SF2, keywords: ["书", "书本", "书籍", "关闭", "合上", "未读", "封面", "未打开"], keywords_en: ["closed book", "book", "cover", "closed", "unopened", "unread"]),
        SingleSymbols(name: "menucard",                  version: .SF3, keywords: ["菜单", "点餐", "菜谱"], keywords_en: ["menu", "food menu", "order"]),
        SingleSymbols(name: "greetingcard",              version: .SF2, keywords: ["贺卡", "卡片", "祝福", "节日", "邀请", "问候"], keywords_en: ["card", "greeting card", "invite", "invitation", "holiday"]),
        SingleSymbols(name: "magazine",                  version: .SF3, keywords: ["杂志", "期刊", "阅读", "资讯", "出版", "内容", "专栏"], keywords_en: ["magazine", "journal", "publication", "periodical", "read", "content"]),
        SingleSymbols(name: "newspaper",                 version: .SF2, keywords: ["报纸", "报刊", "新闻", "资讯", "媒体", "阅读", "报道", "头条"], keywords_en: ["newspaper", "news", "media", "press", "report", "headline"]),
        SingleSymbols(name: "bookmark",                  version: .SF1, keywords: ["书签", "收藏", "标记", "保存", "标注"], keywords_en: ["bookmark", "favorite", "save", "mark"]),
        
        // ========== 教育与学习 ==========
        SingleSymbols(name: "graduationcap",             version: .SF2, keywords: ["毕业帽", "学士帽", "毕业", "学校", "教育", "学术", "大学", "学生", "学习"], keywords_en: ["graduation cap", "graduation", "school", "education", "academic", "university", "student", "learning"]),
        SingleSymbols(name: "ruler",                     version: .SF2, keywords: ["尺子", "标尺", "测量", "长度", "刻度", "尺寸", "设计", "绘图"], keywords_en: ["ruler", "measure", "measurement", "length", "scale", "size", "design", "drawing"]),
        SingleSymbols(name: "backpack",                  version: .SF4, keywords: ["背包", "书包", "学生", "上学", "校园", "旅行", "携带", "出行"], keywords_en: ["backpack", "school bag", "bag", "student", "school", "campus", "travel", "carry"]),
        SingleSymbols(name: "studentdesk",               version: .SF1, keywords: ["课桌", "学生桌", "书桌", "桌子", "学习", "上课", "课堂", "教室", "座位"], keywords_en: ["student desk", "desk", "school desk", "study", "classroom", "school", "learning", "seat"]),
        
        // ========== 文件/连接工具 ==========
        SingleSymbols(name: "paperclip",                 version: .SF1, keywords: ["曲别针", "回形针", "附件", "绑定"], keywords_en: ["paperclip", "attachment", "bind", "clip"]),
        SingleSymbols(name: "link",                      version: .SF1, keywords: ["链接", "超链接", "网址", "连接", "跳转", "网页链接"], keywords_en: ["link", "url", "hyperlink", "connect", "web", "website"]),
        
        // ========== 开发/终端 ==========
        SingleSymbols(name: "apple.terminal",            version: .SF5, keywords: ["终端", "命令行", "控制台", "开发", "代码", "脚本", "命令"], keywords_en: ["terminal", "shell", "cli", "command line", "console", "developer", "code", "bash", "script"]),
        
        // ========== 人物与社交 ==========
        SingleSymbols(name: "person",                    version: .SF1, keywords: ["人", "个人", "用户", "账户", "联系人", "个人资料", "头像", "成员"], keywords_en: ["person", "user", "account", "contact", "profile", "avatar", "member"]),
        SingleSymbols(name: "person.2",                  version: .SF1, keywords: ["两人", "双人", "好友", "联系人", "用户", "成员", "分享", "配对", "关系"], keywords_en: ["two people", "pair", "friends", "contacts", "users", "members", "share", "relationship"]),
        SingleSymbols(name: "person.3",                  version: .SF1, keywords: ["三人", "多人", "团队", "群组", "小组", "协作", "社区", "成员", "群聊"], keywords_en: ["three people", "group", "team", "users", "members", "collaboration", "community", "group chat"]),
        
        // ========== 身份与证件 ==========
        SingleSymbols(name: "lanyardcard",               version: .SF3, keywords: ["工牌", "胸牌", "挂绳卡", "证件", "身份", "员工证", "通行证", "凭证"], keywords_en: ["id card", "badge", "lanyard", "employee badge", "credential", "pass"]),
        SingleSymbols(name: "person.crop.circle",        version: .SF1, keywords: ["头像", "用户头像", "个人头像", "个人资料", "账户", "用户", "联系人", "圆形"], keywords_en: ["avatar", "profile", "profile picture", "user", "account", "contact", "circle"]),
        SingleSymbols(name: "person.crop.rectangle",     version: .SF1, keywords: ["照片", "用户图片", "头像卡片", "资料图片", "个人照片"], keywords_en: ["profile image", "profile photo", "portrait", "id photo", "user image", "photo"]),
        SingleSymbols(name: "person.text.rectangle",     version: .SF3, keywords: ["身份证", "证件", "身份信息", "个人信息", "资料卡", "名片", "驾照", "凭证"], keywords_en: ["id card", "identity", "credential", "profile card", "personal info", "license", "card"]),
        
        // ========== 图片与展示 ==========
        SingleSymbols(name: "photo.artframe",            version: .SF3, keywords: ["相框", "照片", "图片", "画框", "艺术"], keywords_en: ["photo frame", "photo", "frame", "image", "gallery", "art"]),
        SingleSymbols(name: "person.crop.artframe",      version: .SF3, keywords: ["头像框", "相框", "个人相框", "照片框"], keywords_en: ["avatar frame", "photo frame", "personal photo frames", "image"]),
        
        // ========== 图案 / 纹理 ==========
        SingleSymbols(name: "rectangle.pattern.checkered", version: .SF6, keywords: ["游戏", "棋盘", "棋格", "格子", "方格", "纹理", "图案"], keywords_en: ["game", "checkered", "checkerboard", "grid", "pattern", "texture", "tile"]),
        
        // ========== 人物基础 ==========
        SingleSymbols(name: "figure",                    version: .SF5, keywords: ["人", "人体", "行人", "用户"], keywords_en: ["person", "human", "figure", "body", "pedestrian"]),
        SingleSymbols(name: "figure.stand",              version: .SF2, keywords: ["男", "男性", "站立", "站姿", "人", "人体", "个人"], keywords_en: ["man", "human", "male", "standing", "stand", "person", "figure", "human", "body"]),
        SingleSymbols(name: "figure.stand.dress",        version: .SF6, keywords: ["女", "女性", "裙子", "女装", "站立", "站姿"], keywords_en: ["woman", "human", "female", "skirt", "dress", "standing", "standing posture", "figure", "person"]),
        
        // ========== 社交/互动 ==========
        SingleSymbols(name: "figure.wave",               version: .SF2, keywords: ["人", "挥手", "打招呼", "问候", "欢迎", "你好", "再见"], keywords_en: ["person", "human", "figure", "waving", "greet", "greeting", "welcome", "hello", "goodbye"]),
        SingleSymbols(name: "figure.arms.open",          version: .SF4, keywords: ["人"], keywords_en: ["person", "human"]),
        SingleSymbols(name: "figure.2.arms.open",        version: .SF4, keywords: ["人", "双人", "两人", "牵手", "关系", "情侣"], keywords_en: ["person", "human", "two people", "holding hands", "relationship", "couple"]),
        SingleSymbols(name: "figure.2.and.child.holdinghands", version: .SF4, keywords: ["人", "三人", "亲子", "家庭", "牵手", "家人"], keywords_en: ["person", "human", "three people", "parent-child", "family", "holding hands"]),
        
        // ========== 行为动作 ==========
        SingleSymbols(name: "figure.walk",               version: .SF2, keywords: ["人", "走路", "行走", "步行", "散步", "行人"], keywords_en: ["person", "human", "walk", "walking", "strolling", "pedestrian", "go"]),
        SingleSymbols(name: "figure.run",                version: .SF4, keywords: ["人", "运动", "慢跑", "冲刺", "跑步", "奔跑", "健身"], keywords_en: ["person", "human", "run", "running", "jog", "sprint", "fitness", "exercise", "sport"]),
        SingleSymbols(name: "figure.hiking",             version: .SF4, keywords: ["人", "徒步", "登山", "爬山", "远足", "户外"], keywords_en: ["person", "human", "hike", "hiking", "trekking", "mountain", "outdoor"]),
        SingleSymbols(name: "figure.outdoor.cycle",      version: .SF4, keywords: ["人", "运动", "健身", "骑行", "自行车", "户外", "骑车"], keywords_en: ["person", "human", "bike", "bicycle", "cycling", "ride", "outdoor cycling"]),
        SingleSymbols(name: "figure.pool.swim",          version: .SF4, keywords: ["人", "游泳", "运动", "健身"], keywords_en: ["person", "human", "swimming", "sports", "fitness"]),
        SingleSymbols(name: "figure.mind.and.body",      version: .SF4, keywords: ["人", "冥想", "瑜伽", "放松", "正念", "静坐"], keywords_en: ["person", "human", "meditation", "yoga", "relax", "mindfulness", "sitting meditation"]),
        SingleSymbols(name: "figure.mixed.cardio",       version: .SF4, keywords: ["人", "训练", "有氧运动", "健身", "锻炼", "运动", "体能训练"], keywords_en: ["person", "human", "mixed cardio", "cardio", "training", "fitness", "exercise", "workout"]),
        SingleSymbols(name: "figure.highintensity.intervaltraining", version: .SF4, keywords: ["人", "健身", "训练", "锻炼", "运动", "高强度间歇训练"], keywords_en: ["person", "human", "high intensity interval training", "hiit",  "fitness", "training", "workout", "exercise"]),
        
        // ========== 安全/风险 ==========
        SingleSymbols(name: "figure.fall",               version: .SF4, keywords: ["人", "跌倒", "滑倒", "摔倒"], keywords_en: ["person", "human", "fall", "falling", "slip down", "tumble"]),
        SingleSymbols(name: "figure.walk.diamond",       version: .SF2, keywords: ["人", "行人", "步行", "交通", "路标", "人行横道", "注意"], keywords_en: ["person", "human", "pedestrian", "walk", "walking", "crossing", "crosswalk", "traffic", "road sign", "caution"]),
        SingleSymbols(name: "figure.seated.seatbelt",    version: .SF4, keywords: ["人", "安全带", "乘车", "乘客", "坐姿", "安全", "汽车"], keywords_en: ["person", "human", "seatbelt", "riding", "passenger", "sitting posture", "safety", "car"]),
        
        // ========== 特殊人群 ==========
        SingleSymbols(name: "accessibility",             version: .SF5, keywords: ["人", "无障碍", "辅助功能", "残障", "包容"], keywords_en: ["person", "human", "accessibility", "accessible", "disabled", "inclusive"]),
        SingleSymbols(name: "figure.roll",               version: .SF3, keywords: ["人", "轮椅", "无障碍", "残障", "滚动"], keywords_en: ["person", "human", "wheelchair", "accessibility", "disability", "rolling"]),
        
        // ========== 性别/标识 ==========
        SingleSymbols(name: "figure.stand.dress.line.vertical.figure", version: .SF6, keywords: ["人", "厕所", "卫生间", "洗手间", "公共厕所", "男女", "标识"], keywords_en: ["person", "human", "restroom", "bathroom", "toilet", "public restroom", "men and women", "gender sign", "restroom sign"]),
        
        //--------
        // ========== 运动与健身 ==========
        SingleSymbols(name: "dumbbell",                  version: .SF4, keywords: ["哑铃", "健身", "力量训练", "举重", "训练", "锻炼"], keywords_en: ["dumbbell", "fitness", "workout", "strength", "training"]),
        SingleSymbols(name: "sportscourt",               version: .SF1, keywords: ["运动", "运动场", "球场", "体育场", "比赛场地", "体育", "游戏", "比赛", "场地"], keywords_en: ["sports court", "court", "stadium", "sport", "game"]),
        
        // ========== 球类运动 ==========
        SingleSymbols(name: "soccerball",                version: .SF4, keywords: ["球", "球类", "体育", "运动", "足球","比赛", "世界杯"], keywords_en: ["soccer", "football", "ball", "world cup", "match"]),
        SingleSymbols(name: "baseball",                  version: .SF4, keywords: ["球", "球类", "体育", "运动", "棒球", "比赛"], keywords_en: ["baseball", "ball", "sport", "game"]),
        SingleSymbols(name: "basketball",                version: .SF4, keywords: ["球", "球类", "体育", "运动", "篮球", "NBA", "比赛"], keywords_en: ["basketball", "nba", "sport", "game", "ball"]),
        SingleSymbols(name: "american.football",         version: .SF6, keywords: ["球", "球类", "体育", "运动", "橄榄球", "美式足球"], keywords_en: ["NFL",  "american football", "nfl", "football", "sport", "game"]),
        SingleSymbols(name: "volleyball",                version: .SF4, keywords: ["球", "球类", "体育", "排球", "运动", "比赛"], keywords_en: ["volleyball", "sport", "game", "ball"]),
        SingleSymbols(name: "tennis.racket",             version: .SF4, keywords: ["球", "体育", "网球拍", "网球", "球拍", "运动", "比赛"], keywords_en: ["tennis", "racket", "sport", "game"]),
        SingleSymbols(name: "tennisball",                version: .SF4, keywords: ["球", "球类", "体育", "网球", "运动", "比赛"], keywords_en: ["tennis", "ball", "sport", "game"]),
        SingleSymbols(name: "hockey.puck",               version: .SF4, keywords: ["球", "球类", "体育", "冰球", "冰上运动", "比赛", "运动"], keywords_en: ["hockey", "ice hockey", "puck", "sport", "game"]),
        
        // ========== 极限/户外运动 ==========
        SingleSymbols(name: "skateboard",                version: .SF5, keywords: ["运动", "滑板", "极限运动", "户外", "街头", "娱乐"], keywords_en: ["skateboard", "extreme sport", "urban", "sport"]),
        SingleSymbols(name: "snowboard",                 version: .SF5, keywords: ["运动", "单板滑雪", "滑雪", "冬季运动", "雪地"], keywords_en: ["snowboard", "ski", "winter sport", "snow"]),
        SingleSymbols(name: "surfboard",                 version: .SF5, keywords: ["运动", "冲浪板", "冲浪", "海浪", "水上运动"], keywords_en: ["surfboard", "surfing", "wave", "water sport"]),
        
        // ========== 健身与装备 ==========
        SingleSymbols(name: "duffle.bag",                version: .SF6, keywords: ["包", "旅行包", "健身包", "运动包", "行李"], keywords_en: ["duffle bag", "gym bag", "travel bag", "luggage"]),
        
        // ========== 奖励与成就 ==========
        SingleSymbols(name: "rosette",                   version: .SF1, keywords: ["荣誉", "奖章", "徽章", "认证", "装饰"], keywords_en: ["award", "badge", "achievement", "recognition", "medal"]),
        SingleSymbols(name: "trophy",                    version: .SF4, keywords: ["奖杯", "获奖", "冠军", "荣誉", "获胜", "比赛"], keywords_en: ["trophy", "champion", "winner", "award", "competition"]),
        SingleSymbols(name: "medal",                     version: .SF4, keywords: ["奖牌", "获奖", "勋章", "荣誉", "成就", "比赛"], keywords_en: ["medal", "award", "achievement", "honor", "competition"]),
        
        // ========== 键盘修饰键 ==========
        SingleSymbols(name: "command",                   version: .SF1, keywords: ["按键", "键盘", "快捷键"], keywords_en: ["macOS", "Command", "Cmd",  "command", "shortcut", "key", "modifier"]),
        SingleSymbols(name: "option",                    version: .SF1, keywords: ["按键", "键盘", "快捷键"], keywords_en: ["macOS", "Option", "Alt", "option", "alt", "shortcut", "key", "modifier"]),
        SingleSymbols(name: "alt",                       version: .SF1, keywords: ["按键", "键盘", "快捷键"], keywords_en: ["macOS", "Alt", "Option", "alt", "option", "shortcut", "key", "modifier"]),
        SingleSymbols(name: "control",                   version: .SF1, keywords: ["按键", "键盘", "快捷键"], keywords_en: ["macOS", "Control", "Ctrl", "control", "ctrl", "shortcut", "key", "modifier"]),
        SingleSymbols(name: "shift",                     version: .SF1, keywords: ["按键", "键盘", "快捷键",  "上档键", "大写"], keywords_en: ["macOS", "shift", "uppercase", "shortcut", "key", "modifier"]),
        SingleSymbols(name: "capslock",                  version: .SF1, keywords: ["按键", "键盘", "快捷键", "大写"], keywords_en: ["macOS",  "Caps Lock", "shortcut", "key", "modifier"]),
        SingleSymbols(name: "fn",                        version: .SF2, keywords: ["按键", "键盘", "快捷键", "功能键"], keywords_en: ["macOS", "function", "fn", "shortcut", "key", "modifier"]),
        SingleSymbols(name: "space",                     version: .SF4, keywords: ["按键", "键盘", "快捷键", "空格"], keywords_en: ["macOS", "space", "keyboard", "shortcut", "key", "modifier"]),
        
        // ========== 电源与系统状态 ==========
        SingleSymbols(name: "power",                     version: .SF1, keywords: ["按键", "电源", "电源键", "开关", "开机", "关机"], keywords_en: ["power", "on/off", "shutdown", "boot"]),
        SingleSymbols(name: "poweron",                   version: .SF2, keywords: ["按键", "开机", "电源", "开启", "直线", "线段", "竖线"], keywords_en: ["power on", "start", "boot", "on"]),
        SingleSymbols(name: "powersleep",                version: .SF2, keywords: ["睡眠", "休眠", "待机", "省电", "月亮"], keywords_en: ["sleep", "standby", "hibernate", "power save"]),
        SingleSymbols(name: "restart",                   version: .SF2, keywords: ["重启", "重新启动", "刷新", "重置"], keywords_en: ["restart", "reload", "reset", "reboot"]),
        SingleSymbols(name: "alternatingcurrent",        version: .SF3, keywords: ["交流电", "电源", "电力", "波浪"], keywords_en: ["AC", "ac", "power", "electricity", "current"]),
        
        // ========== 编辑/删除 ==========
        SingleSymbols(name: "clear",                     version: .SF1, keywords: ["清除", "清空", "删除", "重置", "取消"], keywords_en: ["clear", "delete", "reset", "remove"]),
        SingleSymbols(name: "delete.left",               version: .SF1, keywords: ["退格", "删除", "左", "清除"], keywords_en: ["backspace", "delete", "erase"]),
        SingleSymbols(name: "delete.right",              version: .SF1, keywords: ["删除", "右", "清除"], keywords_en: ["delete", "erase", "remove"]),
        
        // ========== 输入设备 ==========
        SingleSymbols(name: "keyboard",                  version: .SF1, keywords: ["键盘", "输入", "打字", "输入设备"], keywords_en: ["keyboard", "typing", "input"]),
        SingleSymbols(name: "cursorarrow",               version: .SF2, keywords: ["光标", "指针", "鼠标", "箭头"], keywords_en: ["cursor", "pointer", "mouse", "arrow"]),
        
        // ========== 系统UI ==========
        SingleSymbols(name: "progress.indicator",        version: .SF6, keywords: ["加载", "进度", "等待", "转圈"], keywords_en: ["loading","progress", "spinner", "wait", "buffering"]),
        SingleSymbols(name: "mount",                     version: .SF2, keywords: ["挂载", "磁盘", "加载", "连接", "移动", "滚动"], keywords_en: ["mount", "disk", "drive", "attach"]),
        SingleSymbols(name: "beziercurve",               version: .SF6, keywords: ["贝塞尔", "贝塞尔曲线", "曲线", "路径", "设计", "绘图"], keywords_en: ["bezier", "curve", "path", "design"]),
        
        // ========== 天气与气象 ==========
        SingleSymbols(name: "globe",                     version: .SF1, keywords: ["地球", "全球", "世界", "国际化", "互联网"], keywords_en: ["globe", "world", "global", "internet", "earth"]),
        SingleSymbols(name: "sun.max",                   version: .SF1, keywords: ["太阳", "晴天", "白天", "阳光", "亮度"], keywords_en: ["sun", "sunny", "day", "light", "brightness"]),
        SingleSymbols(name: "sun.horizon",               version: .SF5, keywords: ["日出", "日落", "地平线", "黄昏", "清晨"], keywords_en: ["sunrise", "sunset", "horizon", "dawn", "dusk"]),
        SingleSymbols(name: "moon",                      version: .SF1, keywords: ["月亮", "夜晚", "夜间", "勿扰", "黑夜", "深色模式"], keywords_en: ["moon", "night", "dark mode", "evening"]),
        SingleSymbols(name: "zzz",                       version: .SF1, keywords: ["睡眠", "休息", "打盹", "勿扰", "安静"], keywords_en: ["sleep", "rest", "do not disturb", "nap"]),
        
        // ========== 天气系统 ==========
        SingleSymbols(name: "cloud",                     version: .SF1, keywords: ["天气", "云", "多云", "云层", "阴天"], keywords_en: ["cloud", "weather", "overcast", "sky"]),
        SingleSymbols(name: "cloud.drizzle",             version: .SF1, keywords: ["天气", "雨", "小雨", "毛毛雨", "降水", "天气"], keywords_en: ["drizzle", "light rain", "rain", "weather"]),
        SingleSymbols(name: "cloud.sun",                 version: .SF1, keywords: ["天气", "云", "太阳", "多云"], keywords_en: ["partly cloudy", "cloud", "sun", "weather"]),
        SingleSymbols(name: "wind",                      version: .SF1, keywords: ["天气", "风", "大风", "气流", "空气", "吹风"], keywords_en: ["wind", "breeze", "airflow", "gust", "weather"]),
        SingleSymbols(name: "snowflake",                 version: .SF3, keywords: ["雪", "雪花", "下雪", "冬天", "冰雪", "冰冻" ,"低温"], keywords_en: ["snow", "snowflake", "winter", "cold", "ice"]),
        SingleSymbols(name: "tornado",                   version: .SF1, keywords: ["天气", "龙卷风", "旋风", "风暴"], keywords_en: ["tornado", "storm", "wind", "disaster"]),
    SingleSymbols(name: "tropicalstorm",             version: .SF1, keywords: ["天气", "台风", "飓风", "热带风暴", "风暴"], keywords_en: ["hurricane", "typhoon", "storm", "weather"]),
        
        // ========== 气候与测量 ==========
        SingleSymbols(name: "thermometer.variable",      version: .SF6, keywords: ["温度计", "温度", "气温", "冷热", "测量"], keywords_en: ["temperature", "thermometer", "heat", "cold"]),
        SingleSymbols(name: "degreesign.fahrenheit",     version: .SF6, keywords: ["华氏度", "温度", "气温", "美国单位"], keywords_en: ["°F", "fahrenheit", "temperature"]),
        SingleSymbols(name: "degreesign.celsius",        version: .SF6, keywords: ["摄氏度", "温度", "气温"], keywords_en: ["°C", "celsius", "temperature"]),
        SingleSymbols(name: "humidity",                  version: .SF3, keywords: ["天气", "湿度", "空气湿度", "潮湿", "水分"], keywords_en: ["humidity", "moisture", "weather"]),
        
        // ========== 水与自然元素 ==========
        SingleSymbols(name: "water.waves",               version: .SF4, keywords: ["水波", "波浪", "海洋", "河流", "水流", "湖泊"], keywords_en: ["water", "waves", "ocean", "sea"]),
        SingleSymbols(name: "drop",                      version: .SF2, keywords: ["水", "水滴", "雨", "雨水", "雨滴", "液体"], keywords_en: ["drop", "water", "rain", "liquid"]),
        SingleSymbols(name: "rainbow",                   version: .SF5, keywords: ["天气", "彩虹", "颜色"], keywords_en: ["rainbow", "rain", "sunlight", "color"]),
        
        // ========== 能源与状态 ==========
        SingleSymbols(name: "flame",                     version: .SF1, keywords: ["火", "火焰", "火苗", "燃烧", "热门"], keywords_en: ["fire", "flame", "hot", "burn"]),
        SingleSymbols(name: "sparkle",                   version: .SF2, keywords: ["闪光", "星星"], keywords_en: ["flash", "stars","sparkle", "shine"]),
        
        // ========== 安全 ==========
        SingleSymbols(name: "fire.extinguisher",         version: .SF6, keywords: ["灭火器", "消防", "安全", "紧急", "灭火"], keywords_en: ["fire extinguisher", "fire safety", "emergency"]),
        SingleSymbols(name: "umbrella",                  version: .SF1, keywords: ["雨伞", "下雨", "防雨", "遮阳", "保护"], keywords_en: ["umbrella", "rain", "weather", "protection"]),
        
        // ========== 抽象/全球 ==========
        SingleSymbols(name: "peacesign",                 version: .SF3, keywords: ["和平", "反战", "和平标志", "符号"], keywords_en: ["peace", "anti war", "symbol", "global"]),
        
        
        // ========== 媒体播放控制 ==========
        SingleSymbols(name: "play",                      version: .SF1, keywords: ["播放", "开始", "启动", "运行"], keywords_en: ["play", "start", "playback", "media"]),
        SingleSymbols(name: "pause",                     version: .SF1, keywords: ["暂停", "停顿", "等待", "中断"], keywords_en: ["pause", "stop temporarily", "hold"]),
        SingleSymbols(name: "stop",                      version: .SF1, keywords: ["停止", "结束", "中止", "终止"], keywords_en: ["stop", "end", "halt"]),
        SingleSymbols(name: "playpause",                 version: .SF1, keywords: ["播放暂停", "切换", "媒体控制"], keywords_en: ["play pause", "toggle", "media control"]),
        
        // ========== 进度控制 ==========
        SingleSymbols(name: "backward",                  version: .SF1, keywords: ["后退", "回退", "倒退", "快退"], keywords_en: ["backward", "rewind", "previous", "back"]),
        SingleSymbols(name: "forward",                   version: .SF1, keywords: ["前进", "快进", "跳过"], keywords_en: ["forward", "next", "skip", "fast forward"]),
        
        // ========== 播放模式 ==========
        SingleSymbols(name: "shuffle",                   version: .SF1, keywords: ["随机", "随机播放", "乱序", "打乱", "洗牌"], keywords_en: ["shuffle", "random", "mix", "order"]),
        SingleSymbols(name: "repeat",                    version: .SF1, keywords: ["循环", "重复", "单曲循环", "全部循环"], keywords_en: ["repeat", "loop", "repeat all", "repeat one"]),
        SingleSymbols(name: "infinity",                  version: .SF2, keywords: ["无限", "循环", "永久"], keywords_en: ["∞",  "infinity", "endless", "loop", "forever"]),
        
        // ========== 录制 ==========
        SingleSymbols(name: "stop.circle",             version: .SF1, keywords: ["停止", "结束", "中止", "终止", "暂停操作", "停止播放", "停止录制", "圆形"], keywords_en: ["stop", "end", "halt", "terminate", "stop playback", "stop recording", "circle"]),
        SingleSymbols(name: "record.circle",             version: .SF2, keywords: ["录制", "录音", "录屏", "录像"], keywords_en: ["REC", "record", "recording", "capture", "video", "audio"]),
        
        // ========== 音频系统 ==========
        SingleSymbols(name: "speaker",                   version: .SF1, keywords: ["声音", "音量", "扬声器", "喇叭"], keywords_en: ["speaker", "audio", "volume", "sound"]),
        SingleSymbols(name: "speaker.wave.3",            version: .SF2, keywords: ["声音", "音量", "扬声器", "喇叭"], keywords_en: ["loud", "max volume", "speaker", "audio"]),
        SingleSymbols(name: "music.note",                version: .SF1, keywords: ["音乐", "音符", "歌曲", "旋律"], keywords_en: ["music", "song", "audio", "track", "sound"]),
        SingleSymbols(name: "music.quarternote.3",       version: .SF2, keywords: ["音符", "节奏", "节拍", "乐谱", "音乐"], keywords_en: ["music", "beat", "rhythm", "note"]),
        SingleSymbols(name: "music.microphone",          version: .SF6, keywords: ["麦克风", "录音", "歌唱", "演唱", "卡拉OK"], keywords_en: ["microphone", "mic", "record", "sing", "audio"]),
        SingleSymbols(name: "megaphone",                 version: .SF2, keywords: ["喇叭", "广播", "公告", "通知", "宣传"], keywords_en: ["megaphone", "announcement", "broadcast", "notify"]),
        
        // ========== 紧急 ==========
        SingleSymbols(name: "SOS",                       version: .SF4, keywords: ["紧急", "求救", "帮助", "安全"], keywords_en: ["sos", "emergency", "help", "alert", "rescue"]),
        
        // ========== 媒体附属 ==========
        SingleSymbols(name: "memories",                  version: .SF1, keywords: ["回忆", "记忆", "重播"], keywords_en: ["memory", "recollection", "replay"]),
        
        // ========== 旋转与状态变换 ==========
        SingleSymbols(name: "arrow.trianglehead.clockwise",         version: .SF6, keywords: ["顺时针", "旋转", "刷新", "循环", "更新","重播"], keywords_en: ["clockwise", "rotate", "refresh", "redo", "sync", "replay"]),
        SingleSymbols(name: "arrow.trianglehead.counterclockwise",  version: .SF6, keywords: [ "逆时针", "旋转", "撤销", "回退", "反转"], keywords_en: ["counterclockwise", "undo", "back", "rotate", "reverse"]),
        SingleSymbols(name: "arrow.trianglehead.2.clockwise.rotate.90", version: .SF6, keywords: ["双向", "旋转", "刷新", "更新", "同步", "循环"], keywords_en: ["sync", "rotate", "refresh", "bidirectional", "loop"]),
        
        // ========== 搜索与检索系统 ==========
        SingleSymbols(name: "magnifyingglass",           version: .SF1, keywords: ["放大镜", "搜索", "查找", "查询", "检索"], keywords_en: ["search", "find", "query", "lookup", "explore"]),
        SingleSymbols(name: "plus.magnifyingglass",      version: .SF1, keywords: ["放大镜", "放大", "缩放"], keywords_en: ["zoom in", "magnify", "plus", "scaling"]),
        SingleSymbols(name: "minus.magnifyingglass",     version: .SF1, keywords: ["放大镜", "缩小", "缩放"], keywords_en: ["zoom out", "minus", "shrink", "scaling"]),
        SingleSymbols(name: "loupe",                     version: .SF2, keywords: ["放大镜", "搜索", "查找", "查询", "细节", "查看", "检查", "聚焦"], keywords_en: ["loupe", "zoom", "inspect", "detail", "focus"]),
        
        // ========== 输入系统 ==========
        SingleSymbols(name: "microphone",                version: .SF6, keywords: ["麦克风", "语音", "录音", "输入", "话筒", "讲话", "说话"], keywords_en: ["microphone", "mic", "voice", "audio input", "record"]),
        SingleSymbols(name: "microphone.slash",          version: .SF6, keywords: ["麦克风", "禁用", "关闭", "静音", "语音", "录音", "无声"], keywords_en: ["mute", "microphone off", "no sound", "disabled mic"]),
        
        // ========== 开发语言 ==========
        SingleSymbols(name: "swift",                     version: .SF2, keywords: [ "编程", "开发", "苹果"], keywords_en: ["iOS", "Swift", "swift lang", "programming", "developer", "apple"]),
        
        // ========== 基础线条 ==========
        SingleSymbols(name: "line.diagonal",             version: .SF2, keywords: ["线", "线条", "斜线", "对角线", "切线"], keywords_en: ["line", "diagonal", "stroke"]),
        SingleSymbols(name: "line.diagonal.arrow",       version: .SF2, keywords: ["线", "线条", "斜线", "箭头", "对角线"], keywords_en: ["diagonal", "arrow", "direction","navigate"]),
        
        // ========== 基础形状 ==========
        SingleSymbols(name: "righttriangle",             version: .SF5, keywords: ["形状", "几何", "直角三角形", "三角形"], keywords_en: ["triangle", "right triangle", "shape", "geometry"]),
        SingleSymbols(name: "circle",                    version: .SF1, keywords: ["形状", "几何", "圆", "圆形", "圆圈"], keywords_en: ["circle", "shape"]),
        SingleSymbols(name: "circle.dashed",             version: .SF2, keywords: ["形状", "几何", "圆", "虚线"], keywords_en: ["dashed", "circle", "shape"]),
        SingleSymbols(name: "circlebadge",               version: .SF2, keywords: ["形状", "几何", "圆", "圆形", "圆圈", "标记", "圆点"], keywords_en: ["circle", "shape", "dot"]),
        
        // ========== 网格系统 ==========
        SingleSymbols(name: "circle.grid.2x2",           version: .SF1, keywords: ["点阵", "布局", "网格"], keywords_en: ["grid", "2x2", "layout", "matrix"]),
        SingleSymbols(name: "circle.grid.3x3",           version: .SF1, keywords: ["九宫格", "布局", "网格", "点阵"], keywords_en: ["grid", "3x3", "layout", "matrix"]),
        
        // ========== 方形系统 ==========
        SingleSymbols(name: "square",                    version: .SF1, keywords: ["形状", "几何", "正方形", "矩形", "方块"], keywords_en: ["square", "shape", "box"]),
        SingleSymbols(name: "square.dashed",             version: .SF2, keywords: ["形状", "几何", "正方形", "矩形", "虚线"], keywords_en: ["square", "dashed", "shape"]),
        SingleSymbols(name: "squareshape",               version: .SF2, keywords: ["形状", "几何", "正方形", "矩形"], keywords_en: ["rectangle", "square", "shape"]),
        
        // ========== 布局与分割 ==========
        SingleSymbols(name: "square.split.2x2",          version: .SF1, keywords: ["形状", "几何", "正方形", "矩形", "四", "网格", "布局", "分区", "分割"], keywords_en: ["split", "grid", "layout", "partition"]),
        
        // ========== 叠加与复制 ==========
        SingleSymbols(name: "square.on.square",          version: .SF1, keywords: ["复制", "拷贝", "副本", "叠加", "重叠"], keywords_en: ["copy", "duplicate", "overlay", "stack", "copy"]),
        SingleSymbols(name: "square.on.circle",          version: .SF1, keywords: ["形状", "几何", "正方形", "矩形", "圆", "叠加"], keywords_en: ["overlay", "combine", "shape mix"]),
        SingleSymbols(name: "square.stack",              version: .SF1, keywords: ["堆叠", "图层", "叠加", "多层"], keywords_en: ["stack", "layers", "overlay", "multiple"]),
        
        // ========== App容器 ==========
        SingleSymbols(name: "app",                       version: .SF1, keywords: ["应用", "图标", "程序"], keywords_en: ["app", "application", "icon", "software"]),
        SingleSymbols(name: "plus.app",                  version: .SF1, keywords: ["添加", "安装", "创建","新增"], keywords_en: ["add", "install", "create"]),
        SingleSymbols(name: "arrow.down.app",            version: .SF2, keywords: ["下载", "安装", "获取"], keywords_en: ["download", "install", "get"]),
        SingleSymbols(name: "questionmark.app",          version: .SF3, keywords: ["问号", "问题", "未知", "帮助"], keywords_en: ["unknown", "missing", "help", "question"]),
        SingleSymbols(name: "app.badge",                 version: .SF1, keywords: ["提示", "角标", "通知", "未读", "红点", "消息"], keywords_en: ["badge", "notification", "unread", "indicator"]),
        
        // ========== 容器与布局 ==========
        SingleSymbols(name: "rectangle",                 version: .SF1, keywords: ["形状", "几何", "矩形"], keywords_en: ["rectangle", "shape"]),
        SingleSymbols(name: "rectangle.split.3x3",       version: .SF1, keywords: ["九宫格", "网格", "表格", "布局", "分割"], keywords_en: ["grid", "3x3", "layout", "matrix"]),
        SingleSymbols(name: "rectangle.on.rectangle",    version: .SF1, keywords: ["形状", "几何", "矩形", "复制", "叠加", "图层", "重叠"], keywords_en: ["copy", "duplicate", "overlay", "layers", "shape"]),
        SingleSymbols(name: "rectangle.portrait",        version: .SF2, keywords: ["形状", "几何", "矩形", "竖屏", "纵向"], keywords_en: ["portrait", "vertical", "screen", "shape"]),
        SingleSymbols(name: "rectangle.grid.1x2",        version: .SF1, keywords: ["形状", "几何", "矩形", "分栏", "双栏", "布局"], keywords_en: ["grid", "1x2", "layout", "columns", "shape"]),
        
        // ========== 基础形状 ==========
        SingleSymbols(name: "capsule",                   version: .SF1, keywords: [ "胶囊", "形状", "按钮", "标签"], keywords_en: ["capsule", "shape", "button", "tag"]),
        SingleSymbols(name: "oval",                      version: .SF2, keywords: [ "椭圆", "形状", "圆弧"], keywords_en: ["oval", "ellipse", "shape"]),
        SingleSymbols(name: "triangle",                  version: .SF1, keywords: ["三角形", "形状", "方向"], keywords_en: ["triangle", "shape", "direction"]),
        SingleSymbols(name: "diamond",                   version: .SF2, keywords: ["菱形", "钻石", "几何", "形状", "宝石"], keywords_en: ["rhombus", "diamond", "geometry", "shape"]),
        SingleSymbols(name: "rhombus",                   version: .SF1, keywords: ["菱形", "钻石", "几何", "形状", "宝石"], keywords_en: ["rhombus", "diamond", "geometry", "shape"]),
        
        // ========== 状态与认证 ==========
        SingleSymbols(name: "checkmark.seal",            version: .SF1, keywords: ["认证", "已验证", "通过", "完成", "对勾", "对号", "勾选"], keywords_en: ["verified", "approved", "checkmark", "status", "badge"]),
        SingleSymbols(name: "xmark.seal",                version: .SF1, keywords: ["错误", "拒绝", "未通过", "关闭", "叉号"], keywords_en: ["error", "rejected", "failed", "invalid", "status"]),
        
        // ========== 情感与收藏 ==========
        SingleSymbols(name: "heart",                     version: .SF1, keywords: ["形状", "心", "心形", "喜欢", "收藏", "爱", "关注"], keywords_en: ["heart", "like", "favorite", "love", "shape"]),
        SingleSymbols(name: "star",                      version: .SF1, keywords: ["形状", "星星", "五角星", "星标", "收藏", "评分", "精选"], keywords_en: ["star", "favorite", "rating", "featured", "shape"]),
        
        // ========== 游戏/符号 ==========
        SingleSymbols(name: "suit.club",                 version: .SF1, keywords: ["梅花", "扑克牌", "卡牌", "游戏"], keywords_en: ["club", "card suit", "game"]),
        SingleSymbols(name: "suit.diamond",              version: .SF1, keywords: ["方块", "扑克牌", "卡牌", "游戏"], keywords_en: ["diamond suit", "card", "game"]),
        SingleSymbols(name: "suit.spade",                version: .SF1, keywords: ["黑桃", "扑克牌", "卡牌", "游戏"], keywords_en: ["spade", "card suit", "game"]),
        
        // ========== 安全与防护 ==========
        SingleSymbols(name: "shield",                    version: .SF1, keywords: ["盾牌", "护盾", "防御", "安全", "保护", "隐私", "防护"], keywords_en: ["shield", "security", "protection", "privacy"]),
        SingleSymbols(name: "shield.lefthalf.filled",    version: .SF3, keywords: ["盾牌", "护盾", "防御", "安全", "保护", "隐私", "防护"], keywords_en: ["shield", "security", "protection", "privacy"]),
        SingleSymbols(name: "shield.pattern.checkered",  version: .SF6, keywords: ["盾牌", "护盾", "防御", "安全", "保护", "隐私", "防护"], keywords_en: ["shield", "security", "protection", "privacy"]),
        
        // ========== 标记与信号 ==========
        SingleSymbols(name: "flag",                      version: .SF1, keywords: ["旗帜", "标记", "举报", "里程碑"], keywords_en: ["flag", "mark", "report", "milestone"]),
        SingleSymbols(name: "flag.pattern.checkered",    version: .SF6, keywords: ["旗帜", "终点", "完成", "赛车", "胜利"], keywords_en: ["finish", "race", "checkered flag", "complete"]),
        SingleSymbols(name: "flag.2.crossed",            version: .SF3, keywords: ["信号旗", "通信", "标识"], keywords_en: ["signal", "flags", "communication"]),
        
        // ========== 位置与定位 ==========
        SingleSymbols(name: "location",                  version: .SF1, keywords: ["位置", "定位", "导航", "地理位置"], keywords_en: ["GPS", "location", "position", "gps", "coordinate"]),
        SingleSymbols(name: "location.slash",            version: .SF1, keywords: ["位置", "定位", "导航", "地理位置", "关闭", "禁用"], keywords_en: ["GPS", "location off", "gps off", "disabled", "privacy"]),
        SingleSymbols(name: "location.north",            version: .SF1, keywords: ["北", "导航", "指北", "方向", "指南针"], keywords_en: ["north", "compass", "direction", "navigation"]),
        
        // ========== 地图与标记 ==========
        SingleSymbols(name: "map",                       version: .SF1, keywords: ["地图", "导航", "路线", "地理"], keywords_en: ["map", "navigation", "route", "geography"]),
        SingleSymbols(name: "mappin",                    version: .SF1, keywords: ["地图标记", "标记", "位置点", "地点", "定位"], keywords_en: ["map pin", "location pin", "place", "marker"]),
        SingleSymbols(name: "pin",                       version: .SF1, keywords: ["别针", "图钉", "固定", "标记", "钉住"], keywords_en: ["pin", "attach", "mark", "fix"]),
        
        // ========== 位置与导航 ==========
        SingleSymbols(name: "signpost.left",             version: .SF2, keywords: ["路标", "指路", "方向", "导航"], keywords_en: ["signpost", "direction", "left", "navigation"]),
        SingleSymbols(name: "signpost.right.and.left",   version: .SF4, keywords: ["路标", "交叉口", "双向", "方向"], keywords_en: ["signpost", "intersection", "direction", "navigation"]),
        
        // ========== 环境与场景 ==========
        SingleSymbols(name: "mountain.2",                version: .SF4, keywords: ["山", "山脉", "户外", "风景"], keywords_en: ["mountain", "landscape", "outdoor", "nature"]),
        SingleSymbols(name: "safari",                    version: .SF1, keywords: ["浏览器", "指南针", "探索"], keywords_en: ["browser", "safari", "compass", "explore", "web"]),
        
        // ========== 通知与提醒 ==========
        SingleSymbols(name: "bell",                      version: .SF1, keywords: ["铃铛", "通知", "铃声", "提醒", "消息"], keywords_en: ["bell", "notification", "alert", "reminder"]),
        SingleSymbols(name: "bell.slash",                version: .SF1, keywords: ["铃铛", "通知", "铃声", "提醒", "消息", "禁止", "关闭", "勿扰", "静音"], keywords_en: ["bell", "mute", "notifications off", "alert", "do not disturb"]),
        SingleSymbols(name: "bell.badge",                version: .SF2, keywords: ["铃铛", "通知", "铃声", "提醒", "未读", "角标"], keywords_en: ["bell", "notification badge", "unread", "alert", "indicator"]),
        SingleSymbols(name: "bell.and.waves.left.and.right", version: .SF4, keywords: ["铃铛", "通知", "铃声", "响铃", "振动", "提醒", "闹铃",], keywords_en: ["bell", "ringing", "alert", "alarm", "vibration"]),
        
        // ========== 标签与分类 ==========
        SingleSymbols(name: "tag",                       version: .SF1, keywords: ["标签", "分类", "标记", "价格"], keywords_en: ["tag", "label", "category", "mark"]),
        
        // ========== 能量与速度 ==========
        SingleSymbols(name: "bolt",                      version: .SF1, keywords: ["闪电", "充电", "能量", "电力", "快速"], keywords_en: ["bolt", "energy", "power", "fast", "lightning", "Charge"]),
        SingleSymbols(name: "bolt.horizontal",           version: .SF2, keywords: ["闪电", "充电", "能量", "电力", "快速"], keywords_en: ["bolt", "energy", "power", "fast", "lightning", "Charge"]),
        
        // ========== iCloud 与同步 ==========
        SingleSymbols(name: "icloud",                    version: .SF1, keywords: ["云", "云端", "同步", "存储", "备份"], keywords_en: ["icloud", "cloud", "sync", "storage", "backup"]),
        SingleSymbols(name: "icloud.slash",              version: .SF1, keywords: ["云", "云端", "同步", "断开", "离线"], keywords_en: ["cloud", "icloud","cloud off", "offline", "not synced", "disconnected"]),
        SingleSymbols(name: "checkmark.icloud",          version: .SF2, keywords: ["云", "云端", "同步", "完成", "备份", "成功"], keywords_en: ["cloud", "icloud", "sync complete", "uploaded", "success", "done"]),
        SingleSymbols(name: "xmark.icloud",              version: .SF1, keywords: ["云", "云端", "同步", "失败","错误", "未完成"], keywords_en: ["cloud", "icloud", "sync failed", "error", "failed"]),
        SingleSymbols(name: "icloud.and.arrow.down",     version: .SF1, keywords: ["云", "云端", "下载", "同步", "获取"], keywords_en: ["cloud", "icloud", "download", "fetch", "retrieve"]),
        
        // ========== 数学 ==========
        SingleSymbols(name: "squareroot",                version: .SF6, keywords: ["平方根", "开方", "根号", "数学"], keywords_en: ["square root", "sqrt", "math", "function"]),
        SingleSymbols(name: "x.squareroot",              version: .SF1, keywords: ["平方根", "x的平方根", "开方", "数学"], keywords_en: ["sqrt x", "square root", "math", "expression"]),
        
        // ========== 相机与拍摄 ==========
        SingleSymbols(name: "camera",                    version: .SF1, keywords: ["相机", "拍照", "拍摄", "摄影"], keywords_en: ["camera", "capture", "photo", "shoot"]),
        SingleSymbols(name: "camera.macro",              version: .SF3, keywords: ["微距", "特写", "摄影", "花朵"], keywords_en: ["macro", "close up", "camera", "photo", "flowers"]),
        SingleSymbols(name: "camera.filters",            version: .SF2, keywords: ["滤镜", "效果", "美化", "过滤", "叠加"], keywords_en: ["filter", "effect", "camera", "edit"]),
        SingleSymbols(name: "flashlight.off.fill",       version: .SF1, keywords: ["手电筒", "闪光灯", "照明"], keywords_en: ["flashlight", "flash", "light", "torch"]),
        
        // ========== 取景与扫描 ==========
        SingleSymbols(name: "viewfinder",                version: .SF1, keywords: ["取景器", "对焦", "拍摄", "扫描"], keywords_en: ["viewfinder", "focus", "frame", "scan"]),
        SingleSymbols(name: "viewfinder.rectangular",    version: .SF5, keywords: ["矩形", "取景器", "对焦", "扫描"], keywords_en: ["viewfinder", "frame", "focus", "scan"]),
        SingleSymbols(name: "plus.viewfinder",           version: .SF2, keywords: ["扫码", "扫描", "添加"], keywords_en: ["scan", "qr code", "add", "capture"]),
       
        // ========== 拍摄模式 ==========
        SingleSymbols(name: "pano",                      version: .SF1, keywords: ["全景", "广角"], keywords_en: ["panorama", "wide"]),
        SingleSymbols(name: "field.of.view.ultrawide",   version: .SF5, keywords: ["超广角", "广角镜头"], keywords_en: ["ultrawide", "wide angle", "camera"]),
        
        // ========== 照片与媒体 ==========
        SingleSymbols(name: "photo",                     version: .SF1, keywords: ["照片", "图片", "图像", "相册"], keywords_en: ["photo", "image", "picture", "media"]),
        SingleSymbols(name: "photo.on.rectangle.angled", version: .SF2, keywords: ["照片", "图片", "图像", "图库", "多图", "相册"], keywords_en: ["photo", "image", "picture", "media", "gallery", "multiple", "album"]),
        SingleSymbols(name: "photo.stack",               version: .SF4, keywords: ["照片", "图片", "图像", "堆叠", "多图", "相册"], keywords_en: ["photo", "image", "picture", "media", "gallery", "multiple", "album", "stack"]),
        
        // ========== 图像处理 ==========
        SingleSymbols(name: "mosaic",                    version: .SF2, keywords: ["马赛克", "像素化", "模糊"], keywords_en: ["mosaic", "pixelate", "blur"]),
        
        
        // ========== 消息与通信 ==========
        SingleSymbols(name: "message",                   version: .SF1, keywords: ["消息", "短信", "聊天", "对话"], keywords_en: ["message", "sms", "chat", "conversation", "comment"]),
        SingleSymbols(name: "bubble",                    version: .SF5, keywords: ["消息", "气泡", "对话", "聊天", "评论"], keywords_en: ["message", "sms", "chat", "conversation", "comment", "bubble"]),
        SingleSymbols(name: "text.bubble",               version: .SF1, keywords: ["消息", "气泡", "对话", "聊天", "评论"], keywords_en: ["message", "sms", "chat", "conversation", "comment", "bubble"]),
        SingleSymbols(name: "ellipsis.bubble",           version: .SF2, keywords: ["消息", "气泡", "对话", "聊天", "评论"], keywords_en: ["message", "sms", "chat", "conversation", "comment", "bubble", "typing", "loading"]),
        SingleSymbols(name: "bubble.middle.bottom",      version: .SF1, keywords: ["消息", "气泡", "对话", "聊天", "评论"], keywords_en: ["message", "sms", "chat", "conversation", "comment", "bubble", "typing", "loading"]),
        
        // ========== 引用系统 ==========
        SingleSymbols(name: "quote.opening",             version: .SF3, keywords: ["引用", "引号"], keywords_en: ["quote", "citation", "text"]),
        SingleSymbols(name: "quote.closing",             version: .SF3, keywords: ["引用", "结束", "引号"], keywords_en: ["quote", "citation", "text", "end"]),
        
        // ========== 通话与视频 ==========
        SingleSymbols(name: "phone",                     version: .SF1, keywords: ["电话", "通话", "联系"], keywords_en: ["phone", "call", "contact"]),
        SingleSymbols(name: "phone.down",                version: .SF1, keywords: ["电话", "挂断", "结束", "拒接"], keywords_en: ["hang up", "end call", "decline"]),
        SingleSymbols(name: "video",                     version: .SF1, keywords: ["视频", "视频通话", "摄像头"], keywords_en: ["video", "video call", "camera", "facetime"]),
        
        // ========== 邮件系统 ==========
        SingleSymbols(name: "envelope",                  version: .SF1, keywords: ["邮件", "信件", "信封", "联系"], keywords_en: ["email", "mail", "message"]),
        SingleSymbols(name: "envelope.front",            version: .SF6, keywords: ["邮件", "信件", "信封", "联系", "正面"], keywords_en: ["email", "mail", "message", "front"]),
        SingleSymbols(name: "envelope.open",             version: .SF1, keywords: ["邮件", "信件", "信封", "已读", "打开"], keywords_en: ["email", "mail", "message", "open", "read"]),
        SingleSymbols(name: "mail",                      version: .SF2, keywords: ["邮件", "信件", "信封", "联系"], keywords_en: ["email", "mail", "message"]),
        SingleSymbols(name: "paperplane",                version: .SF1, keywords: ["邮件", "信件", "信封", "联系", "发送", "分享", "投递"], keywords_en: ["email", "mail", "message", "send", "share", "deliver"]),
        
        // ========== 设置系统 ==========
        SingleSymbols(name: "gear",                      version: .SF1, keywords: ["设置", "配置", "系统", "齿轮"], keywords_en: ["settings", "configuration", "system"]),
        SingleSymbols(name: "gearshape",                 version: .SF2, keywords: ["设置", "配置", "系统", "齿轮"], keywords_en: ["settings", "configuration", "system"]),
        SingleSymbols(name: "slider.horizontal.3",       version: .SF1, keywords: ["设置", "配置", "水平", "调节", "参数"], keywords_en: ["settings", "configuration", "slider", "adjust", "controls", "parameter"]),
        SingleSymbols(name: "slider.vertical.3",         version: .SF2, keywords: ["设置", "配置", "垂直", "调节", "参数"], keywords_en: ["settings", "configuration", "slider", "adjust", "controls", "parameter"]),
        SingleSymbols(name: "switch.2",                  version: .SF2, keywords: ["开关", "切换"], keywords_en: ["toggle", "switch", "enable", "disable"]),
        SingleSymbols(name: "ellipsis",                  version: .SF1, keywords: ["更多", "菜单", "选项", "省略", "省略号"], keywords_en: ["more", "menu", "options", "omitted"]),
        SingleSymbols(name: "ellipsis.circle",           version: .SF1, keywords: ["更多", "菜单", "选项", "省略", "省略号", "圆形"], keywords_en: ["more", "menu", "options", "omitted", "circle"]),
        SingleSymbols(name: "nosign",                    version: .SF1, keywords: ["禁止", "禁用", "不允许", "拒绝", "驳回"], keywords_en: ["forbidden", "prohibited", "disabled", "rejected"]),
        
        
        // ========== AI 与系统能力 ==========
        SingleSymbols(name: "apple.intelligence",        version: .SF6, keywords: ["人工智能", "智能"], keywords_en: ["ai", "intelligence"]),
        
        
        // ========== 图形与编辑 ==========
        SingleSymbols(name: "line.3.crossed.swirl.circle", version: .SF2, keywords: ["漩涡", "效果", "滤镜"], keywords_en: ["swirl", "effect", "filter", "processing"]),
        SingleSymbols(name: "lineweight",                version: .SF2, keywords: ["线宽", "粗细"], keywords_en: ["line weight", "stroke", "style"]),
        SingleSymbols(name: "perspective",               version: .SF1, keywords: ["透视", "视角", "变换"], keywords_en: ["perspective", "transform", "viewpoint"]),
        SingleSymbols(name: "grid",                      version: .SF1, keywords: ["网格", "布局", "对齐"], keywords_en: ["#","grid", "layout", "alignment"]),
        
        // ========== 购物容器 ==========
        SingleSymbols(name: "bag",                       version: .SF1, keywords: ["袋子", "手提袋", "购物袋", "商店", "购物"], keywords_en: ["bag", "shopping bag", "store", "retail"]),
        SingleSymbols(name: "cart",                      version: .SF1, keywords: ["购物车", "购物", "商店"], keywords_en: ["cart", "shopping cart", "store", "retail"]),
        SingleSymbols(name: "basket",                    version: .SF4, keywords: ["篮子", "购物", "菜篮", "购物篮"], keywords_en: ["basket", "shopping basket", "food basket", "store"]),
        
        // ========== 支付与交易 ==========
        SingleSymbols(name: "creditcard",                version: .SF1, keywords: [ "信用卡", "支付", "银行卡"], keywords_en: ["card", "credit card", "payment", "pay", "card"]),
        SingleSymbols(name: "wallet.pass",               version: .SF2, keywords: ["钱包", "通行证", "票据"], keywords_en: ["wallet", "pass", "ticket"]),
        SingleSymbols(name: "wallet.bifold",             version: .SF6, keywords: ["钱包", "现金", "卡片"], keywords_en: ["wallet", "money", "cash", "card"]),
        SingleSymbols(name: "banknote",                  version: .SF2, keywords: ["钱", "现金", "钞票", "纸币"], keywords_en: [ "cash", "banknote", "money", "currency"]),
        SingleSymbols(name: "giftcard",                  version: .SF2, keywords: ["礼物", "礼品卡"], keywords_en: ["gifts", "gift cards"]),
        SingleSymbols(name: "purchased",                 version: .SF1, keywords: ["下", "箭头", "购买", "付款"], keywords_en: ["purchased", "paid", "down", "arrow"]),
        
        // ========== 货币符号 ==========
        SingleSymbols(name: "dollarsign",                version: .SF4, keywords: ["钱", "美元", "美国","货币", "价格"], keywords_en: ["$", "dollar", "usd", "united states", "currency", "money", "price"]),
        SingleSymbols(name: "eurosign",                  version: .SF4, keywords: ["钱", "欧元", "欧洲","货币"], keywords_en: ["€", "euro", "eur", "europe", "currency", "money"]),
        SingleSymbols(name: "chineseyuanrenminbisign",   version: .SF5, keywords: ["钱", "人民币", "中国", "货币", "元"], keywords_en: ["￥", "yuan", "rmb", "china","cny", "currency", "money"]),
        
        // ========== 礼物系统 ==========
        
        SingleSymbols(name: "gift",                      version: .SF1, keywords: [ "礼物", "赠送", "节日"], keywords_en: ["gift", "present", "reward", "surprise"]),
        
        // ========== 创作工具 ==========
        SingleSymbols(name: "wand.and.rays",             version: .SF1, keywords: ["魔法", "魔法棒", "自动", "增强"], keywords_en: ["magic","magic wand", "auto", "enhance", "ai", "effect"]),
        SingleSymbols(name: "paintbrush",                version: .SF1, keywords: ["刷子", "绘画", "设计", "涂抹", "艺术"], keywords_en: ["brush", "paint", "design", "smearing", "art"]),
        SingleSymbols(name: "paintbrush.pointed",        version: .SF2, keywords: ["笔", "画笔", "毛笔", "艺术"], keywords_en: ["pen", "brush", "calligraphy brush", "art"]),
        SingleSymbols(name: "paintpalette",              version: .SF2, keywords: ["调色盘", "颜色", "绘画", "艺术", "配色"], keywords_en: ["palette", "color", "design", "art","painting", "color scheme"]),
        SingleSymbols(name: "eyedropper",                version: .SF1, keywords: ["滴管", "取色", "吸管", "颜色", "颜色选择"], keywords_en: ["eyedropper", "dropper", "color picker", "sample", "straw", "color selection"]),
        
        // ========== 音乐工具 ==========
        SingleSymbols(name: "pianokeys",                 version: .SF2, keywords: ["钢琴", "琴键", "音乐", "乐器"], keywords_en: ["piano", "piano keys", "music", "instrument"]),
        SingleSymbols(name: "tuningfork",                version: .SF1, keywords: ["音叉", "调音", "校准", "乐器"], keywords_en: ["tuning fork", "tune", "pitch", "calibration", "instrument"]),
        
        // ========== 工具系统 ==========
        SingleSymbols(name: "level",                     version: .SF2, keywords: ["水平", "对齐", "校准", "工具"], keywords_en: ["level", "align", "balance", "calibration", "tool"]),
        SingleSymbols(name: "wrench.adjustable",         version: .SF4, keywords: ["扳手", "调整", "维修", "工具"], keywords_en: ["wrench", "adjust", "repair", "tool"]),
        SingleSymbols(name: "hammer",                    version: .SF1, keywords: ["锤子", "构建", "开发", "工具", "维修"], keywords_en: ["repair", "hammer", "build", "tool", "construction"]),
        SingleSymbols(name: "screwdriver",               version: .SF3, keywords: ["螺丝刀", "维修", "组装", "工具"], keywords_en: ["screwdriver", "repair", "assemble", "tool"]),
        SingleSymbols(name: "wrench.and.screwdriver",    version: .SF2, keywords: ["工具", "维修", "设置", "修复", "维护"], keywords_en: ["tools", "repair", "settings", "maintenance"]),
        
        // ========== 开发与自动化 ==========
        SingleSymbols(name: "applescript",               version: .SF2, keywords: ["脚本", "自动化", "开发"], keywords_en: ["script", "automation", "code", "applescript"]),
        
        // ========== 医疗系统：诊断 ==========
        SingleSymbols(name: "stethoscope",               version: .SF2, keywords: ["医疗", "医生", "听诊器", "诊断"], keywords_en: ["medical", "doctor", "stethoscope", "diagnosis"]),
        SingleSymbols(name: "medical.thermometer",       version: .SF4, keywords: ["医疗", "医生", "体温计", "发烧", "检测"], keywords_en: ["medical", "doctor", "thermometer", "temperature", "fever", "measure"]),
        
        // ========== 医疗系统：呼吸 ==========
        SingleSymbols(name: "lungs",                     version: .SF2, keywords: ["肺", "呼吸", "器官"], keywords_en: ["lungs", "respiratory", "breathing", "organ"]),
        SingleSymbols(name: "inhaler",                   version: .SF6, keywords: ["医疗", "肺", "呼吸", "吸入器", "哮喘"], keywords_en: ["medical", "lungs", "respiratory", "breathing", "inhaler", "asthma", "treatment"]),
        
        // ========== 医疗系统：治疗 ==========
        SingleSymbols(name: "pill",                      version: .SF4, keywords: ["医疗", "药物", "药丸", "服药"], keywords_en: ["medical", "pill", "medicine", "drug", "treatment"]),
        SingleSymbols(name: "syringe",                   version: .SF4, keywords: ["医疗", "注射器", "疫苗", "针剂"], keywords_en: ["medical", "injection", "vaccine", "treatment"]),
        SingleSymbols(name: "bandage",                   version: .SF1, keywords: ["医疗", "创可贴", "绷带", "伤口", "护理"], keywords_en: ["medical", "band-aid", "bandage", "wound", "care", "healing"]),
        
        // ========== 医疗系统：防护 ==========
        SingleSymbols(name: "facemask",                  version: .SF3, keywords: ["医疗", "卫生", "口罩", "防护", "防疫"], keywords_en: ["medical", "mask", "protection", "hygiene", "prevention"]),
        
        // ========== 医疗系统：急救 ==========
        SingleSymbols(name: "cross",                     version: .SF2, keywords: ["加号", "医疗", "急救", "红十字"], keywords_en: ["medical cross", "medical", "first aid", "emergency", "red cross", "plus sign"]),
        SingleSymbols(name: "staroflife",                version: .SF1, keywords: ["医疗", "急救", "救护"], keywords_en: ["medical", "emergency", "ambulance"]),
        
        // ========== 医疗系统：病原 ==========
        SingleSymbols(name: "microbe",                   version: .SF4, keywords: ["微生物", "病毒", "细菌", "感染"], keywords_en: ["bacteria", "virus", "infection"]),
        
        // ========== 心理与认知 ==========
        SingleSymbols(name: "brain",                     version: .SF3, keywords: ["大脑", "神经", "认知", "思考"], keywords_en: ["brain", "neural", "cognition", "mind"]),
        SingleSymbols(name: "brain.head.profile",        version: .SF3, keywords: ["大脑", "心理", "思维", "认知"], keywords_en: ["brain", "mind", "thinking", "mental", "cognitive"]),
        SingleSymbols(name: "apple.meditate",            version: .SF5, keywords: ["冥想", "正念", "放松"], keywords_en: ["meditation", "mindfulness", "relax", "wellness"]),
        
        // ========== 科研系统（独立于医疗） ==========
        SingleSymbols(name: "flask",                     version: .SF5, keywords: ["烧瓶", "实验", "化学", "科学", "研究"],keywords_en: ["flask", "chemistry", "lab", "experiment", "science", "research"]),
        SingleSymbols(name: "testtube.2",                version: .SF3, keywords: ["试管", "化学", "科学", "实验室", "检测"], keywords_en: ["chemistry", "science", "test tube", "lab", "analysis", "experiment"]),
        
        // ========== 办公设备 ==========
        SingleSymbols(name: "printer",                   version: .SF1, keywords: ["打印", "打印机", "输出"], keywords_en: ["printer", "print", "output", "document"]),
        SingleSymbols(name: "scanner",                   version: .SF2, keywords: ["扫描", "扫描仪", "数字化"], keywords_en: ["scanner", "scan", "digitize", "ocr"]),
        SingleSymbols(name: "faxmachine",                version: .SF2, keywords: ["传真", "传真机", "通讯"], keywords_en: ["fax", "fax machine", "communication"]),
        
        // ========== 随身包（Personal Bags） ==========
        SingleSymbols(name: "handbag",                   version: .SF4, keywords: ["包", "手提包"], keywords_en: [ "handbag", "bag", "carry"]),
        SingleSymbols(name: "briefcase",                 version: .SF1, keywords: ["包", "公文包", "商务"], keywords_en: ["briefcase", "bag", "business", "office", "work"]),
        
        // ========== 容器与防护（Cases & Containers） ==========
        SingleSymbols(name: "case",                      version: .SF2, keywords: ["盒子", "箱", "收纳盒"], keywords_en: ["box", "cabinet", "storage box", "case", "storage", "protect"]),
        SingleSymbols(name: "cross.case",                version: .SF2, keywords: [ "急救包", "医疗包", "急救"], keywords_en: ["first aid kit", "medical", "emergency"]),
        SingleSymbols(name: "suitcase",                  version: .SF3, keywords: ["箱", "手提箱", "行李箱"], keywords_en: ["suitcase", "handbag", "luggage"]),
        SingleSymbols(name: "suitcase.rolling",          version: .SF4, keywords: ["箱", "拉杆箱", "行李箱"], keywords_en: ["suitcase", "rolling suitcase", "luggage"]),
        
        // ========== 艺术与表演 ==========
        SingleSymbols(name: "theatermasks",              version: .SF3, keywords: ["艺术", "剧院", "戏剧", "面具", "表演"], keywords_en: ["theater", "drama", "mask", "performance", "art"]),
        
        
        // ========== 扩展与模块（Extensions / Plugins） ==========
        SingleSymbols(name: "puzzlepiece.extension",     version: .SF3, keywords: ["拼图", "模块", "组件"], keywords_en: ["puzzle", "module", "component", "part"]),
        SingleSymbols(name: "puzzlepiece",               version: .SF2, keywords: ["拼图", "模块", "组件"], keywords_en: ["puzzle", "module", "component", "part"]),
        
        
        // ========== 智能家居系统 ==========
        SingleSymbols(name: "homekit",                   version: .SF2, keywords: ["房子", "智能家居"], keywords_en: ["house", "HomeKit", "home automation", "IoT"]),
        SingleSymbols(name: "wifi.router",               version: .SF4, keywords: ["路由器", "网络", "无线网络"], keywords_en: ["wifi", "router", "internet"]),
        
        // ========== 居住空间 ==========
        SingleSymbols(name: "house",                     version: .SF1, keywords: ["房子", "家", "主页", "首页"], keywords_en: ["home", "house"]),
        SingleSymbols(name: "building",                  version: .SF2, keywords: ["建筑", "大楼", "公司", "城市"], keywords_en: ["architecture", "building", "structure", "city", "company"]),
        SingleSymbols(name: "building.columns",          version: .SF2, keywords: ["建筑", "机构", "政府", "银行", "博物馆"], keywords_en: ["institution", "architecture", "government", "bank", "museum"]),
        
        // ========== 照明系统 ==========
        SingleSymbols(name: "lightbulb",                 version: .SF1, keywords: ["灯", "照明", "灯泡", "灵感", "创意", "想法"], keywords_en: ["lamp", "light", "inspiration", "creativity", "idea"]),
        SingleSymbols(name: "lamp.desk",                 version: .SF4, keywords: ["灯", "照明", "台灯", "桌灯", "阅读灯"], keywords_en: ["lamp", "light", "desk lamp", "study light","table lamp"]),
        SingleSymbols(name: "lamp.floor",                version: .SF4, keywords: ["灯", "照明", "落地灯", "家居"], keywords_en: ["lamp", "light", "floor lamp", "home furnishings"]),
        SingleSymbols(name: "lamp.ceiling",              version: .SF4, keywords: ["灯", "照明", "吊灯", "天花板灯"], keywords_en: ["lamp", "light", "ceiling Light"]),
        SingleSymbols(name: "chandelier",                version: .SF4, keywords: ["灯", "照明", "枝形吊灯", "吊灯", "水晶灯"], keywords_en: ["lamp", "light", "chandelier", "crystal chandelier"]),
        SingleSymbols(name: "light.panel",               version: .SF4, keywords: ["灯", "照明", "面板", "灯光面板"], keywords_en: ["lamp", "light", "panel", "lighting panel"]),
        
        // ========== 电力系统 ==========
        SingleSymbols(name: "powerplug",                 version: .SF3, keywords: ["电", "插头", "电源", "插座", "充电", ], keywords_en: ["plug", "power supply", "socket", "charging", "electric"]),
        SingleSymbols(name: "powercord",                 version: .SF5, keywords: ["电", "电线", "电源线", "充电线"], keywords_en: ["electric", "electric wire", "power cord", "charging cable"]),
        
        // ========== 水系统 ==========
        SingleSymbols(name: "spigot",                    version: .SF4, keywords: ["水", "水龙头", "水阀"], keywords_en: ["tap", "faucet", "water"]),
        SingleSymbols(name: "shower",                    version: .SF4, keywords: ["水", "淋浴", "洗澡"], keywords_en: ["shower", "bath", "water"]),
        SingleSymbols(name: "bathtub",                   version: .SF4, keywords: ["水", "浴缸", "泡澡", "洗澡"], keywords_en: ["bathtub", "bath", "water"]),
        SingleSymbols(name: "sprinkler",                 version: .SF4, keywords: ["水", "喷淋", "灌溉", "洒水", "洒水器",  "浇水"], keywords_en: ["sprinkler", "irrigation", "watering", "water"]),
        SingleSymbols(name: "sink",                      version: .SF4, keywords: ["水", "水槽", "洗手池", "洗碗池", "厨房", "清洗"], keywords_en: ["sink", "kitchen sink", "basin", "wash", "washing", "water"]),
        SingleSymbols(name: "toilet",                    version: .SF4, keywords: ["水", "马桶", "厕所", "卫生间", "洗手间"], keywords_en: ["toilet", "bathroom", "restroom", "wc", "lavatory", "water"]),
        
        // ========== 家电系统 ==========
        SingleSymbols(name: "fan",                       version: .SF5, keywords: ["家电", "降温", "散热", "通风", "风扇", "电风扇"], keywords_en: ["home appliances", "cooling", "ventilation", "air", "fan", "electric fan"]),
        SingleSymbols(name: "fan.ceiling",               version: .SF4, keywords: ["家电", "降温", "散热", "通风", "吊扇"], keywords_en: ["home appliances", "cooling", "ventilation", "air", "fan", "ceiling fan"]),
        SingleSymbols(name: "dehumidifier",              version: .SF4, keywords: ["家电", "除湿机", "除湿", "干燥", "空气", "湿度"], keywords_en: ["home appliances", "dehumidifier", "dehumidify", "dry", "humidity", "air"]),
        SingleSymbols(name: "humidifier",                version: .SF4, keywords: ["加湿器", "加湿", "空气", "湿度", "家电"], keywords_en: ["home appliances", "humidifier", "humidify", "humidity", "air", "moisture"]),
        SingleSymbols(name: "robotic.vacuum",            version: .SF6, keywords: ["扫地机器人", "清洁", "吸尘", "自动打扫", "家电", "机器人"], keywords_en: ["home appliances", "robot vacuum", "robotic vacuum", "vacuuming",  "cleaning", "vacuum", "roomba"]),
        SingleSymbols(name: "refrigerator",              version: .SF4, keywords: ["冰箱", "冷藏", "保鲜", "冷冻", "家电"], keywords_en: ["home appliances", "refrigerator", "fridge", "freezer", "cooling"]),
        SingleSymbols(name: "microwave",                 version: .SF4, keywords: ["微波炉", "加热", "厨房", "家电"], keywords_en: ["home appliances", "microwave", "microwave oven", "heat", "cook"]),
        SingleSymbols(name: "oven",                      version: .SF4, keywords: ["烤箱", "烘焙", "烤制", "厨房", "家电"], keywords_en: ["home appliances", "oven", "baking", "bake", "cook"]),
        SingleSymbols(name: "stove",                     version: .SF4, keywords: ["炉灶", "煤气灶", "做饭", "烹饪", "厨房"], keywords_en: ["stove", "cooktop", "gas stove", "cooking"]),
        SingleSymbols(name: "washer",                    version: .SF4, keywords: ["洗衣机", "洗衣", "清洗", "衣物", "家电"], keywords_en: ["home appliances", "washer", "washing machine", "laundry", "wash"]),
        
        
        // ========== 家具系统 ==========
        SingleSymbols(name: "bed.double",                version: .SF1, keywords: ["双人床", "床", "卧室", "睡觉", "休息", "家具"], keywords_en: ["furniture", "double bed", "bed", "sleep", "bedroom"]),
        SingleSymbols(name: "sofa",                      version: .SF4, keywords: ["沙发", "客厅", "休息", "坐", "家具"], keywords_en: ["furniture", "sofa", "couch", "seat", "living room"]),
        SingleSymbols(name: "chair",                     version: .SF4, keywords: ["椅子", "座位", "坐", "家具"], keywords_en: ["furniture", "chair", "seat", "sitting"]),
        SingleSymbols(name: "table.furniture",           version: .SF4, keywords: ["桌子", "餐桌", "办公桌", "家具"], keywords_en: ["furniture", "table", "desk", "dining table"]),
        SingleSymbols(name: "cabinet",                   version: .SF4, keywords: ["柜子", "橱柜", "收纳", "储物", "家具"], keywords_en: ["furniture", "cabinet", "storage", "cupboard"]),
        SingleSymbols(name: "chair.lounge",              version: .SF4, keywords: ["椅子", "休闲椅", "躺椅", "放松", "休息", "家具"], keywords_en: ["furniture", "lounge chair", "recliner", "relax", "chair"]),
        
        // ========== 空间结构 ==========
        SingleSymbols(name: "stairs",                    version: .SF4, keywords: ["楼梯", "台阶", "上下楼"], keywords_en: ["stairs", "staircase", "steps", "stairs up", "stairs down"]),
        SingleSymbols(name: "door.left.hand.open",       version: .SF4, keywords: ["开门", "门", "进入", "出口", "入口"], keywords_en: ["door", "door open", "open door", "entrance", "exit", "doorway"]),
        SingleSymbols(name: "fireplace",                 version: .SF4, keywords: ["壁炉", "暖炉", "取暖", "冬天", "家居"], keywords_en: ["fireplace", "heater", "fire", "warm", "indoor"]),
        
        // ========== 装修与节日 ==========
        SingleSymbols(name: "balloon",                   version: .SF4, keywords: ["气球", "庆祝", "派对", "生日", "装饰", "节日"], keywords_en: ["balloon", "party", "celebration", "birthday", "decoration", "festival"]),
        SingleSymbols(name: "fireworks",                 version: .SF5, keywords: ["烟花", "烟火", "庆典", "节日", "新年", "庆祝"], keywords_en: ["fireworks", "celebration", "festival", "new year", "explosion"]),
        SingleSymbols(name: "party.popper",              version: .SF4, keywords: ["礼花", "庆祝", "派对", "节日"], keywords_en: ["party popper", "celebration", "party", "confetti", "festival"]),
        SingleSymbols(name: "popcorn",                   version: .SF4, keywords: ["爆米花", "零食", "电影", "影院", "观影"], keywords_en: ["popcorn", "snack", "movie", "cinema", "food"]),
        
        // ========== 户外与自然居住 ==========
        SingleSymbols(name: "tent",                      version: .SF4, keywords: ["帐篷", "露营", "野营", "户外", "住宿"], keywords_en: ["tent", "camping", "outdoor", "camp", "shelter"]),
        SingleSymbols(name: "house.lodge",               version: .SF4, keywords: ["木屋", "小屋", "度假屋", "户外"], keywords_en: ["lodge", "cabin", "house", "vacation home", "cottage"]),
        
        // ========== 商业与家居设备 ==========
        SingleSymbols(name: "storefront",                version: .SF5, keywords: ["店面", "商店", "商铺", "零售", "营业"], keywords_en: ["storefront", "shop", "store", "retail", "business"]),
        
        // ========== 特效与视觉 ==========
        SingleSymbols(name: "laser.burst",               version: .SF5, keywords: ["激光", "爆发", "光效", "光束", "能量"], keywords_en: ["laser", "burst", "beam", "light", "effect"]),
        
        // ========== 厨房与餐饮 ==========
        SingleSymbols(name: "frying.pan",                version: .SF4, keywords: ["锅", "煎锅", "平底锅", "炒锅", "烹饪", "厨房", "炒菜", "厨具"], keywords_en: ["pot", "frying pan", "pan", "cook", "cooking", "kitchen", "kitchenware"]),
        
        // ========== UI 布局 ==========
        SingleSymbols(name: "square.split.bottomrightquarter", version: .SF2, keywords: ["分割", "布局", "分区",  "界面"], keywords_en: ["split", "layout", "grid", "section", "partition"]),
        
        // ========== 教育与地理 ==========
        SingleSymbols(name: "globe.desk",                version: .SF4, keywords: ["地球仪", "地理", "教育", "全球", "学习"], keywords_en: ["globe", "globe desk", "geography", "education", "world"]),
        
        // ========== 安全与锁定 ==========
        SingleSymbols(name: "lock",                      version: .SF1, keywords: ["锁", "加锁", "锁定", "安全", "私密", "保护", "密码"], keywords_en: ["lock", "locked", "secure", "security", "privacy", "protection", "password"]),
        SingleSymbols(name: "lock.open",                 version: .SF1, keywords: ["锁", "解锁", "开锁", "访问", "允许", "开放"], keywords_en: ["lock", "unlock", "unlocked", "open lock", "access", "allow"]),
        SingleSymbols(name: "key",                       version: .SF2, keywords: ["钥匙", "密钥", "解锁", "权限"], keywords_en: ["key", "password", "access key", "credential", "unlock"]),
        SingleSymbols(name: "wifi",                      version: .SF1, keywords: ["无线网络", "网络", "连接", "互联网"], keywords_en: ["wifi", "wi-fi", "wireless", "network", "internet", "connection"]),
        SingleSymbols(name: "faceid",                    version: .SF1, keywords: ["面容识别", "人脸识别", "生物识别", "解锁", "认证"], keywords_en: ["face id", "faceid", "facial recognition", "biometric", "authentication", "unlock"]),
        SingleSymbols(name: "touchid",                   version: .SF2, keywords: ["指纹识别", "指纹", "生物识别", "解锁", "认证"], keywords_en: ["touch id", "touchid", "fingerprint", "biometric", "authentication", "unlock"]),
        SingleSymbols(name: "opticid",                   version: .SF5, keywords: ["虹膜识别", "生物识别", "认证"], keywords_en: ["optic id", "opticid", "iris recognition", "biometric", "authentication", "vision pro"]),
        
        // ========== 三维与空间 ==========
        SingleSymbols(name: "move.3d",                   version: .SF2, keywords: ["移动", "空间", "坐标", "变换"], keywords_en: ["move", "translate", "position"]),
        SingleSymbols(name: "torus",                     version: .SF2, keywords: ["环面", "甜甜圈", "三维", "几何", "形状"], keywords_en: ["torus", "donut shape", "3d", "geometry", "shape"]),
        SingleSymbols(name: "rotate.left",               version: .SF1, keywords: ["左旋转", "旋转", "向左旋转", "变换"], keywords_en: ["rotate left", "rotation", "rotate", "transform"]),
        SingleSymbols(name: "cube",                      version: .SF1, keywords: ["立方体", "方块", "三维", "模型", "几何"], keywords_en: ["cube", "box", "3d", "geometry", "model"]),
        SingleSymbols(name: "shippingbox",               version: .SF2, keywords: ["箱子", "纸箱", "包裹", "快递", "物流", "运输"], keywords_en: ["boxes", "cardboard boxes", "shipping box", "package", "delivery", "logistics"]),
        SingleSymbols(name: "arkit",                     version: .SF1, keywords: ["增强现实", "空间", "开发"], keywords_en: ["arkit", "augmented reality", "ar", "spatial", "apple ar"]),
        SingleSymbols(name: "cone",                      version: .SF2, keywords: ["锥体", "圆锥", "三维", "几何", "形状"], keywords_en: ["cone", "3d", "geometry", "shape"]),
        SingleSymbols(name: "square.stack.3d.down.right", version: .SF1, keywords: ["堆叠", "图层", "层级", "多层", "界面"], keywords_en: ["3d", "stack", "layers", "stack", "hierarchy", "ui layers"]),
        SingleSymbols(name: "square.stack.3d.up",        version: .SF1, keywords: ["堆叠", "图层", "层级", "上移", "多层"], keywords_en: ["3d", "stack up", "layers", "stack", "move up", "hierarchy"]),
        SingleSymbols(name: "square.2.layers.3d",        version: .SF4, keywords: ["双层", "图层", "叠加", "深度", "三维"], keywords_en: ["2 layers", "stack", "double layer", "layers", "depth", "3d"]),
        SingleSymbols(name: "square.3.layers.3d.down.right", version: .SF3, keywords: ["三层", "图层", "堆叠", "层级", "三维"], keywords_en: ["3 layers", "stack", "layers", "hierarchy", "3d"]),
        SingleSymbols(name: "cylinder",                  version: .SF2, keywords: ["圆柱", "三维", "几何", "形状", "数据库"], keywords_en: ["cylinder", "3d", "geometry", "shape", "database"]),
        
        // ========== 核心硬件 ==========
        SingleSymbols(name: "cpu",                       version: .SF2, keywords: ["CPU", "处理器", "芯片", "计算", "性能", "硬件"], keywords_en: ["cpu", "processor", "chip", "compute", "performance", "hardware"]),
        SingleSymbols(name: "memorychip",                version: .SF2, keywords: ["内存", "芯片", "存储", "硬件"], keywords_en: ["memory", "ram", "memory chip", "storage", "hardware"]),
        SingleSymbols(name: "opticaldisc",               version: .SF2, keywords: ["光盘", "存储", "介质", "硬件"], keywords_en: ["optical disc", "cd", "dvd", "media", "storage"]),
        SingleSymbols(name: "sensor.tag.radiowaves.forward", version: .SF3, keywords: ["传感器", "标签", "无线", "识别", "硬件"], keywords_en: ["hardware", "sensor", "nfc", "tag", "wireless", "scan"]),
        SingleSymbols(name: "airtag",                    version: .SF3, keywords: ["定位", "追踪", "防丢", "硬件"], keywords_en: ["hardware", "airtag", "tracking", "locator", "find", "item tracker"]),
        
        // ========== 计算设备 ==========
        SingleSymbols(name: "display",                   version: .SF2, keywords: ["显示器", "屏幕", "电脑", "计算机", "硬件"], keywords_en: ["hardware", "display", "monitor", "screen", "computer", "pc"]),
        SingleSymbols(name: "pc",                        version: .SF2, keywords: ["电脑", "台式机", "计算机", "硬件"], keywords_en: ["hardware", "pc", "desktop", "computer"]),
        SingleSymbols(name: "xserve",                    version: .SF2, keywords: ["服务器", "机架服务器", "数据中心", "硬件"], keywords_en: ["hardware", "server", "xserve", "rack server", "data center"]),
        SingleSymbols(name: "server.rack",               version: .SF2, keywords: ["服务器", "机架服务器", "数据中心", "硬件"], keywords_en: ["hardware", "server rack", "data center"]),
        SingleSymbols(name: "laptopcomputer",            version: .SF2, keywords: ["笔记本", "电脑", "计算机", "硬件"], keywords_en: ["hardware", "laptop", "notebook", "portable computer", "computer", "pc"]),
        SingleSymbols(name: "macmini",                   version: .SF2, keywords: ["台式机", "苹果电脑", "硬件"], keywords_en: ["hardware", "mac mini", "desktop mac", "apple computer", "computer", "pc"]),
        
        // ========== 移动设备 ==========
        SingleSymbols(name: "smartphone",                version: .SF5, keywords: ["智能手机", "手机", "移动设备", "硬件"], keywords_en: ["hardware", "smartphone", "phone", "mobile device"]),
        SingleSymbols(name: "flipphone",                 version: .SF2, keywords: ["手机", "翻盖手机", "功能机", "老式手机", "硬件"], keywords_en: ["hardware", "phone", "flip phone", "feature phone", "old phone"]),
        SingleSymbols(name: "candybarphone",             version: .SF2, keywords: ["直板手机", "老式手机", "功能机", "硬件"], keywords_en: ["hardware", "candy bar phone", "feature phone", "classic phone"]),
        SingleSymbols(name: "ipad",                      version: .SF2, keywords: ["平板", "平板电脑", "硬件", "苹果设备"], keywords_en: ["hardware", "ipad", "tablet", "tablet computer", "apple device"]),
        SingleSymbols(name: "ipod",                      version: .SF2, keywords: ["音乐", "播放器", "音乐播放器", "随身听", "苹果设备", "硬件"], keywords_en: ["music", "player", "hardware", "ipod", "music player", "mp3 player", "portable music", "apple device"]),
        SingleSymbols(name: "vision.pro",                version: .SF6, keywords: ["空间计算", "头显", "硬件"], keywords_en: ["hardware", "vision pro", "spatial computing", "xr headset", "ar vr", "headset"]),
        
        // ========== iPad 行为 ==========
        SingleSymbols(name: "ipad.landscape",            version: .SF2, keywords: ["横屏", "横向", "平板", "硬件"], keywords_en: ["hardware", "iPad", "landscape", "tablet landscape", "horizontal"]),
        
        // ========== iPhone 行为 ==========
        SingleSymbols(name: "iphone.gen1.and.arrow.left", version: .SF6, keywords: ["返回", "回退", "迁移"], keywords_en: ["iPhone","return", "go back", "migrate"]),
        SingleSymbols(name: "iphone.gen2.and.arrow.left.and.arrow.right.inward", version: .SF6, keywords: ["同步", "数据迁移"], keywords_en: ["iPhone", "synchronization", "data migration"]),
        SingleSymbols(name: "iphone.and.arrow.right.outward", version: .SF6, keywords: ["退出", "迁移", "导出"], keywords_en: ["iPhone", "export", "send", "share"]),
        SingleSymbols(name: "iphone.rear.camera",        version: .SF3, keywords: ["后置摄像头"], keywords_en: ["iPhone", "Rear camera"]),
        SingleSymbols(name: "iphone.gen1.crop.circle",   version: .SF6, keywords: ["圆形图标", "设备头像"], keywords_en: ["iPhone", "circular icon", "device icon"]),
        SingleSymbols(name: "iphone.gen1.radiowaves.left.and.right", version: .SF4, keywords: ["信号", "通话", "网络", "无线", "通信"], keywords_en: ["iPhone", "signal", "call", "network", "wireless", "communication"]),
        SingleSymbols(name: "platter.filled.top.iphone", version: .SF3, keywords: ["状态栏", "通知", "顶部"], keywords_en: ["status bar", "top bar", "notification area"]),
        
        // ========== 输入设备 ==========
        SingleSymbols(name: "applepencil",               version: .SF3, keywords: ["笔", "手写笔", "绘图", "书写", "硬件"], keywords_en: ["hardware", "pencil", "apple pencil", "stylus", "drawing", "writing"]),
        SingleSymbols(name: "magicmouse",                version: .SF3, keywords: ["鼠标", "苹果鼠标", "硬件"], keywords_en: ["hardware", "magic mouse", "mouse", "apple mouse"]),
        SingleSymbols(name: "computermouse",             version: .SF3, keywords: ["鼠标", "电脑鼠标", "输入设备", "硬件"], keywords_en: ["hardware", "mouse", "computer mouse", "input device"]),
        
        // ========== 音频设备 ==========
        SingleSymbols(name: "headphones",                version: .SF1, keywords: ["耳机", "头戴耳机", "音乐", "降噪"], keywords_en: ["headphones", "over ear", "audio", "noise cancelling", "music"]),
        SingleSymbols(name: "headset",                   version: .SF6, keywords: ["耳麦", "通话耳机", "客服", "游戏", "音乐"], keywords_en: ["headphones", "mic headset", "call", "gaming", "customer service", "music"]),
        SingleSymbols(name: "airpods",                   version: .SF2, keywords: ["无线耳机", "蓝牙耳机", "音乐"], keywords_en: ["headphones", "airpods", "wireless earbuds", "wireless headphones", "bluetooth", "music", "apple headphones"]),
        SingleSymbols(name: "earbuds",                   version: .SF3, keywords: ["耳机", "无线耳机", "蓝牙耳机", "耳塞式耳机", "音乐"], keywords_en: ["headphones", "airpods", "wireless earbuds", "wireless headphones", "in-ear headphones", "music", "bluetooth"]),
        SingleSymbols(name: "earbuds.case",              version: .SF3, keywords: ["耳机", "耳机盒", "收纳", "充电盒"], keywords_en: ["headphones", "earbuds case", "charging case", "case"]),
        SingleSymbols(name: "airpods.max",               version: .SF6, keywords: ["耳机", "头戴耳机", "降噪", "音乐", "苹果耳机"], keywords_en: ["headphones", "music", "airpods max", "over ear headphones", "noise cancelling", "apple headphones"]),
        SingleSymbols(name: "earpods",                   version: .SF2, keywords: ["有线耳机", "苹果耳机", "音频"], keywords_en: ["music", "headphones", "earpods", "wired earphones", "apple headphones", "earphones"]),
        SingleSymbols(name: "airpods.gen3",              version: .SF3, keywords: ["无线耳机", "蓝牙耳机", "入耳式", "苹果耳机"], keywords_en: ["music", "headphones", "airpods 3", "wireless earbuds", "bluetooth earbuds", "true wireless", "apple headphones"]),
        SingleSymbols(name: "homepod",                   version: .SF2, keywords: ["智能音箱", "Siri", "家居音响", "语音助手", "苹果设备"], keywords_en: ["homepod", "smart speaker", "siri speaker", "home audio", "voice assistant", "apple device"]),
        SingleSymbols(name: "hifispeaker",               version: .SF1, keywords: ["Hi-Fi音箱", "扬声器", "高保真", "音响", "音乐"], keywords_en: ["music", "hifi speaker", "speaker", "audio system", "high fidelity", "sound"]),
        
        // ========== 媒体与现实 ==========
        SingleSymbols(name: "tv",                        version: .SF1, keywords: ["电视", "屏幕", "媒体", "显示"], keywords_en: ["television", "display", "media"]),
        SingleSymbols(name: "4k.tv",                     version: .SF2, keywords: ["电视", "4K电视", "超高清"], keywords_en: ["tv", "4k tv", "ultra hd", "television"]),
        SingleSymbols(name: "airplay.video",             version: .SF6, keywords: ["投屏", "无线投影", "屏幕共享"], keywords_en: ["screen mirroring", "cast", "stream"]),
        SingleSymbols(name: "pip",                       version: .SF2, keywords: ["画中画", "小窗播放", "悬浮窗"], keywords_en: ["picture in picture", "floating window"]),
        SingleSymbols(name: "appletv",                   version: .SF2, keywords: ["机顶盒", "流媒体", "影视", "影音", "硬件"], keywords_en: ["hardware", "apple tv", "streaming box", "set top box", "media", "streaming"]),
        SingleSymbols(name: "appletvremote.gen1",        version: .SF3, keywords: ["遥控器", "控制器", "媒体控制", "硬件"], keywords_en: ["hardware", "remote control", "apple tv remote", "controller", "media remote"]),
        SingleSymbols(name: "mediastick",                version: .SF3, keywords: ["媒体棒", "电视棒", "流媒体设备", "机顶盒", "投屏设备", "硬件", "U盘"], keywords_en: ["hardware", "media stick", "streaming stick", "tv stick", "set top device", "usb flash drive"]),
        
        // ========== 通信 ==========
        SingleSymbols(name: "antenna.radiowaves.left.and.right", version: .SF1, keywords: ["天线", "信号", "无线", "通信"], keywords_en: ["antenna", "signal", "wireless", "communication"]),
        SingleSymbols(name: "simcard",                   version: .SF2, keywords: ["SIM卡", "手机卡",  "运营商", "通信"], keywords_en: ["sim card", "carrier", "mobile network", "communication"]),
        SingleSymbols(name: "esim",                      version: .SF2, keywords: ["虚拟SIM卡"], keywords_en: ["esim", "embedded sim", "digital sim", "communication"]),
        
        // ========== Apple 设备生态 ==========
        SingleSymbols(name: "iphone.case",               version: .SF5, keywords: ["手机壳", "保护壳", "配件", "外壳"], keywords_en: ["iphone case", "phone case", "cover", "protection case", "accessory"]),
        
        // ========== Apple Watch ==========
        SingleSymbols(name: "applewatch",                version: .SF2, keywords: ["智能手表", "穿戴设备", "健康", "运动", "硬件"], keywords_en: ["hardware", "apple watch", "smartwatch", "wearable", "fitness", "health"]),
        SingleSymbols(name: "applewatch.side.right",     version: .SF2, keywords: ["数码表冠", "侧边按钮", "侧面", "控制", "硬件"], keywords_en: ["hardware", "digital crown", "side button", "side", "control"]),
        
        
        // ========== 接口 / 连接 ==========
        SingleSymbols(name: "cable.connector",           version: .SF3, keywords: ["数据线", "连接线", "电缆", "接口", "连接"], keywords_en: ["cable", "connector", "data cable", "wire", "connection"]),
        SingleSymbols(name: "audio.jack.mono",           version: .SF5, keywords: ["耳机", "耳机接口", "音频插孔", "接口"], keywords_en: ["headphones", "audio jack", "3.5mm jack", "headphone port", "aux", "audio port"]),
        
        // ========== 广播 / 信号 ==========
        SingleSymbols(name: "radio",                     version: .SF2, keywords: ["收音机", "广播", "音频"], keywords_en: ["am", "fm", "radio", "broadcast", "audio", "receiver"]),
        SingleSymbols(name: "dot.radiowaves.left.and.right", version: .SF1, keywords: ["无线通信", "信号", "广播", "通信"], keywords_en: ["radio waves", "signal", "wireless", "broadcast"]),
        
        // ========== UI 全屏 ==========
        SingleSymbols(name: "rectangle.arrowtriangle.2.outward", version: .SF2, keywords: ["全屏", "扩展", "展开", "滚动", "横屏", "横向"], keywords_en: ["full screen", "expand", "scroll", "landscape", "horizontal"]),
        SingleSymbols(name: "rectangle.portrait.arrowtriangle.2.outward", version: .SF2, keywords: ["全屏", "扩展", "展开", "滚动", "竖屏", "纵向"], keywords_en: ["full screen", "expand", "scroll", "portrait", "vertical"]),
        
        // ========== 乐器 ==========
        SingleSymbols(name: "guitars",                   version: .SF1, keywords: ["吉他", "乐器", "音乐", "演奏", "音频", "摇滚"], keywords_en: ["instrument", "music", "playing", "audio", "rock"]),
        
        // ========== 存储 ==========
        SingleSymbols(name: "sdcard",                    version: .SF2, keywords: ["SD卡", "存储卡", "内存卡", "扩展存储", "数据"], keywords_en: ["sd card", "memory card", "storage", "flash card", "storage expansion"]),
        
        // ========== 空中交通 ==========
        SingleSymbols(name: "airplane",                  version: .SF1, keywords: ["飞机", "航班", "飞行", "航空", "旅行", "交通"], keywords_en: ["transportation", "airplane", "flight", "aircraft", "aviation", "travel"]),
        SingleSymbols(name: "drone",                     version: .SF6, keywords: ["飞机", "无人机", "航拍", "飞行", "遥控", "拍摄"], keywords_en: ["airplane", "drone", "uav", "aerial", "quadcopter", "flying camera"]),
        
        // ========== 陆地交通 ==========
        SingleSymbols(name: "car",                       version: .SF1, keywords: ["车", "汽车", "驾驶", "自驾", "车辆", "出行", "交通"], keywords_en: ["transportation", "car", "vehicle", "driving", "automobile", "transport"]),
        SingleSymbols(name: "bus",                       version: .SF2, keywords: ["交通", "车", "公交车", "巴士", "公共交通", "出行"], keywords_en: ["transportation", "car", "bus", "public transport", "transit", "coach", "city bus"]),
        SingleSymbols(name: "tram",                      version: .SF2, keywords: ["交通", "有轨电车", "电车", "轨道交通", "城市交通"], keywords_en: ["transportation", "tram", "streetcar", "light rail", "rail transit"]),
        SingleSymbols(name: "train.side.front.car",      version: .SF3, keywords: ["交通", "火车", "列车", "高铁", "铁路", "轨道交通"], keywords_en: ["transportation", "train", "railway", "high speed rail", "subway", "rail transport"]),
        SingleSymbols(name: "truck.box",                 version: .SF5, keywords: ["交通", "车", "卡车", "货车", "物流", "运输", "配送"], keywords_en: ["transportation", "car", "truck", "cargo", "logistics", "delivery", "freight"]),
        
        // ========== 水上交通 ==========
        SingleSymbols(name: "ferry",                     version: .SF3, keywords: ["交通", "船", "渡轮", "轮渡", "船只", "水运", "航运"], keywords_en: ["transportation", "ferry", "water transport", "shipping", "marine transport"]),
        SingleSymbols(name: "sailboat",                  version: .SF4, keywords: ["交通", "船", "帆船", "航海", "水上", "游艇", "旅行"], keywords_en: ["transportation", "boat", "sailboat", "sailing", "yacht", "marine", "sea travel"]),
        
        // ========== 两轮交通 ==========
        SingleSymbols(name: "bicycle",                   version: .SF2, keywords: ["交通", "车", "自行车", "单车", "骑行", "运动"], keywords_en: ["transportation", "bicycle", "bike", "cycling", "ride"]),
        SingleSymbols(name: "motorcycle",                version: .SF6, keywords: ["交通", "车", "摩托车", "机车", "骑行", "两轮", "交通工具"], keywords_en: ["transportation", "motorcycle", "bike", "motorbike", "ride", "two wheeler"]),
        SingleSymbols(name: "moped",                     version: .SF6, keywords: ["交通", "车", "轻便摩托", "电动车", "代步", "小型摩托"], keywords_en: ["transportation", "moped", "scooter bike", "small motorcycle", "electric bike"]),
        SingleSymbols(name: "scooter",                   version: .SF3, keywords: ["交通", "车", "滑板车", "踏板车", "电动滑板车", "代步"], keywords_en: ["transportation", "scooter", "electric scooter", "kick scooter", "e scooter"]),
        
        // ========== 特殊人群 / 辅助交通 ==========
        SingleSymbols(name: "wheelchair",                version: .SF6, keywords: ["轮椅", "无障碍", "残障"], keywords_en: ["wheelchair", "accessibility", "disabled"]),
        SingleSymbols(name: "stroller",                  version: .SF4, keywords: ["婴儿车", "推车", "宝宝", "亲子", "出行"], keywords_en: ["stroller", "baby stroller", "pram", "child transport"]),
        SingleSymbols(name: "helmet",                    version: .SF6, keywords: ["头盔", "安全帽", "防护", "骑行", "安全", "装备"], keywords_en: ["helmet", "safety helmet", "protection", "cycling", "gear"]),
        
        // ========== 基础设施 ==========
        SingleSymbols(name: "parkingsign",               version: .SF3, keywords: ["停车", "停车场", "停车标志", "车位"], keywords_en: ["parking", "parking sign", "parking lot", "car park", "parking space"]),
        SingleSymbols(name: "fuelpump",                  version: .SF3, keywords: ["加油", "加油站", "燃油", "油泵", "能源"], keywords_en: ["fuel pump", "gas station", "refuel", "petrol", "gasoline"]),
        
        
        // ========== 动力系统 ==========
        SingleSymbols(name: "engine.combustion",         version: .SF4, keywords: ["发动机", "引擎", "内燃机", "动力系统", "燃油", "汽车"], keywords_en: ["engine", "combustion engine", "powertrain", "internal combustion", "motor"]),
        SingleSymbols(name: "transmission",              version: .SF4, keywords: ["变速箱", "档位", "传动系统", "动力传输"], keywords_en: ["transmission", "gearbox", "drivetrain", "gear system"]),
        SingleSymbols(name: "axle.2",                    version: .SF4, keywords: ["车轴", "驱动轴", "四驱", "底盘结构"], keywords_en: ["axle", "driveshaft", "4wd", "drivetrain component"]),
        SingleSymbols(name: "suspension.shock",          version: .SF6, keywords: ["悬架", "减震器", "避震", "缓冲"], keywords_en: ["suspension", "shock absorber", "suspension system", "damping"]),
        
        // ========== 电气 / 能源 ==========
        SingleSymbols(name: "batteryblock",              version: .SF4, keywords: ["电池组", "动力电池", "新能源", "电动车", "充电"], keywords_en: ["battery pack", "ev battery", "electric vehicle", "charging", "power storage"]),
        SingleSymbols(name: "glowplug",                  version: .SF4, keywords: ["预热塞", "柴油发动机", "启动"], keywords_en: ["glow plug", "diesel engine", "cold start"]),
        SingleSymbols(name: "oilcan",                    version: .SF4, keywords: ["机油", "润滑油", "保养", "润滑", "维修"], keywords_en: ["oil", "lubricant", "engine oil", "maintenance", "service"]),
        
        // ========== 安全系统 ==========
        SingleSymbols(name: "abs",                       version: .SF4, keywords: ["防抱死系统", "制动", "刹车安全"], keywords_en: ["abs", "anti lock braking", "brake system", "safety system"]),
        SingleSymbols(name: "brakesignal",               version: .SF4, keywords: ["刹车", "制动", "减速", "刹车灯"], keywords_en: ["brake", "braking", "stop signal", "brake light"]),
        SingleSymbols(name: "tirepressure",              version: .SF5, keywords: ["胎压", "轮胎气压"], keywords_en: ["tire pressure", "tpms", "pressure monitoring"]),
        SingleSymbols(name: "hazardsign",                version: .SF4, keywords: ["危险", "警告", "故障", "紧急"], keywords_en: ["hazard", "warning", "danger", "emergency"]),
        SingleSymbols(name: "yieldsign",                 version: .SF5, keywords: ["让行", "让路", "交通标志", "减速"], keywords_en: ["yield", "give way", "traffic sign", "slow down"]),
        SingleSymbols(name: "wrongwaysign",              version: .SF4, keywords: ["逆行", "禁止通行", "错误方向", "交通"], keywords_en: ["wrong way", "no entry", "do not enter", "traffic restriction"]),
        
        // ========== 视野 / 控制 ==========
        SingleSymbols(name: "steeringwheel",             version: .SF4, keywords: ["方向盘", "驾驶", "操控"], keywords_en: ["steering wheel", "driving", "steering"]),
        SingleSymbols(name: "mirror.side.left",          version: .SF4, keywords: ["后视镜", "侧视镜"], keywords_en: ["side mirror", "rearview mirror"]),
        SingleSymbols(name: "windshield.front.and.wiper", version: .SF4, keywords: ["雨刮器", "挡风玻璃"], keywords_en: ["windshield wiper", "windshield"]),
        SingleSymbols(name: "headlight.high.beam",       version: .SF4, keywords: ["远光灯", "大灯", "车灯", "照明"], keywords_en: ["headlight", "high beam", "car light", "illumination"]),
        SingleSymbols(name: "parkinglight",              version: .SF4, keywords: ["示廓灯", "停车灯", "车灯"], keywords_en: ["parking light", "position light", "marker light", "car light"]),
        
        // ========== 车辆结构 ==========
        SingleSymbols(name: "tire",                      version: .SF6, keywords: ["轮胎", "车轮"], keywords_en: ["tire", "wheel"]),
        SingleSymbols(name: "tow.hitch",                 version: .SF6, keywords: ["拖车钩", "牵引"], keywords_en: ["tow hitch", "trailer hitch"]),
        SingleSymbols(name: "carseat.left",              version: .SF5, keywords: ["座椅", "汽车座椅", "儿童座椅"], keywords_en: ["seat", "car seat", "child seat"]),
        SingleSymbols(name: "car.side.front.open.crop",  version: .SF6, keywords: ["汽车", "前备箱", "车头"], keywords_en: ["car", "trunk", "front of car"]),
        SingleSymbols(name: "car.side.rear.open.crop",   version: .SF6, keywords: ["汽车", "后备箱", "车尾"], keywords_en: ["car", "trunk", "rear"]),
        SingleSymbols(name: "car.top.door.front.left.open", version: .SF4, keywords: ["汽车", "俯视", "车门","进入"], keywords_en: ["car", "top view", "car door", "enter"]),
        
        // ========== 车型 / 外观 ==========
        SingleSymbols(name: "car.side",                  version: .SF4, keywords: ["汽车", "轿车", "汽车侧面", "车辆", "车型"], keywords_en: ["car", "sedan", "vehicle side", "automobile"]),
        SingleSymbols(name: "suv.side",                  version: .SF4, keywords: ["越野车", "车型", "多功能车"], keywords_en: ["car", "automobile", "suv", "sport utility vehicle", "off road", "4x4"]),
        SingleSymbols(name: "truck.pickup.side",         version: .SF5, keywords: ["皮卡", "货车"], keywords_en: ["car", "automobile", "pickup truck", "truck", "cargo vehicle", "utility truck"]),
        SingleSymbols(name: "convertible.side",          version: .SF6, keywords: ["敞篷车", "跑车", "豪车"], keywords_en: ["car", "automobile", "convertible", "sports car", "cabriolet", "luxury car"]),
        
        // ========== 仪表 ==========
        SingleSymbols(name: "tachometer",                version: .SF6, keywords: ["转速表", "仪表盘", "发动机转速"], keywords_en: ["rpm", "tachometer", "rpm gauge", "engine speed", "dashboard"]),
        SingleSymbols(name: "horn",                      version: .SF5, keywords: ["喇叭", "鸣笛", "警报", "提醒"], keywords_en: ["horn", "car horn", "beep", "alert"]),
        SingleSymbols(name: "heat.waves",                version: .SF5, keywords: ["热量", "高温", "暖风", "加热", "空调"], keywords_en: ["heat", "heat waves", "temperature", "heating", "warm air"]),
       
        // ========== 动物 ==========
        SingleSymbols(name: "hare",                      version: .SF1, keywords: ["兔子", "野兔", "速度", "快速", "敏捷", "动物", "性能"], keywords_en: ["hare", "rabbit", "fast", "speed", "swift", "agile", "animal", "performance"]),
        SingleSymbols(name: "tortoise",                  version: .SF1, keywords: ["乌龟", "龟", "缓慢", "低速", "节能", "动物"], keywords_en: ["animal", "tortoise", "turtle", "slow", "low power", "low speed", "energy saving"]),
        SingleSymbols(name: "dog",                       version: .SF5, keywords: ["狗", "宠物", "犬", "可爱", "动物"], keywords_en: ["animal", "dog", "pet", "canine", "puppy"]),
        SingleSymbols(name: "cat",                       version: .SF5, keywords: ["猫", "宠物", "猫咪", "可爱", "动物"], keywords_en: ["animal", "cat", "pet", "feline", "kitty"]),
        SingleSymbols(name: "lizard",                    version: .SF4, keywords: ["蜥蜴", "爬行动物", "冷血动物", "动物"], keywords_en: ["animal", "lizard", "reptile", "cold blooded"]),
        SingleSymbols(name: "bird",                      version: .SF4, keywords: ["鸟", "飞鸟", "动物", "飞行"], keywords_en: ["animal", "bird", "flying", "animal", "avian"]),
        SingleSymbols(name: "fish",                      version: .SF4, keywords: ["鱼", "水生动物", "动物", "海洋"], keywords_en: ["animal", "fish", "aquatic", "marine"]),
        SingleSymbols(name: "pawprint",                  version: .SF3, keywords: ["爪印", "足迹", "宠物", "动物"], keywords_en: ["animal", "paw print", "footprint", "pet", "track"]),
        
        // ========== 昆虫 ==========
        SingleSymbols(name: "ant",                       version: .SF1, keywords: ["蚂蚁", "昆虫"], keywords_en: ["bug", "ant", "insect"]),
        SingleSymbols(name: "ladybug",                   version: .SF2, keywords: ["瓢虫", "昆虫"], keywords_en: ["bug", "ladybug", "insect"]),
        
        // ========== 物品 / 玩具 ==========
        SingleSymbols(name: "teddybear",                 version: .SF4, keywords: ["熊", "泰迪熊", "玩具", "毛绒玩具", "礼物"], keywords_en: ["bear", "teddy bear", "toy", "plush toy", "gift"]),
        
        // ========== 植物 / 自然 ==========
        SingleSymbols(name: "leaf",                      version: .SF2, keywords: ["叶子", "植物", "绿色", "环保", "自然"], keywords_en: ["leaf", "plant", "green", "eco", "nature"]),
        SingleSymbols(name: "tree",                      version: .SF4, keywords: ["树", "树木", "植物", "自然", "森林"], keywords_en: ["tree", "plant", "forest", "nature"]),
        SingleSymbols(name: "laurel.leading",            version: .SF4, keywords: ["月桂", "桂冠", "胜利", "荣誉", "装饰"], keywords_en: ["laurel", "wreath", "victory", "honor", "decoration"]),
        SingleSymbols(name: "fossil.shell",              version: .SF4, keywords: ["化石", "贝壳", "古生物", "自然", "科学"], keywords_en: ["fossil", "shell", "prehistoric", "nature", "science"]),
        
        // ========== 衣物 ==========
        SingleSymbols(name: "hanger",                    version: .SF5, keywords: ["衣架", "挂衣", "晾衣"], keywords_en: ["hanger", "clothes hanger", "clothing rack"]),
        
        // ========== 权力 / 身份 ==========
        SingleSymbols(name: "crown",                     version: .SF2, keywords: ["王冠", "皇冠", "会员", "尊贵", "高级"], keywords_en: ["vip", "crown", "royalty", "vip", "premium", "elite", "luxury"]),
        
        // ========== 帽子 ==========
        SingleSymbols(name: "hat.widebrim",              version: .SF6, keywords: ["帽子", "宽檐帽", "遮阳帽"], keywords_en: ["wide brim hat", "sun hat", "summer hat"]),
        SingleSymbols(name: "hat.cap",                   version: .SF6, keywords: ["帽子", "鸭舌帽", "棒球帽", "休闲帽", "运动帽"], keywords_en: ["cap", "baseball cap", "sports cap", "casual hat"]),
        
        // ========== 上衣 ==========
        SingleSymbols(name: "tshirt",                    version: .SF3, keywords: ["衣服", "T恤", "上衣", "短袖"], keywords_en: ["clothes", "tshirt", "t-shirt", "top", "casual wear"]),
        SingleSymbols(name: "jacket",                    version: .SF6, keywords: ["衣服", "夹克", "外套", "外衣", "外套"], keywords_en: ["clothes", "jacket", "coat", "outerwear"]),
        SingleSymbols(name: "coat",                      version: .SF6, keywords: ["衣服", "大衣", "外套", "外衣", "外套"], keywords_en: ["clothes", "coat", "overcoat", "outerwear",]),
        
        // ========== 鞋类 ==========
        SingleSymbols(name: "shoe",                      version: .SF5, keywords: ["鞋子", "运动鞋", "球鞋"], keywords_en: ["shoe", "sneaker", "footwear", "shoes", "athletic shoes"]),
        
        // ========== 足迹 / 行为 ==========
        SingleSymbols(name: "shoeprints.fill",           version: .SF4, keywords: ["脚印", "足迹", "行走"], keywords_en: ["footprints", "walking"]),
        
        // ========== 娱乐与影视 ==========
        SingleSymbols(name: "film",                      version: .SF1, keywords: ["电影", "胶片", "影视", "视频", "影片"], keywords_en: ["film", "movie", "cinema", "video", "motion picture"]),
        SingleSymbols(name: "movieclapper",              version: .SF5, keywords: ["场记板", "电影", "拍摄", "影视"], keywords_en: ["clapperboard", "film", "movie", "shooting", "video"]),
        SingleSymbols(name: "ticket",                    version: .SF2, keywords: ["门票", "电影票", "入场券"], keywords_en: ["ticket", "movie ticket", "event ticket", "admission", "entry pass"]),
        
        // ========== 音频与存储 ==========
        SingleSymbols(name: "recordingtape",             version: .SF1, keywords: ["录音带", "磁带", "音乐",  "音频",  "复古"], keywords_en: ["cassette tape", "cassette tape", "recording tape", "music", "audio", "retro"]),
        
        // ========== 工具 / 观察 ==========
        SingleSymbols(name: "binoculars",                version: .SF2, keywords: ["望远镜", "双筒望远镜", "观察", "侦察"], keywords_en: ["binoculars", "telescope", "observation", "spotting"]),
        
        // ========== 安全 / 支持 ==========
        SingleSymbols(name: "lifepreserver",             version: .SF2, keywords: ["救生圈", "救援", "安全", "紧急",  "援助"], keywords_en: ["lifebuoy", "rescue", "safety", "emergency", "aid"]),
        
        // ========== 表情 / 面部（Emoji语义层） ==========
        SingleSymbols(name: "face.smiling",              version: .SF2, keywords: ["人脸", "笑脸", "微笑", "开心", "表情"], keywords_en: ["smiling face", "happy", "emoji", "smile", "positive expression"]),
        
        // ========== 视觉 / 感知 ==========
        SingleSymbols(name: "eye",                       version: .SF1, keywords: ["眼睛", "查看", "预览", "可见", "观察"], keywords_en: ["eye", "view", "preview", "visibility", "observe"]),
        SingleSymbols(name: "eyes",                      version: .SF2, keywords: ["眼睛", "双眼", "关注", "监视", "注意力", "观察"], keywords_en: ["eyes", "watching", "attention", "monitor", "focus"]),
        
        // ========== 面部器官 ==========
        SingleSymbols(name: "nose",                      version: .SF2, keywords: ["鼻子", "嗅觉", "面部"], keywords_en: ["nose", "smell", "sense of smell"]),
        SingleSymbols(name: "mouth",                     version: .SF2, keywords: ["嘴", "嘴唇"], keywords_en: ["mouth", "lip"]),
        SingleSymbols(name: "ear",                       version: .SF1, keywords: ["耳朵", "听觉", "听力"], keywords_en: ["ears", "hearing", "auditory power"]),
        SingleSymbols(name: "mustache",                  version: .SF2, keywords: ["胡须", "胡子"], keywords_en: ["beard", "whisker"]),
        
        // ========== 外观 / 风格 ==========
        SingleSymbols(name: "comb",                      version: .SF2, keywords: ["梳子", "梳头", "理发"], keywords_en: ["comb", "combing hair", "haircut"]),
        SingleSymbols(name: "eyeglasses",                version: .SF1, keywords: ["眼镜", "近视", "阅读", "视力"], keywords_en: ["glasses", "nearsightedness", "reading", "vision"]),
        SingleSymbols(name: "sunglasses",                version: .SF5, keywords: ["眼镜", "太阳镜", "墨镜", "防晒"], keywords_en: ["glasses", "eyeglasses", "sunglasses", "sunscreen"]),
        
        // ========== 手势 / UI交互 ==========
        SingleSymbols(name: "hand.raised",               version: .SF1, keywords: ["手", "手势", "举手", "请求", "提问"], keywords_en: ["hand", "gesture", "raise hand", "request", "ask a question"]),
        SingleSymbols(name: "hand.raised.palm.facing",   version: .SF6, keywords: ["手", "手势", "举手", "示意", "手掌"], keywords_en: ["hand", "gesture", "raise hand", "gesture", "palm"]),
        SingleSymbols(name: "hand.raised.fingers.spread", version: .SF4, keywords: ["手", "手势", "举手", "示意", "手掌", "交互"], keywords_en: ["hand", "gesture", "raise hand", "gesture", "palm", "interaction"]),
        SingleSymbols(name: "hand.thumbsup",             version: .SF1, keywords: ["手", "手势", "点赞", "认可", "赞同", "喜欢"], keywords_en: ["hand", "gesture", "thumbs up", "like", "approve", "good"]),
        SingleSymbols(name: "hand.thumbsdown",           version: .SF1, keywords: ["手", "手势", "反对", "不喜欢", "差评", "否定"], keywords_en: ["hand", "gesture", "thumbs down", "dislike", "bad", "negative"]),
        SingleSymbols(name: "hand.point.up",             version: .SF2, keywords: ["手", "手势", "手指", "点击", "指向", "选择", "交互", "触控"], keywords_en: ["hand", "gesture", "finger", "click", "point", "select", "interact", "touch"]),
        SingleSymbols(name: "hand.wave",                 version: .SF2, keywords: ["手", "手势", "挥手", "打招呼", "再见", "问候"], keywords_en: ["hand", "gesture", "wave", "hello", "goodbye", "greeting", "farewell"]),
        SingleSymbols(name: "hands.clap",                version: .SF2, keywords: ["手", "手势", "鼓掌", "拍手", "赞扬", "认可"], keywords_en: ["hand", "gesture", "clapping", "praise", "approval"]),
        
        // ========== UI / 组合图形 ==========
        SingleSymbols(name: "xmark.triangle.circle.square", version: .SF6, keywords: ["形状", "组合", "图形"], keywords_en: ["shape", "combination", "graphic"]),
        
        // ========== 二维码与扫描 ==========
        SingleSymbols(name: "qrcode",                    version: .SF1, keywords: ["二维码", "扫码", "扫描"], keywords_en: ["qr code", "scan", "scanning"]),
        SingleSymbols(name: "barcode",                   version: .SF1, keywords: ["条形码", "商品条码", "扫码", "扫描"], keywords_en: ["barcode", "product barcode", "scan", "scanning"]),
        SingleSymbols(name: "livephoto",                 version: .SF1, keywords: ["动态照片", "实况照片", "照片"], keywords_en: ["live photo", "motion photo", "photo"]),
        SingleSymbols(name: "f.cursive",                 version: .SF1, keywords: ["草书F", "手写体", "字母F"], keywords_en: ["cursive f", "f", "handwritten f", "letter f"]),
        SingleSymbols(name: "scope",                     version: .SF1, keywords: ["范围", "瞄准", "目标", "聚焦", "精确", "准星"], keywords_en: ["scope", "aim", "targeting", "focus", "precision", "crosshair"]),
        SingleSymbols(name: "rectangle.stack",           version: .SF1, keywords: ["堆叠", "图层"], keywords_en: ["stack", "cards", "layers", "pages"]),
        
        // ========== 数据可视化 ==========
        SingleSymbols(name: "chart.xyaxis.line",         version: .SF3, keywords: ["图表", "折线图", "统计"], keywords_en: ["graph", "line chart", "trend line", "statistics"]),
        SingleSymbols(name: "chart.bar",                 version: .SF1, keywords: ["图表", "柱状图", "统计"], keywords_en: [ "chart", "bar chart", "statistics"]),
        SingleSymbols(name: "chart.pie",                 version: .SF1, keywords: ["图表", "饼图", "统计"], keywords_en: ["chart", "pie chart", "statistics"]),
        SingleSymbols(name: "chart.dots.scatter",        version: .SF4, keywords: ["图表", "散点图", "统计"], keywords_en: ["chart", "scatter plot", "statistics"]),
        SingleSymbols(name: "chart.line.uptrend.xyaxis", version: .SF3, keywords: ["图表", "上升", "增长", "股市"], keywords_en: ["chart", "rise", "growth", "stock market"]),
        
        // ========== 业务指标 / 性能 ==========
        SingleSymbols(name: "gauge.with.needle",         version: .SF5, keywords: ["仪表盘", "性能", "速度", "指标"], keywords_en: ["gauge", "dashboard", "performance", "metrics"]),
        
        // ========== 信号 / 波形 ==========
        SingleSymbols(name: "waveform",                  version: .SF1, keywords: ["波形", "信号", "音频", "声波", "声音"], keywords_en: ["waveform", "signal", "audio wave", "sound", "voice"]),
        SingleSymbols(name: "waveform.path.ecg",         version: .SF1, keywords: ["心电图", "心率"], keywords_en: ["ecg", "heart rate"]),
        
        // ========== 商业 / 营销事件 ==========
        SingleSymbols(name: "burst",                     version: .SF1, keywords: ["爆发", "新品", "促销", "热点", "营销", "特卖"], keywords_en: ["burst", "new product", "promotion", "hot deal", "marketing highlight", "special offer"]),
        
        // ========== 时间 ==========
        SingleSymbols(name: "clock",                     version: .SF1, keywords: ["时钟", "时间", "钟表", "小时", "分钟"], keywords_en: ["clock", "time", "watch", "hours", "minutes"]),
        SingleSymbols(name: "alarm",                     version: .SF1, keywords: ["闹钟", "提醒", "闹铃", "起床", "通知提醒"], keywords_en: ["alarm", "alert", "reminder", "wake up", "notification"]),
        SingleSymbols(name: "stopwatch",                 version: .SF1, keywords: ["秒表", "计时", "测速", "比赛"], keywords_en: ["stopwatch", "timer", "speed test", "race"]),
        SingleSymbols(name: "timer",                     version: .SF1, keywords: ["倒计时", "定时器", "计时", "时间"], keywords_en: ["timer", "countdown"]),
        SingleSymbols(name: "hourglass",                 version: .SF1, keywords: ["沙漏", "等待", "倒计时", "时间", "加载"], keywords_en: ["hourglass", "waiting", "countdown", "loading", "time flow"]),
        
        // ========== 游戏 ==========
        SingleSymbols(name: "gamecontroller",            version: .SF1, keywords: ["游戏", "手柄","游戏手柄", "控制器"], keywords_en: ["game", "controller", "gamepad", "controller"]),
        SingleSymbols(name: "arcade.stick",              version: .SF5, keywords: ["游戏", "摇杆", "操控杆", "街机",  "格斗", "复古"], keywords_en: ["games", "joystick", "control joystick", "arcade", "fighting", "retro"]),
        SingleSymbols(name: "arcade.stick.console",      version: .SF5, keywords: ["游戏", "摇杆", "操控杆", "街机",  "格斗", "复古"], keywords_en: ["games", "joystick", "control joystick", "arcade", "fighting", "retro"]),
        SingleSymbols(name: "dpad",                      version: .SF2, keywords: ["游戏", "手柄", "方向键", "十字键"], keywords_en: ["game", "controller", "directional keys", "d-pad"]),
        SingleSymbols(name: "playstation.logo",          version: .SF4, keywords: ["游戏", "索尼", "主机平台"], keywords_en: ["game", "playstation", "ps", "sony gaming", "console platform", "ps5", "ps4"]),
        SingleSymbols(name: "xbox.logo",                 version: .SF4, keywords: ["游戏", "微软", "游戏主机"], keywords_en: ["game", "xbox", "microsoft gaming", "console platform"]),
        
        // ========== 饮品容器 ==========
        SingleSymbols(name: "cup.and.saucer",            version: .SF3, keywords: ["杯子", "茶杯", "咖啡杯", "茶具", "餐具"], keywords_en: ["cup", "teacup", "coffee cup", "tea set", "tableware"]),
        SingleSymbols(name: "mug",                       version: .SF4, keywords: ["杯子", "马克杯"], keywords_en: ["cup", "mug"]),
        SingleSymbols(name: "wineglass",                 version: .SF4, keywords: ["杯子", "酒杯", "红酒杯", "葡萄酒"], keywords_en: ["wine glass", "red wine", "glassware", "alcohol glass"]),
        SingleSymbols(name: "waterbottle",               version: .SF5, keywords: ["水瓶", "运动水壶", "水"], keywords_en: ["water bottle", "sports water bottle", "water"]),
        
        // ========== 饮品状态 ==========
        SingleSymbols(name: "cup.and.heat.waves",        version: .SF6, keywords: ["咖啡", "热饮", "热咖啡"], keywords_en: ["coffee", "hot drinks", "hot coffee"]),
        
        // ========== 食物实体 ==========
        SingleSymbols(name: "birthday.cake",             version: .SF4, keywords: ["生日", "蛋糕", "生日蛋糕", "甜点", "节日", "甜品"], keywords_en: ["birthday", "cake", "birthday cake", "dessert", "holiday", "sweet treats"]),
        SingleSymbols(name: "carrot",                    version: .SF4, keywords: ["胡萝卜", "蔬菜", "食物", "食材", "素食"], keywords_en: ["carrot", "vegetables", "food", "ingredients", "vegetarian"]),
        
        // ========== 用餐系统 ==========
        SingleSymbols(name: "fork.knife",                version: .SF3, keywords: ["餐具", "刀叉", "吃饭", "餐厅", "用餐", "餐饮"], keywords_en: ["tableware", "knives and forks", "eating", "restaurant", "dining", "catering"]),
        
        // ========== 网络与协议 ==========
        SingleSymbols(name: "bonjour",                   version: .SF2, keywords: ["局域网", "网络服务", "零配置网络"], keywords_en: ["bonjour", "local area network", "lan", "network services", "zero-configuration network"]),
        
        // ========== 测量与数学 ==========
        SingleSymbols(name: "scalemass",                 version: .SF2, keywords: ["质量", "重量", "天平", "称重", "测量", "秤"], keywords_en: ["mass", "weight", "balance", "weighing", "measurement", "scale"]),
        SingleSymbols(name: "angle",                     version: .SF4, keywords: ["角度", "几何", "夹角", "度数", "数学"], keywords_en: ["angle", "geometry", "degree", "measurement", "math"]),
        SingleSymbols(name: "compass.drawing",           version: .SF4, keywords: ["圆规", "绘图", "作图", "设计工具", "制图", "工具", "测量"], keywords_en: ["compass", "drawing", "construction", "design tools", "drafting", "tools", "measurement"]),
        
        // ========== 科学概念 ==========
        SingleSymbols(name: "atom",                      version: .SF2, keywords: ["原子", "科学", "物理", "化学", "微观结构"], keywords_en: ["atom", "physics", "chemistry", "science", "atomic structure"]),
        
        // ========== 信号与波 ==========
        SingleSymbols(name: "wave.3.up",                 version: .SF6, keywords: ["波形", "信号", "无线", "波动"], keywords_en: ["waveform", "signal", "wireless", "fluidity"]),
        
        // ========== 路径 / 流程 ==========
        SingleSymbols(name: "point.bottomleft.forward.to.point.topright.scurvepath", version: .SF5, keywords: ["路径", "曲线", "连接", "流程", "轨迹", "线路"], keywords_en: ["path", "curve", "connection", "flow", "track", "route"]),
        
        // ========== 电池 ==========
        SingleSymbols(name: "battery.0percent",        version: .SF5, keywords: ["电池", "电量", "缺电", "没电"], keywords_en: ["0", "battery", "power level","no power", "no electricity"]),
        SingleSymbols(name: "battery.25percent",        version: .SF5, keywords: ["电池", "电量"], keywords_en: ["25", "battery", "power level"]),
        SingleSymbols(name: "battery.50percent",        version: .SF5, keywords: ["电池", "电量"], keywords_en: ["50", "battery", "power level" ]),
        SingleSymbols(name: "battery.75percent",        version: .SF5, keywords: ["电池", "电量"], keywords_en: ["75", "battery", "power level"]),
        SingleSymbols(name: "battery.100percent",        version: .SF5, keywords: ["电池", "电量", "满电", "充满"], keywords_en: ["100", "battery", "power level", "fully charged", "fully charged"]),
        SingleSymbols(name: "battery.100percent.bolt",        version: .SF5, keywords: ["电池", "电量", "满电", "充满", "充电"], keywords_en: ["100", "battery", "power level", "fully charged", "fully charged", "charge"]),
        
        // ========== 状态 ==========
        SingleSymbols(name: "burn",                      version: .SF1, keywords: ["燃烧", "烧伤", "烫伤"], keywords_en: ["burn", "scald"]),
        
        // ========== 几何变换 ==========
        SingleSymbols(name: "skew",                      version: .SF1, keywords: ["倾斜", "斜切", "变形", "几何变换", "扭曲"], keywords_en: ["slant", "bevel", "deformation", "geometric transformation", "twist"]),
        
        // ========== 渲染 / 视觉效果 ==========
        SingleSymbols(name: "shadow",                    version: .SF2, keywords: ["阴影", "投影", "效果", "层次", "设计"], keywords_en: ["schatten", "projektion", "effekt", "ebenen", "design"]),
        
        // ========== 视图模式 ==========
        SingleSymbols(name: "view.2d",                   version: .SF1, keywords: ["二维", "平面", "视图"], keywords_en: ["2d", "two-dimensional", "plane", "view"]),
        SingleSymbols(name: "view.3d",                   version: .SF1, keywords: ["三维", "立体", "视图", "空间"], keywords_en: ["3d", "solid", "view", "space"]),
        
        // ========== 数值系统 ==========
        SingleSymbols(name: "numbers",                   version: .SF6, keywords: ["数字", "数值", "计算", "数目", "数据"], keywords_en: ["123", "numbers", "numeric", "values", "calculation", "data"]),
        
        // ========== 文字排版 ==========
        SingleSymbols(name: "character",                 version: .SF2, keywords: ["字符", "文字", "排版"], keywords_en: ["character", "text", "typography"]),
        SingleSymbols(name: "bold",                      version: .SF1, keywords: ["文字", "排版", "粗体", "加粗"], keywords_en: ["text", "typography", "bold", "font weight"]),
        SingleSymbols(name: "italic",                    version: .SF1, keywords: ["文字", "排版","斜体"], keywords_en: ["text", "typography", "italic"]),
        SingleSymbols(name: "underline",                 version: .SF1, keywords: ["文字", "排版", "下划线", "强调", "链接"], keywords_en: ["text", "typography", "text decoration", "emphasis", "link"]),
        SingleSymbols(name: "strikethrough",             version: .SF1, keywords: ["文字", "排版", "删除线", "划掉", "完成"], keywords_en: ["text", "typography", "strikethrough", "cross out", "completed"]),
        
        // ========== 数学符号 ==========
        SingleSymbols(name: "sum",                       version: .SF1, keywords: ["求和", "总和", "累加", "数学", "运算符", "统计"], keywords_en: ["Σ","sum", "sigma", "summation", "total", "math", "operator"]),
        SingleSymbols(name: "percent",                   version: .SF1, keywords: ["百分比", "比例", "占比",  "数学"], keywords_en: ["math", "%", "percent", "percentage", "ratio",  "proportion"]),
        SingleSymbols(name: "function",                  version: .SF1, keywords: ["函数", "方法", "编程", "数学"], keywords_en: ["f(x)", "function", "method", "programming", "math"]),
        SingleSymbols(name: "paragraphsign",             version: .SF2, keywords: ["段落", "符号", "排版"], keywords_en: ["¶", "paragraph", "pilcrow", "typography"]),
        
        // ========== 信息符号 ==========
        SingleSymbols(name: "info",                      version: .SF1, keywords: ["信息", "说明", "详情", "关于", "提示"], keywords_en: ["info", "information", "details", "about", "description"]),
        SingleSymbols(name: "info.circle",               version: .SF1, keywords: ["信息", "说明", "详情", "关于", "提示", "辅助信息", "帮助"], keywords_en: ["info", "information", "details", "about", "description", "assistance", "help"]),
        SingleSymbols(name: "questionmark",              version: .SF1, keywords: ["问号", "疑问", "未知", "不确定", "问题"], keywords_en: ["question", "unknown", "uncertain", "query", "help"]),
        SingleSymbols(name: "questionmark.circle",       version: .SF1, keywords: ["问号", "疑问", "未知", "不确定", "问题", "提示", "帮助"], keywords_en: ["question", "unknown", "uncertain", "query", "help", "hint", "prompt"]),
        SingleSymbols(name: "at",                        version: .SF1, keywords: ["提及", "标记", "邮箱", "引用"], keywords_en: ["@", "mention", "tag", "email", "reference"]),
        SingleSymbols(name: "exclamationmark",           version: .SF1, keywords: ["感叹号","警告", "注意", "重要", "提示", "警示"], keywords_en: ["warning", "attention", "important", "alert", "notice"]),
        SingleSymbols(name: "exclamationmark.2",         version: .SF2, keywords: ["感叹号", "警告", "注意", "重要", "提示", "警示", "紧急", "严重警告", "高风险", "重要提示"], keywords_en: ["2", "warning", "attention", "important", "alert", "notice", "high alert", "urgent", "serious", "critical"]),
        SingleSymbols(name: "exclamationmark.3",         version: .SF2, keywords: ["感叹号", "警告", "注意", "重要", "提示", "警示", "紧急", "极端警告", "最高警报", "严重风险"], keywords_en: ["3", "warning", "attention", "important", "alert", "notice", "high alert", "urgent", "serious", "critical", "emergency", "danger", "severe", "alarm"]),
        SingleSymbols(name: "exclamationmark.circle",    version: .SF1, keywords: ["感叹号","警告", "注意", "重要", "提示", "警示", "错误", "异常"], keywords_en: ["warning", "attention", "important", "alert", "notice", "Error", "exception"]),
        
        // ========== 数学运算符号 ==========
        SingleSymbols(name: "plus",                      version: .SF1, keywords: ["数学", "运算符", "加号", "增加", "添加", "加法", "正", "新建", "创建", "插入"], keywords_en: ["math", "operators", "plus", "add", "increase", "addition", "positive", "new", "create", "insert"]),
        SingleSymbols(name: "plus.circle",               version: .SF1, keywords: ["圆形", "加号", "增加", "添加", "加法", "正", "新建", "创建", "插入"], keywords_en: ["circle", "plus", "add", "increase", "addition", "positive", "new", "create", "insert"]),
        SingleSymbols(name: "plus.square",               version: .SF1, keywords: ["正方形", "加号", "增加", "添加", "加法", "正", "新建", "创建", "插入"], keywords_en: ["square", "plus", "add", "increase", "addition", "positive", "new", "create", "insert"]),
        SingleSymbols(name: "minus",                     version: .SF1, keywords: ["数学", "运算符", "减号", "减少", "删除", "移除", "减法", "移出", "清除"], keywords_en: ["math", "operators", "minus", "subtract", "remove", "decrease", "negative", "delete", "square minus", "clear"]),
        SingleSymbols(name: "minus.circle",              version: .SF1, keywords: ["圆形", "减号", "减少", "删除", "移除", "减法", "移出", "清除"], keywords_en: ["circle", "minus", "subtract", "remove", "decrease", "negative", "delete", "square minus", "clear"]),
        SingleSymbols(name: "minus.square",              version: .SF1, keywords: ["正方形", "减号", "减少", "删除", "移除", "减法", "移出", "清除"], keywords_en: ["square", "minus", "subtract", "remove", "decrease", "negative", "delete", "square minus", "clear"]),
        SingleSymbols(name: "plusminus",                 version: .SF1, keywords: ["数学", "运算符", "正负", "加减", "范围", "差值"], keywords_en: ["math", "operators", "plus minus", "±", "tolerance", "range", "variation"]),
        SingleSymbols(name: "plusminus.circle",                 version: .SF1, keywords: ["圆形", "正负", "加减", "范围", "差值"], keywords_en: ["circle", "plus minus", "±", "tolerance", "range", "variation"]),
        SingleSymbols(name: "plus.forwardslash.minus",   version: .SF3, keywords: ["数学", "运算符", "加减", "正负", "切换"], keywords_en: ["math", "operators", "toggle", "plus minus", "variation"]),
        SingleSymbols(name: "multiply",                  version: .SF1, keywords: ["数学", "运算符", "乘号", "关闭", "取消", "退出", "删除", "清除", "叉号"], keywords_en: ["math", "operators", "×", "multiply", "close", "cancel", "exit", "delete", "clear", "x button"]),
        SingleSymbols(name: "multiply.circle",           version: .SF1, keywords: ["圆形", "乘号", "关闭", "取消", "退出", "删除", "清除", "叉号"], keywords_en: ["circle", "×", "multiply", "close", "cancel", "exit", "delete", "clear", "x button"]),
        SingleSymbols(name: "multiply.square",           version: .SF1, keywords: ["正方形","乘号", "关闭", "取消", "退出", "删除", "清除", "叉号"], keywords_en: ["square", "×", "multiply", "close", "cancel", "exit", "delete", "clear", "x button"]),
        SingleSymbols(name: "divide",                    version: .SF1, keywords: ["数学", "运算符", "除号", "除法"], keywords_en: ["÷", "math", "operators", "divide", "division"]),
        SingleSymbols(name: "equal",                     version: .SF1, keywords: ["数学", "运算符","等号", "等于", "相等", "全等", "赋值"], keywords_en: ["=", "math", "operators", "equals", "same", "strictly equal", "assign value"]),
        SingleSymbols(name: "notequal",                  version: .SF6, keywords: ["数学", "运算符", "等号", "等于", "不相等", "不等于", "不同"], keywords_en: ["≠", "math", "operators", "equals", "same", "different", "not equal to"]),
        
        // ========== 编程语法 ==========
        SingleSymbols(name: "chevron.left.forwardslash.chevron.right", version: .SF3, keywords: ["代码", "标签", "尖括号", "编程"], keywords_en: ["code", "html", "tag", "</>", "programming"]),
        SingleSymbols(name: "ellipsis.curlybraces",      version: .SF3, keywords: ["代码", "代码块", "函数体", "大括号", "结构", "省略", "函数体", "编程"], keywords_en: ["code block", "function body", "curly braces", "structure", "omission", "programming", "{...}"]),
        
        // ========== 操作符号 ==========
        SingleSymbols(name: "xmark",                     version: .SF1, keywords: ["关闭", "取消", "错误", "删除", "退出", "终止", "清除", "移除"], keywords_en: ["close", "cancel", "error", "delete", "exit", "terminate", "clear", "remove", "dismiss", "stop"]),
        SingleSymbols(name: "xmark.circle",              version: .SF1, keywords: ["圆形", "关闭", "取消", "错误", "删除", "退出", "终止", "清除", "移除"], keywords_en: ["circle", "close", "cancel", "error", "delete", "exit", "terminate", "clear", "remove", "dismiss", "stop"]),
        SingleSymbols(name: "xmark.square",              version: .SF1, keywords: ["正方形", "关闭", "取消", "错误", "删除", "退出", "终止", "清除", "移除"], keywords_en: ["square", "close", "cancel", "error", "delete", "exit", "terminate", "clear", "remove", "dismiss", "stop"]),
        SingleSymbols(name: "checkmark",                 version: .SF1, keywords: ["对勾", "对号", "完成", "确认", "成功", "通过", "勾选", "选中"], keywords_en: ["checkmark", "check mark", "done", "confirm", "success", "passed", "checked", "selected", "approved", "completed", "selection"]),
        SingleSymbols(name: "checkmark.circle",          version: .SF1, keywords: ["圆形", "对勾", "对号", "完成", "确认", "成功", "通过", "勾选", "选中"], keywords_en: ["circle", "checkmark", "check mark", "done", "confirm", "success", "passed", "checked", "selected", "approved", "completed", "selection"]),
        SingleSymbols(name: "checkmark.square",          version: .SF1, keywords: ["正方形", "对勾", "对号", "完成", "确认", "成功", "通过", "勾选", "选中"], keywords_en: ["square", "checkmark", "check mark", "done", "confirm", "success", "passed", "checked", "selected", "approved", "completed", "selection"]),
        
        // ========== 方向箭头 ==========
        // ========== 方向箭头（左） ==========
        SingleSymbols(name: "chevron.left",              version: .SF1, keywords: ["方向", "返回", "左", "箭头", "上一步", "退出", "后退"], keywords_en: ["back", "left", "arrow", "previous", "return", "chevron", "exit", "dismiss", "direction"]),
        SingleSymbols(name: "chevron.left.circle",              version: .SF1, keywords: ["方向", "圆形","返回", "左", "箭头", "上一步", "退出", "后退"], keywords_en: ["circle", "back", "left", "arrow", "previous", "return", "chevron", "exit", "dismiss", "direction"]),
        SingleSymbols(name: "chevron.left.square",              version: .SF1, keywords: ["方向", "正方形", "返回", "左", "箭头", "上一步", "退出", "后退"], keywords_en: ["square", "back", "left", "arrow", "previous", "return", "chevron", "exit", "dismiss", "direction"]),
        
        // ========== 方向箭头（右） ==========
        SingleSymbols(name: "chevron.forward",           version: .SF2, keywords: ["方向", "前进", "右", "箭头", "下一步", "更多", "继续", "进入"], keywords_en: ["forward", "right", "chevron", "next", "more", "continue", "proceed", "enter", "direction"]),
        SingleSymbols(name: "chevron.forward.circle",           version: .SF2, keywords: ["方向", "圆形"], keywords_en: ["circle", "forward", "right", "chevron", "next", "more", "continue", "proceed", "enter", "direction"]),
        SingleSymbols(name: "chevron.forward.square",           version: .SF2, keywords: ["方向", "正方形"], keywords_en: ["square", "forward", "right", "chevron", "next", "more", "continue", "proceed", "enter", "direction"]),
        
        // ========== 方向箭头（上） ==========
        SingleSymbols(name: "chevron.up",                version: .SF1, keywords: ["方向", "上", "箭头", "收起", "折叠", "隐藏", "上滑"], keywords_en: ["direction", "up", "arrow", "collapse", "fold", "hide", "slide up"]),
        SingleSymbols(name: "chevron.up.circle",                version: .SF1, keywords: ["方向", "圆形", "上", "箭头", "收起", "折叠", "隐藏", "上滑"], keywords_en: ["circle", "direction", "up", "arrow", "collapse", "fold", "hide", "slide up"]),
        SingleSymbols(name: "chevron.up.square",                version: .SF1, keywords: ["方向", "正方形", "上", "箭头", "收起", "折叠", "隐藏", "上滑"], keywords_en: ["square", "direction", "up", "arrow", "collapse", "fold", "hide", "slide up"]),
        
        // ========== 方向箭头（下） ==========
        SingleSymbols(name: "chevron.down",              version: .SF1, keywords: ["方向", "下", "箭头", "展开", "下拉", "更多", "显示", "展开"], keywords_en: ["direction", "arrow", "down", "expand", "dropdown", "more", "show", "expand"]),
        SingleSymbols(name: "chevron.down.circle",              version: .SF1, keywords: ["方向", "圆形", "下", "箭头", "展开", "下拉", "更多", "显示", "展开"], keywords_en: ["circle", "arrow", "direction", "down", "expand", "dropdown", "more", "show", "expand"]),
        SingleSymbols(name: "chevron.down.square",              version: .SF1, keywords: ["方向", "正方形", "下", "箭头", "展开", "下拉", "更多", "显示", "展开"], keywords_en: ["square", "arrow", "direction", "down", "expand", "dropdown", "more", "show", "expand"]),
        
        // ========== 方向箭头（切换） ==========
        SingleSymbols(name: "chevron.up.chevron.down",   version: .SF1, keywords: ["方向", "箭头", "上下", "排序", "选择", "滚动", "切换"], keywords_en: ["direction", "arrow", "up", "down", "sort", "select", "scroll", "toggle"]),
        
        // ========== 方向箭头（向左转） ==========
        SingleSymbols(name: "arrow.uturn.left",          version: .SF1, keywords: ["方向", "返回", "左", "箭头", "上一步", "退出", "后退", "撤销"], keywords_en: ["back", "left", "arrow", "previous", "return", "chevron", "exit", "dismiss", "direction", "cancel"]),
        SingleSymbols(name: "arrow.uturn.left.circle",          version: .SF1, keywords: ["圆形", "方向", "返回", "左", "箭头", "上一步", "退出", "后退", "撤销"], keywords_en: ["circle", "back", "left", "arrow", "previous", "return", "chevron", "exit", "dismiss", "direction", "cancel"]),
        SingleSymbols(name: "arrow.uturn.left.square",          version: .SF1, keywords: ["正方形", "方向", "返回", "左", "箭头", "上一步", "退出", "后退", "撤销"], keywords_en: ["square", "back", "left", "arrow", "previous", "return", "chevron", "exit", "dismiss", "direction", "cancel"]),
        
        // ========== 方向箭头（向右转） ==========
        SingleSymbols(name: "arrow.uturn.right",          version: .SF1, keywords: ["方向", "箭头", "右", "转向", "重做"], keywords_en: ["direction", "arrow", "right", "turn", "u-turn", "redo"]),
        SingleSymbols(name: "arrow.uturn.right.circle",          version: .SF1, keywords: ["圆形", "方向", "箭头", "右", "转向", "重做"], keywords_en: ["circle", "direction", "arrow", "right", "turn", "u-turn", "redo"]),
        SingleSymbols(name: "arrow.uturn.right.square",          version: .SF1, keywords: ["正方形", "方向", "箭头", "右", "转向", "重做"], keywords_en: ["square", "direction", "arrow", "right", "turn", "u-turn", "redo"]),
    
        // ========== 方向箭头（向上转） ==========
        SingleSymbols(name: "arrow.uturn.up",          version: .SF1, keywords: ["方向", "上", "箭头", "返回", "掉头", "反转", "拐弯", "转向"], keywords_en: ["direction", "up", "arrow", "return", "u-turn", "reverse", "turn", "switch"]),
        SingleSymbols(name: "arrow.uturn.up.circle",          version: .SF1, keywords: ["方向", "圆形", "上", "箭头", "返回", "掉头", "反转", "拐弯", "转向"], keywords_en: ["direction", "circle", "up", "arrow", "return", "u-turn", "reverse", "turn", "switch"]),
        SingleSymbols(name: "arrow.uturn.up.square",          version: .SF1, keywords: ["方向", "正方形", "上", "箭头", "返回", "掉头", "反转", "拐弯", "转向"], keywords_en: ["direction", "square", "up", "arrow", "return", "u-turn", "reverse", "turn", "switch"]),
        
        // ========== 方向箭头（向下转） ==========
        SingleSymbols(name: "arrow.uturn.down",          version: .SF1, keywords: ["方向", "下", "箭头", "返回", "掉头", "反转", "拐弯", "转向"], keywords_en: ["direction", "down", "arrow", "return", "u-turn", "reverse", "turn", "switch"]),
        SingleSymbols(name: "arrow.uturn.down.circle",          version: .SF1, keywords: ["方向", "圆形", "下", "箭头", "返回", "掉头", "反转", "拐弯", "转向"], keywords_en: ["direction", "circle", "down", "arrow", "return", "u-turn", "reverse", "turn", "switch"]),
        SingleSymbols(name: "arrow.uturn.down.square",          version: .SF1, keywords: ["方向", "正方形", "下", "箭头", "返回", "掉头", "反转", "拐弯", "转向"], keywords_en: ["direction", "square", "down", "arrow", "return", "u-turn", "reverse", "turn", "switch"]),
        
        // ========== 方向箭头（复杂） ==========
        SingleSymbols(name: "arrow.up.and.down.and.arrow.left.and.right", version: .SF2, keywords: ["方向", "箭头", "移动", "拖动", "选中", "拖拽"], keywords_en: ["direction", "arrow", "move", "drag", "select", "drag and drop"]),
        
        // ========== 方向箭头（放大） ==========
        SingleSymbols(name: "arrow.up.left.and.arrow.down.right", version: .SF1, keywords: ["方向", "箭头", "放大", "全屏", "展开", "扩大", "最大化"], keywords_en: ["direction", "arrow", "expand", "fullscreen", "zoom in", "maximize", "enlarge", "scale up"]),
        SingleSymbols(name: "arrow.down.left.and.arrow.up.right", version: .SF5, keywords: ["方向", "箭头", "放大", "全屏", "展开", "扩大", "最大化"], keywords_en: ["direction", "arrow", "expand", "fullscreen", "zoom in", "maximize", "enlarge", "scale up"]),
        
        // ========== 方向箭头（缩小） ==========
        SingleSymbols(name: "arrow.down.right.and.arrow.up.left", version: .SF1, keywords: ["方向", "箭头", "缩小", "退出全屏", "收起", "关闭", "最小化"], keywords_en: ["direction", "arrow", "minimize", "exit fullscreen", "collapse", "close", "minimize"]),
        SingleSymbols(name: "arrow.up.right.and.arrow.down.left", version: .SF5, keywords: ["方向", "箭头", "缩小", "退出全屏", "收起", "关闭", "最小化"], keywords_en: ["direction", "arrow", "minimize", "exit fullscreen", "collapse", "close", "minimize"]),
        
        // ========== 方向箭头（复杂） ==========
        SingleSymbols(name: "arrow.3.trianglepath",      version: .SF1, keywords: ["方向", "箭头", "循环", "刷新", "循环", "轮换"], keywords_en: ["direction", "arrow", "loop", "refresh", "rotate"]),
        SingleSymbols(name: "arrow.trianglehead.merge",  version: .SF6, keywords: ["方向", "箭头", "合并", "整合", "连接", "协作"], keywords_en: ["direction", "arrow", "merge", "integrate", "connect", "collaborate"]),
        SingleSymbols(name: "arrow.trianglehead.branch", version: .SF6, keywords: ["方向", "箭头", "分支", "派生", "分叉", "分流"], keywords_en: ["direction", "arrow", "branch", "derivative", "fork", "split"]),
        SingleSymbols(name: "arrow.trianglehead.swap",   version: .SF6, keywords: ["方向", "箭头", "传输", "连接"], keywords_en: ["direction", "arrow", "transmission", "connect"]),
        SingleSymbols(name: "arrow.down.left.arrow.up.right", version: .SF5, keywords: ["方向", "箭头", "转换", "双向", "交换", "互换", "切换"], keywords_en: ["direction", "arrow", "conversion", "bidirectional", "exchange", "interchange", "switch"]),
        SingleSymbols(name: "arrow.up.left.arrow.down.right", version: .SF5, keywords: ["方向", "箭头", "转换", "双向", "交换", "互换", "切换"], keywords_en: ["direction", "arrow", "conversion", "bidirectional", "exchange", "interchange", "switch"]),
        
        // ========== 三角箭头 ==========
        // ========== 三角箭头（左） ==========
        SingleSymbols(name: "arrowtriangle.left",        version: .SF1, keywords: ["方向", "箭头", "三角形", "左", "后退", "上一个", "返回"], keywords_en: ["direction", "arrow", "triangle"]),
        
        // ========== 三角箭头（右） ==========
        SingleSymbols(name: "arrowtriangle.right",       version: .SF1, keywords: ["方向", "箭头", "三角形", "右", "前进", "下一个", "继续", "播放"], keywords_en: ["direction", "arrow", "triangle"]),
        
        // ========== 三角箭头（上） ==========
        SingleSymbols(name: "arrowtriangle.up",          version: .SF1, keywords: ["方向", "箭头", "三角形", "上", "收起", "顶部"], keywords_en: ["direction", "arrow", "triangle", "top", "collapse"]),
        
        // ========== 三角箭头（下） ==========
        SingleSymbols(name: "arrowtriangle.down",        version: .SF1, keywords: ["方向", "箭头", "三角形", "下", "下拉", "底部", "展开", "更多"], keywords_en: ["direction", "arrow", "triangle", "down", "dropdown", "bottom", "expand", "more"]),
        
        
        // ========== 方向形状箭头 ==========
        SingleSymbols(name: "arrowshape.left",           version: .SF4, keywords: ["方向", "箭头", "形状", "左", "返回", "后退", "回退", "退出"], keywords_en: ["direction", "arrow", "shape", "left", "back", "exit"]),
        SingleSymbols(name: "arrowshape.right",          version: .SF4, keywords: ["方向", "箭头", "形状", "右", "前进", "发送", "下一步", "进入"], keywords_en: ["direction", "arrow", "shape", "right", "forward", "send", "next", "enter"]),
        SingleSymbols(name: "arrowshape.up",             version: .SF5, keywords: ["方向", "箭头", "形状", "上", "上传", "发送", "推送"], keywords_en: ["direction", "arrow", "shape", "up", "upload", "send", "push"]),
        SingleSymbols(name: "arrowshape.down",           version: .SF5, keywords: ["方向", "箭头", "形状", "下", "下载", "导入", "获取", "拉取"], keywords_en: ["direction", "arrow", "shape", "down", "download", "import", "get", "pull"]),
        
        // ========== 方向形状箭头（复杂） ==========
        SingleSymbols(name: "arrowshape.left.arrowshape.right", version: .SF5, keywords: ["方向", "形状", "箭头", "切换", "交换", "左右"], keywords_en: ["direction", "arrow", "shape", "switch", "swap", "left and right"]),
        SingleSymbols(name: "arrowshape.turn.up.left",   version: .SF1, keywords: ["方向", "箭头", "形状", "撤销", "回复", "返回", "撤回"], keywords_en: ["direction", "arrow", "shape", "undo", "reply", "back", "revert", "rollback"]),
        SingleSymbols(name: "arrowshape.turn.up.left.2", version: .SF1, keywords: ["方向", "箭头", "形状", "全部回复", "群回复"], keywords_en: ["direction", "arrow", "shape", "reply all", "bulk reply"]),
        
        // ========== 输入控制 ==========
        SingleSymbols(name: "arrowkeys",                 version: .SF5, keywords: ["方向", "箭头", "方向键", "按键", "键盘", "控制"], keywords_en: ["direction", "arrow", "arrow keys", "keys", "keyboard", "controls"]),
        
        // ========== 系统品牌 ==========
        SingleSymbols(name: "apple.logo",                version: .SF4, keywords: ["苹果", "系统", "标志", "品牌"], keywords_en: ["apple", "brand", "logo", "system", "corporate"]),
        
        // ========== 导出 / 导入 / 分享（核心动作类） ==========
        SingleSymbols(name: "square.and.arrow.up",       version: .SF1, keywords: ["分享", "导出", "上传", "发送", "共享"], keywords_en: ["share", "export", "upload", "send"]),
        SingleSymbols(name: "rectangle.portrait.and.arrow.right", version: .SF3, keywords: ["登出", "退出", "离开", "导出"], keywords_en: ["logout", "exit", "leave", "export", "quit"]),
        SingleSymbols(name: "square.and.arrow.down",     version: .SF1, keywords: ["导入", "下载", "保存", "接收", "存入"], keywords_en: ["import", "download", "save", "receive", "store"]),
        
        // =============== 数字 =========
        SingleSymbols(name: "0.circle",version: .SF6,keywords: ["0", "数字", "圆形", "编号", "序号"],keywords_en: ["0", "circle", "number", "index"]),
        SingleSymbols(name: "0.square",version: .SF6,keywords: ["0", "数字", "正方形", "编号", "序号"],keywords_en: ["0", "square", "number", "index"]),
        SingleSymbols(name: "1.circle",version: .SF6,keywords: ["1", "数字", "圆形", "编号", "序号"],keywords_en: ["1", "circle", "number", "index"]),
        SingleSymbols(name: "1.square",version: .SF6,keywords: ["1", "数字", "正方形", "编号", "序号"],keywords_en: ["1", "square", "number", "index"]),
        SingleSymbols(name: "2.circle",version: .SF6,keywords: ["2", "数字", "圆形", "编号", "序号"],keywords_en: ["2", "circle", "number", "index"]),
        SingleSymbols(name: "2.square",version: .SF6,keywords: ["2", "数字", "正方形", "编号", "序号"],keywords_en: ["2", "square", "number", "index"]),
        SingleSymbols(name: "3.circle",version: .SF6,keywords: ["3", "数字", "圆形", "编号", "序号"],keywords_en: ["3", "circle", "number", "index"]),
        SingleSymbols(name: "3.square",version: .SF6,keywords: ["3", "数字", "正方形", "编号", "序号"],keywords_en: ["3", "square", "number", "index"]),
        SingleSymbols(name: "4.circle",version: .SF6,keywords: ["4", "数字", "圆形", "编号", "序号"],keywords_en: ["4", "circle", "number", "index"]),
        SingleSymbols(name: "4.square",version: .SF6,keywords: ["4", "数字", "正方形", "编号", "序号"],keywords_en: ["4", "square", "number", "index"]),
        SingleSymbols(name: "5.circle",version: .SF6,keywords: ["5", "数字", "圆形", "编号", "序号"],keywords_en: ["5", "circle", "number", "index"]),
        SingleSymbols(name: "5.square",version: .SF6,keywords: ["5", "数字", "正方形", "编号", "序号"],keywords_en: ["5", "square", "number", "index"]),
        SingleSymbols(name: "6.circle",version: .SF6,keywords: ["6", "数字", "圆形", "编号", "序号"],keywords_en: ["6", "circle", "number", "index"]),
        SingleSymbols(name: "6.square",version: .SF6,keywords: ["6", "数字", "正方形","编号", "序号"],keywords_en: ["6", "square", "number", "index"]),
        SingleSymbols(name: "7.circle",version: .SF6,keywords: ["7", "数字", "圆形", "编号", "序号"],keywords_en: ["7", "circle", "number", "index"]),
        SingleSymbols(name: "7.square",version: .SF6,keywords: ["7", "数字", "正方形","编号", "序号"],keywords_en: ["7", "square", "number", "index"]),
        SingleSymbols(name: "8.circle",version: .SF6,keywords: ["8", "数字", "圆形", "编号", "序号"],keywords_en: ["8", "circle", "number", "index"]),
        SingleSymbols(name: "8.square",version: .SF6,keywords: ["8", "数字", "正方形", "编号", "序号"],keywords_en: ["8", "square", "number", "index"]),
        SingleSymbols(name: "9.circle",version: .SF6,keywords: ["9", "数字", "圆形", "编号", "序号"],keywords_en: ["9", "circle", "number", "index"]),
        SingleSymbols(name: "9.square",version: .SF6,keywords: ["9", "数字", "正方形", "编号", "序号"],keywords_en: ["9", "square", "number", "index"]),
        
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
    
    let filtered = SingleSymbols.listSymbols.filter {
        UIImage(systemName: $0.name) != nil
    }

    var availableSymbols: [SingleSymbols] {
        Array(filtered.prefix(200))
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
            item.keywords_en.contains { $0.localizedCaseInsensitiveContains(searchText) } ||
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
