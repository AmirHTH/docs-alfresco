---
author: [Alfresco Documentation, Alfresco Documentation]
audience: 
category: Customization
option: email server service
---

# OutboundSMTP configuration properties

The following properties can be configured for the OutboundSMTP subsystem type.

The email service is exposed as a spring bean called mailService, which is contained within the OutboundSMTP subsystem.

Configure the Alfresco repository to send emails to an external SMTP server by overriding the default settings. Set the email property overrides in the alfresco-global.properties file.

The following properties can be configured for the OutboundSMTP subsystem type.

-   **mail.host=yourmailhost.com**

    Specifies the host name of the SMTP host, that is, the host name or IP address of the server to which email should be sent.

-   **mail.port=25**

    Specifies the port number on which the SMTP service runs \(the default is 25\). By convention, the TCP port number 25 is reserved for SMTP, but this can be changed by your email administrator.

-   **mail.username=username**

    Specifies the user name of the account that connects to the smtp server.

-   **mail.password=password**

    Specifies the password for the user name used in `mail.username`.

-   **mail.encoding=UTF-8**

    Specifies UTF-8 encoding for email. Set this value to UTF-8 or similar if encoding of email messages is required.

-   **mail.from.default=admin@alfresco.org**

    Specifies the email address from which email notifications are sent. This setting is for emails that are not triggered by a user, for example, feed notification emails. If the current user does not have an email address, this property is used for the `from` field by the `MailActionExecutor`.

-   **mail.from.enabled=false**

    If this property is set to false, then the value set in `mail.from.default` is always used. If this property is set to true, then the `from` field may be changed. This property may be required if your email server security settings insist on matching the `from` field with the authentication details.

-   **mail.protocol=smtp**

    Specifies which protocol to use for sending email. The value can be either smtp or smtps.

-   **mail.header=**

    Optionally specifies the content transfer encoding for the message. If specified the **Content-Transfer-Encoding** is set to the value you specify.


The following properties are for SMTP.

-   **mail.smtp.auth=false**

    Specifies if authentication is required or not. Specifies the use of SMTPS authentication. If true, attempt to authenticate the user using the `AUTH` command. Defaults to false.

-   **mail.smtp.timeout=30000**

    Specifies the timeout in milliseconds for SMTP.

-   **mail.smtp.starttls.enable=false**

    Specifies if the transport layer security needs to be enabled or not. Specifies the use of `STARTTLS` command. If true, enables the use of the `STARTTLS` command to switch the connection to a TLS-protected connection before issuing any login commands. Defaults to false.

-   **mail.smtp.debug=false**

    Specifies if debugging SMTP is required or not.


The following properties are for SMTPS.

-   **mail.smtps.starttls.enable=false**

    Specifies if the transport layer security for smtps needs to be enabled or not.

-   **mail.smtps.auth=false**

    Specifies if authentication for smtps is required or not.


The following properties can be set to define a test message when the subsystem starts.

-   **mail.testmessage.send=false**

    Defines whether or not to send a test message.

-   **mail.testmessage.to=**

    Specifies the recipient of the test message.

-   **mail.testmessage.subject=Outbound SMTP**

    Specifies the message subject of the test message.

-   **mail.testmessage.text=The Outbound SMTP email subsystem is working.**

    Specifies the message body of the test message.


The following property is for setting the email site invitation behavior.

-   **notification.email.siteinvite=false**

    You must set the outbound email configuration for Share invitations to work correctly. This property allows you to control whether or not emails are sent out for site invites. If you have not configured the outbound email properties, set this property to false.


**Parent topic:**[Configuring email](../concepts/email-intro.md)

