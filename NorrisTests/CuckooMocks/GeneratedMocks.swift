// MARK: - Mocks generated from file: Norris/Networking/NetworkingProtocols.swift at 2020-04-12 15:48:07 +0000

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
        
        set {
            cuckoo_manager.setter("headers",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.headers = newValue)
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
	    
	    
	    var headers: Cuckoo.ProtocolToBeStubbedProperty<MockEndpoint, [String: String]> {
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
	    
	    
	    var headers: Cuckoo.VerifyProperty<[String: String]> {
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
        
        set { }
        
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

