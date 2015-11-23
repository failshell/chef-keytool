Cookbook exposing a LWRP to manage Java keystores with the ```keytool``` utility.

# Usage
## General
See the ```test``` recipe for examples.

## Manage by Attributes

```javascript
"keytool" : {
  "keystores" : {
    "custom_jre_keystore" : {
      "keytool" : "/opt/jre/bin/keytool",
      "path" : "/opt/jre/lib/security/cacerts",
      "password" : "changeit",
      "certificates" : {
        "cacert-class3" : "/etc/ssl/certs/cacert-class3.crt"
        "cacert-root" : "/etc/ssl/certs/cacert-root.crt"
      }
    },
    "another_keystore" : {
    }
  },
```


# Author

Author:: Jean-Francois Theroux (<me@failshell.io>)
Author:: Christian Fischer (<chef-cookbooks@computerlyrik.de>)
