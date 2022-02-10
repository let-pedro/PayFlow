
import UIKit
import FirebaseFirestore
import FirebaseAuth

class HomeViewController: UIViewController {
    
    private var homeView: HomeView
    private let viewModel: HomeVM
    private var bills: [DocumentSnapshot] = []
    
    //MARK: - Setup
    
    init() {
        self.homeView = HomeView()
        self.viewModel = HomeVM()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        settingMain()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        dateTable()
        //extension
        addHeaderTo(vc: self)
    }
    
    
    private func settingMain(){
        setDelegates()
        validateAuth()
        buttonCall()
    
    }
    
    
    func setDelegates(){
        homeView.table.delegate = self
        homeView.table.dataSource = self
    }
        
    //MARK: - Main
    
    private func validateAuth() {
        if Auth.auth().currentUser == nil {
            let LoginScene = LoginVC()
            LoginScene.modalPresentationStyle = .fullScreen
            present(LoginScene,animated: true)
        }
    }
    
    
    private func dateTable(){
        self.bills = []
        viewModel.getAllBill() { [self] success in
            for documentBill in success {
                self.bills.append(documentBill)
            }
            DispatchQueue.main.async {
                self.homeView.table.reloadData()
                
                homeView.RegistrationAmountt.text = "Você tem \(bills.count) boletos cadastrados para pagar"
                homeView.QtBoleto.text = "\(bills.count) ao total"
            }
        }
    }
    
    // MARK: - button action

    private func buttonCall(){
        homeView.buttonAdd.addTarget(self, action: #selector(tapButtonNewRegister), for: .touchUpInside)
    }
    
    
    @objc func tapButtonNewRegister(){
        let registerBillScene = RegisterBillVC()
        registerBillScene.modalPresentationStyle = .fullScreen
        present(registerBillScene,animated: true)
    }

}
// MARK: - extension

extension HomeVC:  UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bills.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeView.table.dequeueReusableCell(withIdentifier: BillCell.identifier, for: indexPath) as? BillCell
        
        let datasBill = bills[indexPath.row].data()
        cell?.configure(title: datasBill!["title"] as! String,
                        date: datasBill!["dueDate"] as! String,
                        value: datasBill!["value"] as! Double)
        return cell!
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let selectedBill = bills[indexPath.row]
            
            viewModel.paymentsMade(with: selectedBill) { success in
                guard success == true else {
                    self.present(Utilities.Alert(Title: "Erro!", messageAlert: "Erro ao excluir contar"), animated: true)
                    return
                }
                self.present(Utilities.Alert(Title: "Sucesso!", messageAlert: "Contar excluida com Sucesso"), animated: true)
                self.dateTable()
            }
        }
    }
}
