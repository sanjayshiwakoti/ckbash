**CK Automation**  
To Automate the pushing in git branch

**Install**  
Copy and configure as per your project location in .bashrc file

```
export PATH_CK_CENTRAL=path-to-ck/ck-central  
export PATH_CK_CENTRAL_CLIENT=path-to-ck/ck-central-client  
export PATH_CK_CENTRAL_SERVICE=path-to-ck/ck-central-service  
export PATH_CK_CUSTOMER=path-to-ck/ck-customer  
export PATH_CK_DISCOVERER=path-to-ck/ck-discoverer  
export PATH_CK_DISCOVERY_CLIENT=path-to-ck/ck-discovery-client  
export PATH_CK_DISCOVERY_SERVICE=path-to-ck/ck-discovery-service  
export PATH_CK_DOCUMENTDB=path-to-ck/ck-documentdb  
export PATH_CK_PRODUCT=path-to-ck/ck-product  
export PATH_CK_CENTRAL_B2C=path-to-ck/ck-central-client-b2c
```  

**Usage**  
* To pull all the repositories  
`./ck.sh pull`
* To tag the repositories  
`./ck.sh tag v[Version]`
* To Push the repositories  
`./ck.sh tag v[Version]`


