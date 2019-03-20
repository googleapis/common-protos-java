## Google Common Protos Java

[![release level](https://img.shields.io/badge/release%20level-general%20availability%20%28GA%29-brightgreen.svg?style&#x3D;flat)](https://cloud.google.com/terms/launch-stages)

[//]: # ( TODO: Build status icon.)
This repository is a home for the [protocol buffer][protobuf] types which are
common dependencies throughout the Google API ecosystem, generated for Java.
The protobuf definitions for these generated Java classes are provided in the
[googleapis][googleapis] repository.

Quickstart
----------

[//]: # ({x-version-update-start:common-protos-java:released})
If you are using Maven, add this to your pom.xml file
```xml
  <dependencyManagement>
    <dependencies>
      <dependency>
        <groupId>com.google.api.grpc</groupId>
        <artifactId>proto-google-common-protos</artifactId>
        <version>1.15.0</version>
       </dependency>

       <dependency>
         <groupId>com.google.api.grpc</groupId>
         <artifactId>grpc-google-common-protos</artifactId>
         <version>1.15.0</version>
       </dependency>
        ...
    </dependencies>
  </dependencyManagement>
```
[//]: # ({x-version-update-end})

[//]: # ({x-version-update-start:common-protos-java:released})
If you are using Gradle, add this to your dependencies
```Groovy
compile 'com.google.api.grpc:proto-google-common-protos:1.15.0'
compile 'com.google.api.grpc:grpc-google-common-protos:1.15.0'
```
If you are using SBT, add this to your dependencies
```Scala
libraryDependencies += "com.google.api.grpc" % "proto-google-common-protos" % "1.15.0"
libraryDependencies += "com.google.api.grpc" % "grpc-google-common-protos" % "1.15.0"
```
[//]: # ({x-version-update-end})

## License

These classes are licensed using the Apache 2.0 software license, a
permissive, copyfree license. You are free to use them in your applications
provided the license terms are honored.

  [api-style]: https://cloud.google.com/apis/design/
  [protobuf]: https://developers.google.com/protocol-buffers/
  [googleapis]: https://github.com/googleapis/googleapis/
  [proto-google-common-protos]: https://repo1.maven.org/maven2/com/google/api/grpc/proto-google-common-protos/
  [grpc-google-common-protos]: https://repo1.maven.org/maven2/com/google/api/grpc/grpc-google-common-protos/