({
    provideSearchAction : function(component) {
        var accountNameVal = component.get("v.accountName");
        var action = component.get("c.retrieveAccountDataByName");
        action.setParams({ input : accountNameVal });
        action.setCallback(this, function(a) {
            component.set("v.accounts", a.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})
