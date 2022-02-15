//
//  ViewController.swift
//  IMC
//
//  Created by Giovanna Danelli Pau on 09/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var customView: View? = nil
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func buildView(){
        view = View()
        customView = view as? View
        customView?.calcularButton.addTarget(self, action: #selector(calcular), for: .touchUpInside)
    }
    
    @objc func calcular(){
        guard let weight = Double(customView?.pesoText.text ?? "0"), let height = Double(customView?.alturaText.text ?? "0") else {return}
        imc = weight / (height * height)
        showResults()
    }
   
    func showResults(){
        var result: String = " "
        var image: String = " "
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "magreza"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        
        customView?.resultadoLabel.text = "\(Int(imc)): \(result)"
        customView?.resultadoImage.image = UIImage(named: image)
        customView?.secondView.isHidden = false
        customView?.endEditing(true)
    }

}

