import UIKit
import RxSwift
import RxCocoa

protocol HomepageDisplayLogic: class {
    func displaySearchResults(_ viewModel: Homepage.Search.ViewModel)
    func displayError(_ viewModel: Homepage.Error.ViewModel)
}

class HomepageViewController: UIViewController {
    @IBOutlet weak private var searchTextField: UITextField!
    @IBOutlet weak private var searchButton: UIButton!
    @IBOutlet weak private var tableView: UITableView!
    
    var interactor: HomepageBusinessLogic?
    private let disposeBag = DisposeBag()
    private var searchText = ""
    private var searchResults = [Homepage.Result]()
    private var indicator = UIActivityIndicatorView(style: .large)
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup
    private func setup() {
        let viewController = self
        let worker = HomepageWorker()
        let interactor = HomepageInteractor(worker)
        let presenter = HomepagePresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    static func initFromStoryboard() -> HomepageViewController {
        return UIStoryboard(name: "Homepage", bundle: nil).instantiateInitialViewController() as? HomepageViewController ?? HomepageViewController()
    }

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTapAroundView()
        setupObservables()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 209
        tableView.isHidden = true
    }
    
    private func hideKeyboardWhenTapAroundView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: Rx
extension HomepageViewController {
    private func setupObservables() {
        disposeBag.insert([
            searchTextField
                .rx
                .controlEvent(.editingChanged)
                .withLatestFrom(searchTextField.rx.text.orEmpty)
                .subscribe(onNext: { [weak self] text in
                    self?.handleTypedText(text)
                }),
            
            searchButton
                .rx
                .tap
                .subscribe(onNext: { [weak self] _ in
                    self?.handleClickedSearch()
                })
        ])
    }
    
    private func handleTypedText(_ text: String) {
        searchText = text
    }
    
    private func handleClickedSearch() {
        tableView.isHidden = true
        showLoading()
        interactor?.getSearchData(.init(searchText: searchText))
    }
}

// MARK: TableView DataSource, Delegate
extension HomepageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homepageCell") ?? UITableViewCell()
        cell.textLabel?.text = searchResults[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: searchResults[indexPath.row].text), UIApplication.shared.canOpenURL(url) else {
            displayAlert("Cannot open URL")
            return
        }
        UIApplication.shared.open(url)
    }
}

// MARK: DisplayLogic
extension HomepageViewController: HomepageDisplayLogic {
    func displaySearchResults(_ viewModel: Homepage.Search.ViewModel) {
        searchResults = viewModel.searchResults
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.hideLoading()
            self.reloadTableView()
        }
    }
    
    func displayError(_ viewModel: Homepage.Error.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.hideLoading()
            self.displayAlert(viewModel.message)
        }
    }
    
    private func reloadTableView() {
        tableView.isHidden = false
        tableView.reloadData()
    }
    
    private func showLoading() {
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.startAnimating()
    }
    
    private func hideLoading() {
        indicator.stopAnimating()
    }
    
    private func displayAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        present(
            alert,
            animated: true,
            completion: {
                Timer.scheduledTimer(
                    withTimeInterval: 1,
                    repeats: false,
                    block: { _ in
                        self.dismiss(animated: true, completion: nil)
                    }
                )
            }
        )
    }
}
