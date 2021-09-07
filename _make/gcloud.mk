
### GCLOUD


# Unique Project id.
GCLOUD_PROJECT_ID=gedw99-gcloud-test
# Service account JSON file
GCLOUD_SERVICE_ACCOUNT=x.json

## gcloud print, outputs all variables for the gcloud tooling
gcloud-print:
	@echo 
	@echo GCLOUD_PROJECT_ID: 		$(GCLOUD_PROJECT_ID)
	@echo GCLOUD_SERVICE_ACCOUNT: 	$(GCLOUD_SERVICE_ACCOUNT)

## gcloud dep, installs the gcloud tool to your OS.
gcloud-dep:
	# for now just open the web page....
	open https://cloud.google.com/sdk/docs/install
	##or
	open https://cloud.google.com/sdk/docs/downloads-interactive

## gcloud config, outputs various configuration status
gcloud-config:
	@echo 
	@echo configurations
	gcloud config configurations list

	@echo 
	@echo config
	gcloud config list

	@echo 
	@echo projects
	gcloud projects list

	@echo 
	@echo service-accounts
	gcloud iam service-accounts list
	#gcloud beta iam service-accounts list


## gcloud console, open the browser to your project
gcloud-console:
	open https://console.cloud.google.com/home/dashboard?project=$(GCLOUD_PROJECT_ID)

## gcloud proj create, creates a project. MUST be unique.
gcloud-proj-create:
	#gcloud projects create -h
	gcloud projects create $(GCLOUD_PROJECT_ID) --name $(GCLOUD_PROJECT_ID)
gcloud-proj-delete:
	#gcloud projects delete -h
	gcloud projects delete $(GCLOUD_PROJECT_ID)


