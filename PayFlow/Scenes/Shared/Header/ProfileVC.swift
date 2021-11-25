
import UIKit
import FirebaseFirestore
import FirebaseAuth

class ProfileVC: UIViewController {
    
    private let profileView: ProfileView
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser
    
    //MARK: - Setup
    
    
    init() {
        self.profileView = ProfileView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = profileView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async { [self] in
            db.collection("users").whereField("id", isEqualTo: String(user!.uid)).getDocuments() { [self] (querySnapshot, error ) in
                guard error == nil  else {
                    print("error profile \(error!.localizedDescription)")
                    return
                }
                DispatchQueue.main.async {
                    let data = querySnapshot!.documents[0].data()
                    profileView.welcomeLabel.text = "Olá, \(String(describing: data["firstName"]!))"
                }
            }
        }
    }
}
