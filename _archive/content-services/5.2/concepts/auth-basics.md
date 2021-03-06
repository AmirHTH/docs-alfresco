---
author: [Alfresco Documentation, Alfresco Documentation]
audience: 
category: [Authentication and Security, Authentication, Developer]
keyword: [overview, authentication]
---

# External authentication and SSO

Use this information to understand what we mean by External Authentication and how Single Sign-On \(SSO\) can be used with this authentication type.

## **What is external authentication?**

External authentication uses the Central Authentication Service \(CAS\), which enables Single Sign-On \(SSO\), and allows a user to authenticate with a CAS, instead of directly with Alfresco Content Services. For example, this might be using the `mod_cas` Apache module. For more information about `mod_cas`, see [CAS Apache Module](http://mod-cas.sourceforge.net/).

CAS is usually used with a proxy, for example, the [Apache mod\_proxy](https://httpd.apache.org/docs/current/mod/mod_proxy.html) module.

External authentication is set with the `authentication.chain` parameter in your `alfresco-global.properties` file to use the `external` authentication subsystem.

To provide SSO, an external authentication system \(or CAS\) can be integrated Alfresco Content Services. For example, the identity of the logged-in user is extracted by the CAS, passed to Alfresco Content Services servlets and extracted using the `HttpServletRequest.getRemoteUser()` method. As a result, when a user connects to Share they are shown their user dashboard, but will not see the Share login page.

The subsystem also allows a proxy user to be configured, so that requests made through this proxy user are made in the name of an alternative user, whose name is carried in a configured HTTP request header. This allows, for example, the Alfresco Share application and other Surf applications to act as a client to an SSO-protected Alfresco Content Services application and assert the user name in a secure manner.

A disabled user can still log in to Alfresco using external authentication. If the external control synchronization is configured appropriately, a user's status of disabled can be synchronized via the LDAP directory. In summary, if an administrator wants to prevent a user from authenticating to Alfresco, then the user should be disabled in Alfresco either directly, or in the LDAP directory that is referenced by the ldap.synchronization.userAccountStatusProperty property.

If troubleshooting a user log in issue, first check Alfresco to see if the user account is enabled, and then step through the authentication chain to see if the user can successfully authenticate using one of the members of the chain.

For example, if external authentication is the only authentication system in the chain and auto-create missing people is enabled, then the users will be able to authenticate automatically. In other words, users that are not already synchronized to Alfresco will be auto-created and enabled, by default. If the user is subsequently set to disabled \(either directly via APIs or via LDAP synchronization\), then the user will no longer be able to access Alfresco. The user will also appear as disabled in **Share \> Admin Tools \> Users**.

**Note:** Activating external authentication makes Alfresco Content Services accept external authentication tokens. Make sure that no untrusted direct access to Alfresco Content Services HTTP or AJP ports is allowed.

Here are two scenarios where external authentication is configured with Alfresco Content Services and Share. In both scenarios, an HTTP or HTTPS request is sent to an authentication proxy. If authentication is OK, the proxy passes the request to Share using the AJP protocol.

In the first scenario, the Share [endpoint-url](surf-connectors-endpoints.md) \(http://localhost:8080/alfresco/wcs\) sends the request directly to Alfresco Content Services using HTTP and a User Header. No certificate is used and the `external.authentication.proxyUserName` is blank:

```
external.authentication.proxyUserName=
```

Alfresco Content Services trusts the header \(defined by `external.authentication.proxyHeader`\) sent by Share. This scenario is typically used if you want to prohibit direct access to Alfresco Content Services and enforce using the proxy, for example, by using firewall rules to the proxy.

![A client uses either an HTTP or HTTPS protocol to an authentication proxy.  If authentication is OK,            the proxy passes the request to Share using the AJP protocol.             The Share endpoint-url (http://localhost:8080/alfresco/wcs) sends the request directly to the Alfresco layer using HTTP and a user header.            No certificate is used and the external.authentication.proxyUserName is blank. Alfresco trusts the header (defined by external.authentication.proxyHeader) sent by Share.](../images/external-direct.png)

In the second scenario, the Share [endpoint-url](surf-connectors-endpoints.md) \(http://your.server.com/alfresco/wcs\) sends the request back to Apache, using HTTP and a User Header \(defined by `external.authentication.proxyHeader`\), and a certificate. `external.authentication.proxyUserName` is set:

```
external.authentication.proxyUserName=alfresco-system
```

Apache uses the certificate to check that the request is coming from Share with the correct user \(that is, the value of `external.authentication.proxyUserName`\) and forwards the request to Alfresco Content Services. This scenario is typically used to allow direct access to Share, using HTTPS and the originator \(the proxy\) sends a client certificate when establishing the SSL tunnel.

![A client uses either an HTTP or HTTPS protocol to an authentication proxy.  If authentication is OK,            the proxy passes the request to Share using the AJP protocol.             The Share endpoint-url (http://localhost:8080/alfresco/wcs) sends the request back to           Apache, using HTTP and a User Header (defined by         external.authentication.proxyHeader), and a certificate.         external.authentication.proxyUserName is         set. Apache uses         the certificate to check that the request is coming from Share with the correct user (that         is, the value of external.authentication.proxyUserName and forwards the         request to Alfresco.](../images/external-indirect.png)

[Default authentication chain](auth-subsystem-defaultauth.md) and [Configuring external authentication](auth-external-intro.md) provide more information on the parameter and the external authentication subsystem.

Using the `external` authentication subsystem means that:

-   The complexity of authentication moves to an external software layer \(a proxy\). Alfresco Content Services listens to the authenticated user name that it receives using a custom HTTP header, or it reads the CGI REMOTE\_USER variable that can be passed using the AJP protocol. [Configuring external authentication](../tasks/adminconsole-directorymgt-external.md) provides more information on configuring the `external` authentication subsystem.
-   Most of the responsibility for authentication is not controlled by Alfresco Content Services, but controlled by the external software layer. Unless there is a problem when the authenticated user name is transmitted, the issue is located in the external software layer. In these cases, work with your proxy vendor or implementer of the authentication proxy to resolve the issue.

## How is Single Sign-On \(SSO\) related to external authentication?

SSO is a property of an authentication scheme. You can use more than one method to set up SSO. For example:

-   If you are using Kerberos, you can use either the `kerberos` authentication subsystem, or the `external` authentication subsystem with a proxy that handles Kerberos authentication.
-   If you are using NTLM, you can use either the `alfrescoNtlm` or `passthru` authentication subsystems, or the `external` authentication subsystem with a proxy that handles NTLM authentication.
-   If you are using CAS, you must use the `external` authentication subsystem with a proxy that handles CAS authentication.

In summary, external authentication and SSO are not interdependent: you can set up external authentication that is not SSO \(for example, using an Apache proxy with a `mod_auth_basic` setting\), and you can set up an SSO system that is not using the `external` authentication subsystem \(for example, using the `kerberos` authentication subsystem\).

See [Authentication subsystem types](auth-subsystem-types.md) for a listing of the authentication subsystems and the features that they support.

**Parent topic:**[Configuring external authentication](../concepts/auth-external-intro.md)

