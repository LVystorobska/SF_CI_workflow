        
wget https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz
mkdir sfdx-cli
tar xJf sfdx-linux-amd64.tar.xz -C sfdx-cli --strip-components 1
./sfdx-cli/install
echo 'Auth with the DevHub'
sfdx force:auth:sfdxurl:store -f token.txt -a DevHub -d
sfdx force:org:create -f config/project-scratch-def.json -a my-scratch
sfdx force:source:push -u my-scratch
sfdx force:org:list
sfdx force:apex:test:run -u my-scratch --resultformat human
sfdx force:org:delete -u my-scratch --noprompt