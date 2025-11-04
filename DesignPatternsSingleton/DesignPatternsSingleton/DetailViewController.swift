//
//  DetailViewController.swift
//  DesignPatternsSingleton
//
//  Created by Daniela Valadares on 03/11/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let counterLabel = UILabel()
    private let resetButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalhes"
        view.backgroundColor = .systemBackground
        setupLayout()
        updateLabel()
    }
    
    private func setupLayout() {
        counterLabel.font = .systemFont(ofSize: 28, weight: .medium)
        counterLabel.textAlignment = .center
        
        resetButton.setTitle("Resetar contador", for: .normal)
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [counterLabel, resetButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func resetTapped() {
        CounterManager.shared.reset()
        updateLabel()
    }
    
    private func updateLabel() {
        counterLabel.text = "Valor atual: \(CounterManager.shared.count)"
    }
}
