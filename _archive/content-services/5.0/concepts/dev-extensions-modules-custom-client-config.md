---
author: Alfresco Documentation
---

# Adding custom client configuration

Custom web client configuration can be included by using a module context.

Add a bean defintion to module-context.xml:

```

  
    <bean id="myModule_configBootstrap" class="org.alfresco.web.config.WebClientConfigBootstrap" init-method="init">
      <property name="configs">
        <list>
          <value>classpath:alfresco/module/myModuleId/my-web-client-custom.xml</value>
        </list>
      </property>
    </bean>
    

```

**Note:** Since 3.3 SP2 config files loaded by the org.alfresco.web.config.WebClientConfigBootstrap and org.springframework.extensions.config.ConfigBootstrap Spring beans are applied in a deterministic order. The beans are now processed in alphabetical order using the bean ID as the key.

**Parent topic:**[Modules \(AMPs\)](../concepts/dev-extensions-modules-intro.md)

