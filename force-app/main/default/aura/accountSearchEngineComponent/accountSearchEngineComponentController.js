({
    provideSearchAction : function(component, event) {
        var accountNameVal = component.get("v.accountName");
        component.set('v.mycolumns', [
            {label: 'Account Name', fieldName: 'AccountName', type: 'url',
            typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}},
                {label: 'Phone', fieldName: 'Phone', type: 'Phone'},
            	{label: 'Description', fieldName: 'Description', type: 'text'},
            	{label: 'Industry', fieldName: 'Industry', type: 'text'},
                {label: 'Rating', fieldName: 'Rating', type: 'text '}
            ]);
        var action = component.get("c.retrieveAccountDataByName");
        action.setParams({ input : accountNameVal });
        action.setCallback(this, function(res) {
            var records = res.getReturnValue();
                  records.forEach(function(record){
                    record['AccountName'] = '/lightning/r/Case/' + record['Id'] + '/view';
                });
            component.set("v.accounts", res.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})