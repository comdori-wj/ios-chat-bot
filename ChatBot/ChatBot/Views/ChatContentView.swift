//
//  ChatContentView.swift
//  ChatBot
//
//  Created by Wonji Ha on 1/16/24.
//

import UIKit

class ChatContentView: UIView, UIContentView {
    var configuration: UIContentConfiguration {
            didSet {
                guard let configuration = configuration as? ChatContentConfiguration else { return }
                apply(configuration)
            }
        }
        
        private lazy var textLabel: UILabel = {
            let label = UILabel()
            label.font = .preferredFont(forTextStyle: .body)
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .white
            return label
        }()
        
        private lazy var bubble: BubbleView = {
            let bubble = BubbleView()
            bubble.backgroundColor = .systemBackground
//            bubble.color = .systemGray3
            bubble.color = .systemBlue
            addSubview(bubble)
            bubble.addSubview(textLabel)
            bubble.translatesAutoresizingMaskIntoConstraints = false
            return bubble
        }()
        
        init(configuration: ChatContentConfiguration) {
            self.configuration = configuration
            super.init(frame: .zero)
            apply(configuration)
            setup()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
        private func setup() {
            NSLayoutConstraint.activate([
                bubble.trailingAnchor.constraint(equalTo: trailingAnchor),
                bubble.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                bubble.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                bubble.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
                
                textLabel.topAnchor.constraint(equalTo: bubble.topAnchor, constant: 5),
                textLabel.bottomAnchor.constraint(equalTo: bubble.bottomAnchor, constant: -5),
                textLabel.leadingAnchor.constraint(equalTo: bubble.leadingAnchor, constant: 10),
                textLabel.trailingAnchor.constraint(equalTo: bubble.trailingAnchor, constant: -20),
            ])
        }
        
        private func apply(_ configuration: ChatContentConfiguration) {
            textLabel.text = configuration.content
        }
    }
