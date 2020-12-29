#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)
    import ClibpcapMacOS
#elseif os(Linux)
    import ClibpcapLinux
#endif

import Foundation

extension SwiftPCAP {
  ///
  /// Class implementing offline packet capture from pcap or pcapng files.
  ///
  /// Uses libpcap through the CPcap wrapper.
  ///
  public class Offline: Base {
    
    ///
    /// Initializer takes the interface name
    ///
    /// - parameter path: The path to the capture file
    ///
    public init(path: String) throws {
      super.init()

      // prepare error buffer for libpcap to use
      let errbuf = UnsafeMutablePointer<Int8>.allocate(capacity: Int(PCAP_ERRBUF_SIZE))
      
      // create the pcap_t handle
      pcapDevice = pcap_open_offline(path, errbuf)
      
      if (pcapDevice == nil) {
        throw Errors.errorMessage(msg: String(cString: errbuf))
      }
    }
  }
}
