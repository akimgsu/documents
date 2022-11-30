## What is network
* Category(size): LAN, WAN, PAN, MAN
* Category(structure): star, mesh, buss, ring, hybrid etc..
* Communication methods: uni, multi, broad cast
* Protocol: https://en.wikipedia.org/wiki/OSI_protocols

|Level|Protocols|
|-----|---------|
|2 | Ethernet |
|3 | ARP, IPv4, ICMP |
|4 | TCP, UDP |

## Model
* Encapsulation: high(7 level) to 1 low(1 level)
* DeCapsulation: low(1 level) to high(7 level)
* structure: [header][payload][footer]
* 2 Level use MAC address

### 2 LEVEL
* MAC address: AA:BB:CC:DD:EE:FF
* Structure: AA:BB:CC is manufacturer and DD:EE:FF is unique# for manufacturer

NAT stands for network address translation. It’s a way to map multiple local private addresses to a public one before transferring the information.

Address Resolution Protocol (ARP) is a protocol or procedure that connects an ever-changing Internet Protocol (IP) address to a fixed physical machine address, also known as a media access control (MAC) address, in a local-area network (LAN). 