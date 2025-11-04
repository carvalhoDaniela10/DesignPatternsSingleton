//
//  MainViewController.swift
//  DesignPatternsSingleton
//
//  Created by Daniela Valadares on 03/11/25.
//

import UIKit

class MainViewController: UIViewController {

    private let counterLabel = UILabel()
    private let addButton = UIButton(type: .system)
    private let goToDetailButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Principal"
        view.backgroundColor = .systemBackground
        setupLayout()
        updateLabel()
    }
    
    private func setupLayout() {
        counterLabel.font = .systemFont(ofSize: 32, weight: .bold)
        counterLabel.textAlignment = .center
        
        addButton.setTitle("Adicionar 1", for: .normal)
        addButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        
        goToDetailButton.setTitle("Ir para detalhes", for: .normal)
        goToDetailButton.addTarget(self, action: #selector(detailTapped), for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [counterLabel, addButton, goToDetailButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func addTapped() {
        CounterManager.shared.increment()
        updateLabel()
    }
    
    @objc private func detailTapped() {
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    private func updateLabel() {
        counterLabel.text = "Contador: \(CounterManager.shared.count)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel() // Atualiza quando volta da segunda tela
    }
}
