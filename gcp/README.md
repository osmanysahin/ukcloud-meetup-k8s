


  

**Enabling services**

gcloud services enable compute.googleapis.com

gcloud services enable servicenetworking.googleapis.com

gcloud services enable cloudresourcemanager.googleapis.com

gcloud services enable container.googleapis.com

  

**create service account**

gcloud iam service-accounts create terraform-gke

  

**create roles**

gcloud projects add-iam-policy-binding gke-meetup --member serviceAccount:terraform-gke@gke-meetup.iam.gserviceaccount.com --role roles/container.admin

gcloud projects add-iam-policy-binding gke-meetup --member serviceAccount:terraform-gke@gke-meetup.iam.gserviceaccount.com --role roles/compute.admin

gcloud projects add-iam-policy-binding gke-meetup --member serviceAccount:terraform-gke@gke-meetup.iam.gserviceaccount.com --role roles/iam.serviceAccountUser

gcloud projects add-iam-policy-binding gke-meetup --member serviceAccount:terraform-gke@gke-meetup.iam.gserviceaccount.com --role roles/resourcemanager.projectIamAdmin

  
  

**create json file for terraform use it locally**

gcloud iam service-accounts keys create terraform-gke-keyfile.json --iam-account=terraform-gke@gke-meetup.iam.gserviceaccount.com

  0

**
bucket name:meetup-terraform-state
region: europe-west2
service account: terraform-gke
project: gke-meetup
**

  

**create the bucket for the state file**

gsutil mb -p gke-meetup -c regional -l europe-west2 gs://meetup-terraform-state/


  

**create versioning for deletion**

gsutil versioning set on gs://meetup-terraform-state/

  

**grant write/read permissions on the bucket for the service account**

gsutil iam ch serviceAccount:terraform-gke@gke-meetup.iam.gserviceaccount.com:legacyBucketWriter gs://meetup-terraform-state/


**connect to the cluster**
gcloud container clusters get-credentials gke --zone europe-west2-a --project gke-meetup

# deploy the yaml file
kubectl apply -f hello-kubernetes.yaml

# get services 
kubectl get services