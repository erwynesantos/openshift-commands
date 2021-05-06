# RedHat OpenShift 3.x/4.x Commands
Helpful commands for Openshift 3.x and 4.x

|Description|Command|
|-----------|-------|
|Manual|`oc help`|
|List all pods|`oc get pods --all-namespaces`|
|Running pods|`oc get pods --all-namespaces grep Run`|
|Non-running pods| `oc get pods --all-namespaces grep -v Run`|
|Get logs on the pod under _n=gyro-detection-native-i-9gt4d_ |`oc logs gyro-detection-native-i-9gt4d`|
|Get nodes|`oc get nodes`|
|Get specific pod and its corresponding deployed host node | oc get pods -o wide | grep gyro-detection|
|Deployment config / dc|`oc get dc`|
| |`oc dc gyro-detection -o yaml`|
| |`oc get nodes --show-labels`|
|Go to _sftp server_ project |`oc project mysftp`|
|List pods for _mysftp_ |`oc get pods`|
|Detailed description for _mysftp_ project's pods |`oc get pods -o wide`|
|Go to a pod |(Method 1) - web console|
| |(Method 2) - `oc rsh <pod>`|
|Copy a file to a pod|`oc rsync tmp_files sftp-<pod name>:/tmp`|
|Redeploy|`oc get pods`|
| |`oc delete pod <pod name>`|
|Get services|`oc get svc`|
|Get configmap|`oc get cm`|
|Show configmap of java-app-dir from n=ottoman|`oc get cm java-app-dir -o yaml -n=ottoman`|
|Get oc cronjobs|`oc get cj`|
|OC ssh|`oc rsh <pod>`|
|Go to pod via ssh and then enter bash shell|`oc rsh <pod>`|
|Cronjob|`oc get jobs --all-namespaces`|
|Copy a job|`oc get jo awscli -n aerospike-loader-tmp -o yaml`|
|Create job|`oc create -f job.yaml`|
| |`oc get pods -w` # -w will wait until completed|
|Create a job and do like unix/generic linux/server commands|`vi job.yaml` and edit the sleep to 1000000|
|Create a cronjob|`oc get cj --all-namespaces`|
|Copies a conjob|`oc get cj copy-s3-bucket-cron -n amplify-sms-campaign-prod -o yaml > cronjob.yaml`|
|List cronjobs |`oc get cj` then `vi cronjob.yaml`|
|Create a new cronjob |`oc create -f cronjob.yaml`|
|Edit the created cronjob|`vi cronjob.yaml`|
|Replaces the previous cronjob.yaml |`oc replace -f cronjob.yaml`|
|Giving admin role to a user|`oc project <namespace>`|
| |`oc policy add-role-to-user admin <netid>`|
|Preview roles given to a user|`oc get rolebindings`|
|Removing a given role from a user|`oc policy remove-role-from-user admin <user>`|
| | `oc delete rolebinding admin-0`|
|List node info|`oc get nodes`|
|Check number of nodes|oc get nodes | wc -l
|Detailed node info|`oc get nodes -o wide`|
|List of persistent volume claims, persistent volume is nfs, nas, glusterfs, etc|`oc get pvc`
|Utilization of nodes|`oc adm top nodes`|
|Docker processes|`sudo docker ps`|
|Get the dockerimages|`sudo docker images`|
|Opens the config for the pvc selected and then check the persistent volume name|`oc get pvc <pvc name> -o yaml`
|Check the path pv|`oc get pv <volume name> -o yaml`|
|Go to it and exec command|`oc exec -it <podname> <command such as bash>`|
| |`oc exec -it  <podname> bash/uptime/timedatectl`|
|Enter the pod and then immediately enter bash shell|`oc exec -it <podname> bash`|
|List deployments|`oc get deploymnet`
|List deployment configs|`oc get deploymentconfig`|
|List buildconfigs|`oc get buildconfig`|
|List routes of the pod to the network/internet|`oc get route`|
|Get secret token for pod builder-dockercfg|`oc get secret builder-dockercfg`|
|Decode the secret with base 64|oc get secret builder-dockercfg -o jsonpath="{.data.username}"| base -64|
|List image strings|`oc get is`|
|Giving permission to a group to pull an image|`oc policy add-role-to-group system:image-puller system:serviceaccounts:dynamic-extend-campaign --namespace=custom-images`|
|Making someone admin in Openshift|`oc adm policy add-cluster-role-to-user cluster-admin <userid>`|
|Deleting a pvc|`oc delete <pvc> -n <namespace>`|
|Deleting a pv|`oc delete <pv> -n <namespace>`|

# Notes
* OpenShift is merely an application layer added on top of the running RedHat Enterprise Linux Operatng System
* the expectation here is that one is already familiar with linux terminal commands
* n = namespace
* the sftp server is also running as a container
* oc is PaaS
* oc cronjob is different from generic linux cron
* verify if one is in the correct namespace for giving a role to a user
* role bindings, are also objects, connect the user to another object such as a namespace/role
* persistent vol claim is a persistent volume that is already claimed
* pv and pvcs go hand in hand
* **always** delete pvc first before pv
* **always** create a pv first before pvc
* it = interactive shell
* normally ssh is only if you are going to do any configs
* whenever skeptical, use `--dry-run` at the end of the command for verification

