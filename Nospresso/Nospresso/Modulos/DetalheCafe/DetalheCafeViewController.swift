//
//  DetalheCafeViewController.swift
//  Nospresso
//
//  Created by Leonardo dos Santos Marcos on 20/10/20.
//

import UIKit

class DetalheCafeViewController: UIViewController {
    var presenter: DetalheCafePresenterType?
    @IBOutlet weak var cafeImageView: UIImageView!
    @IBOutlet weak var intensidadeStackView: ContadorIntensidadeStackView!
    
    @IBOutlet weak var intensidadeLabel: UILabel!
    @IBOutlet weak var medidasStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.telaCarregou()
    }

}

extension DetalheCafeViewController: DetalheCafeViewType {
    func exibirTitulo(_ titulo: String) {
        title = titulo
    }
    
    func exibirDados(do cafe: Cafe) {
        DispatchQueue.main.async {
            if let intensidade = cafe.intensidade {
                self.intensidadeStackView.configurar(para: intensidade)
                self.intensidadeLabel.text = "Intensidade: \(intensidade)"
            } else {
                self.intensidadeLabel.isHidden = true
            }
            
            self.cafeImageView.carregarImagem(usando: cafe.imagem)
            
            
            
            
            for medida in cafe.medidas {
                let view = MedidaView.doNib()
                view.configurar(com: medida)
                
                self.medidasStackView.addArrangedSubview(view)
            }
            
            self.medidasStackView.addArrangedSubview(UIView())
        }
    }
}
