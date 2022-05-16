# Green Blue Multi-Cluster-Ingress with Terraform

## WIP

This is a POC for deploying green-blue clusters using selected samples from
https://github.com/GoogleCloudPlatform/gke-networking-recipes.git.


The multi-cluster-ingress loadbalances all traffic over a Google-managed 
anycast IP (MCI) which registers regular gke clusters. Traffic to the
green/blue clusters can then be controlled using Istio or MCI commands.

Currently, only prod is populated and the modules/helm directory has not been
helmified, just the raw .yaml for now.

The modules have not been hardened. This step would come after ensuring all the
login flows and networking is working as designed.

## To try it

```
cd prod
terraform init
terraform plan
```

Then follow the instructions in https://github.com/GoogleCloudPlatform/gke-networking-recipes.git
for the basic 
[mci-blue-gree-cluster](https://github.com/GoogleCloudPlatform/gke-networking-recipes/tree/main/ingress/multi-cluster/mci-blue-green-cluster)
to deploy the MCI and sample app. Add in ingress via IAP 
[following 
this](https://github.com/GoogleCloudPlatform/gke-networking-recipes/tree/main/ingress/single-cluster/ingress-iap).

## Remaining steps

* Terraform the modules/helm directory and add module hooks to prod
* Create a vanilla NewtworkPolicy which only allows traffic to the private-api service from IAP-ingress namespace
	* or create an OPA rule for same
* Once testing is complete, add Kustomize to template dev and staging

