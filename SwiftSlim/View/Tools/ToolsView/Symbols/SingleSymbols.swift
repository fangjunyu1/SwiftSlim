//
//  SingleSymbols.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/4/30.
//

import SwiftUI

struct SingleSymbols: Identifiable {
    var id: String { name }
    var name: String
    var version: SymbolsVersion
    var keywords: [String]
    var keywords_en: [String]
    
    // MARK: - 完整符号列表
    static let listSymbols: [SingleSymbols] = [
        
        // ========== 书写与编辑 ==========
        SingleSymbols(name: "pencil",                    version: .SF1, keywords: ["pen", "pencil", "write", "writing", "edit", "drawing", "edit 2", "modify", "pen 2"], keywords_en: ["pen", "pencil", "write", "writing", "draw", "drawing", "edit", "annotate"]),
        SingleSymbols(name: "pencil.tip",                version: .SF1, keywords: ["pencil", "pen", "pencil tip", "tip", "write", "drawing", "draw", "annotate"], keywords_en: ["pen", "pencil", "pencil tip", "tip", "nib", "write", "draw", "annotate", "mark"]),
        SingleSymbols(name: "eraser",                    version: .SF4, keywords: ["eraser", "erase", "clear", "clear 2", "delete", "remove"], keywords_en: ["eraser", "erase", "clear", "remove", "delete"]),
        SingleSymbols(name: "square.and.pencil",         version: .SF1, keywords: ["pencil", "pen", "edit", "modify", "write 2", "create", "new"], keywords_en: ["pen", "pencil", "edit", "compose", "write", "create", "new", "draft"]),
        SingleSymbols(name: "scribble",                  version: .SF1, keywords: ["scribble", "handwriting", "draw 2", "sketch", "drawing", "line", "scribble 2"], keywords_en: ["scribble", "handwriting", "draw", "sketch", "doodle", "line"]),
        SingleSymbols(name: "highlighter",               version: .SF2, keywords: ["pencil", "highlighter", "highlight", "draw", "annotate", "annotate 2", "pen 3"], keywords_en: ["pen", "highlighter", "highlight", "mark", "marker", "annotate"]),
        SingleSymbols(name: "trash",                     version: .SF1, keywords: ["trash", "delete", "remove", "clear 2", "discard", "trash 2"], keywords_en: ["trash", "delete", "remove", "bin", "discard"]),
        SingleSymbols(name: "scissors",                  version: .SF1, keywords: ["scissors", "cut", "clip", "trim", "edit"], keywords_en: ["scissors", "cut", "clip", "trim"]),
        SingleSymbols(name: "crop",                      version: .SF1, keywords: ["clip", "trim 2", "cut 2", "resize", "crop"], keywords_en: ["crop", "trim", "cut", "resize"]),
        
        // ========== 文件与存储 ==========
        SingleSymbols(name: "folder",                    version: .SF1, keywords: ["folder", "directory", "organize", "archive", "storage", "folder 2"], keywords_en: ["folder", "directory", "organize", "archive", "storage"]),
        SingleSymbols(name: "tray",                      version: .SF1, keywords: ["tray", "inbox", "organization", "storage 2"], keywords_en: ["tray", "inbox", "organization", "storage"]),
        SingleSymbols(name: "externaldrive",             version: .SF2, keywords: ["external drive", "portable drive", "hard drive", "disk", "storage 3", "backup"], keywords_en: ["external drive", "portable drive", "hard drive", "disk", "storage", "backup"]),
        SingleSymbols(name: "archivebox",                version: .SF1, keywords: ["archive", "archive box", "organization", "box", "package", "folder 2"], keywords_en: ["archive", "archive box", "storage", "box", "package", "store", "save"]),
        SingleSymbols(name: "document",                  version: .SF6, keywords: ["file", "document", "page", "paper", "record", "material"], keywords_en: ["document", "file", "page", "paper", "record", "material"]),
        SingleSymbols(name: "arrow.down.document",       version: .SF6, keywords: ["download", "download file", "save", "import", "receive", "document 2"], keywords_en: ["download", "download file", "save", "import", "receive", "document", "file"]),
        SingleSymbols(name: "text.document",             version: .SF6, keywords: ["text file", "txt", "document", "file"], keywords_en: ["text file", "txt", "document", "file"]),
        SingleSymbols(name: "zipper.page",               version: .SF6, keywords: ["zip", "zip file", "package", "archive", "file"], keywords_en: ["zip", "zip file", "archive", "archiving", "compress", "compressed file", "file"]),
        SingleSymbols(name: "document.on.document",      version: .SF6, keywords: ["copy", "copy duplicate", "duplicate copy", "repeat"], keywords_en: ["copy", "duplicate", "document copy", "file copy", "document", "file"]),
        SingleSymbols(name: "clipboard",                 version: .SF4, keywords: ["clipboard", "paste", "copy", "clipboard 2", "content"], keywords_en: ["clipboard", "paste", "copy"]),
        SingleSymbols(name: "text.page",                 version: .SF6, keywords: ["text", "page", "document", "content", "article"], keywords_en: ["text", "page", "document", "content", "article"]),
        SingleSymbols(name: "text.page.badge.magnifyingglass",                 version: .SF6, keywords: ["search document", "find document", "search text", "find text", "page search", "lookup"], keywords_en: ["search document", "find document", "search text", "find text", "page search", "lookup"]),
        SingleSymbols(name: "note",                      version: .SF2, keywords: ["note", "notes", "memo", "clipboard 2", "pen 2", "note 2"], keywords_en: ["note", "notes", "memo", "record", "annotation"]),
        SingleSymbols(name: "scroll",                    version: .SF2, keywords: ["scroll", "document 3", "text", "document", "paper 2", "paper"], keywords_en: ["scroll", "document", "history", "archive", "paper"]),
        SingleSymbols(name: "checklist",                 version: .SF3, keywords: ["checklist", "todo", "list", "task", "check", "items"], keywords_en: ["checklist", "todo", "list", "task", "check", "items"]),
        SingleSymbols(name: "square.text.square",        version: .SF3, keywords: ["text box", "text 2", "content 2", "text", "text frame", "content"], keywords_en: ["text box", "text", "content", "layout", "text frame"]),
        
        // =========== 日历 ===========
        SingleSymbols(name: "calendar",version: .SF1,keywords: ["calendar", "date", "schedule", "time", "arrangement", "plan", "event", "reminder"],keywords_en: ["calendar", "date", "schedule", "time", "plan", "event", "reminder"]),

        SingleSymbols(name: "calendar.and.person",version: .SF6,keywords: ["calendar", "personal calendar", "schedule", "schedule 2", "appointment", "arrangement"],keywords_en: ["calendar", "personal calendar", "user calendar", "schedule", "appointment", "meeting", "event"]),
        
        // ========== 阅读与书籍 ==========
        SingleSymbols(name: "book",                      version: .SF1, keywords: ["book", "book volume", "books", "reading", "library book", "textbook", "learning", "course"], keywords_en: ["book", "read", "reading", "textbook", "study", "course"]),
        SingleSymbols(name: "books.vertical",            version: .SF2, keywords: ["books 2", "library", "books", "bookshelf", "reading 2", "reading", "books 3", "library book"], keywords_en: ["books", "library", "collection", "bookshelf", "reading"]),
        SingleSymbols(name: "book.closed",               version: .SF2, keywords: ["book", "book volume", "books", "close", "unopened", "unread", "closed book", "closed book 2"], keywords_en: ["closed book", "book", "cover", "closed", "unopened", "unread"]),
        SingleSymbols(name: "menucard",                  version: .SF3, keywords: ["menu", "food menu", "order"], keywords_en: ["menu", "food menu", "order"]),
        SingleSymbols(name: "greetingcard",              version: .SF2, keywords: ["card", "greeting card", "invite", "invitation", "holiday", "card 2"], keywords_en: ["card", "greeting card", "invite", "invitation", "holiday"]),
        SingleSymbols(name: "magazine",                  version: .SF3, keywords: ["magazine", "journal", "reading", "periodical", "read", "content", "magazine 2"], keywords_en: ["magazine", "journal", "publication", "periodical", "read", "content"]),
        SingleSymbols(name: "newspaper",                 version: .SF2, keywords: ["newspaper", "news", "media", "periodical", "report", "reading", "newspaper 2", "newspaper 3"], keywords_en: ["newspaper", "news", "media", "press", "report", "headline"]),
        SingleSymbols(name: "bookmark",                  version: .SF1, keywords: ["bookmark", "favorite", "annotate", "save", "draw"], keywords_en: ["bookmark", "favorite", "save", "mark"]),
        
        // ========== 教育与学习 ==========
        SingleSymbols(name: "graduationcap",             version: .SF2, keywords: ["graduation cap", "graduation", "school", "education", "academic", "university", "student", "learning 2", "learning"], keywords_en: ["graduation cap", "graduation", "school", "education", "academic", "university", "student", "learning"]),
        SingleSymbols(name: "ruler",                     version: .SF2, keywords: ["ruler", "measure", "measurement", "length", "scale", "size", "design", "drawing"], keywords_en: ["ruler", "measure", "measurement", "length", "scale", "size", "design", "drawing"]),
        SingleSymbols(name: "backpack",                  version: .SF4, keywords: ["backpack", "school bag", "learning 2", "student 2", "school 2", "campus", "travel", "carry"], keywords_en: ["backpack", "school bag", "bag", "student", "school", "campus", "travel", "carry"]),
        SingleSymbols(name: "studentdesk",               version: .SF1, keywords: ["student desk", "desk", "school desk", "study", "learning", "school 3", "learning 3", "seat", "student desk 2"], keywords_en: ["student desk", "desk", "school desk", "study", "classroom", "school", "learning", "seat"]),
        
        // ========== 文件/连接工具 ==========
        SingleSymbols(name: "paperclip",                 version: .SF1, keywords: ["paperclip", "attachment", "bind", "clip 2"], keywords_en: ["paperclip", "attachment", "bind", "clip"]),
        SingleSymbols(name: "link",                      version: .SF1, keywords: ["link", "url", "hyperlink", "connect", "web", "website"], keywords_en: ["link", "url", "hyperlink", "connect", "web", "website"]),
        
        // ========== 开发/终端 ==========
        SingleSymbols(name: "apple.terminal",            version: .SF5, keywords: ["terminal", "shell", "cli", "development", "code", "script", "code 2"], keywords_en: ["terminal", "shell", "cli", "command line", "console", "developer", "code", "bash", "script"]),
        
        // ========== 人物与社交 ==========
        SingleSymbols(name: "person",                    version: .SF1, keywords: ["person", "individual", "user", "account", "contact", "avatar", "avatar 2", "member"], keywords_en: ["person", "user", "account", "contact", "profile", "avatar", "member"]),
        SingleSymbols(name: "person.2",                  version: .SF1, keywords: ["two people", "pair", "friends", "contact", "user", "member", "share", "relationship", "two people 2"], keywords_en: ["two people", "pair", "friends", "contacts", "users", "members", "share", "relationship"]),
        SingleSymbols(name: "person.3",                  version: .SF1, keywords: ["three people", "group", "team", "users", "members", "collaboration", "community", "member", "three people 2"], keywords_en: ["three people", "group", "team", "users", "members", "collaboration", "community", "group chat"]),
        
        // ========== 身份与证件 ==========
        SingleSymbols(name: "lanyardcard",               version: .SF3, keywords: ["id card", "badge", "lanyard", "employee badge", "credential", "pass", "id card 2", "id card 3"], keywords_en: ["id card", "badge", "lanyard", "employee badge", "credential", "pass"]),
        SingleSymbols(name: "person.crop.circle",        version: .SF1, keywords: ["avatar 2", "profile", "profile picture", "avatar", "account", "user", "contact", "circle"], keywords_en: ["avatar", "profile", "profile picture", "user", "account", "contact", "circle"]),
        SingleSymbols(name: "person.crop.rectangle",     version: .SF1, keywords: ["profile image", "profile photo", "portrait", "id photo", "user image"], keywords_en: ["profile image", "profile photo", "portrait", "id photo", "user image", "photo"]),
        SingleSymbols(name: "person.text.rectangle",     version: .SF3, keywords: ["id card 4", "employee badge", "credential 2", "profile card", "personal info", "license", "card 3", "id card 3"], keywords_en: ["id card", "identity", "credential", "profile card", "personal info", "license", "card"]),
        
        // ========== 图片与展示 ==========
        SingleSymbols(name: "photo.artframe",            version: .SF3, keywords: ["photo frame", "profile image", "frame", "image", "gallery"], keywords_en: ["photo frame", "photo", "frame", "image", "gallery", "art"]),
        SingleSymbols(name: "person.crop.artframe",      version: .SF3, keywords: ["avatar frame", "photo frame", "personal photo frames", "image 2"], keywords_en: ["avatar frame", "photo frame", "personal photo frames", "image"]),
        
        // ========== 图案 / 纹理 ==========
        SingleSymbols(name: "rectangle.pattern.checkered", version: .SF6, keywords: ["game", "checkered", "checkerboard", "grid", "pattern", "texture", "tile"], keywords_en: ["game", "checkered", "checkerboard", "grid", "pattern", "texture", "tile"]),
        
        // ========== 人物基础 ==========
        SingleSymbols(name: "figure",                    version: .SF5, keywords: ["person", "human body", "figure", "user"], keywords_en: ["person", "human", "figure", "body", "pedestrian"]),
        SingleSymbols(name: "figure.stand",              version: .SF2, keywords: ["man", "male", "standing", "standing posture", "person", "human body", "individual"], keywords_en: ["man", "human", "male", "standing", "stand", "person", "figure", "human", "body"]),
        SingleSymbols(name: "figure.stand.dress",        version: .SF6, keywords: ["woman", "female", "female 2", "skirt", "standing", "standing posture"], keywords_en: ["woman", "human", "female", "skirt", "dress", "standing", "standing posture", "figure", "person"]),
        
        // ========== 社交/互动 ==========
        SingleSymbols(name: "figure.wave",               version: .SF2, keywords: ["person", "human", "figure 2", "card 2", "greet", "greeting", "welcome"], keywords_en: ["person", "human", "figure", "waving", "greet", "greeting", "welcome", "hello", "goodbye"]),
        SingleSymbols(name: "figure.arms.open",          version: .SF4, keywords: ["person"], keywords_en: ["person", "human"]),
        SingleSymbols(name: "figure.2.arms.open",        version: .SF4, keywords: ["person", "pair", "two people", "holding hands", "two people 2", "couple"], keywords_en: ["person", "human", "two people", "holding hands", "relationship", "couple"]),
        SingleSymbols(name: "figure.2.and.child.holdinghands", version: .SF4, keywords: ["person", "three people", "three people 3", "parent-child", "holding hands", "holding hands 2"], keywords_en: ["person", "human", "three people", "parent-child", "family", "holding hands"]),
        
        // ========== 行为动作 ==========
        SingleSymbols(name: "figure.walk",               version: .SF2, keywords: ["person", "human 2", "walk", "walking", "strolling", "figure"], keywords_en: ["person", "human", "walk", "walking", "strolling", "pedestrian", "go"]),
        SingleSymbols(name: "figure.run",                version: .SF4, keywords: ["person", "sport", "run", "running", "jog", "sprint", "fitness"], keywords_en: ["person", "human", "run", "running", "jog", "sprint", "fitness", "exercise", "sport"]),
        SingleSymbols(name: "figure.hiking",             version: .SF4, keywords: ["person", "human 3", "hike", "hiking", "trekking", "mountain"], keywords_en: ["person", "human", "hike", "hiking", "trekking", "mountain", "outdoor"]),
        SingleSymbols(name: "figure.outdoor.cycle",      version: .SF4, keywords: ["person", "sport", "fitness", "bicycle", "cycling", "mountain", "outdoor cycling"], keywords_en: ["person", "human", "bike", "bicycle", "cycling", "ride", "outdoor cycling"]),
        SingleSymbols(name: "figure.pool.swim",          version: .SF4, keywords: ["person", "human 4", "sport", "fitness"], keywords_en: ["person", "human", "swimming", "sports", "fitness"]),
        SingleSymbols(name: "figure.mind.and.body",      version: .SF4, keywords: ["person", "human 5", "meditation", "yoga", "relax", "mindfulness"], keywords_en: ["person", "human", "meditation", "yoga", "relax", "mindfulness", "sitting meditation"]),
        SingleSymbols(name: "figure.mixed.cardio",       version: .SF4, keywords: ["person", "human 6", "mixed cardio", "fitness", "training", "sport", "exercise"], keywords_en: ["person", "human", "mixed cardio", "cardio", "training", "fitness", "exercise", "workout"]),
        SingleSymbols(name: "figure.highintensity.intervaltraining", version: .SF4, keywords: ["person", "fitness", "human 6", "training", "sport", "training 2"], keywords_en: ["person", "human", "high intensity interval training", "hiit",  "fitness", "training", "workout", "exercise"]),
        
        // ========== 安全/风险 ==========
        SingleSymbols(name: "figure.fall",               version: .SF4, keywords: ["person", "human 7", "fall", "falling"], keywords_en: ["person", "human", "fall", "falling", "slip down", "tumble"]),
        SingleSymbols(name: "figure.walk.diamond",       version: .SF2, keywords: ["person", "figure", "walking", "transportation", "walking 2", "crossing", "crosswalk"], keywords_en: ["person", "human", "pedestrian", "walk", "walking", "crossing", "crosswalk", "traffic", "road sign", "caution"]),
        SingleSymbols(name: "figure.seated.seatbelt",    version: .SF4, keywords: ["person", "human 8", "seatbelt", "riding", "passenger", "safety", "car"], keywords_en: ["person", "human", "seatbelt", "riding", "passenger", "sitting posture", "safety", "car"]),
        
        // ========== 特殊人群 ==========
        SingleSymbols(name: "accessibility",             version: .SF5, keywords: ["person", "human 9", "accessibility", "accessible", "disabled"], keywords_en: ["person", "human", "accessibility", "accessible", "disabled", "inclusive"]),
        SingleSymbols(name: "figure.roll",               version: .SF3, keywords: ["person", "human 10", "human 9", "accessible", "disability"], keywords_en: ["person", "human", "wheelchair", "accessibility", "disability", "rolling"]),
        
        // ========== 性别/标识 ==========
        SingleSymbols(name: "figure.stand.dress.line.vertical.figure", version: .SF6, keywords: ["person", "human 11", "restroom", "bathroom", "toilet", "public restroom", "men and women"], keywords_en: ["person", "human", "restroom", "bathroom", "toilet", "public restroom", "men and women", "gender sign", "restroom sign"]),
        
        //--------
        // ========== 运动与健身 ==========
        SingleSymbols(name: "dumbbell",                  version: .SF4, keywords: ["dumbbell", "fitness", "workout", "strength", "human 6", "training"], keywords_en: ["dumbbell", "fitness", "workout", "strength", "training"]),
        SingleSymbols(name: "sportscourt",               version: .SF1, keywords: ["sport", "court", "stadium", "sport 2", "game 2", "sports court", "game", "sports court 2", "sports court 3"], keywords_en: ["sports court", "court", "stadium", "sport", "game"]),
        
        // ========== 球类运动 ==========
        SingleSymbols(name: "soccerball",                version: .SF4, keywords: ["soccer", "football", "sports court", "sport", "match", "sports court 2", "soccer 2"], keywords_en: ["soccer", "football", "ball", "world cup", "match"]),
        SingleSymbols(name: "baseball",                  version: .SF4, keywords: ["soccer", "football", "sports court", "sport", "baseball", "sports court 2"], keywords_en: ["baseball", "ball", "sport", "game"]),
        SingleSymbols(name: "basketball",                version: .SF4, keywords: ["soccer", "football", "sports court", "sport", "ball", "nba", "sports court 2"], keywords_en: ["basketball", "nba", "sport", "game", "ball"]),
        SingleSymbols(name: "american.football",         version: .SF6, keywords: ["soccer", "football", "sports court", "sport", "sport 3", "game 3"], keywords_en: ["NFL",  "american football", "nfl", "football", "sport", "game"]),
        SingleSymbols(name: "volleyball",                version: .SF4, keywords: ["soccer", "football", "sports court", "ball 2", "sport", "sports court 2"], keywords_en: ["volleyball", "sport", "game", "ball"]),
        SingleSymbols(name: "tennis.racket",             version: .SF4, keywords: ["soccer", "sports court", "sport 4", "game 4", "tennis", "sport", "sports court 2"], keywords_en: ["tennis", "racket", "sport", "game"]),
        SingleSymbols(name: "tennisball",                version: .SF4, keywords: ["soccer", "football", "sports court", "game 4", "sport", "sports court 2"], keywords_en: ["tennis", "ball", "sport", "game"]),
        SingleSymbols(name: "hockey.puck",               version: .SF4, keywords: ["soccer", "football", "sports court", "sport 5", "game 5", "sports court 2", "sport"], keywords_en: ["hockey", "ice hockey", "puck", "sport", "game"]),
        
        // ========== 极限/户外运动 ==========
        SingleSymbols(name: "skateboard",                version: .SF5, keywords: ["sport", "extreme sport", "urban", "mountain", "skateboard", "skateboard 2"], keywords_en: ["skateboard", "extreme sport", "urban", "sport"]),
        SingleSymbols(name: "snowboard",                 version: .SF5, keywords: ["sport", "ski", "winter sport", "snow", "snowboard"], keywords_en: ["snowboard", "ski", "winter sport", "snow"]),
        SingleSymbols(name: "surfboard",                 version: .SF5, keywords: ["sport", "surfing", "wave", "water sport", "surfboard"], keywords_en: ["surfboard", "surfing", "wave", "water sport"]),
        
        // ========== 健身与装备 ==========
        SingleSymbols(name: "duffle.bag",                version: .SF6, keywords: ["duffle bag", "gym bag", "travel bag", "luggage", "duffle bag 2"], keywords_en: ["duffle bag", "gym bag", "travel bag", "luggage"]),
        
        // ========== 奖励与成就 ==========
        SingleSymbols(name: "rosette",                   version: .SF1, keywords: ["award", "badge 2", "achievement", "recognition", "medal"], keywords_en: ["award", "badge", "achievement", "recognition", "medal"]),
        SingleSymbols(name: "trophy",                    version: .SF4, keywords: ["trophy", "champion", "winner", "award", "competition", "sports court 2"], keywords_en: ["trophy", "champion", "winner", "award", "competition"]),
        SingleSymbols(name: "medal",                     version: .SF4, keywords: ["medal 2", "champion", "achievement 2", "award", "competition 2", "sports court 2"], keywords_en: ["medal", "award", "achievement", "honor", "competition"]),
        
        // ========== 键盘修饰键 ==========
        SingleSymbols(name: "command",                   version: .SF1, keywords: ["macos", "command", "cmd"], keywords_en: ["macOS", "Command", "Cmd",  "command", "shortcut", "key", "modifier"]),
        SingleSymbols(name: "option",                    version: .SF1, keywords: ["macos", "command", "cmd"], keywords_en: ["macOS", "Option", "Alt", "option", "alt", "shortcut", "key", "modifier"]),
        SingleSymbols(name: "alt",                       version: .SF1, keywords: ["macos", "command", "cmd"], keywords_en: ["macOS", "Alt", "Option", "alt", "option", "shortcut", "key", "modifier"]),
        SingleSymbols(name: "control",                   version: .SF1, keywords: ["macos", "command", "cmd"], keywords_en: ["macOS", "Control", "Ctrl", "control", "ctrl", "shortcut", "key", "modifier"]),
        SingleSymbols(name: "shift",                     version: .SF1, keywords: ["macos", "command", "cmd", "shortcut", "key"], keywords_en: ["macOS", "shift", "uppercase", "shortcut", "key", "modifier"]),
        SingleSymbols(name: "capslock",                  version: .SF1, keywords: ["macos", "command", "cmd", "key"], keywords_en: ["macOS",  "Caps Lock", "shortcut", "key", "modifier"]),
        SingleSymbols(name: "fn",                        version: .SF2, keywords: ["macos", "command", "cmd", "shortcut 2"], keywords_en: ["macOS", "function", "fn", "shortcut", "key", "modifier"]),
        SingleSymbols(name: "space",                     version: .SF4, keywords: ["macos", "command", "cmd", "shortcut 3"], keywords_en: ["macOS", "space", "keyboard", "shortcut", "key", "modifier"]),
        
        // ========== 电源与系统状态 ==========
        SingleSymbols(name: "power",                     version: .SF1, keywords: ["macos", "on off", "shutdown", "boot", "power", "power 2"], keywords_en: ["power", "on/off", "shutdown", "boot"]),
        SingleSymbols(name: "poweron",                   version: .SF2, keywords: ["macos", "power", "on off", "on", "power on", "power on 2", "power on 3"], keywords_en: ["power on", "start", "boot", "on"]),
        SingleSymbols(name: "powersleep",                version: .SF2, keywords: ["sleep", "standby", "hibernate", "power save", "sleep 2"], keywords_en: ["sleep", "standby", "hibernate", "power save"]),
        SingleSymbols(name: "restart",                   version: .SF2, keywords: ["restart", "reload", "reset", "reboot"], keywords_en: ["restart", "reload", "reset", "reboot"]),
        SingleSymbols(name: "alternatingcurrent",        version: .SF3, keywords: ["ac", "on off", "power 3", "electricity"], keywords_en: ["AC", "ac", "power", "electricity", "current"]),
        
        // ========== 编辑/删除 ==========
        SingleSymbols(name: "clear",                     version: .SF1, keywords: ["clear 2", "delete 2", "delete", "reboot", "cancel"], keywords_en: ["clear", "delete", "reset", "remove"]),
        SingleSymbols(name: "delete.left",               version: .SF1, keywords: ["backspace", "delete", "left", "clear 2"], keywords_en: ["backspace", "delete", "erase"]),
        SingleSymbols(name: "delete.right",              version: .SF1, keywords: ["delete", "right", "clear 2"], keywords_en: ["delete", "erase", "remove"]),
        
        // ========== 输入设备 ==========
        SingleSymbols(name: "keyboard",                  version: .SF1, keywords: ["command", "typing", "input", "keyboard"], keywords_en: ["keyboard", "typing", "input"]),
        SingleSymbols(name: "cursorarrow",               version: .SF2, keywords: ["cursor", "pointer", "mouse", "arrow"], keywords_en: ["cursor", "pointer", "mouse", "arrow"]),
        
        // ========== 系统UI ==========
        SingleSymbols(name: "progress.indicator",        version: .SF6, keywords: ["loading", "progress", "spinner", "wait"], keywords_en: ["loading","progress", "spinner", "wait", "buffering"]),
        SingleSymbols(name: "mount",                     version: .SF2, keywords: ["mount", "disk", "loading", "connect", "mount 2", "disability"], keywords_en: ["mount", "disk", "drive", "attach"]),
        SingleSymbols(name: "beziercurve",               version: .SF6, keywords: ["bezier", "curve", "path", "design 2", "design", "drawing"], keywords_en: ["bezier", "curve", "path", "design"]),
        
        // ========== 天气与气象 ==========
        SingleSymbols(name: "globe",                     version: .SF1, keywords: ["globe", "world", "global", "internet", "earth"], keywords_en: ["globe", "world", "global", "internet", "earth"]),
        SingleSymbols(name: "sun.max",                   version: .SF1, keywords: ["sun", "sunny", "day", "light", "brightness"], keywords_en: ["sun", "sunny", "day", "light", "brightness"]),
        SingleSymbols(name: "sun.horizon",               version: .SF5, keywords: ["sunrise", "sunset", "horizon", "dawn", "dusk"], keywords_en: ["sunrise", "sunset", "horizon", "dawn", "dusk"]),
        SingleSymbols(name: "moon",                      version: .SF1, keywords: ["sleep 2", "night", "dark mode", "evening", "moon", "moon 2"], keywords_en: ["moon", "night", "dark mode", "evening"]),
        SingleSymbols(name: "zzz",                       version: .SF1, keywords: ["sleep", "rest", "do not disturb", "evening", "sleep 3"], keywords_en: ["sleep", "rest", "do not disturb", "nap"]),
        
        // ========== 天气系统 ==========
        SingleSymbols(name: "cloud",                     version: .SF1, keywords: ["weather", "weather 2", "overcast", "sky", "cloud"], keywords_en: ["cloud", "weather", "overcast", "sky"]),
        SingleSymbols(name: "cloud.drizzle",             version: .SF1, keywords: ["weather", "light rain", "rain", "weather 3", "drizzle", "weather"], keywords_en: ["drizzle", "light rain", "rain", "weather"]),
        SingleSymbols(name: "cloud.sun",                 version: .SF1, keywords: ["weather", "weather 2", "sun", "overcast"], keywords_en: ["partly cloudy", "cloud", "sun", "weather"]),
        SingleSymbols(name: "wind",                      version: .SF1, keywords: ["weather", "breeze", "airflow", "gust", "weather 4", "wind"], keywords_en: ["wind", "breeze", "airflow", "gust", "weather"]),
        SingleSymbols(name: "snowflake",                 version: .SF3, keywords: ["snow 2", "snowflake", "winter", "cold", "ice", "snow 3", "snow 4"], keywords_en: ["snow", "snowflake", "winter", "cold", "ice"]),
        SingleSymbols(name: "tornado",                   version: .SF1, keywords: ["weather", "storm", "wind 2", "disaster"], keywords_en: ["tornado", "storm", "wind", "disaster"]),
    SingleSymbols(name: "tropicalstorm",             version: .SF1, keywords: ["weather", "typhoon", "storm 2", "weather 5", "disaster"], keywords_en: ["hurricane", "typhoon", "storm", "weather"]),
        
        // ========== 气候与测量 ==========
        SingleSymbols(name: "thermometer.variable",      version: .SF6, keywords: ["temperature", "thermometer", "heat", "cold 2", "measurement"], keywords_en: ["temperature", "thermometer", "heat", "cold"]),
        SingleSymbols(name: "degreesign.fahrenheit",     version: .SF6, keywords: ["f", "thermometer", "heat", "f 2"], keywords_en: ["°F", "fahrenheit", "temperature"]),
        SingleSymbols(name: "degreesign.celsius",        version: .SF6, keywords: ["c", "thermometer", "heat"], keywords_en: ["°C", "celsius", "temperature"]),
        SingleSymbols(name: "humidity",                  version: .SF3, keywords: ["weather", "moisture", "weather 6", "humidity", "humidity 2"], keywords_en: ["humidity", "moisture", "weather"]),
        
        // ========== 水与自然元素 ==========
        SingleSymbols(name: "water.waves",               version: .SF4, keywords: ["water", "electricity", "ocean", "sea", "water 2", "water 3"], keywords_en: ["water", "waves", "ocean", "sea"]),
        SingleSymbols(name: "drop",                      version: .SF2, keywords: ["water 4", "water 5", "light rain", "liquid", "drop", "drop 2"], keywords_en: ["drop", "water", "rain", "liquid"]),
        SingleSymbols(name: "rainbow",                   version: .SF5, keywords: ["weather", "rain 2", "sunlight"], keywords_en: ["rainbow", "rain", "sunlight", "color"]),
        
        // ========== 能源与状态 ==========
        SingleSymbols(name: "flame",                     version: .SF1, keywords: ["fire", "flame", "hot", "burn", "fire 2"], keywords_en: ["fire", "flame", "hot", "burn"]),
        SingleSymbols(name: "sparkle",                   version: .SF2, keywords: ["flash", "stars"], keywords_en: ["flash", "stars","sparkle", "shine"]),
        
        // ========== 安全 ==========
        SingleSymbols(name: "fire.extinguisher",         version: .SF6, keywords: ["fire extinguisher", "fire safety", "safety", "fire extinguisher 2", "fire extinguisher 3"], keywords_en: ["fire extinguisher", "fire safety", "emergency"]),
        SingleSymbols(name: "umbrella",                  version: .SF1, keywords: ["umbrella", "rain 3", "weather 7", "protection", "umbrella 2"], keywords_en: ["umbrella", "rain", "weather", "protection"]),
        
        // ========== 抽象/全球 ==========
        SingleSymbols(name: "peacesign",                 version: .SF3, keywords: ["peace", "anti war", "symbol", "global 2"], keywords_en: ["peace", "anti war", "symbol", "global"]),
        
        
        // ========== 媒体播放控制 ==========
        SingleSymbols(name: "play",                      version: .SF1, keywords: ["play", "start", "playback", "media 2"], keywords_en: ["play", "start", "playback", "media"]),
        SingleSymbols(name: "pause",                     version: .SF1, keywords: ["pause", "stop temporarily", "spinner", "pause 2"], keywords_en: ["pause", "stop temporarily", "hold"]),
        SingleSymbols(name: "stop",                      version: .SF1, keywords: ["stop", "end", "halt", "stop 2"], keywords_en: ["stop", "end", "halt"]),
        SingleSymbols(name: "playpause",                 version: .SF1, keywords: ["play pause", "toggle", "media control"], keywords_en: ["play pause", "toggle", "media control"]),
        
        // ========== 进度控制 ==========
        SingleSymbols(name: "backward",                  version: .SF1, keywords: ["backward", "rewind", "previous", "back"], keywords_en: ["backward", "rewind", "previous", "back"]),
        SingleSymbols(name: "forward",                   version: .SF1, keywords: ["forward", "next", "skip"], keywords_en: ["forward", "next", "skip", "fast forward"]),
        
        // ========== 播放模式 ==========
        SingleSymbols(name: "shuffle",                   version: .SF1, keywords: ["shuffle", "random", "mix", "order 2", "shuffle 2"], keywords_en: ["shuffle", "random", "mix", "order"]),
        SingleSymbols(name: "repeat",                    version: .SF1, keywords: ["repeat 2", "repeat", "repeat all", "repeat one"], keywords_en: ["repeat", "loop", "repeat all", "repeat one"]),
        SingleSymbols(name: "infinity",                  version: .SF2, keywords: ["infinity", "repeat 2", "endless"], keywords_en: ["∞",  "infinity", "endless", "loop", "forever"]),
        
        // ========== 录制 ==========
        SingleSymbols(name: "stop.circle",             version: .SF1, keywords: ["stop", "end", "halt", "stop 2", "stop playback", "stop recording", "circle 2", "circle"], keywords_en: ["stop", "end", "halt", "terminate", "stop playback", "stop recording", "circle"]),
        SingleSymbols(name: "record.circle",             version: .SF2, keywords: ["rec", "record 2", "recording", "capture"], keywords_en: ["REC", "record", "recording", "capture", "video", "audio"]),
        
        // ========== 音频系统 ==========
        SingleSymbols(name: "speaker",                   version: .SF1, keywords: ["speaker", "audio", "volume", "sound"], keywords_en: ["speaker", "audio", "volume", "sound"]),
        SingleSymbols(name: "speaker.wave.3",            version: .SF2, keywords: ["speaker", "audio", "volume", "sound"], keywords_en: ["loud", "max volume", "speaker", "audio"]),
        SingleSymbols(name: "music.note",                version: .SF1, keywords: ["music", "song", "audio 2", "track"], keywords_en: ["music", "song", "audio", "track", "sound"]),
        SingleSymbols(name: "music.quarternote.3",       version: .SF2, keywords: ["song", "beat", "rhythm", "note 3", "music"], keywords_en: ["music", "beat", "rhythm", "note"]),
        SingleSymbols(name: "music.microphone",          version: .SF6, keywords: ["microphone", "record 2", "record 3", "sing", "audio 3"], keywords_en: ["microphone", "mic", "record", "sing", "audio"]),
        SingleSymbols(name: "megaphone",                 version: .SF2, keywords: ["sound", "announcement", "broadcast", "notify", "megaphone"], keywords_en: ["megaphone", "announcement", "broadcast", "notify"]),
        
        // ========== 紧急 ==========
        SingleSymbols(name: "SOS",                       version: .SF4, keywords: ["fire extinguisher 2", "emergency", "help", "safety"], keywords_en: ["sos", "emergency", "help", "alert", "rescue"]),
        
        // ========== 媒体附属 ==========
        SingleSymbols(name: "memories",                  version: .SF1, keywords: ["memory", "recollection", "replay"], keywords_en: ["memory", "recollection", "replay"]),
        
        // ========== 旋转与状态变换 ==========
        SingleSymbols(name: "arrow.trianglehead.clockwise",         version: .SF6, keywords: ["clockwise", "rotate", "reset", "repeat 2", "sync", "replay"], keywords_en: ["clockwise", "rotate", "refresh", "redo", "sync", "replay"]),
        SingleSymbols(name: "arrow.trianglehead.counterclockwise",  version: .SF6, keywords: ["counterclockwise", "rotate", "back 2", "rewind", "reverse"], keywords_en: ["counterclockwise", "undo", "back", "rotate", "reverse"]),
        SingleSymbols(name: "arrow.trianglehead.2.clockwise.rotate.90", version: .SF6, keywords: ["sync 2", "rotate", "reset", "sync", "loop", "repeat 2"], keywords_en: ["sync", "rotate", "refresh", "bidirectional", "loop"]),
        
        // ========== 搜索与检索系统 ==========
        SingleSymbols(name: "magnifyingglass",           version: .SF1, keywords: ["search", "search 2", "find", "lookup 2", "lookup"], keywords_en: ["search", "find", "query", "lookup", "explore"]),
        SingleSymbols(name: "plus.magnifyingglass",      version: .SF1, keywords: ["search", "magnify", "plus"], keywords_en: ["zoom in", "magnify", "plus", "scaling"]),
        SingleSymbols(name: "minus.magnifyingglass",     version: .SF1, keywords: ["search", "minus", "plus"], keywords_en: ["zoom out", "minus", "shrink", "scaling"]),
        SingleSymbols(name: "loupe",                     version: .SF2, keywords: ["search", "search 2", "find", "lookup 2", "focus", "loupe", "loupe 2", "loupe 3"], keywords_en: ["loupe", "zoom", "inspect", "detail", "focus"]),
        
        // ========== 输入系统 ==========
        SingleSymbols(name: "microphone",                version: .SF6, keywords: ["microphone", "mic", "record 2", "typing", "record 4", "microphone 2", "microphone 3"], keywords_en: ["microphone", "mic", "voice", "audio input", "record"]),
        SingleSymbols(name: "microphone.slash",          version: .SF6, keywords: ["microphone", "microphone off", "close", "disabled mic", "mic", "record 2", "mute"], keywords_en: ["mute", "microphone off", "no sound", "disabled mic"]),
        
        // ========== 开发语言 ==========
        SingleSymbols(name: "swift",                     version: .SF2, keywords: ["programming", "development", "apple"], keywords_en: ["iOS", "Swift", "swift lang", "programming", "developer", "apple"]),
        
        // ========== 基础线条 ==========
        SingleSymbols(name: "line.diagonal",             version: .SF2, keywords: ["line 2", "scribble 2", "stroke", "line 3", "line 4"], keywords_en: ["line", "diagonal", "stroke"]),
        SingleSymbols(name: "line.diagonal.arrow",       version: .SF2, keywords: ["line 2", "scribble 2", "stroke", "arrow", "line 3"], keywords_en: ["diagonal", "arrow", "direction","navigate"]),
        
        // ========== 基础形状 ==========
        SingleSymbols(name: "righttriangle",             version: .SF5, keywords: ["shape", "geometry", "shape 2", "geometry 2"], keywords_en: ["triangle", "right triangle", "shape", "geometry"]),
        SingleSymbols(name: "circle",                    version: .SF1, keywords: ["shape", "geometry", "round shape", "circle", "ring circle"], keywords_en: ["circle", "shape"]),
        SingleSymbols(name: "circle.dashed",             version: .SF2, keywords: ["shape", "geometry", "round shape", "dashed"], keywords_en: ["dashed", "circle", "shape"]),
        SingleSymbols(name: "circlebadge",               version: .SF2, keywords: ["shape", "geometry", "round shape", "circle", "ring circle", "annotate", "circle 3"], keywords_en: ["circle", "shape", "dot"]),
        
        // ========== 网格系统 ==========
        SingleSymbols(name: "circle.grid.2x2",           version: .SF1, keywords: ["grid 2", "2x2", "layout"], keywords_en: ["grid", "2x2", "layout", "matrix"]),
        SingleSymbols(name: "circle.grid.3x3",           version: .SF1, keywords: ["grid 3", "2x2", "layout", "grid 2"], keywords_en: ["grid", "3x3", "layout", "matrix"]),
        
        // ========== 方形系统 ==========
        SingleSymbols(name: "square",                    version: .SF1, keywords: ["shape", "geometry", "square", "rectangle", "square 2"], keywords_en: ["square", "shape", "box"]),
        SingleSymbols(name: "square.dashed",             version: .SF2, keywords: ["shape", "geometry", "square", "rectangle", "dashed"], keywords_en: ["square", "dashed", "shape"]),
        SingleSymbols(name: "squareshape",               version: .SF2, keywords: ["shape", "geometry", "square", "rectangle"], keywords_en: ["rectangle", "square", "shape"]),
        
        // ========== 布局与分割 ==========
        SingleSymbols(name: "square.split.2x2",          version: .SF1, keywords: ["shape", "geometry", "square", "rectangle", "split", "layout", "2x2", "split 2", "split 3"], keywords_en: ["split", "grid", "layout", "partition"]),
        
        // ========== 叠加与复制 ==========
        SingleSymbols(name: "square.on.square",          version: .SF1, keywords: ["copy", "copy duplicate", "duplicate copy", "stack", "copy 2"], keywords_en: ["copy", "duplicate", "overlay", "stack", "copy"]),
        SingleSymbols(name: "square.on.circle",          version: .SF1, keywords: ["shape", "geometry", "square", "rectangle", "round shape", "stack"], keywords_en: ["overlay", "combine", "shape mix"]),
        SingleSymbols(name: "square.stack",              version: .SF1, keywords: ["stack 2", "layers", "stack", "multiple"], keywords_en: ["stack", "layers", "overlay", "multiple"]),
        
        // ========== App容器 ==========
        SingleSymbols(name: "app",                       version: .SF1, keywords: ["app", "application", "icon"], keywords_en: ["app", "application", "icon", "software"]),
        SingleSymbols(name: "plus.app",                  version: .SF1, keywords: ["add", "install", "create 2", "add 2"], keywords_en: ["add", "install", "create"]),
        SingleSymbols(name: "arrow.down.app",            version: .SF2, keywords: ["download", "install", "receive"], keywords_en: ["download", "install", "get"]),
        SingleSymbols(name: "questionmark.app",          version: .SF3, keywords: ["unknown", "missing", "help 2", "help"], keywords_en: ["unknown", "missing", "help", "question"]),
        SingleSymbols(name: "app.badge",                 version: .SF1, keywords: ["badge 3", "notification", "notify", "unread", "badge 4", "badge 5"], keywords_en: ["badge", "notification", "unread", "indicator"]),
        
        // ========== 容器与布局 ==========
        SingleSymbols(name: "rectangle",                 version: .SF1, keywords: ["shape", "geometry", "rectangle"], keywords_en: ["rectangle", "shape"]),
        SingleSymbols(name: "rectangle.split.3x3",       version: .SF1, keywords: ["grid 3", "layout", "layout 2", "2x2", "split 3"], keywords_en: ["grid", "3x3", "layout", "matrix"]),
        SingleSymbols(name: "rectangle.on.rectangle",    version: .SF1, keywords: ["shape", "geometry", "rectangle", "copy", "stack", "layers", "copy 2"], keywords_en: ["copy", "duplicate", "overlay", "layers", "shape"]),
        SingleSymbols(name: "rectangle.portrait",        version: .SF2, keywords: ["shape", "geometry", "rectangle", "shape 3", "portrait 2"], keywords_en: ["portrait", "vertical", "screen", "shape"]),
        SingleSymbols(name: "rectangle.grid.1x2",        version: .SF1, keywords: ["shape", "geometry", "rectangle", "columns", "shape 4", "2x2"], keywords_en: ["grid", "1x2", "layout", "columns", "shape"]),
        
        // ========== 基础形状 ==========
        SingleSymbols(name: "capsule",                   version: .SF1, keywords: ["capsule", "shape", "button", "tag"], keywords_en: ["capsule", "shape", "button", "tag"]),
        SingleSymbols(name: "oval",                      version: .SF2, keywords: ["oval", "shape", "shape 5"], keywords_en: ["oval", "ellipse", "shape"]),
        SingleSymbols(name: "triangle",                  version: .SF1, keywords: ["geometry 2", "shape", "direction"], keywords_en: ["triangle", "shape", "direction"]),
        SingleSymbols(name: "diamond",                   version: .SF2, keywords: ["rhombus", "diamond", "geometry", "shape", "rhombus 2"], keywords_en: ["rhombus", "diamond", "geometry", "shape"]),
        SingleSymbols(name: "rhombus",                   version: .SF1, keywords: ["rhombus", "diamond", "geometry", "shape", "rhombus 2"], keywords_en: ["rhombus", "diamond", "geometry", "shape"]),
        
        // ========== 状态与认证 ==========
        SingleSymbols(name: "checkmark.seal",            version: .SF1, keywords: ["recognition", "approved", "checkmark", "status", "badge 6", "verified", "check"], keywords_en: ["verified", "approved", "checkmark", "status", "badge"]),
        SingleSymbols(name: "xmark.seal",                version: .SF1, keywords: ["error", "rejected", "failed", "close", "status 2"], keywords_en: ["error", "rejected", "failed", "invalid", "status"]),
        
        // ========== 情感与收藏 ==========
        SingleSymbols(name: "heart",                     version: .SF1, keywords: ["shape", "like", "favorite 2", "love", "favorite", "heart", "heart 2"], keywords_en: ["heart", "like", "favorite", "love", "shape"]),
        SingleSymbols(name: "star",                      version: .SF1, keywords: ["shape", "stars", "rating", "featured", "favorite", "star", "star 2"], keywords_en: ["star", "favorite", "rating", "featured", "shape"]),
        
        // ========== 游戏/符号 ==========
        SingleSymbols(name: "suit.club",                 version: .SF1, keywords: ["club", "card suit", "game 6", "game"], keywords_en: ["club", "card suit", "game"]),
        SingleSymbols(name: "suit.diamond",              version: .SF1, keywords: ["square 2", "card suit", "game 6", "game"], keywords_en: ["diamond suit", "card", "game"]),
        SingleSymbols(name: "suit.spade",                version: .SF1, keywords: ["spade", "card suit", "game 6", "game"], keywords_en: ["spade", "card suit", "game"]),
        
        // ========== 安全与防护 ==========
        SingleSymbols(name: "shield",                    version: .SF1, keywords: ["shield", "security", "protection 2", "safety", "umbrella 2", "shield 2", "protection 3"], keywords_en: ["shield", "security", "protection", "privacy"]),
        SingleSymbols(name: "shield.lefthalf.filled",    version: .SF3, keywords: ["shield", "security", "protection 2", "safety", "umbrella 2", "shield 2", "protection 3"], keywords_en: ["shield", "security", "protection", "privacy"]),
        SingleSymbols(name: "shield.pattern.checkered",  version: .SF6, keywords: ["shield", "security", "protection 2", "safety", "umbrella 2", "shield 2", "protection 3"], keywords_en: ["shield", "security", "protection", "privacy"]),
        
        // ========== 标记与信号 ==========
        SingleSymbols(name: "flag",                      version: .SF1, keywords: ["flag", "annotate", "report 2", "milestone"], keywords_en: ["flag", "mark", "report", "milestone"]),
        SingleSymbols(name: "flag.pattern.checkered",    version: .SF6, keywords: ["flag", "race", "status", "complete", "finish"], keywords_en: ["finish", "race", "checkered flag", "complete"]),
        SingleSymbols(name: "flag.2.crossed",            version: .SF3, keywords: ["signal", "flags", "men and women"], keywords_en: ["signal", "flags", "communication"]),
        
        // ========== 位置与定位 ==========
        SingleSymbols(name: "location",                  version: .SF1, keywords: ["gps", "location", "position", "gps 2"], keywords_en: ["GPS", "location", "position", "gps", "coordinate"]),
        SingleSymbols(name: "location.slash",            version: .SF1, keywords: ["gps", "location", "position", "gps 2", "close", "microphone off"], keywords_en: ["GPS", "location off", "gps off", "disabled", "privacy"]),
        SingleSymbols(name: "location.north",            version: .SF1, keywords: ["north", "position", "direction 2", "direction", "north 2"], keywords_en: ["north", "compass", "direction", "navigation"]),
        
        // ========== 地图与标记 ==========
        SingleSymbols(name: "map",                       version: .SF1, keywords: ["map", "position", "route", "geography"], keywords_en: ["map", "navigation", "route", "geography"]),
        SingleSymbols(name: "mappin",                    version: .SF1, keywords: ["map pin", "annotate", "place", "marker", "location"], keywords_en: ["map pin", "location pin", "place", "marker"]),
        SingleSymbols(name: "pin",                       version: .SF1, keywords: ["pin", "attach", "mark", "annotate", "pin 2"], keywords_en: ["pin", "attach", "mark", "fix"]),
        
        // ========== 位置与导航 ==========
        SingleSymbols(name: "signpost.left",             version: .SF2, keywords: ["walking 2", "direction 3", "direction", "position"], keywords_en: ["signpost", "direction", "left", "navigation"]),
        SingleSymbols(name: "signpost.right.and.left",   version: .SF4, keywords: ["walking 2", "intersection", "sync 2", "direction"], keywords_en: ["signpost", "intersection", "direction", "navigation"]),
        
        // ========== 环境与场景 ==========
        SingleSymbols(name: "mountain.2",                version: .SF4, keywords: ["mountain 2", "landscape", "mountain", "nature"], keywords_en: ["mountain", "landscape", "outdoor", "nature"]),
        SingleSymbols(name: "safari",                    version: .SF1, keywords: ["browser", "north 2", "compass"], keywords_en: ["browser", "safari", "compass", "explore", "web"]),
        
        // ========== 通知与提醒 ==========
        SingleSymbols(name: "bell",                      version: .SF1, keywords: ["bell", "notify", "alert", "reminder", "badge 5"], keywords_en: ["bell", "notification", "alert", "reminder"]),
        SingleSymbols(name: "bell.slash",                version: .SF1, keywords: ["bell", "notify", "alert", "reminder", "badge 5", "bell 2", "close", "evening", "disabled mic"], keywords_en: ["bell", "mute", "notifications off", "alert", "do not disturb"]),
        SingleSymbols(name: "bell.badge",                version: .SF2, keywords: ["bell", "notify", "alert", "reminder", "unread", "notification"], keywords_en: ["bell", "notification badge", "unread", "alert", "indicator"]),
        SingleSymbols(name: "bell.and.waves.left.and.right", version: .SF4, keywords: ["bell", "notify", "alert", "alarm", "vibration", "reminder", "bell 3"], keywords_en: ["bell", "ringing", "alert", "alarm", "vibration"]),
        
        // ========== 标签与分类 ==========
        SingleSymbols(name: "tag",                       version: .SF1, keywords: ["tag", "storage", "annotate", "price"], keywords_en: ["tag", "label", "category", "mark"]),
        
        // ========== 能量与速度 ==========
        SingleSymbols(name: "bolt",                      version: .SF1, keywords: ["bolt", "energy", "power 4", "power 3", "lightning"], keywords_en: ["bolt", "energy", "power", "fast", "lightning", "Charge"]),
        SingleSymbols(name: "bolt.horizontal",           version: .SF2, keywords: ["bolt", "energy", "power 4", "power 3", "lightning"], keywords_en: ["bolt", "energy", "power", "fast", "lightning", "Charge"]),
        
        // ========== iCloud 与同步 ==========
        SingleSymbols(name: "icloud",                    version: .SF1, keywords: ["weather 2", "cloud 2", "loop", "folder 2", "backup"], keywords_en: ["icloud", "cloud", "sync", "storage", "backup"]),
        SingleSymbols(name: "icloud.slash",              version: .SF1, keywords: ["weather 2", "cloud 2", "loop", "offline", "not synced"], keywords_en: ["cloud", "icloud","cloud off", "offline", "not synced", "disconnected"]),
        SingleSymbols(name: "checkmark.icloud",          version: .SF2, keywords: ["weather 2", "cloud 2", "loop", "status", "backup", "done"], keywords_en: ["cloud", "icloud", "sync complete", "uploaded", "success", "done"]),
        SingleSymbols(name: "xmark.icloud",              version: .SF1, keywords: ["weather 2", "cloud 2", "loop", "error 2", "error", "cloud 3"], keywords_en: ["cloud", "icloud", "sync failed", "error", "failed"]),
        SingleSymbols(name: "icloud.and.arrow.down",     version: .SF1, keywords: ["weather 2", "cloud 2", "download", "loop", "receive"], keywords_en: ["cloud", "icloud", "download", "fetch", "retrieve"]),
        
        // ========== 数学 ==========
        SingleSymbols(name: "squareroot",                version: .SF6, keywords: ["square root", "sqrt", "math", "function"], keywords_en: ["square root", "sqrt", "math", "function"]),
        SingleSymbols(name: "x.squareroot",              version: .SF1, keywords: ["square root", "square root 2", "sqrt", "function"], keywords_en: ["sqrt x", "square root", "math", "expression"]),
        
        // ========== 相机与拍摄 ==========
        SingleSymbols(name: "camera",                    version: .SF1, keywords: ["camera", "capture 2", "photo", "shoot"], keywords_en: ["camera", "capture", "photo", "shoot"]),
        SingleSymbols(name: "camera.macro",              version: .SF3, keywords: ["macro", "close up", "shoot", "photo 2"], keywords_en: ["macro", "close up", "camera", "photo", "flowers"]),
        SingleSymbols(name: "camera.filters",            version: .SF2, keywords: ["filter", "effect", "camera 2", "edit 3", "stack"], keywords_en: ["filter", "effect", "camera", "edit"]),
        SingleSymbols(name: "flashlight.off.fill",       version: .SF1, keywords: ["flashlight", "flash 2", "light 2"], keywords_en: ["flashlight", "flash", "light", "torch"]),
        
        // ========== 取景与扫描 ==========
        SingleSymbols(name: "viewfinder",                version: .SF1, keywords: ["viewfinder", "focus 2", "photo", "scan"], keywords_en: ["viewfinder", "focus", "frame", "scan"]),
        SingleSymbols(name: "viewfinder.rectangular",    version: .SF5, keywords: ["rectangle", "viewfinder", "focus 2", "scan"], keywords_en: ["viewfinder", "frame", "focus", "scan"]),
        SingleSymbols(name: "plus.viewfinder",           version: .SF2, keywords: ["scan 2", "scan", "add"], keywords_en: ["scan", "qr code", "add", "capture"]),
       
        // ========== 拍摄模式 ==========
        SingleSymbols(name: "pano",                      version: .SF1, keywords: ["panorama", "wide"], keywords_en: ["panorama", "wide"]),
        SingleSymbols(name: "field.of.view.ultrawide",   version: .SF5, keywords: ["ultrawide", "wide angle"], keywords_en: ["ultrawide", "wide angle", "camera"]),
        
        // ========== 照片与媒体 ==========
        SingleSymbols(name: "photo",                     version: .SF1, keywords: ["profile image", "frame", "picture", "media 3"], keywords_en: ["photo", "image", "picture", "media"]),
        SingleSymbols(name: "photo.on.rectangle.angled", version: .SF2, keywords: ["profile image", "frame", "picture", "media 4", "gallery 2", "media 3"], keywords_en: ["photo", "image", "picture", "media", "gallery", "multiple", "album"]),
        SingleSymbols(name: "photo.stack",               version: .SF4, keywords: ["profile image", "frame", "picture", "stack 2", "gallery 2", "media 3"], keywords_en: ["photo", "image", "picture", "media", "gallery", "multiple", "album", "stack"]),
        
        // ========== 图像处理 ==========
        SingleSymbols(name: "mosaic",                    version: .SF2, keywords: ["mosaic", "pixelate", "blur"], keywords_en: ["mosaic", "pixelate", "blur"]),
        
        
        // ========== 消息与通信 ==========
        SingleSymbols(name: "message",                   version: .SF1, keywords: ["badge 5", "sms", "chat", "conversation"], keywords_en: ["message", "sms", "chat", "conversation", "comment"]),
        SingleSymbols(name: "bubble",                    version: .SF5, keywords: ["badge 5", "sms 2", "conversation", "chat", "comment"], keywords_en: ["message", "sms", "chat", "conversation", "comment", "bubble"]),
        SingleSymbols(name: "text.bubble",               version: .SF1, keywords: ["badge 5", "sms 2", "conversation", "chat", "comment"], keywords_en: ["message", "sms", "chat", "conversation", "comment", "bubble"]),
        SingleSymbols(name: "ellipsis.bubble",           version: .SF2, keywords: ["badge 5", "sms 2", "conversation", "chat", "comment"], keywords_en: ["message", "sms", "chat", "conversation", "comment", "bubble", "typing", "loading"]),
        SingleSymbols(name: "bubble.middle.bottom",      version: .SF1, keywords: ["badge 5", "sms 2", "conversation", "chat", "comment"], keywords_en: ["message", "sms", "chat", "conversation", "comment", "bubble", "typing", "loading"]),
        
        // ========== 引用系统 ==========
        SingleSymbols(name: "quote.opening",             version: .SF3, keywords: ["quote", "citation"], keywords_en: ["quote", "citation", "text"]),
        SingleSymbols(name: "quote.closing",             version: .SF3, keywords: ["quote", "end", "citation"], keywords_en: ["quote", "citation", "text", "end"]),
        
        // ========== 通话与视频 ==========
        SingleSymbols(name: "phone",                     version: .SF1, keywords: ["phone", "call", "contact 2"], keywords_en: ["phone", "call", "contact"]),
        SingleSymbols(name: "phone.down",                version: .SF1, keywords: ["phone", "end call", "end", "hang up"], keywords_en: ["hang up", "end call", "decline"]),
        SingleSymbols(name: "video",                     version: .SF1, keywords: ["video", "video call", "camera 3"], keywords_en: ["video", "video call", "camera", "facetime"]),
        
        // ========== 邮件系统 ==========
        SingleSymbols(name: "envelope",                  version: .SF1, keywords: ["email", "mail", "message", "contact 2"], keywords_en: ["email", "mail", "message"]),
        SingleSymbols(name: "envelope.front",            version: .SF6, keywords: ["email", "mail", "message", "contact 2", "email 2"], keywords_en: ["email", "mail", "message", "front"]),
        SingleSymbols(name: "envelope.open",             version: .SF1, keywords: ["email", "mail", "message", "open", "read 2"], keywords_en: ["email", "mail", "message", "open", "read"]),
        SingleSymbols(name: "mail",                      version: .SF2, keywords: ["email", "mail", "message", "contact 2"], keywords_en: ["email", "mail", "message"]),
        SingleSymbols(name: "paperplane",                version: .SF1, keywords: ["email", "mail", "message", "contact 2", "share 2", "share", "email 3"], keywords_en: ["email", "mail", "message", "send", "share", "deliver"]),
        
        // ========== 设置系统 ==========
        SingleSymbols(name: "gear",                      version: .SF1, keywords: ["settings", "configuration", "system", "settings 2"], keywords_en: ["settings", "configuration", "system"]),
        SingleSymbols(name: "gearshape",                 version: .SF2, keywords: ["settings", "configuration", "system", "settings 2"], keywords_en: ["settings", "configuration", "system"]),
        SingleSymbols(name: "slider.horizontal.3",       version: .SF1, keywords: ["settings", "configuration", "slider", "adjust", "controls"], keywords_en: ["settings", "configuration", "slider", "adjust", "controls", "parameter"]),
        SingleSymbols(name: "slider.vertical.3",         version: .SF2, keywords: ["settings", "configuration", "slider 2", "adjust", "controls"], keywords_en: ["settings", "configuration", "slider", "adjust", "controls", "parameter"]),
        SingleSymbols(name: "switch.2",                  version: .SF2, keywords: ["boot", "toggle"], keywords_en: ["toggle", "switch", "enable", "disable"]),
        SingleSymbols(name: "ellipsis",                  version: .SF1, keywords: ["more", "menu", "options", "omission", "ellipsis"], keywords_en: ["more", "menu", "options", "omitted"]),
        SingleSymbols(name: "ellipsis.circle",           version: .SF1, keywords: ["more", "menu", "options", "omission", "ellipsis", "circle"], keywords_en: ["more", "menu", "options", "omitted", "circle"]),
        SingleSymbols(name: "nosign",                    version: .SF1, keywords: ["bell 2", "microphone off", "disabled 2", "rejected", "forbidden"], keywords_en: ["forbidden", "prohibited", "disabled", "rejected"]),
        
        
        // ========== AI 与系统能力 ==========
        SingleSymbols(name: "apple.intelligence",        version: .SF6, keywords: ["ai", "intelligence"], keywords_en: ["ai", "intelligence"]),
        
        
        // ========== 图形与编辑 ==========
        SingleSymbols(name: "line.3.crossed.swirl.circle", version: .SF2, keywords: ["swirl", "effect", "filter"], keywords_en: ["swirl", "effect", "filter", "processing"]),
        SingleSymbols(name: "lineweight",                version: .SF2, keywords: ["line weight", "stroke 2"], keywords_en: ["line weight", "stroke", "style"]),
        SingleSymbols(name: "perspective",               version: .SF1, keywords: ["perspective", "transform", "viewpoint"], keywords_en: ["perspective", "transform", "viewpoint"]),
        SingleSymbols(name: "grid",                      version: .SF1, keywords: ["layout", "2x2", "layout 3"], keywords_en: ["#","grid", "layout", "alignment"]),
        
        // ========== 购物容器 ==========
        SingleSymbols(name: "bag",                       version: .SF1, keywords: ["bag", "shopping bag", "store", "retail", "shopping"], keywords_en: ["bag", "shopping bag", "store", "retail"]),
        SingleSymbols(name: "cart",                      version: .SF1, keywords: ["cart", "shopping", "retail"], keywords_en: ["cart", "shopping cart", "store", "retail"]),
        SingleSymbols(name: "basket",                    version: .SF4, keywords: ["basket", "shopping", "food basket", "store 2"], keywords_en: ["basket", "shopping basket", "food basket", "store"]),
        
        // ========== 支付与交易 ==========
        SingleSymbols(name: "creditcard",                version: .SF1, keywords: ["card 4", "payment", "payment 2"], keywords_en: ["card", "credit card", "payment", "pay", "card"]),
        SingleSymbols(name: "wallet.pass",               version: .SF2, keywords: ["wallet", "id card 2", "ticket"], keywords_en: ["wallet", "pass", "ticket"]),
        SingleSymbols(name: "wallet.bifold",             version: .SF6, keywords: ["wallet", "money", "greeting card"], keywords_en: ["wallet", "money", "cash", "card"]),
        SingleSymbols(name: "banknote",                  version: .SF2, keywords: ["money 2", "money", "money 3", "currency"], keywords_en: [ "cash", "banknote", "money", "currency"]),
        SingleSymbols(name: "giftcard",                  version: .SF2, keywords: ["gifts", "gift cards"], keywords_en: ["gifts", "gift cards"]),
        SingleSymbols(name: "purchased",                 version: .SF1, keywords: ["down", "arrow", "down 2", "arrow 2"], keywords_en: ["purchased", "paid", "down", "arrow"]),
        
        // ========== 货币符号 ==========
        SingleSymbols(name: "dollarsign",                version: .SF4, keywords: ["money 2", "dollar", "usd", "currency 2", "price"], keywords_en: ["$", "dollar", "usd", "united states", "currency", "money", "price"]),
        SingleSymbols(name: "eurosign",                  version: .SF4, keywords: ["money 2", "euro", "eur", "currency 2"], keywords_en: ["€", "euro", "eur", "europe", "currency", "money"]),
        SingleSymbols(name: "chineseyuanrenminbisign",   version: .SF5, keywords: ["money 2", "yuan", "rmb", "currency 2", "cny"], keywords_en: ["￥", "yuan", "rmb", "china","cny", "currency", "money"]),
        
        // ========== 礼物系统 ==========
        
        SingleSymbols(name: "gift",                      version: .SF1, keywords: ["gifts", "present", "invitation"], keywords_en: ["gift", "present", "reward", "surprise"]),
        
        // ========== 创作工具 ==========
        SingleSymbols(name: "wand.and.rays",             version: .SF1, keywords: ["magic", "magic wand", "auto", "enhance"], keywords_en: ["magic","magic wand", "auto", "enhance", "ai", "effect"]),
        SingleSymbols(name: "paintbrush",                version: .SF1, keywords: ["brush", "paint", "design", "smearing", "gallery"], keywords_en: ["brush", "paint", "design", "smearing", "art"]),
        SingleSymbols(name: "paintbrush.pointed",        version: .SF2, keywords: ["pencil", "brush 2", "calligraphy brush", "gallery"], keywords_en: ["pen", "brush", "calligraphy brush", "art"]),
        SingleSymbols(name: "paintpalette",              version: .SF2, keywords: ["palette", "sunlight", "paint", "gallery", "painting"], keywords_en: ["palette", "color", "design", "art","painting", "color scheme"]),
        SingleSymbols(name: "eyedropper",                version: .SF1, keywords: ["eyedropper", "dropper", "color picker", "sunlight", "straw"], keywords_en: ["eyedropper", "dropper", "color picker", "sample", "straw", "color selection"]),
        
        // ========== 音乐工具 ==========
        SingleSymbols(name: "pianokeys",                 version: .SF2, keywords: ["piano", "piano keys", "music", "instrument"], keywords_en: ["piano", "piano keys", "music", "instrument"]),
        SingleSymbols(name: "tuningfork",                version: .SF1, keywords: ["tuning fork", "tune", "pitch", "instrument"], keywords_en: ["tuning fork", "tune", "pitch", "calibration", "instrument"]),
        
        // ========== 工具系统 ==========
        SingleSymbols(name: "level",                     version: .SF2, keywords: ["slider", "layout 3", "pitch", "calibration"], keywords_en: ["level", "align", "balance", "calibration", "tool"]),
        SingleSymbols(name: "wrench.adjustable",         version: .SF4, keywords: ["wrench", "crop", "repair", "calibration"], keywords_en: ["wrench", "adjust", "repair", "tool"]),
        SingleSymbols(name: "hammer",                    version: .SF1, keywords: ["repair 2", "hammer", "development", "calibration", "repair"], keywords_en: ["repair", "hammer", "build", "tool", "construction"]),
        SingleSymbols(name: "screwdriver",               version: .SF3, keywords: ["screwdriver", "repair", "assemble", "calibration"], keywords_en: ["screwdriver", "repair", "assemble", "tool"]),
        SingleSymbols(name: "wrench.and.screwdriver",    version: .SF2, keywords: ["calibration", "repair", "settings", "maintenance", "tools"], keywords_en: ["tools", "repair", "settings", "maintenance"]),
        
        // ========== 开发与自动化 ==========
        SingleSymbols(name: "applescript",               version: .SF2, keywords: ["script", "automation", "development"], keywords_en: ["script", "automation", "code", "applescript"]),
        
        // ========== 医疗系统：诊断 ==========
        SingleSymbols(name: "stethoscope",               version: .SF2, keywords: ["medical", "doctor", "stethoscope", "diagnosis"], keywords_en: ["medical", "doctor", "stethoscope", "diagnosis"]),
        SingleSymbols(name: "medical.thermometer",       version: .SF4, keywords: ["medical", "doctor", "thermometer 2", "temperature 2", "fever"], keywords_en: ["medical", "doctor", "thermometer", "temperature", "fever", "measure"]),
        
        // ========== 医疗系统：呼吸 ==========
        SingleSymbols(name: "lungs",                     version: .SF2, keywords: ["lungs", "respiratory", "breathing"], keywords_en: ["lungs", "respiratory", "breathing", "organ"]),
        SingleSymbols(name: "inhaler",                   version: .SF6, keywords: ["medical", "lungs", "respiratory", "breathing 2", "inhaler"], keywords_en: ["medical", "lungs", "respiratory", "breathing", "inhaler", "asthma", "treatment"]),
        
        // ========== 医疗系统：治疗 ==========
        SingleSymbols(name: "pill",                      version: .SF4, keywords: ["medical", "pill", "medicine", "drug"], keywords_en: ["medical", "pill", "medicine", "drug", "treatment"]),
        SingleSymbols(name: "syringe",                   version: .SF4, keywords: ["medical", "injection", "vaccine", "treatment"], keywords_en: ["medical", "injection", "vaccine", "treatment"]),
        SingleSymbols(name: "bandage",                   version: .SF1, keywords: ["medical", "band-aid", "bandage", "wound", "care"], keywords_en: ["medical", "band-aid", "bandage", "wound", "care", "healing"]),
        
        // ========== 医疗系统：防护 ==========
        SingleSymbols(name: "facemask",                  version: .SF3, keywords: ["medical", "mask", "protection 4", "protection 3", "prevention"], keywords_en: ["medical", "mask", "protection", "hygiene", "prevention"]),
        
        // ========== 医疗系统：急救 ==========
        SingleSymbols(name: "cross",                     version: .SF2, keywords: ["medical cross", "medical", "first aid", "emergency 2"], keywords_en: ["medical cross", "medical", "first aid", "emergency", "red cross", "plus sign"]),
        SingleSymbols(name: "staroflife",                version: .SF1, keywords: ["medical", "first aid", "ambulance"], keywords_en: ["medical", "emergency", "ambulance"]),
        
        // ========== 医疗系统：病原 ==========
        SingleSymbols(name: "microbe",                   version: .SF4, keywords: ["bacteria", "virus", "infection", "bacteria 2"], keywords_en: ["bacteria", "virus", "infection"]),
        
        // ========== 心理与认知 ==========
        SingleSymbols(name: "brain",                     version: .SF3, keywords: ["brain", "neural", "cognition", "mind"], keywords_en: ["brain", "neural", "cognition", "mind"]),
        SingleSymbols(name: "brain.head.profile",        version: .SF3, keywords: ["brain", "mind 2", "thinking", "cognition"], keywords_en: ["brain", "mind", "thinking", "mental", "cognitive"]),
        SingleSymbols(name: "apple.meditate",            version: .SF5, keywords: ["human 5", "relax", "yoga"], keywords_en: ["meditation", "mindfulness", "relax", "wellness"]),
        
        // ========== 科研系统（独立于医疗） ==========
        SingleSymbols(name: "flask",                     version: .SF5, keywords: ["flask", "chemistry", "lab", "experiment", "science"],keywords_en: ["flask", "chemistry", "lab", "experiment", "science", "research"]),
        SingleSymbols(name: "testtube.2",                version: .SF3, keywords: ["chemistry 2", "lab", "experiment", "lab 2", "fever"], keywords_en: ["chemistry", "science", "test tube", "lab", "analysis", "experiment"]),
        
        // ========== 办公设备 ==========
        SingleSymbols(name: "printer",                   version: .SF1, keywords: ["printer", "print", "output"], keywords_en: ["printer", "print", "output", "document"]),
        SingleSymbols(name: "scanner",                   version: .SF2, keywords: ["scan", "scan 3", "digitize"], keywords_en: ["scanner", "scan", "digitize", "ocr"]),
        SingleSymbols(name: "faxmachine",                version: .SF2, keywords: ["fax", "fax machine", "communication"], keywords_en: ["fax", "fax machine", "communication"]),
        
        // ========== 随身包（Personal Bags） ==========
        SingleSymbols(name: "handbag",                   version: .SF4, keywords: ["duffle bag", "bag 2"], keywords_en: [ "handbag", "bag", "carry"]),
        SingleSymbols(name: "briefcase",                 version: .SF1, keywords: ["duffle bag", "bag 3", "business"], keywords_en: ["briefcase", "bag", "business", "office", "work"]),
        
        // ========== 容器与防护（Cases & Containers） ==========
        SingleSymbols(name: "case",                      version: .SF2, keywords: ["box", "cabinet", "storage box"], keywords_en: ["box", "cabinet", "storage box", "case", "storage", "protect"]),
        SingleSymbols(name: "cross.case",                version: .SF2, keywords: ["first aid kit", "medical 2", "first aid"], keywords_en: ["first aid kit", "medical", "emergency"]),
        SingleSymbols(name: "suitcase",                  version: .SF3, keywords: ["cabinet", "handbag", "luggage 2"], keywords_en: ["suitcase", "handbag", "luggage"]),
        SingleSymbols(name: "suitcase.rolling",          version: .SF4, keywords: ["cabinet", "rolling suitcase", "luggage 2"], keywords_en: ["suitcase", "rolling suitcase", "luggage"]),
        
        // ========== 艺术与表演 ==========
        SingleSymbols(name: "theatermasks",              version: .SF3, keywords: ["gallery", "drama", "mask 2", "performance", "art"], keywords_en: ["theater", "drama", "mask", "performance", "art"]),
        
        
        // ========== 扩展与模块（Extensions / Plugins） ==========
        SingleSymbols(name: "puzzlepiece.extension",     version: .SF3, keywords: ["puzzle", "module", "component"], keywords_en: ["puzzle", "module", "component", "part"]),
        SingleSymbols(name: "puzzlepiece",               version: .SF2, keywords: ["puzzle", "module", "component"], keywords_en: ["puzzle", "module", "component", "part"]),
        
        
        // ========== 智能家居系统 ==========
        SingleSymbols(name: "homekit",                   version: .SF2, keywords: ["house", "homekit"], keywords_en: ["house", "HomeKit", "home automation", "IoT"]),
        SingleSymbols(name: "wifi.router",               version: .SF4, keywords: ["wifi", "router", "internet 2"], keywords_en: ["wifi", "router", "internet"]),
        
        // ========== 居住空间 ==========
        SingleSymbols(name: "house",                     version: .SF1, keywords: ["house", "house 2", "home", "home 2"], keywords_en: ["home", "house"]),
        SingleSymbols(name: "building",                  version: .SF2, keywords: ["architecture", "building", "structure", "city"], keywords_en: ["architecture", "building", "structure", "city", "company"]),
        SingleSymbols(name: "building.columns",          version: .SF2, keywords: ["architecture", "architecture 2", "government", "bank", "museum"], keywords_en: ["institution", "architecture", "government", "bank", "museum"]),
        
        // ========== 照明系统 ==========
        SingleSymbols(name: "lightbulb",                 version: .SF1, keywords: ["lamp", "light 2", "inspiration", "creativity", "idea", "lamp 2"], keywords_en: ["lamp", "light", "inspiration", "creativity", "idea"]),
        SingleSymbols(name: "lamp.desk",                 version: .SF4, keywords: ["lamp", "light 2", "desk lamp", "study light", "table lamp"], keywords_en: ["lamp", "light", "desk lamp", "study light","table lamp"]),
        SingleSymbols(name: "lamp.floor",                version: .SF4, keywords: ["lamp", "light 2", "floor lamp", "home furnishings"], keywords_en: ["lamp", "light", "floor lamp", "home furnishings"]),
        SingleSymbols(name: "lamp.ceiling",              version: .SF4, keywords: ["lamp", "light 2", "ceiling light", "lamp 3"], keywords_en: ["lamp", "light", "ceiling Light"]),
        SingleSymbols(name: "chandelier",                version: .SF4, keywords: ["lamp", "light 2", "chandelier", "ceiling light", "lamp 4"], keywords_en: ["lamp", "light", "chandelier", "crystal chandelier"]),
        SingleSymbols(name: "light.panel",               version: .SF4, keywords: ["lamp", "light 2", "panel", "lighting panel"], keywords_en: ["lamp", "light", "panel", "lighting panel"]),
        
        // ========== 电力系统 ==========
        SingleSymbols(name: "powerplug",                 version: .SF3, keywords: ["electricity 2", "power supply", "on off", "charging", "energy"], keywords_en: ["plug", "power supply", "socket", "charging", "electric"]),
        SingleSymbols(name: "powercord",                 version: .SF5, keywords: ["electricity 2", "electric wire", "power cord", "charging cable"], keywords_en: ["electric", "electric wire", "power cord", "charging cable"]),
        
        // ========== 水系统 ==========
        SingleSymbols(name: "spigot",                    version: .SF4, keywords: ["water 4", "faucet", "water 6"], keywords_en: ["tap", "faucet", "water"]),
        SingleSymbols(name: "shower",                    version: .SF4, keywords: ["water 4", "bath", "water 7"], keywords_en: ["shower", "bath", "water"]),
        SingleSymbols(name: "bathtub",                   version: .SF4, keywords: ["water 4", "bath 2", "water 8", "water 7"], keywords_en: ["bathtub", "bath", "water"]),
        SingleSymbols(name: "sprinkler",                 version: .SF4, keywords: ["water 4", "irrigation", "watering", "water 9", "sprinkler", "sprinkler 2"], keywords_en: ["sprinkler", "irrigation", "watering", "water"]),
        SingleSymbols(name: "sink",                      version: .SF4, keywords: ["water 4", "kitchen sink", "basin", "wash", "washing", "water 10"], keywords_en: ["sink", "kitchen sink", "basin", "wash", "washing", "water"]),
        SingleSymbols(name: "toilet",                    version: .SF4, keywords: ["water 4", "bathroom 2", "human 11", "restroom", "bathroom"], keywords_en: ["toilet", "bathroom", "restroom", "wc", "lavatory", "water"]),
        
        // ========== 家电系统 ==========
        SingleSymbols(name: "fan",                       version: .SF5, keywords: ["home appliance", "cooling", "ventilation", "air", "fan", "electric fan"], keywords_en: ["home appliances", "cooling", "ventilation", "air", "fan", "electric fan"]),
        SingleSymbols(name: "fan.ceiling",               version: .SF4, keywords: ["home appliance", "cooling", "ventilation", "air", "fan 2"], keywords_en: ["home appliances", "cooling", "ventilation", "air", "fan", "ceiling fan"]),
        SingleSymbols(name: "dehumidifier",              version: .SF4, keywords: ["home appliance", "dehumidifier", "dehumidify", "dry", "weather 4", "moisture"], keywords_en: ["home appliances", "dehumidifier", "dehumidify", "dry", "humidity", "air"]),
        SingleSymbols(name: "humidifier",                version: .SF4, keywords: ["home appliances", "humidifier", "weather 4", "moisture", "home appliance"], keywords_en: ["home appliances", "humidifier", "humidify", "humidity", "air", "moisture"]),
        SingleSymbols(name: "robotic.vacuum",            version: .SF6, keywords: ["home appliances 2", "robot vacuum", "robotic vacuum", "vacuuming", "home appliance", "vacuum"], keywords_en: ["home appliances", "robot vacuum", "robotic vacuum", "vacuuming",  "cleaning", "vacuum", "roomba"]),
        SingleSymbols(name: "refrigerator",              version: .SF4, keywords: ["home appliances 3", "refrigerator", "fridge", "freezer", "home appliance"], keywords_en: ["home appliances", "refrigerator", "fridge", "freezer", "cooling"]),
        SingleSymbols(name: "microwave",                 version: .SF4, keywords: ["home appliances 4", "microwave", "washing", "home appliance"], keywords_en: ["home appliances", "microwave", "microwave oven", "heat", "cook"]),
        SingleSymbols(name: "oven",                      version: .SF4, keywords: ["home appliances 5", "oven", "baking", "washing", "home appliance"], keywords_en: ["home appliances", "oven", "baking", "bake", "cook"]),
        SingleSymbols(name: "stove",                     version: .SF4, keywords: ["stove", "cooktop", "gas stove", "cooking", "washing"], keywords_en: ["stove", "cooktop", "gas stove", "cooking"]),
        SingleSymbols(name: "washer",                    version: .SF4, keywords: ["home appliances 6", "washer", "water 10", "laundry", "home appliance"], keywords_en: ["home appliances", "washer", "washing machine", "laundry", "wash"]),
        
        
        // ========== 家具系统 ==========
        SingleSymbols(name: "bed.double",                version: .SF1, keywords: ["furniture", "double bed", "bed", "sleep 4", "rest", "furniture 2"], keywords_en: ["furniture", "double bed", "bed", "sleep", "bedroom"]),
        SingleSymbols(name: "sofa",                      version: .SF4, keywords: ["furniture 3", "sofa", "rest", "seat 2", "furniture 2"], keywords_en: ["furniture", "sofa", "couch", "seat", "living room"]),
        SingleSymbols(name: "chair",                     version: .SF4, keywords: ["furniture 4", "student desk 2", "seat 2", "furniture 2"], keywords_en: ["furniture", "chair", "seat", "sitting"]),
        SingleSymbols(name: "table.furniture",           version: .SF4, keywords: ["study", "table", "desk 2", "furniture 2"], keywords_en: ["furniture", "table", "desk", "dining table"]),
        SingleSymbols(name: "cabinet",                   version: .SF4, keywords: ["furniture 5", "cabinet 2", "organization", "cupboard", "furniture 2"], keywords_en: ["furniture", "cabinet", "storage", "cupboard"]),
        SingleSymbols(name: "chair.lounge",              version: .SF4, keywords: ["furniture 4", "lounge chair", "recliner", "yoga", "rest", "furniture 2"], keywords_en: ["furniture", "lounge chair", "recliner", "relax", "chair"]),
        
        // ========== 空间结构 ==========
        SingleSymbols(name: "stairs",                    version: .SF4, keywords: ["stairs", "staircase", "steps"], keywords_en: ["stairs", "staircase", "steps", "stairs up", "stairs down"]),
        SingleSymbols(name: "door.left.hand.open",       version: .SF4, keywords: ["door", "door open", "open door", "entrance", "exit"], keywords_en: ["door", "door open", "open door", "entrance", "exit", "doorway"]),
        SingleSymbols(name: "fireplace",                 version: .SF4, keywords: ["fireplace", "heater", "fire 3", "cold", "home furnishings"], keywords_en: ["fireplace", "heater", "fire", "warm", "indoor"]),
        
        // ========== 装修与节日 ==========
        SingleSymbols(name: "balloon",                   version: .SF4, keywords: ["balloon", "party", "celebration", "birthday", "medal", "invitation"], keywords_en: ["balloon", "party", "celebration", "birthday", "decoration", "festival"]),
        SingleSymbols(name: "fireworks",                 version: .SF5, keywords: ["fireworks", "celebration 2", "festival", "invitation", "explosion", "party"], keywords_en: ["fireworks", "celebration", "festival", "new year", "explosion"]),
        SingleSymbols(name: "party.popper",              version: .SF4, keywords: ["party popper", "party", "celebration", "invitation"], keywords_en: ["party popper", "celebration", "party", "confetti", "festival"]),
        SingleSymbols(name: "popcorn",                   version: .SF4, keywords: ["popcorn", "snack", "movie", "cinema", "food"], keywords_en: ["popcorn", "snack", "movie", "cinema", "food"]),
        
        // ========== 户外与自然居住 ==========
        SingleSymbols(name: "tent",                      version: .SF4, keywords: ["tent", "camping", "outdoor", "mountain", "shelter"], keywords_en: ["tent", "camping", "outdoor", "camp", "shelter"]),
        SingleSymbols(name: "house.lodge",               version: .SF4, keywords: ["lodge", "cabin", "house 3", "mountain"], keywords_en: ["lodge", "cabin", "house", "vacation home", "cottage"]),
        
        // ========== 商业与家居设备 ==========
        SingleSymbols(name: "storefront",                version: .SF5, keywords: ["storefront", "retail", "store 3", "retail 2", "business 2"], keywords_en: ["storefront", "shop", "store", "retail", "business"]),
        
        // ========== 特效与视觉 ==========
        SingleSymbols(name: "laser.burst",               version: .SF5, keywords: ["laser", "burst", "beam", "light 3", "power 4"], keywords_en: ["laser", "burst", "beam", "light", "effect"]),
        
        // ========== 厨房与餐饮 ==========
        SingleSymbols(name: "frying.pan",                version: .SF4, keywords: ["pot", "frying pan", "pan", "cook", "cooking", "washing", "kitchenware", "pot 2"], keywords_en: ["pot", "frying pan", "pan", "cook", "cooking", "kitchen", "kitchenware"]),
        
        // ========== UI 布局 ==========
        SingleSymbols(name: "square.split.bottomrightquarter", version: .SF2, keywords: ["split 3", "2x2", "split 2", "section"], keywords_en: ["split", "layout", "grid", "section", "partition"]),
        
        // ========== 教育与地理 ==========
        SingleSymbols(name: "globe.desk",                version: .SF4, keywords: ["globe 2", "geography", "academic", "world", "learning"], keywords_en: ["globe", "globe desk", "geography", "education", "world"]),
        
        // ========== 安全与锁定 ==========
        SingleSymbols(name: "lock",                      version: .SF1, keywords: ["lock", "locked", "secure", "safety", "privacy", "umbrella 2", "password"], keywords_en: ["lock", "locked", "secure", "security", "privacy", "protection", "password"]),
        SingleSymbols(name: "lock.open",                 version: .SF1, keywords: ["lock", "unlock", "unlocked", "open lock", "access", "allow"], keywords_en: ["lock", "unlock", "unlocked", "open lock", "access", "allow"]),
        SingleSymbols(name: "key",                       version: .SF2, keywords: ["key 2", "password 2", "unlock", "credential 3"], keywords_en: ["key", "password", "access key", "credential", "unlock"]),
        SingleSymbols(name: "wifi",                      version: .SF1, keywords: ["internet 2", "router", "connect", "earth"], keywords_en: ["wifi", "wi-fi", "wireless", "network", "internet", "connection"]),
        SingleSymbols(name: "faceid",                    version: .SF1, keywords: ["face id", "faceid", "facial recognition", "unlock", "recognition"], keywords_en: ["face id", "faceid", "facial recognition", "biometric", "authentication", "unlock"]),
        SingleSymbols(name: "touchid",                   version: .SF2, keywords: ["touch id", "touchid", "facial recognition", "unlock", "recognition"], keywords_en: ["touch id", "touchid", "fingerprint", "biometric", "authentication", "unlock"]),
        SingleSymbols(name: "opticid",                   version: .SF5, keywords: ["optic id", "facial recognition", "recognition"], keywords_en: ["optic id", "opticid", "iris recognition", "biometric", "authentication", "vision pro"]),
        
        // ========== 三维与空间 ==========
        SingleSymbols(name: "move.3d",                   version: .SF2, keywords: ["mount 2", "translate", "position 2", "viewpoint"], keywords_en: ["move", "translate", "position"]),
        SingleSymbols(name: "torus",                     version: .SF2, keywords: ["torus", "donut shape", "3d", "geometry", "shape"], keywords_en: ["torus", "donut shape", "3d", "geometry", "shape"]),
        SingleSymbols(name: "rotate.left",               version: .SF1, keywords: ["rotate left", "rotate", "rotate 2", "viewpoint"], keywords_en: ["rotate left", "rotation", "rotate", "transform"]),
        SingleSymbols(name: "cube",                      version: .SF1, keywords: ["cube", "square 2", "3d", "geometry 3", "geometry"], keywords_en: ["cube", "box", "3d", "geometry", "model"]),
        SingleSymbols(name: "shippingbox",               version: .SF2, keywords: ["boxes", "cardboard boxes", "shipping box", "package 2", "delivery", "logistics"], keywords_en: ["boxes", "cardboard boxes", "shipping box", "package", "delivery", "logistics"]),
        SingleSymbols(name: "arkit",                     version: .SF1, keywords: ["arkit", "translate", "development"], keywords_en: ["arkit", "augmented reality", "ar", "spatial", "apple ar"]),
        SingleSymbols(name: "cone",                      version: .SF2, keywords: ["cone", "3d 2", "3d", "geometry", "shape"], keywords_en: ["cone", "3d", "geometry", "shape"]),
        SingleSymbols(name: "square.stack.3d.down.right", version: .SF1, keywords: ["stack 2", "layers", "layers 2", "multiple", "section"], keywords_en: ["3d", "stack", "layers", "stack", "hierarchy", "ui layers"]),
        SingleSymbols(name: "square.stack.3d.up",        version: .SF1, keywords: ["stack 2", "layers", "layers 2", "stack 3", "multiple"], keywords_en: ["3d", "stack up", "layers", "stack", "move up", "hierarchy"]),
        SingleSymbols(name: "square.2.layers.3d",        version: .SF4, keywords: ["2 layers", "layers", "stack", "layers 3", "3d"], keywords_en: ["2 layers", "stack", "double layer", "layers", "depth", "3d"]),
        SingleSymbols(name: "square.3.layers.3d.down.right", version: .SF3, keywords: ["3 layers", "layers", "stack 2", "layers 2", "3d"], keywords_en: ["3 layers", "stack", "layers", "hierarchy", "3d"]),
        SingleSymbols(name: "cylinder",                  version: .SF2, keywords: ["cylinder", "3d", "geometry", "shape", "database"], keywords_en: ["cylinder", "3d", "geometry", "shape", "database"]),
        
        // ========== 核心硬件 ==========
        SingleSymbols(name: "cpu",                       version: .SF2, keywords: ["cpu", "processor", "chip", "compute", "performance 2", "hardware"], keywords_en: ["cpu", "processor", "chip", "compute", "performance", "hardware"]),
        SingleSymbols(name: "memorychip",                version: .SF2, keywords: ["memory 2", "chip", "folder 2", "hardware"], keywords_en: ["memory", "ram", "memory chip", "storage", "hardware"]),
        SingleSymbols(name: "opticaldisc",               version: .SF2, keywords: ["optical disc", "folder 2", "dvd", "hardware"], keywords_en: ["optical disc", "cd", "dvd", "media", "storage"]),
        SingleSymbols(name: "sensor.tag.radiowaves.forward", version: .SF3, keywords: ["hardware 2", "tag", "nfc", "tag 2", "hardware"], keywords_en: ["hardware", "sensor", "nfc", "tag", "wireless", "scan"]),
        SingleSymbols(name: "airtag",                    version: .SF3, keywords: ["location", "airtag", "tracking", "hardware"], keywords_en: ["hardware", "airtag", "tracking", "locator", "find", "item tracker"]),
        
        // ========== 计算设备 ==========
        SingleSymbols(name: "display",                   version: .SF2, keywords: ["hardware 3", "display", "monitor", "screen", "hardware"], keywords_en: ["hardware", "display", "monitor", "screen", "computer", "pc"]),
        SingleSymbols(name: "pc",                        version: .SF2, keywords: ["monitor", "pc", "screen", "hardware"], keywords_en: ["hardware", "pc", "desktop", "computer"]),
        SingleSymbols(name: "xserve",                    version: .SF2, keywords: ["hardware 4", "server", "xserve", "hardware"], keywords_en: ["hardware", "server", "xserve", "rack server", "data center"]),
        SingleSymbols(name: "server.rack",               version: .SF2, keywords: ["hardware 4", "server", "xserve", "hardware"], keywords_en: ["hardware", "server rack", "data center"]),
        SingleSymbols(name: "laptopcomputer",            version: .SF2, keywords: ["hardware 5", "monitor", "screen", "hardware"], keywords_en: ["hardware", "laptop", "notebook", "portable computer", "computer", "pc"]),
        SingleSymbols(name: "macmini",                   version: .SF2, keywords: ["pc", "mac mini", "hardware"], keywords_en: ["hardware", "mac mini", "desktop mac", "apple computer", "computer", "pc"]),
        
        // ========== 移动设备 ==========
        SingleSymbols(name: "smartphone",                version: .SF5, keywords: ["hardware 6", "smartphone", "phone 2", "hardware"], keywords_en: ["hardware", "smartphone", "phone", "mobile device"]),
        SingleSymbols(name: "flipphone",                 version: .SF2, keywords: ["smartphone", "phone 3", "flip phone", "feature phone", "hardware"], keywords_en: ["hardware", "phone", "flip phone", "feature phone", "old phone"]),
        SingleSymbols(name: "candybarphone",             version: .SF2, keywords: ["hardware 7", "feature phone", "flip phone", "hardware"], keywords_en: ["hardware", "candy bar phone", "feature phone", "classic phone"]),
        SingleSymbols(name: "ipad",                      version: .SF2, keywords: ["hardware 8", "ipad", "hardware", "apple device"], keywords_en: ["hardware", "ipad", "tablet", "tablet computer", "apple device"]),
        SingleSymbols(name: "ipod",                      version: .SF2, keywords: ["music", "player", "hardware 9", "ipod", "apple device", "hardware"], keywords_en: ["music", "player", "hardware", "ipod", "music player", "mp3 player", "portable music", "apple device"]),
        SingleSymbols(name: "vision.pro",                version: .SF6, keywords: ["hardware 10", "vision pro", "hardware"], keywords_en: ["hardware", "vision pro", "spatial computing", "xr headset", "ar vr", "headset"]),
        
        // ========== iPad 行为 ==========
        SingleSymbols(name: "ipad.landscape",            version: .SF2, keywords: ["hardware 11", "ipad 2", "hardware 8", "hardware"], keywords_en: ["hardware", "iPad", "landscape", "tablet landscape", "horizontal"]),
        
        // ========== iPhone 行为 ==========
        SingleSymbols(name: "iphone.gen1.and.arrow.left", version: .SF6, keywords: ["back 3", "rewind", "go back"], keywords_en: ["iPhone","return", "go back", "migrate"]),
        SingleSymbols(name: "iphone.gen2.and.arrow.left.and.arrow.right.inward", version: .SF6, keywords: ["loop", "synchronization"], keywords_en: ["iPhone", "synchronization", "data migration"]),
        SingleSymbols(name: "iphone.and.arrow.right.outward", version: .SF6, keywords: ["iphone", "go back", "send"], keywords_en: ["iPhone", "export", "send", "share"]),
        SingleSymbols(name: "iphone.rear.camera",        version: .SF3, keywords: ["iphone 2"], keywords_en: ["iPhone", "Rear camera"]),
        SingleSymbols(name: "iphone.gen1.crop.circle",   version: .SF6, keywords: ["iphone 3", "circular icon"], keywords_en: ["iPhone", "circular icon", "device icon"]),
        SingleSymbols(name: "iphone.gen1.radiowaves.left.and.right", version: .SF4, keywords: ["iphone 4", "call", "router", "nfc", "flags"], keywords_en: ["iPhone", "signal", "call", "network", "wireless", "communication"]),
        SingleSymbols(name: "platter.filled.top.iphone", version: .SF3, keywords: ["status bar", "notify", "notification area"], keywords_en: ["status bar", "top bar", "notification area"]),
        
        // ========== 输入设备 ==========
        SingleSymbols(name: "applepencil",               version: .SF3, keywords: ["pencil", "pencil 2", "drawing", "write", "hardware"], keywords_en: ["hardware", "pencil", "apple pencil", "stylus", "drawing", "writing"]),
        SingleSymbols(name: "magicmouse",                version: .SF3, keywords: ["mouse", "magic mouse", "hardware"], keywords_en: ["hardware", "magic mouse", "mouse", "apple mouse"]),
        SingleSymbols(name: "computermouse",             version: .SF3, keywords: ["mouse", "mouse 2", "keyboard", "hardware"], keywords_en: ["hardware", "mouse", "computer mouse", "input device"]),
        
        // ========== 音频设备 ==========
        SingleSymbols(name: "headphones",                version: .SF1, keywords: ["headphones", "over ear", "music", "noise cancelling"], keywords_en: ["headphones", "over ear", "audio", "noise cancelling", "music"]),
        SingleSymbols(name: "headset",                   version: .SF6, keywords: ["headphones 2", "mic headset", "call 2", "game", "music"], keywords_en: ["headphones", "mic headset", "call", "gaming", "customer service", "music"]),
        SingleSymbols(name: "airpods",                   version: .SF2, keywords: ["headphones 3", "airpods", "music"], keywords_en: ["headphones", "airpods", "wireless earbuds", "wireless headphones", "bluetooth", "music", "apple headphones"]),
        SingleSymbols(name: "earbuds",                   version: .SF3, keywords: ["headphones", "headphones 3", "airpods", "wireless headphones", "music"], keywords_en: ["headphones", "airpods", "wireless earbuds", "wireless headphones", "in-ear headphones", "music", "bluetooth"]),
        SingleSymbols(name: "earbuds.case",              version: .SF3, keywords: ["headphones", "earbuds case", "organization", "case"], keywords_en: ["headphones", "earbuds case", "charging case", "case"]),
        SingleSymbols(name: "airpods.max",               version: .SF6, keywords: ["headphones", "over ear", "noise cancelling", "music", "noise cancelling 2"], keywords_en: ["headphones", "music", "airpods max", "over ear headphones", "noise cancelling", "apple headphones"]),
        SingleSymbols(name: "earpods",                   version: .SF2, keywords: ["music 2", "noise cancelling 2", "audio 4"], keywords_en: ["music", "headphones", "earpods", "wired earphones", "apple headphones", "earphones"]),
        SingleSymbols(name: "airpods.gen3",              version: .SF3, keywords: ["headphones 3", "airpods", "airpods 3", "noise cancelling 2"], keywords_en: ["music", "headphones", "airpods 3", "wireless earbuds", "bluetooth earbuds", "true wireless", "apple headphones"]),
        SingleSymbols(name: "homepod",                   version: .SF2, keywords: ["homepod", "siri", "siri speaker", "home audio", "apple device"], keywords_en: ["homepod", "smart speaker", "siri speaker", "home audio", "voice assistant", "apple device"]),
        SingleSymbols(name: "hifispeaker",               version: .SF1, keywords: ["music 3", "volume", "speaker 2", "audio system", "music"], keywords_en: ["music", "hifi speaker", "speaker", "audio system", "high fidelity", "sound"]),
        
        // ========== 媒体与现实 ==========
        SingleSymbols(name: "tv",                        version: .SF1, keywords: ["television", "display", "report", "television 2"], keywords_en: ["television", "display", "media"]),
        SingleSymbols(name: "4k.tv",                     version: .SF2, keywords: ["television", "4k tv", "ultra hd"], keywords_en: ["tv", "4k tv", "ultra hd", "television"]),
        SingleSymbols(name: "airplay.video",             version: .SF6, keywords: ["screen mirroring", "cast", "stream"], keywords_en: ["screen mirroring", "cast", "stream"]),
        SingleSymbols(name: "pip",                       version: .SF2, keywords: ["picture in picture", "floating window", "picture in picture 2"], keywords_en: ["picture in picture", "floating window"]),
        SingleSymbols(name: "appletv",                   version: .SF2, keywords: ["hardware 12", "apple tv", "streaming box", "set top box", "hardware"], keywords_en: ["hardware", "apple tv", "streaming box", "set top box", "media", "streaming"]),
        SingleSymbols(name: "appletvremote.gen1",        version: .SF3, keywords: ["hardware 13", "remote control", "media control", "hardware"], keywords_en: ["hardware", "remote control", "apple tv remote", "controller", "media remote"]),
        SingleSymbols(name: "mediastick",                version: .SF3, keywords: ["hardware 14", "media stick", "streaming stick", "hardware 12", "set top device", "hardware", "hardware 15"], keywords_en: ["hardware", "media stick", "streaming stick", "tv stick", "set top device", "usb flash drive"]),
        
        // ========== 通信 ==========
        SingleSymbols(name: "antenna.radiowaves.left.and.right", version: .SF1, keywords: ["antenna", "iphone 4", "nfc", "flags"], keywords_en: ["antenna", "signal", "wireless", "communication"]),
        SingleSymbols(name: "simcard",                   version: .SF2, keywords: ["sim card", "carrier", "mobile network", "flags"], keywords_en: ["sim card", "carrier", "mobile network", "communication"]),
        SingleSymbols(name: "esim",                      version: .SF2, keywords: ["esim"], keywords_en: ["esim", "embedded sim", "digital sim", "communication"]),
        
        // ========== Apple 设备生态 ==========
        SingleSymbols(name: "iphone.case",               version: .SF5, keywords: ["iphone case", "phone case", "cover", "protection case"], keywords_en: ["iphone case", "phone case", "cover", "protection case", "accessory"]),
        
        // ========== Apple Watch ==========
        SingleSymbols(name: "applewatch",                version: .SF2, keywords: ["hardware 16", "apple watch", "smartwatch", "sport", "hardware"], keywords_en: ["hardware", "apple watch", "smartwatch", "wearable", "fitness", "health"]),
        SingleSymbols(name: "applewatch.side.right",     version: .SF2, keywords: ["hardware 17", "digital crown", "side button", "side", "hardware"], keywords_en: ["hardware", "digital crown", "side button", "side", "control"]),
        
        
        // ========== 接口 / 连接 ==========
        SingleSymbols(name: "cable.connector",           version: .SF3, keywords: ["cable", "connector", "data cable", "wire", "connect"], keywords_en: ["cable", "connector", "data cable", "wire", "connection"]),
        SingleSymbols(name: "audio.jack.mono",           version: .SF5, keywords: ["headphones", "audio jack", "3 5mm jack", "wire"], keywords_en: ["headphones", "audio jack", "3.5mm jack", "headphone port", "aux", "audio port"]),
        
        // ========== 广播 / 信号 ==========
        SingleSymbols(name: "radio",                     version: .SF2, keywords: ["am", "announcement", "audio 4"], keywords_en: ["am", "fm", "radio", "broadcast", "audio", "receiver"]),
        SingleSymbols(name: "dot.radiowaves.left.and.right", version: .SF1, keywords: ["radio waves", "iphone 4", "announcement", "flags"], keywords_en: ["radio waves", "signal", "wireless", "broadcast"]),
        
        // ========== UI 全屏 ==========
        SingleSymbols(name: "rectangle.arrowtriangle.2.outward", version: .SF2, keywords: ["full screen", "expand", "scroll 2", "disability", "hardware 11", "ipad 2"], keywords_en: ["full screen", "expand", "scroll", "landscape", "horizontal"]),
        SingleSymbols(name: "rectangle.portrait.arrowtriangle.2.outward", version: .SF2, keywords: ["full screen", "expand", "scroll 2", "disability", "shape 3", "portrait 2"], keywords_en: ["full screen", "expand", "scroll", "portrait", "vertical"]),
        
        // ========== 乐器 ==========
        SingleSymbols(name: "guitars",                   version: .SF1, keywords: ["instrument 2", "instrument", "music", "audio 5", "audio 4", "instrument 3"], keywords_en: ["instrument", "music", "playing", "audio", "rock"]),
        
        // ========== 存储 ==========
        SingleSymbols(name: "sdcard",                    version: .SF2, keywords: ["sd card", "memory card", "storage 4", "flash card", "storage expansion"], keywords_en: ["sd card", "memory card", "storage", "flash card", "storage expansion"]),
        
        // ========== 空中交通 ==========
        SingleSymbols(name: "airplane",                  version: .SF1, keywords: ["transportation 2", "airplane", "flight", "aircraft", "campus", "transportation"], keywords_en: ["transportation", "airplane", "flight", "aircraft", "aviation", "travel"]),
        SingleSymbols(name: "drone",                     version: .SF6, keywords: ["transportation 2", "drone", "uav", "flight", "quadcopter", "photo"], keywords_en: ["airplane", "drone", "uav", "aerial", "quadcopter", "flying camera"]),
        
        // ========== 陆地交通 ==========
        SingleSymbols(name: "car",                       version: .SF1, keywords: ["vehicle", "car", "vehicle 2", "driving", "automobile", "carry", "transportation"], keywords_en: ["transportation", "car", "vehicle", "driving", "automobile", "transport"]),
        SingleSymbols(name: "bus",                       version: .SF2, keywords: ["transportation", "vehicle", "bus", "public transport", "transit", "carry"], keywords_en: ["transportation", "car", "bus", "public transport", "transit", "coach", "city bus"]),
        SingleSymbols(name: "tram",                      version: .SF2, keywords: ["transportation", "tram", "streetcar", "light rail", "rail transit"], keywords_en: ["transportation", "tram", "streetcar", "light rail", "rail transit"]),
        SingleSymbols(name: "train.side.front.car",      version: .SF3, keywords: ["transportation", "train", "railway", "high speed rail", "subway", "light rail"], keywords_en: ["transportation", "train", "railway", "high speed rail", "subway", "rail transport"]),
        SingleSymbols(name: "truck.box",                 version: .SF5, keywords: ["transportation", "vehicle", "truck", "cargo", "delivery", "logistics", "freight"], keywords_en: ["transportation", "car", "truck", "cargo", "logistics", "delivery", "freight"]),
        
        // ========== 水上交通 ==========
        SingleSymbols(name: "ferry",                     version: .SF3, keywords: ["transportation", "ferry", "water transport", "shipping", "marine transport", "transportation 3", "transportation 4"], keywords_en: ["transportation", "ferry", "water transport", "shipping", "marine transport"]),
        SingleSymbols(name: "sailboat",                  version: .SF4, keywords: ["transportation", "ferry", "sailboat", "sailing", "yacht", "marine", "campus"], keywords_en: ["transportation", "boat", "sailboat", "sailing", "yacht", "marine", "sea travel"]),
        
        // ========== 两轮交通 ==========
        SingleSymbols(name: "bicycle",                   version: .SF2, keywords: ["transportation", "vehicle", "cycling", "cycling 2", "bicycle", "sport"], keywords_en: ["transportation", "bicycle", "bike", "cycling", "ride"]),
        SingleSymbols(name: "motorcycle",                version: .SF6, keywords: ["transportation", "vehicle", "bike", "motorbike", "bicycle", "two wheeler", "transportation 5"], keywords_en: ["transportation", "motorcycle", "bike", "motorbike", "ride", "two wheeler"]),
        SingleSymbols(name: "moped",                     version: .SF6, keywords: ["transportation", "vehicle", "scooter bike", "small motorcycle", "electric bike", "transportation 6"], keywords_en: ["transportation", "moped", "scooter bike", "small motorcycle", "electric bike"]),
        SingleSymbols(name: "scooter",                   version: .SF3, keywords: ["transportation", "vehicle", "electric scooter", "kick scooter", "e scooter", "electric bike"], keywords_en: ["transportation", "scooter", "electric scooter", "kick scooter", "e scooter"]),
        
        // ========== 特殊人群 / 辅助交通 ==========
        SingleSymbols(name: "wheelchair",                version: .SF6, keywords: ["human 10", "human 9", "accessible"], keywords_en: ["wheelchair", "accessibility", "disabled"]),
        SingleSymbols(name: "stroller",                  version: .SF4, keywords: ["stroller", "baby stroller", "pram", "three people 3", "carry"], keywords_en: ["stroller", "baby stroller", "pram", "child transport"]),
        SingleSymbols(name: "helmet",                    version: .SF6, keywords: ["helmet", "safety helmet", "protection 3", "bicycle", "safety", "helmet 2"], keywords_en: ["helmet", "safety helmet", "protection", "cycling", "gear"]),
        
        // ========== 基础设施 ==========
        SingleSymbols(name: "parkingsign",               version: .SF3, keywords: ["parking", "parking sign", "parking lot", "car park"], keywords_en: ["parking", "parking sign", "parking lot", "car park", "parking space"]),
        SingleSymbols(name: "fuelpump",                  version: .SF3, keywords: ["fuel pump", "gas station", "refuel", "petrol", "gasoline"], keywords_en: ["fuel pump", "gas station", "refuel", "petrol", "gasoline"]),
        
        
        // ========== 动力系统 ==========
        SingleSymbols(name: "engine.combustion",         version: .SF4, keywords: ["engine", "combustion engine", "powertrain", "internal combustion", "refuel", "car"], keywords_en: ["engine", "combustion engine", "powertrain", "internal combustion", "motor"]),
        SingleSymbols(name: "transmission",              version: .SF4, keywords: ["transmission", "gearbox", "drivetrain", "gear system"], keywords_en: ["transmission", "gearbox", "drivetrain", "gear system"]),
        SingleSymbols(name: "axle.2",                    version: .SF4, keywords: ["axle", "driveshaft", "4wd", "drivetrain component"], keywords_en: ["axle", "driveshaft", "4wd", "drivetrain component"]),
        SingleSymbols(name: "suspension.shock",          version: .SF6, keywords: ["suspension", "shock absorber", "suspension system", "damping"], keywords_en: ["suspension", "shock absorber", "suspension system", "damping"]),
        
        // ========== 电气 / 能源 ==========
        SingleSymbols(name: "batteryblock",              version: .SF4, keywords: ["battery pack", "ev battery", "electric vehicle", "small motorcycle", "energy"], keywords_en: ["battery pack", "ev battery", "electric vehicle", "charging", "power storage"]),
        SingleSymbols(name: "glowplug",                  version: .SF4, keywords: ["glow plug", "diesel engine", "playback"], keywords_en: ["glow plug", "diesel engine", "cold start"]),
        SingleSymbols(name: "oilcan",                    version: .SF4, keywords: ["oil", "lubricant", "engine oil", "maintenance 2", "repair"], keywords_en: ["oil", "lubricant", "engine oil", "maintenance", "service"]),
        
        // ========== 安全系统 ==========
        SingleSymbols(name: "abs",                       version: .SF4, keywords: ["abs", "anti lock braking", "brake system"], keywords_en: ["abs", "anti lock braking", "brake system", "safety system"]),
        SingleSymbols(name: "brakesignal",               version: .SF4, keywords: ["brake", "anti lock braking", "stop signal", "brake light"], keywords_en: ["brake", "braking", "stop signal", "brake light"]),
        SingleSymbols(name: "tirepressure",              version: .SF5, keywords: ["tire pressure", "tpms"], keywords_en: ["tire pressure", "tpms", "pressure monitoring"]),
        SingleSymbols(name: "hazardsign",                version: .SF4, keywords: ["hazard", "warning", "danger", "fire extinguisher 2"], keywords_en: ["hazard", "warning", "danger", "emergency"]),
        SingleSymbols(name: "yieldsign",                 version: .SF5, keywords: ["yield", "give way", "traffic sign", "stop signal"], keywords_en: ["yield", "give way", "traffic sign", "slow down"]),
        SingleSymbols(name: "wrongwaysign",              version: .SF4, keywords: ["wrong way", "no entry", "do not enter", "transportation"], keywords_en: ["wrong way", "no entry", "do not enter", "traffic restriction"]),
        
        // ========== 视野 / 控制 ==========
        SingleSymbols(name: "steeringwheel",             version: .SF4, keywords: ["steering wheel", "vehicle 2", "steering"], keywords_en: ["steering wheel", "driving", "steering"]),
        SingleSymbols(name: "mirror.side.left",          version: .SF4, keywords: ["side mirror", "rearview mirror"], keywords_en: ["side mirror", "rearview mirror"]),
        SingleSymbols(name: "windshield.front.and.wiper", version: .SF4, keywords: ["windshield wiper", "windshield"], keywords_en: ["windshield wiper", "windshield"]),
        SingleSymbols(name: "headlight.high.beam",       version: .SF4, keywords: ["headlight", "high beam", "car light", "light 2"], keywords_en: ["headlight", "high beam", "car light", "illumination"]),
        SingleSymbols(name: "parkinglight",              version: .SF4, keywords: ["parking light", "position light", "car light"], keywords_en: ["parking light", "position light", "marker light", "car light"]),
        
        // ========== 车辆结构 ==========
        SingleSymbols(name: "tire",                      version: .SF6, keywords: ["tire", "wheel"], keywords_en: ["tire", "wheel"]),
        SingleSymbols(name: "tow.hitch",                 version: .SF6, keywords: ["tow hitch", "trailer hitch"], keywords_en: ["tow hitch", "trailer hitch"]),
        SingleSymbols(name: "carseat.left",              version: .SF5, keywords: ["seat 3", "car seat", "child seat"], keywords_en: ["seat", "car seat", "child seat"]),
        SingleSymbols(name: "car.side.front.open.crop",  version: .SF6, keywords: ["car", "trunk", "front of car"], keywords_en: ["car", "trunk", "front of car"]),
        SingleSymbols(name: "car.side.rear.open.crop",   version: .SF6, keywords: ["car", "trunk 2", "rear"], keywords_en: ["car", "trunk", "rear"]),
        SingleSymbols(name: "car.top.door.front.left.open", version: .SF4, keywords: ["car", "top view", "car door", "open door"], keywords_en: ["car", "top view", "car door", "enter"]),
        
        // ========== 车型 / 外观 ==========
        SingleSymbols(name: "car.side",                  version: .SF4, keywords: ["car", "sedan", "vehicle side", "automobile", "car 2"], keywords_en: ["car", "sedan", "vehicle side", "automobile"]),
        SingleSymbols(name: "suv.side",                  version: .SF4, keywords: ["car 3", "car 2", "suv"], keywords_en: ["car", "automobile", "suv", "sport utility vehicle", "off road", "4x4"]),
        SingleSymbols(name: "truck.pickup.side",         version: .SF5, keywords: ["car 4", "cargo"], keywords_en: ["car", "automobile", "pickup truck", "truck", "cargo vehicle", "utility truck"]),
        SingleSymbols(name: "convertible.side",          version: .SF6, keywords: ["car 5", "automobile 2", "convertible"], keywords_en: ["car", "automobile", "convertible", "sports car", "cabriolet", "luxury car"]),
        
        // ========== 仪表 ==========
        SingleSymbols(name: "tachometer",                version: .SF6, keywords: ["rpm", "tachometer", "rpm gauge"], keywords_en: ["rpm", "tachometer", "rpm gauge", "engine speed", "dashboard"]),
        SingleSymbols(name: "horn",                      version: .SF5, keywords: ["sound", "car horn", "beep", "reminder"], keywords_en: ["horn", "car horn", "beep", "alert"]),
        SingleSymbols(name: "heat.waves",                version: .SF5, keywords: ["heat 2", "heat waves", "temperature 3", "microwave", "warm air"], keywords_en: ["heat", "heat waves", "temperature", "heating", "warm air"]),
       
        // ========== 动物 ==========
        SingleSymbols(name: "hare",                      version: .SF1, keywords: ["hare", "rabbit", "fast", "lightning", "swift", "agile", "performance 2"], keywords_en: ["hare", "rabbit", "fast", "speed", "swift", "agile", "animal", "performance"]),
        SingleSymbols(name: "tortoise",                  version: .SF1, keywords: ["animal", "tortoise", "turtle", "slow", "low power", "agile"], keywords_en: ["animal", "tortoise", "turtle", "slow", "low power", "low speed", "energy saving"]),
        SingleSymbols(name: "dog",                       version: .SF5, keywords: ["animal 2", "dog", "pet", "canine", "agile"], keywords_en: ["animal", "dog", "pet", "canine", "puppy"]),
        SingleSymbols(name: "cat",                       version: .SF5, keywords: ["animal 3", "dog", "pet 2", "canine", "agile"], keywords_en: ["animal", "cat", "pet", "feline", "kitty"]),
        SingleSymbols(name: "lizard",                    version: .SF4, keywords: ["animal 4", "lizard", "reptile", "agile"], keywords_en: ["animal", "lizard", "reptile", "cold blooded"]),
        SingleSymbols(name: "bird",                      version: .SF4, keywords: ["animal 5", "bird", "agile", "flight"], keywords_en: ["animal", "bird", "flying", "animal", "avian"]),
        SingleSymbols(name: "fish",                      version: .SF4, keywords: ["animal 6", "fish", "agile", "ocean"], keywords_en: ["animal", "fish", "aquatic", "marine"]),
        SingleSymbols(name: "pawprint",                  version: .SF3, keywords: ["animal 7", "paw print", "dog", "agile"], keywords_en: ["animal", "paw print", "footprint", "pet", "track"]),
        
        // ========== 昆虫 ==========
        SingleSymbols(name: "ant",                       version: .SF1, keywords: ["bug", "ant"], keywords_en: ["bug", "ant", "insect"]),
        SingleSymbols(name: "ladybug",                   version: .SF2, keywords: ["bug 2", "ant"], keywords_en: ["bug", "ladybug", "insect"]),
        
        // ========== 物品 / 玩具 ==========
        SingleSymbols(name: "teddybear",                 version: .SF4, keywords: ["bear", "teddy bear", "toy", "plush toy", "gifts"], keywords_en: ["bear", "teddy bear", "toy", "plush toy", "gift"]),
        
        // ========== 植物 / 自然 ==========
        SingleSymbols(name: "leaf",                      version: .SF2, keywords: ["leaf", "plant", "green", "eco", "nature 2"], keywords_en: ["leaf", "plant", "green", "eco", "nature"]),
        SingleSymbols(name: "tree",                      version: .SF4, keywords: ["tree", "plant 2", "plant", "nature 2", "tree 2"], keywords_en: ["tree", "plant", "forest", "nature"]),
        SingleSymbols(name: "laurel.leading",            version: .SF4, keywords: ["laurel", "wreath", "finish", "award", "medal"], keywords_en: ["laurel", "wreath", "victory", "honor", "decoration"]),
        SingleSymbols(name: "fossil.shell",              version: .SF4, keywords: ["fossil", "shell 2", "prehistoric", "nature 2", "experiment"], keywords_en: ["fossil", "shell", "prehistoric", "nature", "science"]),
        
        // ========== 衣物 ==========
        SingleSymbols(name: "hanger",                    version: .SF5, keywords: ["hanger", "clothes hanger", "clothing rack"], keywords_en: ["hanger", "clothes hanger", "clothing rack"]),
        
        // ========== 权力 / 身份 ==========
        SingleSymbols(name: "crown",                     version: .SF2, keywords: ["vip", "crown", "royalty", "vip 2", "premium"], keywords_en: ["vip", "crown", "royalty", "vip", "premium", "elite", "luxury"]),
        
        // ========== 帽子 ==========
        SingleSymbols(name: "hat.widebrim",              version: .SF6, keywords: ["wide brim hat", "sun hat", "summer hat"], keywords_en: ["wide brim hat", "sun hat", "summer hat"]),
        SingleSymbols(name: "hat.cap",                   version: .SF6, keywords: ["wide brim hat", "baseball cap", "sports cap", "casual hat", "cap"], keywords_en: ["cap", "baseball cap", "sports cap", "casual hat"]),
        
        // ========== 上衣 ==========
        SingleSymbols(name: "tshirt",                    version: .SF3, keywords: ["clothes", "tshirt", "t-shirt", "top"], keywords_en: ["clothes", "tshirt", "t-shirt", "top", "casual wear"]),
        SingleSymbols(name: "jacket",                    version: .SF6, keywords: ["clothes", "jacket", "coat", "outerwear", "coat"], keywords_en: ["clothes", "jacket", "coat", "outerwear"]),
        SingleSymbols(name: "coat",                      version: .SF6, keywords: ["clothes", "coat 2", "coat", "outerwear", "coat"], keywords_en: ["clothes", "coat", "overcoat", "outerwear",]),
        
        // ========== 鞋类 ==========
        SingleSymbols(name: "shoe",                      version: .SF5, keywords: ["shoe", "sneaker", "footwear"], keywords_en: ["shoe", "sneaker", "footwear", "shoes", "athletic shoes"]),
        
        // ========== 足迹 / 行为 ==========
        SingleSymbols(name: "shoeprints.fill",           version: .SF4, keywords: ["footprints", "paw print", "walk"], keywords_en: ["footprints", "walking"]),
        
        // ========== 娱乐与影视 ==========
        SingleSymbols(name: "film",                      version: .SF1, keywords: ["movie", "movie 2", "streaming box", "video", "motion picture"], keywords_en: ["film", "movie", "cinema", "video", "motion picture"]),
        SingleSymbols(name: "movieclapper",              version: .SF5, keywords: ["clapperboard", "movie", "photo", "streaming box"], keywords_en: ["clapperboard", "film", "movie", "shooting", "video"]),
        SingleSymbols(name: "ticket",                    version: .SF2, keywords: ["ticket 2", "movie ticket", "event ticket"], keywords_en: ["ticket", "movie ticket", "event ticket", "admission", "entry pass"]),
        
        // ========== 音频与存储 ==========
        SingleSymbols(name: "recordingtape",             version: .SF1, keywords: ["cassette tape", "cassette tape 2", "music", "audio 4", "audio 6"], keywords_en: ["cassette tape", "cassette tape", "recording tape", "music", "audio", "retro"]),
        
        // ========== 工具 / 观察 ==========
        SingleSymbols(name: "binoculars",                version: .SF2, keywords: ["binoculars", "telescope", "observation", "spotting"], keywords_en: ["binoculars", "telescope", "observation", "spotting"]),
        
        // ========== 安全 / 支持 ==========
        SingleSymbols(name: "lifepreserver",             version: .SF2, keywords: ["lifebuoy", "rescue", "safety", "fire extinguisher 2", "aid"], keywords_en: ["lifebuoy", "rescue", "safety", "emergency", "aid"]),
        
        // ========== 表情 / 面部（Emoji语义层） ==========
        SingleSymbols(name: "face.smiling",              version: .SF2, keywords: ["smiling face", "happy", "emoji", "smile", "positive expression"], keywords_en: ["smiling face", "happy", "emoji", "smile", "positive expression"]),
        
        // ========== 视觉 / 感知 ==========
        SingleSymbols(name: "eye",                       version: .SF1, keywords: ["eye", "loupe", "preview", "visibility", "observation"], keywords_en: ["eye", "view", "preview", "visibility", "observe"]),
        SingleSymbols(name: "eyes",                      version: .SF2, keywords: ["eye", "watching", "heart 2", "monitor 2", "focus 3", "observation"], keywords_en: ["eyes", "watching", "attention", "monitor", "focus"]),
        
        // ========== 面部器官 ==========
        SingleSymbols(name: "nose",                      version: .SF2, keywords: ["nose", "smell", "sense of smell"], keywords_en: ["nose", "smell", "sense of smell"]),
        SingleSymbols(name: "mouth",                     version: .SF2, keywords: ["mouth", "lip"], keywords_en: ["mouth", "lip"]),
        SingleSymbols(name: "ear",                       version: .SF1, keywords: ["ears", "hearing", "auditory power"], keywords_en: ["ears", "hearing", "auditory power"]),
        SingleSymbols(name: "mustache",                  version: .SF2, keywords: ["beard", "whisker"], keywords_en: ["beard", "whisker"]),
        
        // ========== 外观 / 风格 ==========
        SingleSymbols(name: "comb",                      version: .SF2, keywords: ["comb", "combing hair", "haircut"], keywords_en: ["comb", "combing hair", "haircut"]),
        SingleSymbols(name: "eyeglasses",                version: .SF1, keywords: ["glasses", "nearsightedness", "reading", "vision"], keywords_en: ["glasses", "nearsightedness", "reading", "vision"]),
        SingleSymbols(name: "sunglasses",                version: .SF5, keywords: ["glasses", "eyeglasses", "sunglasses", "sunscreen"], keywords_en: ["glasses", "eyeglasses", "sunglasses", "sunscreen"]),
        
        // ========== 手势 / UI交互 ==========
        SingleSymbols(name: "hand.raised",               version: .SF1, keywords: ["hand", "gesture", "raise hand", "request", "ask a question"], keywords_en: ["hand", "gesture", "raise hand", "request", "ask a question"]),
        SingleSymbols(name: "hand.raised.palm.facing",   version: .SF6, keywords: ["hand", "gesture", "raise hand", "gesture 2", "palm"], keywords_en: ["hand", "gesture", "raise hand", "gesture", "palm"]),
        SingleSymbols(name: "hand.raised.fingers.spread", version: .SF4, keywords: ["hand", "gesture", "raise hand", "gesture 2", "palm", "interaction"], keywords_en: ["hand", "gesture", "raise hand", "gesture", "palm", "interaction"]),
        SingleSymbols(name: "hand.thumbsup",             version: .SF1, keywords: ["hand", "gesture", "thumbs up", "like 2", "approve", "love"], keywords_en: ["hand", "gesture", "thumbs up", "like", "approve", "good"]),
        SingleSymbols(name: "hand.thumbsdown",           version: .SF1, keywords: ["hand", "gesture", "thumbs down", "dislike", "bad", "negative"], keywords_en: ["hand", "gesture", "thumbs down", "dislike", "bad", "negative"]),
        SingleSymbols(name: "hand.point.up",             version: .SF2, keywords: ["hand", "gesture", "finger", "click", "point", "select", "interaction", "touch"], keywords_en: ["hand", "gesture", "finger", "click", "point", "select", "interact", "touch"]),
        SingleSymbols(name: "hand.wave",                 version: .SF2, keywords: ["hand", "gesture", "human", "figure 2", "welcome", "card 2"], keywords_en: ["hand", "gesture", "wave", "hello", "goodbye", "greeting", "farewell"]),
        SingleSymbols(name: "hands.clap",                version: .SF2, keywords: ["hand", "gesture", "clapping", "praise", "approval", "like 2"], keywords_en: ["hand", "gesture", "clapping", "praise", "approval"]),
        
        // ========== UI / 组合图形 ==========
        SingleSymbols(name: "xmark.triangle.circle.square", version: .SF6, keywords: ["shape", "combination", "graphic"], keywords_en: ["shape", "combination", "graphic"]),
        
        // ========== 二维码与扫描 ==========
        SingleSymbols(name: "qrcode",                    version: .SF1, keywords: ["qr code", "scan 2", "scan"], keywords_en: ["qr code", "scan", "scanning"]),
        SingleSymbols(name: "barcode",                   version: .SF1, keywords: ["barcode", "product barcode", "scan 2", "scan"], keywords_en: ["barcode", "product barcode", "scan", "scanning"]),
        SingleSymbols(name: "livephoto",                 version: .SF1, keywords: ["live photo", "motion photo", "profile image"], keywords_en: ["live photo", "motion photo", "photo"]),
        SingleSymbols(name: "f.cursive",                 version: .SF1, keywords: ["cursive f", "f 3", "handwritten f"], keywords_en: ["cursive f", "f", "handwritten f", "letter f"]),
        SingleSymbols(name: "scope",                     version: .SF1, keywords: ["scope", "aim", "targeting", "loupe 3", "precision", "crosshair"], keywords_en: ["scope", "aim", "targeting", "focus", "precision", "crosshair"]),
        SingleSymbols(name: "rectangle.stack",           version: .SF1, keywords: ["stack 2", "layers"], keywords_en: ["stack", "cards", "layers", "pages"]),
        
        // ========== 数据可视化 ==========
        SingleSymbols(name: "chart.xyaxis.line",         version: .SF3, keywords: ["graph", "line chart", "trend line"], keywords_en: ["graph", "line chart", "trend line", "statistics"]),
        SingleSymbols(name: "chart.bar",                 version: .SF1, keywords: ["graph", "bar chart", "trend line"], keywords_en: [ "chart", "bar chart", "statistics"]),
        SingleSymbols(name: "chart.pie",                 version: .SF1, keywords: ["graph", "pie chart", "trend line"], keywords_en: ["chart", "pie chart", "statistics"]),
        SingleSymbols(name: "chart.dots.scatter",        version: .SF4, keywords: ["graph", "scatter plot", "trend line"], keywords_en: ["chart", "scatter plot", "statistics"]),
        SingleSymbols(name: "chart.line.uptrend.xyaxis", version: .SF3, keywords: ["graph", "rise", "growth", "stock market"], keywords_en: ["chart", "rise", "growth", "stock market"]),
        
        // ========== 业务指标 / 性能 ==========
        SingleSymbols(name: "gauge.with.needle",         version: .SF5, keywords: ["tachometer", "performance 2", "fast", "metrics"], keywords_en: ["gauge", "dashboard", "performance", "metrics"]),
        
        // ========== 信号 / 波形 ==========
        SingleSymbols(name: "waveform",                  version: .SF1, keywords: ["waveform", "iphone 4", "audio 4", "sound 2", "speaker"], keywords_en: ["waveform", "signal", "audio wave", "sound", "voice"]),
        SingleSymbols(name: "waveform.path.ecg",         version: .SF1, keywords: ["ecg", "heart rate"], keywords_en: ["ecg", "heart rate"]),
        
        // ========== 商业 / 营销事件 ==========
        SingleSymbols(name: "burst",                     version: .SF1, keywords: ["burst", "new product", "promotion", "hot deal", "marketing highlight", "special offer"], keywords_en: ["burst", "new product", "promotion", "hot deal", "marketing highlight", "special offer"]),
        
        // ========== 时间 ==========
        SingleSymbols(name: "clock",                     version: .SF1, keywords: ["clock", "time", "watch", "hours", "minutes"], keywords_en: ["clock", "time", "watch", "hours", "minutes"]),
        SingleSymbols(name: "alarm",                     version: .SF1, keywords: ["alarm 2", "reminder", "bell 3", "wake up", "notification 2"], keywords_en: ["alarm", "alert", "reminder", "wake up", "notification"]),
        SingleSymbols(name: "stopwatch",                 version: .SF1, keywords: ["stopwatch", "timer", "speed test", "sports court 2"], keywords_en: ["stopwatch", "timer", "speed test", "race"]),
        SingleSymbols(name: "timer",                     version: .SF1, keywords: ["timer 2", "countdown", "timer", "time"], keywords_en: ["timer", "countdown"]),
        SingleSymbols(name: "hourglass",                 version: .SF1, keywords: ["hourglass", "spinner", "timer 2", "time", "loading"], keywords_en: ["hourglass", "waiting", "countdown", "loading", "time flow"]),
        
        // ========== 游戏 ==========
        SingleSymbols(name: "gamecontroller",            version: .SF1, keywords: ["game", "controller", "gamepad", "remote control"], keywords_en: ["game", "controller", "gamepad", "controller"]),
        SingleSymbols(name: "arcade.stick",              version: .SF5, keywords: ["game", "joystick", "control joystick", "arcade", "fighting", "audio 6"], keywords_en: ["games", "joystick", "control joystick", "arcade", "fighting", "retro"]),
        SingleSymbols(name: "arcade.stick.console",      version: .SF5, keywords: ["game", "joystick", "control joystick", "arcade", "fighting", "audio 6"], keywords_en: ["games", "joystick", "control joystick", "arcade", "fighting", "retro"]),
        SingleSymbols(name: "dpad",                      version: .SF2, keywords: ["game", "controller", "directional keys", "d-pad"], keywords_en: ["game", "controller", "directional keys", "d-pad"]),
        SingleSymbols(name: "playstation.logo",          version: .SF4, keywords: ["game", "playstation", "ps"], keywords_en: ["game", "playstation", "ps", "sony gaming", "console platform", "ps5", "ps4"]),
        SingleSymbols(name: "xbox.logo",                 version: .SF4, keywords: ["game", "xbox", "microsoft gaming"], keywords_en: ["game", "xbox", "microsoft gaming", "console platform"]),
        
        // ========== 饮品容器 ==========
        SingleSymbols(name: "cup.and.saucer",            version: .SF3, keywords: ["cup", "teacup", "coffee cup", "tea set", "tableware"], keywords_en: ["cup", "teacup", "coffee cup", "tea set", "tableware"]),
        SingleSymbols(name: "mug",                       version: .SF4, keywords: ["cup", "mug"], keywords_en: ["cup", "mug"]),
        SingleSymbols(name: "wineglass",                 version: .SF4, keywords: ["cup", "red wine", "glassware", "alcohol glass"], keywords_en: ["wine glass", "red wine", "glassware", "alcohol glass"]),
        SingleSymbols(name: "waterbottle",               version: .SF5, keywords: ["water bottle", "sports water bottle", "water 4"], keywords_en: ["water bottle", "sports water bottle", "water"]),
        
        // ========== 饮品状态 ==========
        SingleSymbols(name: "cup.and.heat.waves",        version: .SF6, keywords: ["coffee", "hot drinks", "hot coffee"], keywords_en: ["coffee", "hot drinks", "hot coffee"]),
        
        // ========== 食物实体 ==========
        SingleSymbols(name: "birthday.cake",             version: .SF4, keywords: ["birthday", "cake", "birthday cake", "dessert", "invitation", "sweet treats"], keywords_en: ["birthday", "cake", "birthday cake", "dessert", "holiday", "sweet treats"]),
        SingleSymbols(name: "carrot",                    version: .SF4, keywords: ["carrot", "vegetables", "food 2", "ingredients", "vegetarian"], keywords_en: ["carrot", "vegetables", "food", "ingredients", "vegetarian"]),
        
        // ========== 用餐系统 ==========
        SingleSymbols(name: "fork.knife",                version: .SF3, keywords: ["tableware", "knives and forks", "eating", "restaurant", "dining", "catering"], keywords_en: ["tableware", "knives and forks", "eating", "restaurant", "dining", "catering"]),
        
        // ========== 网络与协议 ==========
        SingleSymbols(name: "bonjour",                   version: .SF2, keywords: ["bonjour", "local area network", "lan"], keywords_en: ["bonjour", "local area network", "lan", "network services", "zero-configuration network"]),
        
        // ========== 测量与数学 ==========
        SingleSymbols(name: "scalemass",                 version: .SF2, keywords: ["mass", "weight", "balance", "weighing", "measurement", "scale 2"], keywords_en: ["mass", "weight", "balance", "weighing", "measurement", "scale"]),
        SingleSymbols(name: "angle",                     version: .SF4, keywords: ["angle", "geometry", "degree", "measurement 2", "function"], keywords_en: ["angle", "geometry", "degree", "measurement", "math"]),
        SingleSymbols(name: "compass.drawing",           version: .SF4, keywords: ["compass 2", "drawing", "construction", "design tools", "drafting", "calibration", "measurement"], keywords_en: ["compass", "drawing", "construction", "design tools", "drafting", "tools", "measurement"]),
        
        // ========== 科学概念 ==========
        SingleSymbols(name: "atom",                      version: .SF2, keywords: ["atom", "experiment", "chemistry 3", "lab", "atomic structure"], keywords_en: ["atom", "physics", "chemistry", "science", "atomic structure"]),
        
        // ========== 信号与波 ==========
        SingleSymbols(name: "wave.3.up",                 version: .SF6, keywords: ["waveform", "iphone 4", "nfc", "fluidity"], keywords_en: ["waveform", "signal", "wireless", "fluidity"]),
        
        // ========== 路径 / 流程 ==========
        SingleSymbols(name: "point.bottomleft.forward.to.point.topright.scurvepath", version: .SF5, keywords: ["design 2", "path", "connect", "flow", "track 2", "route 2"], keywords_en: ["path", "curve", "connection", "flow", "track", "route"]),
        
        // ========== 电池 ==========
        SingleSymbols(name: "battery.0percent",        version: .SF5, keywords: ["0", "battery", "power level", "no power"], keywords_en: ["0", "battery", "power level","no power", "no electricity"]),
        SingleSymbols(name: "battery.25percent",        version: .SF5, keywords: ["0", "battery"], keywords_en: ["25", "battery", "power level"]),
        SingleSymbols(name: "battery.50percent",        version: .SF5, keywords: ["0", "battery"], keywords_en: ["50", "battery", "power level" ]),
        SingleSymbols(name: "battery.75percent",        version: .SF5, keywords: ["0", "battery"], keywords_en: ["75", "battery", "power level"]),
        SingleSymbols(name: "battery.100percent",        version: .SF5, keywords: ["0", "battery", "power level 2", "fully charged"], keywords_en: ["100", "battery", "power level", "fully charged", "fully charged"]),
        SingleSymbols(name: "battery.100percent.bolt",        version: .SF5, keywords: ["0", "battery", "power level 2", "fully charged", "energy"], keywords_en: ["100", "battery", "power level", "fully charged", "fully charged", "charge"]),
        
        // ========== 状态 ==========
        SingleSymbols(name: "burn",                      version: .SF1, keywords: ["burn", "scald", "burn 2"], keywords_en: ["burn", "scald"]),
        
        // ========== 几何变换 ==========
        SingleSymbols(name: "skew",                      version: .SF1, keywords: ["slant", "bevel", "deformation", "geometric transformation", "twist"], keywords_en: ["slant", "bevel", "deformation", "geometric transformation", "twist"]),
        
        // ========== 渲染 / 视觉效果 ==========
        SingleSymbols(name: "shadow",                    version: .SF2, keywords: ["schatten", "projektion", "effect", "ebenen", "design"], keywords_en: ["schatten", "projektion", "effekt", "ebenen", "design"]),
        
        // ========== 视图模式 ==========
        SingleSymbols(name: "view.2d",                   version: .SF1, keywords: ["2d", "two-dimensional", "plane"], keywords_en: ["2d", "two-dimensional", "plane", "view"]),
        SingleSymbols(name: "view.3d",                   version: .SF1, keywords: ["3d", "solid", "plane", "translate"], keywords_en: ["3d", "solid", "view", "space"]),
        
        // ========== 数值系统 ==========
        SingleSymbols(name: "numbers",                   version: .SF6, keywords: ["number", "numbers", "compute", "values", "storage expansion"], keywords_en: ["123", "numbers", "numeric", "values", "calculation", "data"]),
        
        // ========== 文字排版 ==========
        SingleSymbols(name: "character",                 version: .SF2, keywords: ["character", "content 2", "text frame"], keywords_en: ["character", "text", "typography"]),
        SingleSymbols(name: "bold",                      version: .SF1, keywords: ["content 2", "text frame", "bold", "font weight"], keywords_en: ["text", "typography", "bold", "font weight"]),
        SingleSymbols(name: "italic",                    version: .SF1, keywords: ["content 2", "text frame", "italic"], keywords_en: ["text", "typography", "italic"]),
        SingleSymbols(name: "underline",                 version: .SF1, keywords: ["content 2", "text frame", "text decoration", "emphasis", "link"], keywords_en: ["text", "typography", "text decoration", "emphasis", "link"]),
        SingleSymbols(name: "strikethrough",             version: .SF1, keywords: ["content 2", "text frame", "strikethrough", "cross out", "status"], keywords_en: ["text", "typography", "strikethrough", "cross out", "completed"]),
        
        // ========== 数学符号 ==========
        SingleSymbols(name: "sum",                       version: .SF1, keywords: ["sum", "sum 2", "sigma", "function", "total", "trend line"], keywords_en: ["Σ","sum", "sigma", "summation", "total", "math", "operator"]),
        SingleSymbols(name: "percent",                   version: .SF1, keywords: ["math 2", "percent", "percent 2", "function"], keywords_en: ["math", "%", "percent", "percentage", "ratio",  "proportion"]),
        SingleSymbols(name: "function",                  version: .SF1, keywords: ["f x", "function 2", "programming", "function"], keywords_en: ["f(x)", "function", "method", "programming", "math"]),
        SingleSymbols(name: "paragraphsign",             version: .SF2, keywords: ["paragraphsign", "global 2", "text frame"], keywords_en: ["¶", "paragraph", "pilcrow", "typography"]),
        
        // ========== 信息符号 ==========
        SingleSymbols(name: "info",                      version: .SF1, keywords: ["info", "information", "details", "about", "badge 3"], keywords_en: ["info", "information", "details", "about", "description"]),
        SingleSymbols(name: "info.circle",               version: .SF1, keywords: ["info", "information", "details", "about", "badge 3", "assistance", "help"], keywords_en: ["info", "information", "details", "about", "description", "assistance", "help"]),
        SingleSymbols(name: "questionmark",              version: .SF1, keywords: ["unknown", "unknown 2", "help 2", "query", "missing"], keywords_en: ["question", "unknown", "uncertain", "query", "help"]),
        SingleSymbols(name: "questionmark.circle",       version: .SF1, keywords: ["unknown", "unknown 2", "help 2", "query", "missing", "badge 3", "help"], keywords_en: ["question", "unknown", "uncertain", "query", "help", "hint", "prompt"]),
        SingleSymbols(name: "at",                        version: .SF1, keywords: ["at", "annotate", "tag 3", "quote"], keywords_en: ["@", "mention", "tag", "email", "reference"]),
        SingleSymbols(name: "exclamationmark",           version: .SF1, keywords: ["warning 2", "warning", "crosswalk", "alert 2", "badge 3", "warning 3"], keywords_en: ["warning", "attention", "important", "alert", "notice"]),
        SingleSymbols(name: "exclamationmark.2",         version: .SF2, keywords: ["warning 2", "warning", "crosswalk", "alert 2", "badge 3", "warning 3", "fire extinguisher 2", "urgent", "serious", "critical"], keywords_en: ["2", "warning", "attention", "important", "alert", "notice", "high alert", "urgent", "serious", "critical"]),
        SingleSymbols(name: "exclamationmark.3",         version: .SF2, keywords: ["warning 2", "warning", "crosswalk", "alert 2", "badge 3", "warning 3", "fire extinguisher 2", "urgent 2", "serious 2", "critical 2"], keywords_en: ["3", "warning", "attention", "important", "alert", "notice", "high alert", "urgent", "serious", "critical", "emergency", "danger", "severe", "alarm"]),
        SingleSymbols(name: "exclamationmark.circle",    version: .SF1, keywords: ["warning 2", "warning", "crosswalk", "alert 2", "badge 3", "warning 3", "error", "warning 4"], keywords_en: ["warning", "attention", "important", "alert", "notice", "Error", "exception"]),
        
        // ========== 数学运算符号 ==========
        SingleSymbols(name: "plus",                      version: .SF1, keywords: ["function", "total", "medical cross", "add 3", "add", "addition", "positive", "create", "create 2", "insert"], keywords_en: ["math", "operators", "plus", "add", "increase", "addition", "positive", "new", "create", "insert"]),
        SingleSymbols(name: "plus.circle",               version: .SF1, keywords: ["circle", "medical cross", "add 3", "add", "addition", "positive", "create", "create 2", "insert"], keywords_en: ["circle", "plus", "add", "increase", "addition", "positive", "new", "create", "insert"]),
        SingleSymbols(name: "plus.square",               version: .SF1, keywords: ["square", "medical cross", "add 3", "add", "addition", "positive", "create", "create 2", "insert"], keywords_en: ["square", "plus", "add", "increase", "addition", "positive", "new", "create", "insert"]),
        SingleSymbols(name: "minus",                     version: .SF1, keywords: ["function", "total", "minus 2", "subtract", "delete", "remove", "negative 2", "delete 3", "clear 2"], keywords_en: ["math", "operators", "minus", "subtract", "remove", "decrease", "negative", "delete", "square minus", "clear"]),
        SingleSymbols(name: "minus.circle",              version: .SF1, keywords: ["circle", "minus 2", "subtract", "delete", "remove", "negative 2", "delete 3", "clear 2"], keywords_en: ["circle", "minus", "subtract", "remove", "decrease", "negative", "delete", "square minus", "clear"]),
        SingleSymbols(name: "minus.square",              version: .SF1, keywords: ["square", "minus 2", "subtract", "delete", "remove", "negative 2", "delete 3", "clear 2"], keywords_en: ["square", "minus", "subtract", "remove", "decrease", "negative", "delete", "square minus", "clear"]),
        SingleSymbols(name: "plusminus",                 version: .SF1, keywords: ["function", "total", "plus minus", "plusminus", "scope", "range"], keywords_en: ["math", "operators", "plus minus", "±", "tolerance", "range", "variation"]),
        SingleSymbols(name: "plusminus.circle",                 version: .SF1, keywords: ["circle", "plus minus", "plusminus", "scope", "range"], keywords_en: ["circle", "plus minus", "±", "tolerance", "range", "variation"]),
        SingleSymbols(name: "plus.forwardslash.minus",   version: .SF3, keywords: ["function", "total", "plusminus", "plus minus", "toggle"], keywords_en: ["math", "operators", "toggle", "plus minus", "variation"]),
        SingleSymbols(name: "multiply",                  version: .SF1, keywords: ["function", "total", "multiply", "close", "cancel", "iphone", "delete", "clear 2", "status 2"], keywords_en: ["math", "operators", "×", "multiply", "close", "cancel", "exit", "delete", "clear", "x button"]),
        SingleSymbols(name: "multiply.circle",           version: .SF1, keywords: ["circle", "multiply", "close", "cancel", "iphone", "delete", "clear 2", "status 2"], keywords_en: ["circle", "×", "multiply", "close", "cancel", "exit", "delete", "clear", "x button"]),
        SingleSymbols(name: "multiply.square",           version: .SF1, keywords: ["square", "multiply", "close", "cancel", "iphone", "delete", "clear 2", "status 2"], keywords_en: ["square", "×", "multiply", "close", "cancel", "exit", "delete", "clear", "x button"]),
        SingleSymbols(name: "divide",                    version: .SF1, keywords: ["function", "total", "operators", "divide"], keywords_en: ["÷", "math", "operators", "divide", "division"]),
        SingleSymbols(name: "equal",                     version: .SF1, keywords: ["function", "total", "operators 2", "equals", "same", "strictly equal", "assign value"], keywords_en: ["=", "math", "operators", "equals", "same", "strictly equal", "assign value"]),
        SingleSymbols(name: "notequal",                  version: .SF6, keywords: ["function", "total", "operators 2", "equals", "same 2", "different", "not equal to"], keywords_en: ["≠", "math", "operators", "equals", "same", "different", "not equal to"]),
        
        // ========== 编程语法 ==========
        SingleSymbols(name: "chevron.left.forwardslash.chevron.right", version: .SF3, keywords: ["code", "tag", "tag 4", "programming"], keywords_en: ["code", "html", "tag", "</>", "programming"]),
        SingleSymbols(name: "ellipsis.curlybraces",      version: .SF3, keywords: ["code", "function body", "curly braces", "structure 2", "omission 2", "omission", "curly braces", "programming"], keywords_en: ["code block", "function body", "curly braces", "structure", "omission", "programming", "{...}"]),
        
        // ========== 操作符号 ==========
        SingleSymbols(name: "xmark",                     version: .SF1, keywords: ["close", "cancel", "error", "delete", "iphone", "stop 2", "clear 2", "remove"], keywords_en: ["close", "cancel", "error", "delete", "exit", "terminate", "clear", "remove", "dismiss", "stop"]),
        SingleSymbols(name: "xmark.circle",              version: .SF1, keywords: ["circle", "close", "cancel", "error", "delete", "iphone", "stop 2", "clear 2", "remove"], keywords_en: ["circle", "close", "cancel", "error", "delete", "exit", "terminate", "clear", "remove", "dismiss", "stop"]),
        SingleSymbols(name: "xmark.square",              version: .SF1, keywords: ["square", "close", "cancel", "error", "delete", "iphone", "stop 2", "clear 2", "remove"], keywords_en: ["square", "close", "cancel", "error", "delete", "exit", "terminate", "clear", "remove", "dismiss", "stop"]),
        SingleSymbols(name: "checkmark",                 version: .SF1, keywords: ["badge 6", "verified", "status", "confirm", "done", "checkmark", "check", "selected"], keywords_en: ["checkmark", "check mark", "done", "confirm", "success", "passed", "checked", "selected", "approved", "completed", "selection"]),
        SingleSymbols(name: "checkmark.circle",          version: .SF1, keywords: ["circle", "badge 6", "verified", "status", "confirm", "done", "checkmark", "check", "selected"], keywords_en: ["circle", "checkmark", "check mark", "done", "confirm", "success", "passed", "checked", "selected", "approved", "completed", "selection"]),
        SingleSymbols(name: "checkmark.square",          version: .SF1, keywords: ["square", "badge 6", "verified", "status", "confirm", "done", "checkmark", "check", "selected"], keywords_en: ["square", "checkmark", "check mark", "done", "confirm", "success", "passed", "checked", "selected", "approved", "completed", "selection"]),
        
        // ========== 方向箭头 ==========
        // ========== 方向箭头（左） ==========
        SingleSymbols(name: "chevron.left",              version: .SF1, keywords: ["direction", "back 3", "left", "arrow", "previous 2", "iphone", "backward"], keywords_en: ["back", "left", "arrow", "previous", "return", "chevron", "exit", "dismiss", "direction"]),
        SingleSymbols(name: "chevron.left.circle",              version: .SF1, keywords: ["direction", "circle", "back 3", "left", "arrow", "previous 2", "iphone", "backward"], keywords_en: ["circle", "back", "left", "arrow", "previous", "return", "chevron", "exit", "dismiss", "direction"]),
        SingleSymbols(name: "chevron.left.square",              version: .SF1, keywords: ["direction", "square", "back 3", "left", "arrow", "previous 2", "iphone", "backward"], keywords_en: ["square", "back", "left", "arrow", "previous", "return", "chevron", "exit", "dismiss", "direction"]),
        
        // ========== 方向箭头（右） ==========
        SingleSymbols(name: "chevron.forward",           version: .SF2, keywords: ["direction", "forward", "right", "arrow", "next 2", "more", "proceed", "open door"], keywords_en: ["forward", "right", "chevron", "next", "more", "continue", "proceed", "enter", "direction"]),
        SingleSymbols(name: "chevron.forward.circle",           version: .SF2, keywords: ["direction", "circle"], keywords_en: ["circle", "forward", "right", "chevron", "next", "more", "continue", "proceed", "enter", "direction"]),
        SingleSymbols(name: "chevron.forward.square",           version: .SF2, keywords: ["direction", "square"], keywords_en: ["square", "forward", "right", "chevron", "next", "more", "continue", "proceed", "enter", "direction"]),
        
        // ========== 方向箭头（上） ==========
        SingleSymbols(name: "chevron.up",                version: .SF1, keywords: ["direction", "up", "arrow", "collapse", "fold", "hide", "slide up"], keywords_en: ["direction", "up", "arrow", "collapse", "fold", "hide", "slide up"]),
        SingleSymbols(name: "chevron.up.circle",                version: .SF1, keywords: ["direction", "circle", "up", "arrow", "collapse", "fold", "hide", "slide up"], keywords_en: ["circle", "direction", "up", "arrow", "collapse", "fold", "hide", "slide up"]),
        SingleSymbols(name: "chevron.up.square",                version: .SF1, keywords: ["direction", "square", "up", "arrow", "collapse", "fold", "hide", "slide up"], keywords_en: ["square", "direction", "up", "arrow", "collapse", "fold", "hide", "slide up"]),
        
        // ========== 方向箭头（下） ==========
        SingleSymbols(name: "chevron.down",              version: .SF1, keywords: ["direction", "down", "arrow", "scroll 2", "dropdown", "more", "television 2", "scroll 2"], keywords_en: ["direction", "arrow", "down", "expand", "dropdown", "more", "show", "expand"]),
        SingleSymbols(name: "chevron.down.circle",              version: .SF1, keywords: ["direction", "circle", "down", "arrow", "scroll 2", "dropdown", "more", "television 2", "scroll 2"], keywords_en: ["circle", "arrow", "direction", "down", "expand", "dropdown", "more", "show", "expand"]),
        SingleSymbols(name: "chevron.down.square",              version: .SF1, keywords: ["direction", "square", "down", "arrow", "scroll 2", "dropdown", "more", "television 2", "scroll 2"], keywords_en: ["square", "arrow", "direction", "down", "expand", "dropdown", "more", "show", "expand"]),
        
        // ========== 方向箭头（切换） ==========
        SingleSymbols(name: "chevron.up.chevron.down",   version: .SF1, keywords: ["direction", "arrow", "up 2", "down 3", "select", "disability", "toggle"], keywords_en: ["direction", "arrow", "up", "down", "sort", "select", "scroll", "toggle"]),
        
        // ========== 方向箭头（向左转） ==========
        SingleSymbols(name: "arrow.uturn.left",          version: .SF1, keywords: ["direction", "back 3", "left", "arrow", "previous 2", "iphone", "backward", "back 2"], keywords_en: ["back", "left", "arrow", "previous", "return", "chevron", "exit", "dismiss", "direction", "cancel"]),
        SingleSymbols(name: "arrow.uturn.left.circle",          version: .SF1, keywords: ["circle", "direction", "back 3", "left", "arrow", "previous 2", "iphone", "backward", "back 2"], keywords_en: ["circle", "back", "left", "arrow", "previous", "return", "chevron", "exit", "dismiss", "direction", "cancel"]),
        SingleSymbols(name: "arrow.uturn.left.square",          version: .SF1, keywords: ["square", "direction", "back 3", "left", "arrow", "previous 2", "iphone", "backward", "back 2"], keywords_en: ["square", "back", "left", "arrow", "previous", "return", "chevron", "exit", "dismiss", "direction", "cancel"]),
        
        // ========== 方向箭头（向右转） ==========
        SingleSymbols(name: "arrow.uturn.right",          version: .SF1, keywords: ["direction", "arrow", "right", "turn", "u-turn"], keywords_en: ["direction", "arrow", "right", "turn", "u-turn", "redo"]),
        SingleSymbols(name: "arrow.uturn.right.circle",          version: .SF1, keywords: ["circle", "direction", "arrow", "right", "turn", "u-turn"], keywords_en: ["circle", "direction", "arrow", "right", "turn", "u-turn", "redo"]),
        SingleSymbols(name: "arrow.uturn.right.square",          version: .SF1, keywords: ["square", "direction", "arrow", "right", "turn", "u-turn"], keywords_en: ["square", "direction", "arrow", "right", "turn", "u-turn", "redo"]),
    
        // ========== 方向箭头（向上转） ==========
        SingleSymbols(name: "arrow.uturn.up",          version: .SF1, keywords: ["direction", "up", "arrow", "back 3", "u-turn 2", "reverse", "turn 2", "turn"], keywords_en: ["direction", "up", "arrow", "return", "u-turn", "reverse", "turn", "switch"]),
        SingleSymbols(name: "arrow.uturn.up.circle",          version: .SF1, keywords: ["direction", "circle", "up", "arrow", "back 3", "u-turn 2", "reverse", "turn 2", "turn"], keywords_en: ["direction", "circle", "up", "arrow", "return", "u-turn", "reverse", "turn", "switch"]),
        SingleSymbols(name: "arrow.uturn.up.square",          version: .SF1, keywords: ["direction", "square", "up", "arrow", "back 3", "u-turn 2", "reverse", "turn 2", "turn"], keywords_en: ["direction", "square", "up", "arrow", "return", "u-turn", "reverse", "turn", "switch"]),
        
        // ========== 方向箭头（向下转） ==========
        SingleSymbols(name: "arrow.uturn.down",          version: .SF1, keywords: ["direction", "down", "arrow", "back 3", "u-turn 2", "reverse", "turn 2", "turn"], keywords_en: ["direction", "down", "arrow", "return", "u-turn", "reverse", "turn", "switch"]),
        SingleSymbols(name: "arrow.uturn.down.circle",          version: .SF1, keywords: ["direction", "circle", "down", "arrow", "back 3", "u-turn 2", "reverse", "turn 2", "turn"], keywords_en: ["direction", "circle", "down", "arrow", "return", "u-turn", "reverse", "turn", "switch"]),
        SingleSymbols(name: "arrow.uturn.down.square",          version: .SF1, keywords: ["direction", "square", "down", "arrow", "back 3", "u-turn 2", "reverse", "turn 2", "turn"], keywords_en: ["direction", "square", "down", "arrow", "return", "u-turn", "reverse", "turn", "switch"]),
        
        // ========== 方向箭头（复杂） ==========
        SingleSymbols(name: "arrow.up.and.down.and.arrow.left.and.right", version: .SF2, keywords: ["direction", "arrow", "mount 2", "drag", "selected", "drag and drop"], keywords_en: ["direction", "arrow", "move", "drag", "select", "drag and drop"]),
        
        // ========== 方向箭头（放大） ==========
        SingleSymbols(name: "arrow.up.left.and.arrow.down.right", version: .SF1, keywords: ["direction", "arrow", "magnify", "full screen", "scroll 2", "maximize", "enlarge"], keywords_en: ["direction", "arrow", "expand", "fullscreen", "zoom in", "maximize", "enlarge", "scale up"]),
        SingleSymbols(name: "arrow.down.left.and.arrow.up.right", version: .SF5, keywords: ["direction", "arrow", "magnify", "full screen", "scroll 2", "maximize", "enlarge"], keywords_en: ["direction", "arrow", "expand", "fullscreen", "zoom in", "maximize", "enlarge", "scale up"]),
        
        // ========== 方向箭头（缩小） ==========
        SingleSymbols(name: "arrow.down.right.and.arrow.up.left", version: .SF1, keywords: ["direction", "arrow", "minus", "exit fullscreen", "collapse", "close", "minimize"], keywords_en: ["direction", "arrow", "minimize", "exit fullscreen", "collapse", "close", "minimize"]),
        SingleSymbols(name: "arrow.up.right.and.arrow.down.left", version: .SF5, keywords: ["direction", "arrow", "minus", "exit fullscreen", "collapse", "close", "minimize"], keywords_en: ["direction", "arrow", "minimize", "exit fullscreen", "collapse", "close", "minimize"]),
        
        // ========== 方向箭头（复杂） ==========
        SingleSymbols(name: "arrow.3.trianglepath",      version: .SF1, keywords: ["direction", "arrow", "repeat 2", "reset", "repeat 2", "direction 4"], keywords_en: ["direction", "arrow", "loop", "refresh", "rotate"]),
        SingleSymbols(name: "arrow.trianglehead.merge",  version: .SF6, keywords: ["direction", "arrow", "merge", "integrate", "connect", "collaboration"], keywords_en: ["direction", "arrow", "merge", "integrate", "connect", "collaborate"]),
        SingleSymbols(name: "arrow.trianglehead.branch", version: .SF6, keywords: ["direction", "arrow", "branch", "derivative", "fork", "split 4"], keywords_en: ["direction", "arrow", "branch", "derivative", "fork", "split"]),
        SingleSymbols(name: "arrow.trianglehead.swap",   version: .SF6, keywords: ["direction", "arrow", "transmission 2", "connect"], keywords_en: ["direction", "arrow", "transmission", "connect"]),
        SingleSymbols(name: "arrow.down.left.arrow.up.right", version: .SF5, keywords: ["direction", "arrow", "conversion", "sync 2", "exchange", "interchange", "toggle"], keywords_en: ["direction", "arrow", "conversion", "bidirectional", "exchange", "interchange", "switch"]),
        SingleSymbols(name: "arrow.up.left.arrow.down.right", version: .SF5, keywords: ["direction", "arrow", "conversion", "sync 2", "exchange", "interchange", "toggle"], keywords_en: ["direction", "arrow", "conversion", "bidirectional", "exchange", "interchange", "switch"]),
        
        // ========== 三角箭头 ==========
        // ========== 三角箭头（左） ==========
        SingleSymbols(name: "arrowtriangle.left",        version: .SF1, keywords: ["direction", "arrow", "geometry 2", "left", "backward", "direction 5", "back 3"], keywords_en: ["direction", "arrow", "triangle"]),
        
        // ========== 三角箭头（右） ==========
        SingleSymbols(name: "arrowtriangle.right",       version: .SF1, keywords: ["direction", "arrow", "geometry 2", "right", "forward", "direction 6", "proceed", "play"], keywords_en: ["direction", "arrow", "triangle"]),
        
        // ========== 三角箭头（上） ==========
        SingleSymbols(name: "arrowtriangle.up",          version: .SF1, keywords: ["direction", "arrow", "geometry 2", "up", "collapse", "notification area"], keywords_en: ["direction", "arrow", "triangle", "top", "collapse"]),
        
        // ========== 三角箭头（下） ==========
        SingleSymbols(name: "arrowtriangle.down",        version: .SF1, keywords: ["direction", "arrow", "geometry 2", "down", "dropdown", "bottom", "scroll 2", "more"], keywords_en: ["direction", "arrow", "triangle", "down", "dropdown", "bottom", "expand", "more"]),
        
        
        // ========== 方向形状箭头 ==========
        SingleSymbols(name: "arrowshape.left",           version: .SF4, keywords: ["direction", "arrow", "shape", "left", "back 3", "backward", "rewind", "iphone"], keywords_en: ["direction", "arrow", "shape", "left", "back", "exit"]),
        SingleSymbols(name: "arrowshape.right",          version: .SF4, keywords: ["direction", "arrow", "shape", "right", "forward", "share 2", "next 2", "open door"], keywords_en: ["direction", "arrow", "shape", "right", "forward", "send", "next", "enter"]),
        SingleSymbols(name: "arrowshape.up",             version: .SF5, keywords: ["direction", "arrow", "shape", "up", "upload", "share 2", "push"], keywords_en: ["direction", "arrow", "shape", "up", "upload", "send", "push"]),
        SingleSymbols(name: "arrowshape.down",           version: .SF5, keywords: ["direction", "arrow", "shape", "down", "download", "import", "receive", "pull"], keywords_en: ["direction", "arrow", "shape", "down", "download", "import", "get", "pull"]),
        
        // ========== 方向形状箭头（复杂） ==========
        SingleSymbols(name: "arrowshape.left.arrowshape.right", version: .SF5, keywords: ["direction", "shape", "arrow", "toggle", "exchange", "left and right"], keywords_en: ["direction", "arrow", "shape", "switch", "swap", "left and right"]),
        SingleSymbols(name: "arrowshape.turn.up.left",   version: .SF1, keywords: ["direction", "arrow", "shape", "back 2", "reply", "back 3", "revert"], keywords_en: ["direction", "arrow", "shape", "undo", "reply", "back", "revert", "rollback"]),
        SingleSymbols(name: "arrowshape.turn.up.left.2", version: .SF1, keywords: ["direction", "arrow", "shape", "reply all", "bulk reply"], keywords_en: ["direction", "arrow", "shape", "reply all", "bulk reply"]),
        
        // ========== 输入控制 ==========
        SingleSymbols(name: "arrowkeys",                 version: .SF5, keywords: ["direction", "arrow", "directional keys", "macos", "command", "side"], keywords_en: ["direction", "arrow", "arrow keys", "keys", "keyboard", "controls"]),
        
        // ========== 系统品牌 ==========
        SingleSymbols(name: "apple.logo",                version: .SF4, keywords: ["apple", "system", "logo", "system 2"], keywords_en: ["apple", "brand", "logo", "system", "corporate"]),
        
        // ========== 导出 / 导入 / 分享（核心动作类） ==========
        SingleSymbols(name: "square.and.arrow.up",       version: .SF1, keywords: ["share", "send", "upload", "share 2", "share 3"], keywords_en: ["share", "export", "upload", "send"]),
        SingleSymbols(name: "rectangle.portrait.and.arrow.right", version: .SF3, keywords: ["logout", "iphone", "leave", "send"], keywords_en: ["logout", "exit", "leave", "export", "quit"]),
        SingleSymbols(name: "square.and.arrow.down",     version: .SF1, keywords: ["import", "download", "save", "document 2", "store 4"], keywords_en: ["import", "download", "save", "receive", "store"]),
        
        // =============== 数字 =========
        SingleSymbols(name: "0.circle",version: .SF6,keywords: ["0 2", "number", "circle", "numbering", "index number"],keywords_en: ["0", "circle", "number", "index"]),
        SingleSymbols(name: "0.square",version: .SF6,keywords: ["0 2", "number", "square", "numbering", "index number"],keywords_en: ["0", "square", "number", "index"]),
        SingleSymbols(name: "1.circle",version: .SF6,keywords: ["1", "number", "circle", "numbering", "index number"],keywords_en: ["1", "circle", "number", "index"]),
        SingleSymbols(name: "1.square",version: .SF6,keywords: ["1", "number", "square", "numbering", "index number"],keywords_en: ["1", "square", "number", "index"]),
        SingleSymbols(name: "2.circle",version: .SF6,keywords: ["2", "number", "circle", "numbering", "index number"],keywords_en: ["2", "circle", "number", "index"]),
        SingleSymbols(name: "2.square",version: .SF6,keywords: ["2", "number", "square", "numbering", "index number"],keywords_en: ["2", "square", "number", "index"]),
        SingleSymbols(name: "3.circle",version: .SF6,keywords: ["3", "number", "circle", "numbering", "index number"],keywords_en: ["3", "circle", "number", "index"]),
        SingleSymbols(name: "3.square",version: .SF6,keywords: ["3", "number", "square", "numbering", "index number"],keywords_en: ["3", "square", "number", "index"]),
        SingleSymbols(name: "4.circle",version: .SF6,keywords: ["4", "number", "circle", "numbering", "index number"],keywords_en: ["4", "circle", "number", "index"]),
        SingleSymbols(name: "4.square",version: .SF6,keywords: ["4", "number", "square", "numbering", "index number"],keywords_en: ["4", "square", "number", "index"]),
        SingleSymbols(name: "5.circle",version: .SF6,keywords: ["5", "number", "circle", "numbering", "index number"],keywords_en: ["5", "circle", "number", "index"]),
        SingleSymbols(name: "5.square",version: .SF6,keywords: ["5", "number", "square", "numbering", "index number"],keywords_en: ["5", "square", "number", "index"]),
        SingleSymbols(name: "6.circle",version: .SF6,keywords: ["6", "number", "circle", "numbering", "index number"],keywords_en: ["6", "circle", "number", "index"]),
        SingleSymbols(name: "6.square",version: .SF6,keywords: ["6", "number", "square", "numbering", "index number"],keywords_en: ["6", "square", "number", "index"]),
        SingleSymbols(name: "7.circle",version: .SF6,keywords: ["7", "number", "circle", "numbering", "index number"],keywords_en: ["7", "circle", "number", "index"]),
        SingleSymbols(name: "7.square",version: .SF6,keywords: ["7", "number", "square", "numbering", "index number"],keywords_en: ["7", "square", "number", "index"]),
        SingleSymbols(name: "8.circle",version: .SF6,keywords: ["8", "number", "circle", "numbering", "index number"],keywords_en: ["8", "circle", "number", "index"]),
        SingleSymbols(name: "8.square",version: .SF6,keywords: ["8", "number", "square", "numbering", "index number"],keywords_en: ["8", "square", "number", "index"]),
        SingleSymbols(name: "9.circle",version: .SF6,keywords: ["9", "number", "circle", "numbering", "index number"],keywords_en: ["9", "circle", "number", "index"]),
        SingleSymbols(name: "9.square",version: .SF6,keywords: ["9", "number", "square", "numbering", "index number"],keywords_en: ["9", "square", "number", "index"]),
        
    ]
}
