
import Foundation
import Firebase
import FirebaseAuth


class SignUpViewModel {
    
    private let db = Firestore.firestore()

    //MARK: - Methods
    
    func createUser(datas: Register,completion: @escaping ((Bool) -> Void)){
        Auth.auth().createUser(withEmail: datas.email, password: datas.password) { (result, error ) in
            guard error == nil else {
                print(("Error create user \(error!.localizedDescription)"))
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let objUser = ["id":uid,
                            "firstName":datas.firstName,
                            "lastName":datas.lastName,
                            "email":datas.email]
                            
            self.db.collection("users").document(uid).setData(objUser) { (error) in
                guard error == nil else {
                    print(("User data couldn't \(error!.localizedDescription)"))
                    completion(false)
                    return
                }
                completion(true)
            }
        }
    }
}
