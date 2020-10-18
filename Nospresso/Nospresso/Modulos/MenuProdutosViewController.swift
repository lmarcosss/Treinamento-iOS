//
//  MenuProdutosViewController.swift
//  Nospresso
//
//  Created by Leonardo dos Santos Marcos on 17/10/20.
//

import UIKit

class MenuProdutosViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removerTextoBotaoVoltar()
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
