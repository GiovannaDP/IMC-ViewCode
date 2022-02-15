//
//  View.swift
//  IMC
//
//  Created by Giovanna Danelli Pau on 14/02/22.
//

import UIKit

class View: UIView {
    
    lazy var firstView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(red: 51/255, green: 168/255, blue: 190/255, alpha: 1.0)
        return view
    }()
    
    lazy var secondView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.isHidden = true
        return view
    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cálculo do IMC"
        label.font = UIFont.systemFont(ofSize: 36, weight: .heavy)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Descubra o seu Índice de Massa Corporal"
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    lazy var pesoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Peso (Kg)"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    lazy var pesoText: UITextField = {
        let text = UITextField(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Ex: 75"
        text.font = UIFont.systemFont(ofSize: 16)
        text.backgroundColor = .white
        text.borderStyle = .roundedRect
        text.keyboardType = .decimalPad
        return text
    }()

    lazy var alturaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Altura (m)"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    lazy var alturaText: UITextField = {
        let text = UITextField(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Ex: 1.86"
        text.font = UIFont.systemFont(ofSize: 16)
        text.backgroundColor = .white
        text.borderStyle = .roundedRect
        text.keyboardType = .decimalPad
        return text
    }()

    lazy var calcularButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .heavy)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.init(red: 138/255, green: 178/255, blue: 194/255, alpha: 1.0)
        button.layer.cornerRadius = 6
        return button
    }()
    
    lazy var tituloResultadoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Seu Índice de Massa Corporal é"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    lazy var resultadoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "resultado"
        label.font = UIFont.systemFont(ofSize: 27, weight: .heavy)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var resultadoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    func addViewsToFirst(){
        self.firstView.addSubview(titleLabel)
        self.firstView.addSubview(subtitleLabel)
        self.firstView.addSubview(pesoLabel)
        self.firstView.addSubview(pesoText)
        self.firstView.addSubview(alturaLabel)
        self.firstView.addSubview(alturaText)
        self.firstView.addSubview(calcularButton)
        
    }
    
    func addViewsToSecond(){
        self.secondView.addSubview(tituloResultadoLabel)
        self.secondView.addSubview(resultadoLabel)
        self.secondView.addSubview(resultadoImage)
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview(firstView)
        
        firstView.addSubview(secondView)
        addViewsToFirst()
        addViewsToSecond()
        configuraConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configuraConstraints(){
        
        NSLayoutConstraint.activate([
            self.firstView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.firstView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            self.firstView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            self.firstView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.firstView.topAnchor, constant: 25),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.firstView.trailingAnchor, constant: 10),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.firstView.leadingAnchor, constant: 10),
            
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            self.subtitleLabel.leadingAnchor.constraint(equalTo: self.firstView.leadingAnchor),
            self.subtitleLabel.trailingAnchor.constraint(equalTo: self.firstView.trailingAnchor),
            
            self.pesoLabel.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 10),
            self.pesoLabel.leadingAnchor.constraint(equalTo: self.firstView.leadingAnchor),
            
            self.alturaLabel.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 10),
            self.alturaLabel.trailingAnchor.constraint(equalTo: self.firstView.trailingAnchor),
            self.alturaLabel.leadingAnchor.constraint(equalTo: self.pesoLabel.trailingAnchor),
            self.alturaLabel.widthAnchor.constraint(equalTo: self.firstView.widthAnchor, constant: -(self.firstView.frame.width / 2)),
            
            self.pesoText.topAnchor.constraint(equalTo: self.pesoLabel.bottomAnchor, constant: 8),
            self.pesoText.centerXAnchor.constraint(equalTo: self.pesoLabel.centerXAnchor),
            self.pesoText.widthAnchor.constraint(equalToConstant: 110),
            
            self.alturaText.topAnchor.constraint(equalTo: self.alturaLabel.bottomAnchor, constant: 8),
            self.alturaText.centerXAnchor.constraint(equalTo: self.alturaLabel.centerXAnchor),
            self.alturaText.widthAnchor.constraint(equalTo: pesoText.widthAnchor),
            
            self.calcularButton.topAnchor.constraint(equalTo: self.pesoText.bottomAnchor, constant: 14),
            self.calcularButton.leadingAnchor.constraint(equalTo: self.pesoText.leadingAnchor),
            self.calcularButton.trailingAnchor.constraint(equalTo: self.alturaText.trailingAnchor),
            
            self.secondView.topAnchor.constraint(equalTo: self.calcularButton.bottomAnchor, constant: 40),
            self.secondView.leadingAnchor.constraint(equalTo: self.firstView.leadingAnchor),
            self.secondView.trailingAnchor.constraint(equalTo: self.firstView.trailingAnchor),
            self.secondView.bottomAnchor.constraint(equalTo: self.firstView.bottomAnchor),
            
            self.tituloResultadoLabel.topAnchor.constraint(equalTo: self.secondView.topAnchor, constant: 16),
            self.tituloResultadoLabel.leadingAnchor.constraint(equalTo: self.secondView.leadingAnchor, constant: 10),
            self.tituloResultadoLabel.trailingAnchor.constraint(equalTo: self.secondView.trailingAnchor, constant: -10),
            
            self.resultadoLabel.topAnchor.constraint(equalTo: self.tituloResultadoLabel.bottomAnchor, constant: 16),
            self.resultadoLabel.centerXAnchor.constraint(equalTo: tituloResultadoLabel.centerXAnchor),
            
            self.resultadoImage.topAnchor.constraint(equalTo: self.resultadoLabel.bottomAnchor, constant: 16),
            self.resultadoImage.bottomAnchor.constraint(equalTo: self.secondView.bottomAnchor, constant: -16),
            self.resultadoImage.leadingAnchor.constraint(equalTo: self.secondView.leadingAnchor, constant: 16),
            self.resultadoImage.trailingAnchor.constraint(equalTo: self.secondView.trailingAnchor, constant: -16),
        ])
        
        
    }
}
