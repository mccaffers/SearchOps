// SearchOps Swift Package
// Business logic for SearchOps iOS Application
//
// (c) 2024 Ryan McCaffery
// This code is licensed under MIT license (see LICENSE.txt for details)
// ---------------------------------------

import XCTest
import SwiftyJSON

@testable import SearchOps

@available(iOS 16.0.0, *)

final class ElasticSearch_v8_MappingTests: XCTestCase {

  @MainActor
  override func setUp() {
    // https://www.mongodb.com/docs/atlas/device-sdks/sdk/swift/test-and-debug/
    _ = RealmManager().getRealm(inMemory: true)
  }
  
  @MainActor
  func testMappingElasticv8() async throws {
    
    let response = try! SearchOpsTests().OpenFile(filename: "v8_mapping")
    Request.mockedSession = MockURLSession(response: response)
    let output = await IndexMap.indexMappings(serverDetails: HostDetails(), index: "")
    
    let fieldsCount = output.count
    XCTAssertEqual(output.count, 16)
    
  }
}
