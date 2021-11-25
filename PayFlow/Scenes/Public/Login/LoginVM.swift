
import Foundation
import FirebaseAuth


struct LoginVM {
    
    
    
    //MARK: - Methods
    
    func loginUser(with email: String, password: String, completion: @escaping ((Bool) -> Void)){
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            guard error == nil else {
                print("Erro login user \(error!.localizedDescription)")
                completion(false)
                return
            }
            completion(true)
        }
    }
}
