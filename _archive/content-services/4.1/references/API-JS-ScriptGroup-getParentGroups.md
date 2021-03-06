---
author: [Alfresco Documentation, Alfresco Documentation]
source: JavaScript API
audience: 
category: JS API
option: getParentGroups
---

# `getParentGroups`

`getParentGroups()` these methods return the immediate parent groups of this group.

**Parent topic:**[ScriptGroup object](../references/API-JS-ScriptGroup.md)

## `getParentGroups(maxItems, skipCount)`

`getParentGroups(maxItems, skipCount)` this method returns immediate parent groups of this group.

### Parameters

-   **maxItems**

    An integer representing the maximum number of results to return. If set to -1 all results will be returned.

-   **skipCount**

    An integer representing the number of results to skip.


### Returns

An array of `ScriptGroup` objects.

### Example

```

    var shortName = "MY_SUB_SUB_GROUP";
    var group = groups.getGroup(shortName);

    // now find immediate parent groups
    var maxItems = -1;
    var skipCount = 0;
    model.parentGroups = group.getParentGroups(maxItems, skipCount);
        
```

## `getParentGroups(paging, sortBy)`

`getParentGroups(paging, sortBy)` this method returns the immediate parent groups of this group.

### Parameters

-   **paging**

    A `ScriptPagingDetails` object.

-   **sortBy**

    The property by which to sort the results, for example `displayName`.


### Returns

An array of `ScriptGroup` objects.

### Example

```

    var shortName = "MY_SUB_SUB_GROUP";
    var group = groups.getGroup(shortName);

    // now find immediate parent groups
    var paging = utils.createPaging(-1, 0);
    var sortBy = "displayName";
    model.parentGroups = group.getParentGroups(paging, sortBy);
        
```

