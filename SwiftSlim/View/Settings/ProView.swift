//
//  ProView.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/21.
//

import SwiftUI
import StoreKit

struct ProView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appStorage: AppStorageManager
    @EnvironmentObject var iapManager: IAPManager
    @State private var selectedProductID: String?
    @State private var isLoading = false    // 加载画布
    @State private var operationTask: Task<Void, Never>?  // 内购 Task
    @State private var productResultStatus: ProductResultEnum?
    
    var showCloseButton: Bool
    
    // 年度会员 ID
    private let yearlyProductID = "com.fangjunyu.Qinote.yearly"
    
    private var expirationDateString: String {
        Self.formatExpirationDate(appStorage.expirationDate)
    }
    
    // 已选择的产品
    private var selectedProduct: Product? {
        iapManager.displayProducts
            .first { $0.product.id == selectedProductID }?
            .product
    }
    
    // 选择年度会员
    private func selectDefaultProductIfNeeded() {
        let products = iapManager.displayProducts
        
        guard !products.isEmpty else { return }
        
        // 如果当前已选择的商品仍然存在，就不重复覆盖用户选择
        if let selectedProductID,
           products.contains(where: { $0.product.id == selectedProductID }) {
            return
        }
        
        // 优先选择年度会员，找不到则选择第一个
        selectedProductID =
        products.first(where: { $0.product.id == yearlyProductID })?.product.id
        ?? products.first?.product.id
    }
    
    // 格式化显示日期
    private static func formatExpirationDate(_ timestamp: TimeInterval) -> String {
        Date(timeIntervalSince1970: timestamp)
            .formatted(date: .abbreviated, time: .omitted)
    }
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 30) {
                        proAnimation
                        proTitle
                        // 如果有会员才显示
                        if appStorage.isValidMember {
                            CurrentPlanView()
                        }
                        if !iapManager.displayProducts.isEmpty {
                            chooseAPlan
                        }
                        included
                        purchaseNotice
                        Spacer()
                    }
                }
                
                VStack(spacing: 14) {
                    subscribeButton
                    restorePurchasesButton
                }
                .padding(.top, 10)
                .padding(.bottom, 50)
            }
            .navigationTitle("Pro")
            .navigationBarTitleDisplayMode(.inline)
            .modifier(Background2Modifiers())
            
            if isLoading {
                loadingView
            }
        }
        .sheet(item: $productResultStatus) { result in
            ProductResultView(result: result)
                .environmentObject(appStorage)
                .environmentObject(iapManager)
        }
        .task {
            if iapManager.displayProducts.isEmpty {
                await iapManager.loadProduct()
                selectDefaultProductIfNeeded()
            }
        }
        .safeAreaInset(edge: .top) {
            if showCloseButton {
                closeButton
            }
        }
    }
    
    // 关闭视图
    var closeButton: some View {
        HStack {
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title.bold())
                    .foregroundStyle(.secondary)
            }
            .buttonStyle(.plain)
        }
        .padding(30)
    }
    
    // 加载视图
    var loadingView: some View {
        ZStack {
            Color.gray.opacity(0.5).ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        // 振动
                        HapticManager.shared.selectionChanged()
                        isLoading = false
                        operationTask?.cancel()   // 取消购买任务
                        operationTask = nil
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.title)
                            .foregroundColor(.white)
                    })
                    Spacer().frame(width: 20)
                }
                Spacer()
            }
            ProgressView("loading...")
                .font(.subheadline)
                .padding(20)
                .background(Color("WhiteAndBlack").opacity(0.8))
                .cornerRadius(10)
            
        }
    }
    
    // 动画
    var proAnimation: some View {
        ReadyStage(backgroundSize: .small)
            .scaleEffect(0.8)
            .frame(height: 160)
    }
    
    // 开启进阶学习
    var proTitle: some View {
        VStack(spacing: 20) {
            Text("Start Advanced Learning")
                .font(.title)
                .fontWeight(.bold)
            Text("Get more complete SwiftUI learning support with courses, examples, and practical tools to gradually master interface building and app development.")
                .foregroundStyle(.secondary)
                .font(.footnote)
        }
        .multilineTextAlignment(.center)
    }
    
    // 选择方案
    var chooseAPlan: some View {
        // 如果不为空
        VStack {
            // 选择方案
            HStack {
                Text("Choose a Plan")
                    .modifier(FootnoteGrayText())
                Spacer()
            }
            VStack {
                ForEach(iapManager.displayProducts) { product in
                    let isSelected: Bool = selectedProductID == product.product.id
                    Button(action: {
                        HapticManager.shared.selectionChanged()
                        selectedProductID = product.product.id
                    }, label: {
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text(product.displayName)
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                    if let tag = product.info.tag, let tagColor = product.info.tagColor {
                                        Text(tag)
                                            .font(.caption2)
                                            .fontWeight(.bold)
                                            .padding(.vertical,3)
                                            .padding(.horizontal, 8)
                                            .foregroundStyle(tagColor)
                                            .background(tagColor.opacity(0.15))
                                            .clipShape(RoundedRectangle(cornerRadius: 3))
                                    }
                                }
                                HStack(spacing: 5) {
                                    Text(product.displayPrice)
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                    HStack(spacing: 2) {
                                        Text(verbatim: "/")
                                        Text(product.info.priceSuffix)
                                    }
                                    .font(.footnote)
                                    .foregroundStyle(.secondary)
                                }
                            }
                            Spacer()
                            Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                                .imageScale(.large)
                                .foregroundStyle(isSelected ? Color("AppColor2") : Color.gray)
                        }
                        .frame(height: 60)
                        .modifier(ProBg())
                        .overlay {
                            if isSelected {
                                RoundedRectangle(cornerRadius: 12)
                                    .strokeBorder(Color("AppColor2"), lineWidth: 3)
                            }
                        }
                        .overlay {
                            if product.info.isRecommend {
                                VStack {
                                    HStack {
                                        Spacer()
                                        Text("Recommended")
                                            .font(.caption)
                                            .fontWeight(.medium)
                                            .foregroundStyle(Color.white)
                                            .padding(3)
                                            .padding(.horizontal, 8)
                                            .background(Color("AppColor2"))
                                            .clipShape(RoundedRectangle(cornerRadius: 5))
                                    }
                                    Spacer()
                                }
                            }
                        }
                    })
                    .buttonStyle(.plain)
                }
            }
        }
        .onAppear {
            selectDefaultProductIfNeeded()
        }
        .onChange(of: iapManager.displayProducts.map { $0.product.id }) { _ in
            selectDefaultProductIfNeeded()
        }
    }
    
    // 包含内容
    var included: some View {
        VStack {
            // 包含内容
            HStack {
                Text("What's Included")
                    .modifier(FootnoteGrayText())
                Spacer()
            }
            VStack {
                ForEach(Array(ProInfo.allCases.enumerated()), id:\.offset) { index,pro in
                    HStack(spacing: 12) {
                        // 图标
                        VStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(pro.color)
                                .frame(width: 33, height: 33)
                                .overlay {
                                    Image(pro.icon)
                                        .resizable()
                                        .renderingMode(.template)
                                        .scaledToFit()
                                        .foregroundStyle(.white)
                                        .frame(width: 22, height: 22)
                                }
                            Spacer()
                        }
                        // 描述
                        VStack(alignment: .leading, spacing: 3) {
                            Text(pro.name)
                                .font(.subheadline)
                            Text(pro.description)
                                .font(.caption)
                                .foregroundStyle(Color.secondary)
                        }
                        Spacer()
                    }
                    if index != ProInfo.allCases.count - 1 {
                        Divider()
                            .padding(.leading, 40)
                            .padding(.vertical, 3)
                    }
                }
            }
            .modifier(Pro3Bg())
        }
    }
    
    // 购买提示
    var purchaseNotice: some View {
        VStack(spacing: 10) {
            // 购买提示
            HStack {
                Text("Purchase Notice")
                    .modifier(FootnoteGrayText())
                Spacer()
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("Subscriptions automatically renew unless canceled in your App Store account.")
                    Text("Purchased Pro access can be restored with “Restore Purchases”.")
                    Text("Lifetime Pro is a one-time purchase, valid forever, with no renewal required.")
                    Text("To cancel, manage your subscription in the App Store or System Settings. Refunds must be requested through Apple, and developers cannot cancel subscriptions or issue refunds on your behalf.")
                }
                Spacer()
            }
            .modifier(Caption2Text())
            .modifier(ProBg())
        }
    }
    
    // 恢复购买
    var restorePurchasesButton: some View {
        VStack {
            Button(action: {
                // 触发振动
                HapticManager.shared.selectionChanged()
                // 显示加载动画
                isLoading = true
                
                operationTask = Task {
                    await iapManager.checkAllTransactions {
                        result in
                        print("完成恢复购买")
                        // 移除加载动画
                        isLoading = false
                        // 弹出完成提示
                        switch result {
                        case .restoreSuccess:
                            print("恢复成功")
                            productResultStatus = .restoreSuccess
                        case .restoreFailed:
                            print("恢复失败")
                            productResultStatus = .restoreFailed
                        default:
                            print("进入其他选择")
                            break
                        }
                    }
                }
            }, label: {
                Text("Restore Purchases")
                    .modifier(FootnoteGrayText())
            })
            .buttonStyle(.plain)
        }
    }
    
    // 立即订阅
    var subscribeButton: some View {
        VStack {
            Button(action: {
                print("开始内购商品")
                // 触发振动
                HapticManager.shared.selectionChanged()
                
                guard let selectedProduct else { return }
                // 显示加载动画
                isLoading = true
                
                operationTask = Task {
                    await iapManager.purchaseProduct(selectedProduct) { result in
                        print("完成购买")
                        // 移除加载动画
                        isLoading = false
                        
                        // 弹出完成提示
                        switch result {
                        case .purchaseSuccess:
                            productResultStatus = .purchaseSuccess
                        case .purchaseFailed:
                            productResultStatus = .purchaseFailed
                        default:
                            break
                        }
                    }
                }
            }, label: {
                Text("Subscribe Now")
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(.white)
                    .frame(width: 240,height: 60)
                    .background(selectedProduct == nil ? Color.gray : Color("AppColor2"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            })
            .disabled(selectedProduct == nil)
        }
    }
}

enum ProductResultEnum: String, Identifiable {
    var id: String {
        rawValue
    }
    case purchaseSuccess
    case purchaseFailed
    case restoreSuccess
    case restoreFailed
    case stateless
}

struct PreviewProView: View {
    @StateObject var appStorage = AppStorageManager.shared
    @StateObject var iapManager = IAPManager.shared
    var body: some View {
        NavigationView {
            ProView(showCloseButton: false)
                .environmentObject(appStorage)
                .environmentObject(iapManager)
                .task {
                    await iapManager.loadProduct()
                }
        }
    }
}

#Preview {
    PreviewProView()
}
