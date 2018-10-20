import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private let disposeBag = DisposeBag()
    var viewModel: HogeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HogeViewModel()
        
        viewModel.helloWorldSubject
            .subscribe(onNext: {[weak self] value in
                print("value = \(value)")
            })
        .disposed(by: disposeBag)
        
        viewModel.updateItem()
    }
}

class HogeViewModel{
    let helloWorldSubject = PublishSubject<String>()
    
    func updateItem() {
        helloWorldSubject.onNext("Hello World!")
    }
}
