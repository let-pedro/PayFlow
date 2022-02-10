

import UIKit

class RegisterBillViewController: UIViewController {
    
    private var registerBillView: RegisterBillView
    private let viewModel: RegisterBillVM
    
    //MARK: - Setup
    
    init() {
        self.registerBillView = RegisterBillView()
        self.viewModel = RegisterBillVM()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        super.loadView()
        
        view = registerBillView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonCall()
    }
    
    // MARK: - Main
    
    
    private func validateFields() -> Bool? {
        if registerBillView.titleBillField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            registerBillView.dueDateFiel.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            registerBillView.valueField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            registerBillView.barcodeField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return false
        }
        return nil
    }
    
    
    private func clearField() {
            registerBillView.titleBillField.text = ""
            registerBillView.dueDateFiel.text = ""
            registerBillView.valueField.text = ""
            registerBillView.barcodeField.text = ""
    }
    
    // MARK: - button action
    
    
    private func buttonCall(){
        registerBillView.backButton.addTarget(self, action: #selector(tapButtonGoToHome), for: .touchUpInside)
        registerBillView.cancelButton.addTarget(self,action: #selector(tapButoonCancelar), for: .touchUpInside)
        registerBillView.registerButton.addTarget(self, action: #selector(tapButtonSubmitRegister), for: .touchUpInside)
    }
    
    
    @objc func tapButtonGoToHome(){
        let homeScene = HomeVC()
        homeScene.modalPresentationStyle = .fullScreen
        present(homeScene, animated: true)
        
    }
    
    @objc func tapButoonCancelar(){
        self.clearField()
    }
    
    @objc func tapButtonSubmitRegister(){

        guard validateFields() == nil else {
            present(Utilities.Alert(Title: "Campo não preenchido", messageAlert: "Todos os campos precisar está preenchidos"), animated: true)
            return
        }
        
        let newBill = Bill(title: registerBillView.titleBillField.text!.trimmingCharacters(in: .whitespacesAndNewlines),
                          dueDate: registerBillView.dueDateFiel.text!.trimmingCharacters(in: .whitespacesAndNewlines),
                          value: Double(registerBillView.valueField.text!)!,
                          barcode: registerBillView.barcodeField.text!.trimmingCharacters(in: .whitespacesAndNewlines))
        
        
        viewModel.createRegisterBill(with: newBill) { [self] success in
            if success != true {
                self.present(Utilities.Alert(Title: "Erro!", messageAlert: "Ocorreu um erro ao cadastrar uma contar"), animated: true)
            } else {
                self.present(Utilities.Alert(Title: "Sucesso!", messageAlert: "Conta cadastrada com sucesso"), animated: true)
                self.clearField()
            }
        }
    }
}
