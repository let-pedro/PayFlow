
import UIKit
import FirebaseFirestore

class ExtractorVC: UIViewController {
    
    private var extractorView: ExtractorView
    private let viewModel: ExtractorVM
    private var bills: [DocumentSnapshot] = []
    
    //MARK: - Setup
    
    init() {
        self.extractorView = ExtractorView()
        self.viewModel = ExtractorVM()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        super.loadView()
        
        view = extractorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setDelegates()
        
        //extension
        addHeaderTo(vc: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        dateTable()
    }
    
    func setDelegates(){
        extractorView.table.delegate = self
        extractorView.table.dataSource = self
    }
    
    //MARK: - Main
    
    private func dateTable(){
        self.bills = []
        
        viewModel.getPaymentsMade() { [self] success in
            for documentBill in success {
                self.bills.append(documentBill)
            }
            DispatchQueue.main.async {
                self.extractorView.table.reloadData()
                extractorView.QtBoleto.text = "\(bills.count) pagos"
            }
        }
    }
}

// MARK: - extension

extension ExtractorVC:  UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bills.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = extractorView.table.dequeueReusableCell(withIdentifier: BillCell.identifier, for: indexPath) as? BillCell
        
        let datasBill = bills[indexPath.row].data()
        cell?.configure(title: datasBill!["title"] as! String,
                        date: datasBill!["dueDate"] as! String,
                        value: datasBill!["value"] as! Double)
        return cell!
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let selectedBill = bills[indexPath.row]
            
            viewModel.deleteBill(with: selectedBill) { success in
                guard success == true else {
                    self.present(Utilities.Alert(Title: "Erro!", messageAlert: "Erro ao excluir contar"), animated: true)
                    return
                }
                self.dateTable()
                self.present(Utilities.Alert(Title: "Sucesso!", messageAlert: "Contar excluida com Sucesso"), animated: true)
            }
        }
    }
}
