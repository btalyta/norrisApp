// MARK: - Mocks generated from file: Norris/FactsView/FactsProtocols.swift at 2020-04-18 18:24:19 +0000

//
//  FactsProtocols.swift
//  Norris
//
//  Created by Bárbara Souza on 13/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.

import Cuckoo
@testable import Norris

import Foundation


 class MockFactsRepositoryProtocols: FactsRepositoryProtocols, Cuckoo.ProtocolMock {
    
     typealias MocksType = FactsRepositoryProtocols
    
     typealias Stubbing = __StubbingProxy_FactsRepositoryProtocols
     typealias Verification = __VerificationProxy_FactsRepositoryProtocols

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: FactsRepositoryProtocols?

     func enableDefaultImplementation(_ stub: FactsRepositoryProtocols) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func requestSuggestions(completion: @escaping ((Result<SuggestionsModel, APIError>) -> Void))  {
        
    return cuckoo_manager.call("requestSuggestions(completion: @escaping ((Result<SuggestionsModel, APIError>) -> Void))",
            parameters: (completion),
            escapingParameters: (completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.requestSuggestions(completion: completion))
        
    }
    
    
    
     func requestFact(with category: String, completion: @escaping ((Result<FactModel, APIError>) -> Void))  {
        
    return cuckoo_manager.call("requestFact(with: String, completion: @escaping ((Result<FactModel, APIError>) -> Void))",
            parameters: (category, completion),
            escapingParameters: (category, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.requestFact(with: category, completion: completion))
        
    }
    
    
    
     func requestCollection(with text: String, completion: @escaping ((Result<FactsCollectionModel, APIError>) -> Void))  {
        
    return cuckoo_manager.call("requestCollection(with: String, completion: @escaping ((Result<FactsCollectionModel, APIError>) -> Void))",
            parameters: (text, completion),
            escapingParameters: (text, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.requestCollection(with: text, completion: completion))
        
    }
    

	 struct __StubbingProxy_FactsRepositoryProtocols: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func requestSuggestions<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(((Result<SuggestionsModel, APIError>) -> Void))> where M1.MatchedType == ((Result<SuggestionsModel, APIError>) -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(((Result<SuggestionsModel, APIError>) -> Void))>] = [wrap(matchable: completion) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockFactsRepositoryProtocols.self, method: "requestSuggestions(completion: @escaping ((Result<SuggestionsModel, APIError>) -> Void))", parameterMatchers: matchers))
	    }
	    
	    func requestFact<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(with category: M1, completion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, ((Result<FactModel, APIError>) -> Void))> where M1.MatchedType == String, M2.MatchedType == ((Result<FactModel, APIError>) -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(String, ((Result<FactModel, APIError>) -> Void))>] = [wrap(matchable: category) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockFactsRepositoryProtocols.self, method: "requestFact(with: String, completion: @escaping ((Result<FactModel, APIError>) -> Void))", parameterMatchers: matchers))
	    }
	    
	    func requestCollection<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(with text: M1, completion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, ((Result<FactsCollectionModel, APIError>) -> Void))> where M1.MatchedType == String, M2.MatchedType == ((Result<FactsCollectionModel, APIError>) -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(String, ((Result<FactsCollectionModel, APIError>) -> Void))>] = [wrap(matchable: text) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockFactsRepositoryProtocols.self, method: "requestCollection(with: String, completion: @escaping ((Result<FactsCollectionModel, APIError>) -> Void))", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_FactsRepositoryProtocols: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func requestSuggestions<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.__DoNotUse<(((Result<SuggestionsModel, APIError>) -> Void)), Void> where M1.MatchedType == ((Result<SuggestionsModel, APIError>) -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(((Result<SuggestionsModel, APIError>) -> Void))>] = [wrap(matchable: completion) { $0 }]
	        return cuckoo_manager.verify("requestSuggestions(completion: @escaping ((Result<SuggestionsModel, APIError>) -> Void))", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func requestFact<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(with category: M1, completion: M2) -> Cuckoo.__DoNotUse<(String, ((Result<FactModel, APIError>) -> Void)), Void> where M1.MatchedType == String, M2.MatchedType == ((Result<FactModel, APIError>) -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(String, ((Result<FactModel, APIError>) -> Void))>] = [wrap(matchable: category) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return cuckoo_manager.verify("requestFact(with: String, completion: @escaping ((Result<FactModel, APIError>) -> Void))", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func requestCollection<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(with text: M1, completion: M2) -> Cuckoo.__DoNotUse<(String, ((Result<FactsCollectionModel, APIError>) -> Void)), Void> where M1.MatchedType == String, M2.MatchedType == ((Result<FactsCollectionModel, APIError>) -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(String, ((Result<FactsCollectionModel, APIError>) -> Void))>] = [wrap(matchable: text) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return cuckoo_manager.verify("requestCollection(with: String, completion: @escaping ((Result<FactsCollectionModel, APIError>) -> Void))", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class FactsRepositoryProtocolsStub: FactsRepositoryProtocols {
    

    

    
     func requestSuggestions(completion: @escaping ((Result<SuggestionsModel, APIError>) -> Void))   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func requestFact(with category: String, completion: @escaping ((Result<FactModel, APIError>) -> Void))   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func requestCollection(with text: String, completion: @escaping ((Result<FactsCollectionModel, APIError>) -> Void))   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockFactsPresenterProtocol: FactsPresenterProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = FactsPresenterProtocol
    
     typealias Stubbing = __StubbingProxy_FactsPresenterProtocol
     typealias Verification = __VerificationProxy_FactsPresenterProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: FactsPresenterProtocol?

     func enableDefaultImplementation(_ stub: FactsPresenterProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var viewController: FactsViewControllerProtocol? {
        get {
            return cuckoo_manager.getter("viewController",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.viewController)
        }
        
        set {
            cuckoo_manager.setter("viewController",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.viewController = newValue)
        }
        
    }
    

    

    
    
    
     func viewDidLoad()  {
        
    return cuckoo_manager.call("viewDidLoad()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.viewDidLoad())
        
    }
    
    
    
     func didSelectCard(with index: IndexPath)  {
        
    return cuckoo_manager.call("didSelectCard(with: IndexPath)",
            parameters: (index),
            escapingParameters: (index),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.didSelectCard(with: index))
        
    }
    
    
    
     func wantsToSearch(with index: IndexPath)  {
        
    return cuckoo_manager.call("wantsToSearch(with: IndexPath)",
            parameters: (index),
            escapingParameters: (index),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.wantsToSearch(with: index))
        
    }
    
    
    
     func wantsToSearch(text: String)  {
        
    return cuckoo_manager.call("wantsToSearch(text: String)",
            parameters: (text),
            escapingParameters: (text),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.wantsToSearch(text: text))
        
    }
    
    
    
     func wantsToShowSuggestions()  {
        
    return cuckoo_manager.call("wantsToShowSuggestions()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.wantsToShowSuggestions())
        
    }
    

	 struct __StubbingProxy_FactsPresenterProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var viewController: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockFactsPresenterProtocol, FactsViewControllerProtocol> {
	        return .init(manager: cuckoo_manager, name: "viewController")
	    }
	    
	    
	    func viewDidLoad() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockFactsPresenterProtocol.self, method: "viewDidLoad()", parameterMatchers: matchers))
	    }
	    
	    func didSelectCard<M1: Cuckoo.Matchable>(with index: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(IndexPath)> where M1.MatchedType == IndexPath {
	        let matchers: [Cuckoo.ParameterMatcher<(IndexPath)>] = [wrap(matchable: index) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockFactsPresenterProtocol.self, method: "didSelectCard(with: IndexPath)", parameterMatchers: matchers))
	    }
	    
	    func wantsToSearch<M1: Cuckoo.Matchable>(with index: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(IndexPath)> where M1.MatchedType == IndexPath {
	        let matchers: [Cuckoo.ParameterMatcher<(IndexPath)>] = [wrap(matchable: index) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockFactsPresenterProtocol.self, method: "wantsToSearch(with: IndexPath)", parameterMatchers: matchers))
	    }
	    
	    func wantsToSearch<M1: Cuckoo.Matchable>(text: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: text) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockFactsPresenterProtocol.self, method: "wantsToSearch(text: String)", parameterMatchers: matchers))
	    }
	    
	    func wantsToShowSuggestions() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockFactsPresenterProtocol.self, method: "wantsToShowSuggestions()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_FactsPresenterProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var viewController: Cuckoo.VerifyOptionalProperty<FactsViewControllerProtocol> {
	        return .init(manager: cuckoo_manager, name: "viewController", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func viewDidLoad() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("viewDidLoad()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func didSelectCard<M1: Cuckoo.Matchable>(with index: M1) -> Cuckoo.__DoNotUse<(IndexPath), Void> where M1.MatchedType == IndexPath {
	        let matchers: [Cuckoo.ParameterMatcher<(IndexPath)>] = [wrap(matchable: index) { $0 }]
	        return cuckoo_manager.verify("didSelectCard(with: IndexPath)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func wantsToSearch<M1: Cuckoo.Matchable>(with index: M1) -> Cuckoo.__DoNotUse<(IndexPath), Void> where M1.MatchedType == IndexPath {
	        let matchers: [Cuckoo.ParameterMatcher<(IndexPath)>] = [wrap(matchable: index) { $0 }]
	        return cuckoo_manager.verify("wantsToSearch(with: IndexPath)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func wantsToSearch<M1: Cuckoo.Matchable>(text: M1) -> Cuckoo.__DoNotUse<(String), Void> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: text) { $0 }]
	        return cuckoo_manager.verify("wantsToSearch(text: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func wantsToShowSuggestions() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("wantsToShowSuggestions()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class FactsPresenterProtocolStub: FactsPresenterProtocol {
    
    
     var viewController: FactsViewControllerProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (FactsViewControllerProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func viewDidLoad()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func didSelectCard(with index: IndexPath)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func wantsToSearch(with index: IndexPath)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func wantsToSearch(text: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func wantsToShowSuggestions()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockFactsViewControllerProtocol: FactsViewControllerProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = FactsViewControllerProtocol
    
     typealias Stubbing = __StubbingProxy_FactsViewControllerProtocol
     typealias Verification = __VerificationProxy_FactsViewControllerProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: FactsViewControllerProtocol?

     func enableDefaultImplementation(_ stub: FactsViewControllerProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func showFacts(viewModel: FactsViewModel)  {
        
    return cuckoo_manager.call("showFacts(viewModel: FactsViewModel)",
            parameters: (viewModel),
            escapingParameters: (viewModel),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.showFacts(viewModel: viewModel))
        
    }
    
    
    
     func showError()  {
        
    return cuckoo_manager.call("showError()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.showError())
        
    }
    
    
    
     func wantsToShare(url: String)  {
        
    return cuckoo_manager.call("wantsToShare(url: String)",
            parameters: (url),
            escapingParameters: (url),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.wantsToShare(url: url))
        
    }
    
    
    
     func showSuggestions(viewModel: [SearchViewModel])  {
        
    return cuckoo_manager.call("showSuggestions(viewModel: [SearchViewModel])",
            parameters: (viewModel),
            escapingParameters: (viewModel),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.showSuggestions(viewModel: viewModel))
        
    }
    

	 struct __StubbingProxy_FactsViewControllerProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func showFacts<M1: Cuckoo.Matchable>(viewModel: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(FactsViewModel)> where M1.MatchedType == FactsViewModel {
	        let matchers: [Cuckoo.ParameterMatcher<(FactsViewModel)>] = [wrap(matchable: viewModel) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockFactsViewControllerProtocol.self, method: "showFacts(viewModel: FactsViewModel)", parameterMatchers: matchers))
	    }
	    
	    func showError() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockFactsViewControllerProtocol.self, method: "showError()", parameterMatchers: matchers))
	    }
	    
	    func wantsToShare<M1: Cuckoo.Matchable>(url: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: url) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockFactsViewControllerProtocol.self, method: "wantsToShare(url: String)", parameterMatchers: matchers))
	    }
	    
	    func showSuggestions<M1: Cuckoo.Matchable>(viewModel: M1) -> Cuckoo.ProtocolStubNoReturnFunction<([SearchViewModel])> where M1.MatchedType == [SearchViewModel] {
	        let matchers: [Cuckoo.ParameterMatcher<([SearchViewModel])>] = [wrap(matchable: viewModel) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockFactsViewControllerProtocol.self, method: "showSuggestions(viewModel: [SearchViewModel])", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_FactsViewControllerProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func showFacts<M1: Cuckoo.Matchable>(viewModel: M1) -> Cuckoo.__DoNotUse<(FactsViewModel), Void> where M1.MatchedType == FactsViewModel {
	        let matchers: [Cuckoo.ParameterMatcher<(FactsViewModel)>] = [wrap(matchable: viewModel) { $0 }]
	        return cuckoo_manager.verify("showFacts(viewModel: FactsViewModel)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func showError() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("showError()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func wantsToShare<M1: Cuckoo.Matchable>(url: M1) -> Cuckoo.__DoNotUse<(String), Void> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: url) { $0 }]
	        return cuckoo_manager.verify("wantsToShare(url: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func showSuggestions<M1: Cuckoo.Matchable>(viewModel: M1) -> Cuckoo.__DoNotUse<([SearchViewModel]), Void> where M1.MatchedType == [SearchViewModel] {
	        let matchers: [Cuckoo.ParameterMatcher<([SearchViewModel])>] = [wrap(matchable: viewModel) { $0 }]
	        return cuckoo_manager.verify("showSuggestions(viewModel: [SearchViewModel])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class FactsViewControllerProtocolStub: FactsViewControllerProtocol {
    

    

    
     func showFacts(viewModel: FactsViewModel)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func showError()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func wantsToShare(url: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func showSuggestions(viewModel: [SearchViewModel])   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: Norris/Networking/NetworkingProtocols.swift at 2020-04-18 18:24:19 +0000

//
//  NetworkingProtocols.swift
//  Norris
//
//  Created by Bárbara Souza on 11/04/20.
//  Copyright © 2020 Bárbara Souza. All rights reserved.

import Cuckoo
@testable import Norris

import Foundation


 class MockHttpRequestProtocol: HttpRequestProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = HttpRequestProtocol
    
     typealias Stubbing = __StubbingProxy_HttpRequestProtocol
     typealias Verification = __VerificationProxy_HttpRequestProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: HttpRequestProtocol?

     func enableDefaultImplementation(_ stub: HttpRequestProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func request<T: Decodable>(_ type: T.Type, from endpoint: Endpoint, completion: ((Result<T, Error>) -> Void)?)  {
        
    return cuckoo_manager.call("request(_: T.Type, from: Endpoint, completion: ((Result<T, Error>) -> Void)?)",
            parameters: (type, endpoint, completion),
            escapingParameters: (type, endpoint, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.request(type, from: endpoint, completion: completion))
        
    }
    

	 struct __StubbingProxy_HttpRequestProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable, T: Decodable>(_ type: M1, from endpoint: M2, completion: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(T.Type, Endpoint, ((Result<T, Error>) -> Void)?)> where M1.MatchedType == T.Type, M2.MatchedType == Endpoint, M3.OptionalMatchedType == ((Result<T, Error>) -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(T.Type, Endpoint, ((Result<T, Error>) -> Void)?)>] = [wrap(matchable: type) { $0.0 }, wrap(matchable: endpoint) { $0.1 }, wrap(matchable: completion) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockHttpRequestProtocol.self, method: "request(_: T.Type, from: Endpoint, completion: ((Result<T, Error>) -> Void)?)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_HttpRequestProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable, T: Decodable>(_ type: M1, from endpoint: M2, completion: M3) -> Cuckoo.__DoNotUse<(T.Type, Endpoint, ((Result<T, Error>) -> Void)?), Void> where M1.MatchedType == T.Type, M2.MatchedType == Endpoint, M3.OptionalMatchedType == ((Result<T, Error>) -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(T.Type, Endpoint, ((Result<T, Error>) -> Void)?)>] = [wrap(matchable: type) { $0.0 }, wrap(matchable: endpoint) { $0.1 }, wrap(matchable: completion) { $0.2 }]
	        return cuckoo_manager.verify("request(_: T.Type, from: Endpoint, completion: ((Result<T, Error>) -> Void)?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class HttpRequestProtocolStub: HttpRequestProtocol {
    

    

    
     func request<T: Decodable>(_ type: T.Type, from endpoint: Endpoint, completion: ((Result<T, Error>) -> Void)?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockEndpoint: Endpoint, Cuckoo.ProtocolMock {
    
     typealias MocksType = Endpoint
    
     typealias Stubbing = __StubbingProxy_Endpoint
     typealias Verification = __VerificationProxy_Endpoint

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: Endpoint?

     func enableDefaultImplementation(_ stub: Endpoint) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var url: String {
        get {
            return cuckoo_manager.getter("url",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.url)
        }
        
    }
    
    
    
     var method: RequestMethod {
        get {
            return cuckoo_manager.getter("method",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.method)
        }
        
    }
    
    
    
     var body: Data? {
        get {
            return cuckoo_manager.getter("body",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.body)
        }
        
    }
    
    
    
     var headers: [String: String] {
        get {
            return cuckoo_manager.getter("headers",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.headers)
        }
        
    }
    

    

    

	 struct __StubbingProxy_Endpoint: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var url: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockEndpoint, String> {
	        return .init(manager: cuckoo_manager, name: "url")
	    }
	    
	    
	    var method: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockEndpoint, RequestMethod> {
	        return .init(manager: cuckoo_manager, name: "method")
	    }
	    
	    
	    var body: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockEndpoint, Data?> {
	        return .init(manager: cuckoo_manager, name: "body")
	    }
	    
	    
	    var headers: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockEndpoint, [String: String]> {
	        return .init(manager: cuckoo_manager, name: "headers")
	    }
	    
	    
	}

	 struct __VerificationProxy_Endpoint: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var url: Cuckoo.VerifyReadOnlyProperty<String> {
	        return .init(manager: cuckoo_manager, name: "url", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var method: Cuckoo.VerifyReadOnlyProperty<RequestMethod> {
	        return .init(manager: cuckoo_manager, name: "method", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var body: Cuckoo.VerifyReadOnlyProperty<Data?> {
	        return .init(manager: cuckoo_manager, name: "body", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var headers: Cuckoo.VerifyReadOnlyProperty<[String: String]> {
	        return .init(manager: cuckoo_manager, name: "headers", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class EndpointStub: Endpoint {
    
    
     var url: String {
        get {
            return DefaultValueRegistry.defaultValue(for: (String).self)
        }
        
    }
    
    
     var method: RequestMethod {
        get {
            return DefaultValueRegistry.defaultValue(for: (RequestMethod).self)
        }
        
    }
    
    
     var body: Data? {
        get {
            return DefaultValueRegistry.defaultValue(for: (Data?).self)
        }
        
    }
    
    
     var headers: [String: String] {
        get {
            return DefaultValueRegistry.defaultValue(for: ([String: String]).self)
        }
        
    }
    

    

    
}



 class MockHttpClientProtocol: HttpClientProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = HttpClientProtocol
    
     typealias Stubbing = __StubbingProxy_HttpClientProtocol
     typealias Verification = __VerificationProxy_HttpClientProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: HttpClientProtocol?

     func enableDefaultImplementation(_ stub: HttpClientProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func request(_ endpoint: Endpoint, completion: ((Result<Data, Error>) -> Void)?)  {
        
    return cuckoo_manager.call("request(_: Endpoint, completion: ((Result<Data, Error>) -> Void)?)",
            parameters: (endpoint, completion),
            escapingParameters: (endpoint, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.request(endpoint, completion: completion))
        
    }
    

	 struct __StubbingProxy_HttpClientProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(_ endpoint: M1, completion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(Endpoint, ((Result<Data, Error>) -> Void)?)> where M1.MatchedType == Endpoint, M2.OptionalMatchedType == ((Result<Data, Error>) -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(Endpoint, ((Result<Data, Error>) -> Void)?)>] = [wrap(matchable: endpoint) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockHttpClientProtocol.self, method: "request(_: Endpoint, completion: ((Result<Data, Error>) -> Void)?)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_HttpClientProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(_ endpoint: M1, completion: M2) -> Cuckoo.__DoNotUse<(Endpoint, ((Result<Data, Error>) -> Void)?), Void> where M1.MatchedType == Endpoint, M2.OptionalMatchedType == ((Result<Data, Error>) -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(Endpoint, ((Result<Data, Error>) -> Void)?)>] = [wrap(matchable: endpoint) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return cuckoo_manager.verify("request(_: Endpoint, completion: ((Result<Data, Error>) -> Void)?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class HttpClientProtocolStub: HttpClientProtocol {
    

    

    
     func request(_ endpoint: Endpoint, completion: ((Result<Data, Error>) -> Void)?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

