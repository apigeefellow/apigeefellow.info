

https://freeloadbalancer.com/load-balancing-layer-4-and-layer-7/

At Layer 4, a load balancer has visibility on network information such as application ports and protocol (TCP/UDP). The load balancer delivers traffic by combining this limited network information with a load balancing algorithm such as round-robin and by calculating the best destination server based on least connections or server response times.

At Layer 7, a load balancer has application awareness and can use this additional application information to make more complex and informed load balancing decisions. With a protocol such as HTTP, a load balancer can uniquely identify client sessions based on cookies and use this information to deliver all a clients requests to the same server. This server persistence using cookies can be based on the server’s cookie or by active cookie injection where a load balancer cookie is inserted into the connection. Free LoadMaster includes cookie injection as one of many methods of ensuring session persistence.

https://en.wikipedia.org/wiki/HAProxy
HAProxy has the following features:

Layer 4 (TCP) and Layer 7 (HTTP) load balancing
URL rewriting
Rate limiting
SSL/TLS termination
Gzip compression
Proxy Protocol support
Health checking
Connection and HTTP message logging
HTTP/2[14]
Multithreading
Hitless Reloads[15]
gRPC Support[16]
Lua and SPOE Support
API Support
Layer 4 Retries
Simplified circuit breaking


https://en.wikipedia.org/wiki/Nginx

Nginx ( /ˌɛndʒɪnˈɛks/ EN-jin-EKS, like "engine X"[8]) (stylized as NGINX or nginx) is a web server which can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache. The software was created by Igor Sysoev and first publicly released in 2004.[9] A company of the same name was founded in 2011 to provide support and Nginx plus paid software.[10]

Nginx is free and open-source software, released under the terms of a BSD-like license. A large fraction of web servers use NGINX,[11] often as a load balancer.[12]

In March 2019, the Nginx company was acquired by F5 Networks for $670 million.[13]

Wikipedia uses Nginx as its SSL termination proxy.

HTTP proxy and Web server features
Ability to handle more than 10,000 simultaneous connections with a low memory footprint (~2.5 MB per 10k inactive HTTP keep-alive connections)
Handling of static files, index files and auto-indexing
Reverse proxy with caching
Load balancing with in-band health checks[26]
TLS/SSL with SNI and OCSP stapling support, via OpenSSL.
FastCGI, SCGI, uWSGI support with caching
gRPC support since March 2018, version 1.13.10.[27]
Name- and IP address-based virtual servers
IPv6-compatible
WebSockets, HTTP/1.1 Upgrade (101 Switching Protocols)[28], HTTP/2 protocol support
URL rewriting and redirection[29][30]
Mail proxy features
TLS/SSL support
STARTTLS support
SMTP, POP3, and IMAP proxy
Authentication using an external HTTP server[31]
Other features include upgrading executable and configuration without client connections loss,[32] and a module-based architecture with both core[33] and third-party module support.[34]

The paid Plus product includes additional features such as advanced load balancing and access to an expanded suite of metrics for performance monitoring.[35][36]


Nginx vs Apache
Nginx was written with an explicit goal of outperforming the Apache web server.[39] Out of the box, serving static files, Nginx uses dramatically less memory than Apache, and can handle roughly four times more requests per second.[40] However, this performance boost comes at a cost of decreased flexibility, such as the ability to override systemwide access settings on a per-file basis (Apache accomplishes this with an .htaccess file, while Nginx has no such feature built in).[41][42]

Nginx also has a reputation of being harder to install and configure than Apache.[43] Formerly, adding third party modules to nginx required recompiling the application from source with the modules statically linked. This was partially overcome in version 1.9.11 on February 2016, with the addition of dynamic module loading.[44] However, the modules still must be compiled at the same time as nginx, and not all modules are compatible with this system—some require the older static linking process.[45]

Nginx is generally considered to run less stable on Windows Server than on Linux, while Apache has equal support for both.[43]

On 11 March 2019, F5 Networks acquired NGINX.[64][65]


https://thenewstack.io/lyfts-envoy-provides-move-monolith-soa/
“When I joined Lyft, people were actively fearful of making service calls, Klein said. They feared that services calls would fail or bring high latency, both of which could slow an application’s performance. Thus was born Envoy.
The proxy architecture provides two key pieces missing in most stacks moving from monolith legacy systems to SOA — robust observability and easy debugging. Having these tools in place allows developers to focus on business logic.

Klein shared the purpose of Envoy: “The network should be transparent to applications. When network and application problems do occur it should be easy to determine the source of the problem.”

A typical system, said Klein, might be using three to five different languages (e.g., Java, Go, Scala, PHP, Python) on different frameworks. In addition, libraries for service calls are per-language. Typically every language has a different library to make the calls and different ways to see the stats and observability out of it.

So over time, an organization can end up with lots of protocols, tons of databases, and different caching layers. And that’s before we get to infrastructure, which can be based on virtual servers, infrastructure services, containers, and load balancers.


What people don’t understand is how all these components come together, Klein explained. At Lyft, developers physically could not understand where the failure was happening. Was it in the app? Did the Amazon Web Services fail? Was there a networking issue? It was impossible to tell.


Not surprisingly, this confusion leads to a lot of pain. Building trust from developers is critical, said Klein, but was nearly impossible in this environment.

Companies know SOA is the future, he explained, but on a day-to-day, rubber-meets-the-road basis, the change is going to create a lot of hurt. And that hurt is mostly about debugging.


The most important point, according to Klein, is that from a distributed-systems standpoint, there are a lot of best practices for things like retries, timeouts, circuit breaking, rate limiting, etc., but in a piecemeal system like this, what often happens is a partial implementation of best practices.


-----------

Graphing, monitoring, analytics using New Relic observability and analytics.

Klein explained that Envoy is primarily a communication bus for large SOA. It handles things like rate limiting, load balancing, circuit breaking, service discovery, and active/passive health checking, etc. As a byproduct of this, it generates a ton of observability data, which could be fed into a system like New Relic for visualization.

Envoy’s advanced load balancing is robust: Retry, timeouts, circuit breaking, rate limiting, shadowing, outlier detection, etc. According to Klein, load balancing is an area that is often missed, either people are not using it or their not using it correctly.


Most importantly, he stressed, Envoy provides best-in-class observability showing statistics, logging, and tracing.


For Envoy, it doesn’t matter which system you are in the system, the mesh just works no matter where the code is running. So whether Lyft developers are writing code on a dev box on their laptop, or in staging, or in scenarios, in production, it just works.


No services in the Lyft stack happen without running through Envoy. From an operations perspective, it just makes sense to use a single software to get fully distributed tracing, logging, and statistics.


Lyft developers questioned why they needed Envoy to do something conceptually simple like retry, but Klein pointed out that retries are one of the best ways to take down your system from exponential overload.

“Nothing,” he said, “is easy in a complex system.”

Envoy is designed from the get-go to treat service discover as lossy. The code assumes that hosts are going to come and go, layer on top both active and passive health checking.


https://thenewstack.io/lyfts-envoy-provides-move-monolith-soa/


Envoy is written in C++ for performance reasons and is an L3/L4 proxy, or byte-oriented proxy. A TCP proxy connections come in, the bytes are operated on pushed back out. This protocol can be used for simple things like a simple HTTP proxy or more complex processes typically managed with MongoDB, Redis, Stunnel, or a TCP rate limiters.

It was written to be HTTP/2 first but it is a fully transparent proxy, Including gRPC and a nifty gRPC HTTP/1.1 bridge. The HTTP L7 filter architecture makes it easy to plug in different functionality.


Deploying Envoy on Your System
Klein suggested that a company deploying Envoy should take small steps. Lyft itself started small and rolled it out incrementally, taking a year to get fully deployed.

He recommends running one thread per core, calling it “embarrassingly parallel.” There is a perception that it’s very wasteful, he explained, but in reality, the use of health checks using plain text calls do not consume a lot of resources. For very, very, very large scale operations, this approach may not be good for active health checking, but for most companies, the usage is not an issue.

Then end result is that developers are able to focus on what they do best — deliver code.

https://newrelic.com/

-----------

https://linkerd.io/2/faq/

What’s the difference between Linkerd 1.x and 2.x?
Linkerd 1.x is built on the “Twitter stack”: Finagle, Netty, Scala, and the JVM.

Linkerd 2.x is built in Rust and Go. It is significantly faster and lighter weight than 1.x, but currently only supports Kubernetes.


Does Linkerd require Kubernetes?
Linkerd 2.x currently requires Kubernetes, though this will change in the future. Linkerd 1.x can be installed on any platform, and supports Kubernetes, DC/OS, Mesos, Consul, and ZooKeeper-based environments.

How it works
Linkerd works by installing a set of ultralight, transparent proxies next to each service instance. These proxies automatically handle all traffic to and from the service. Because they’re transparent, these proxies act as highly instrumented out-of-process network stacks, sending telemetry to, and receiving control signals from, the control plane. This design allows Linkerd to measure and manipulate traffic to and from your service without introducing excessive latency.

In order to be as small, lightweight, and safe as possible, Linkerd’s proxies are written in Rust and specialized for Linkerd. You can learn more about the proxies in the Linkerd proxy repo.

---------------

https://github.com/linkerd/linkerd2-proxy

Transparent, zero-config proxying for HTTP, HTTP/2, and arbitrary TCP protocols.
Automatic Prometheus metrics export for HTTP and TCP traffic;
Transparent, zero-config WebSocket proxying;
Automatic, latency-aware, layer-7 load balancing;
Automatic layer-4 load balancing for non-HTTP traffic;
Automatic TLS (experimental);
An on-demand diagnostic tap API.


This proxy is primarily intended to run on Linux in containerized environments like Kubernetes, though it may also work on other Unix-like systems (like macOS).

The proxy supports service discovery via DNS and the linkerd2 Destination gRPC API.

The Linkerd project is hosted by the Cloud Native Computing Foundation (CNCF).

https://www.slideshare.net/dbryant_uk/oreilly-2017-introduction-to-service-meshes


https://docs.flagger.app/install/flagger-install-on-eks-appmesh
Flagger is a progressive delivery Kubernetes operator

https://www.solo.io/glooe
https://docs.flagger.app/install/flagger-install-with-supergloo

Control planes to Envoy
Ambassador
Gloo
Istio
Consul Connect

