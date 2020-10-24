//
//  MenuProdutosViewController.swift
//  Nospresso
//
//  Created by Leonardo dos Santos Marcos on 17/10/20.
//

import UIKit

class MenuProdutosViewController: UIViewController {
    @IBOutlet private weak var maquinasView: UIView!
    
    @objc
    private func tocarEmMaquinas(_ remetente: Any) {
        let vc = MaquinasViewController(nib: R.nib.maquinasViewController)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removerTextoBotaoVoltar()
        
        //outra forma de adicionar UITapGestureRecognizer alem de peo storyboard ou xib
        let reconhecedor = UITapGestureRecognizer(target: self, action: #selector(tocarEmMaquinas))
        maquinasView.addGestureRecognizer(reconhecedor)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: segue)
//        navigationController?.setNavigationBarHidden(false, animated: true)
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
