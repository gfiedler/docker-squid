Feature: dockerized squid proxy

  Szenario: squid proxy is working
    Given a running docker container with open squid port
      And the environment is configured to use this port as http proxy port
     When we access a web page
     Then we get the content of this web page

