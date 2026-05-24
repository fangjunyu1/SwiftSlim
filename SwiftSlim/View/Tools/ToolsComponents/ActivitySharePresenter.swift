//
//  ActivitySharePresenter.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/5/24.
//

import SwiftUI

import UIKit

struct ActivitySharePresenter: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    let items: [Any]

    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(_ viewController: UIViewController, context: Context) {
        guard isPresented else { return }
        guard viewController.presentedViewController == nil else { return }

        let activityViewController = UIActivityViewController(
            activityItems: items,
            applicationActivities: nil
        )

        activityViewController.completionWithItemsHandler = { _, _, _, _ in
            isPresented = false
        }

        if let popover = activityViewController.popoverPresentationController {
            popover.sourceView = viewController.view
            popover.sourceRect = CGRect(
                x: viewController.view.bounds.midX,
                y: viewController.view.bounds.midY,
                width: 0,
                height: 0
            )
            popover.permittedArrowDirections = []
        }

        viewController.present(activityViewController, animated: true)
    }
}
