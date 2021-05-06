# Common commands in OpenShift
# Manual
oc help

# List all containers/pods
oc get pods --all-namespaces| less

# Running containers/pods
oc get pods --all-namespaces| grep Run | wc -l

# Non-running containers/pods
oc get pods --all-namespaces|grep -v Run | 

# Get logs on 
oc logs gyro-detection-native-i-9gt4d

# Get nodes
oc get nodes
Note: all pods are spread across all available nodes

# Get pods and know which node they are deployed to
oc get pods -o wide | grep gyro-detection

Note: master nodes are only for maintaining the cluster
Note: Infra 1 and 2 nodes only for docker registry and router

# DC - deployment config
oc get dc
oc dc gyro-detection -o yaml|less
oc get nodes --show-labels

# Go to sftp server project # this sftp is running as a container
oc project mysftp
ls
oc get pods
oc get pods -o wide

# Go to a pod 
(Method 1) - UI
(Method 2) - oc rsh

# Copy a file to a pod
oc rsync tmp_files sftp-<pod name>:/tmp

# Redeploy
oc rollout latest dc/sftp

# Delete a pod
oc get pods
oc delete pod <pod name>

# Get services
oc get svc

# Get
oc get cm

# Get oc cronjobs
oc get cj

# OC ssh
oc rsh <pod>

# Cronjob
oc get jobs --all-namespaces|head

# Copy a job
oc get jo awscli -n aerospike-loader-tmp -o yaml

# Create job
oc create -f job.yaml
oc get pods -w # -w will wait until completed

# Create a job and do command line stuff like unix/generic linux/server
vi job.yaml and edit the sleep to 100000000000000000

# create a cronjob
oc get cj --all-namespaces|head
oc get cj copy-s3-bucket-cron -n amplify-sms-campaign-prod -o yaml > cronjob.yaml #copy a conjob
oc get cj 
vi cronjob.yaml
oc create -f cronjob.yaml
vi cronjob.yaml
oc replace -f cronjob.yaml # replcace the previous cronjob.yaml

Note: OC is PaaS
Note: cronjob is different from cron
#-------------------------------------------------------------------------------------------------------------------------------------

01-March-2021

# Admin link
url: https://master.aim-prod.edo.globetel.com/

# Giving admin role to a user
oc projects| grep <project name>
./useradd.sh <usernmae> <project name>
oc policy add-role-to-user admin <netid>

# Preview roles given to a user
oc get rolebindings # role bindings (also an object) connect the user to the object

# Removing a given role from a user
oc policy remove-role-from-user admin <user> 
oc delete rolebinding admin-0

# Check how many nodes
oc get nodes | wc -l 
Note: compute 1,2,3 and log1,2,3 lng ginagamit, other are internal to openshift, it is there to support running the gluster

oc project blaster-unplanned-wriline-campaing

# Get list of persistent volume claims, persistent volume is nfs, nas, glusterfs, etc
oc get pvc 
Note: persistent vol claim is a persistent volume that is already claimed

# Opens the config for the pvc selected and then check the persistent volume name
oc get pvc <pvc name> -o yaml 

# Check the path pv
oc get pv <volume name> -o yaml # to check the path pv

# Checks where it is mounted for 6 to 11 pods 
for i in $(seq 6 11); do ssh sudo ocp$1 sudo mount 2>/dev/null; done | grep dpa_prod 
#-------------------------------------------------------------------------------------------------------------------------------------

09-March-2021

ps -ef | egrep "manager|kublet|api|service-catalog"
oc namespace ottoman
oc get configmap 
oc get cm java-app-dir -o yaml # cm is shortcut for configmap
sudo docker ps | less # docker processes
sudo docker images # get the images
oc get nodes # get the nodes info
oc get nodes -o wide # more detailed nodes info 

OVS node is the software-defined network, known issue to always crash

oc adm top nodes # get util of nodes
oc get pods # get the pods
oc get pods -o wide # get more detailed info for pods

oc exec -it <podname> <command such as bash> # go to the terminal (if a terminal is available), it = interactive (optional)
oc exec     <podname> bash/uptime/timedatectl # execute a command inside the pod without pulling the shell terminal
oc exec -it <podname> bash # enter the pod and then immediately enter bash shell
oc rsh <podname> # go to the pod via ssh and then enter bash shell

Note: normally ssh is only if you are going to do any configs

oc get deploymnet 
co get deploymentconfig

oc get buildconfig # 
oc get route #

oc get secret builder-dockercfg
 
oc get secret builder-dockercfg -o jsonpath="{.data.username}"| base -64 # the dockercfg is encrypted, decode it by


#-------------------------------------------------------------------------------------------------------------------------------------
    
prod1: 10.69.165.135
User: ztro0132-s1ap-augmented-stg-v2
oc login https://master.aim-prod.edo.globetel.com
oc projects 
oc project s1ap-augmented-stg-v2
mkdir slap-augmented-stg-v2
ls
oc get is # is - image string
oc get is --no-headers
oc get is --no-headers | awk '{print $1}'

# Loop to check strings
for is in $(oc get is --no-headers | awk '{print $1}')
do
  echo $is
done

# Loop is to get all the yaml according with this specific name
for is in $(oc get is --no-headers | awk '{print $1}')
do
  oc get is $is -o yaml > $is-is.yaml
done

ls
vi custom_quarkus-s2i-is.yaml

# Now for all the other yaml
Delete all lines from annotations to "app:prometheus" (also del app:prometheus)
Delete all the lines under "type: Source"

oc get bc # bc - buildconfig
oc get bc s1ap-native
oc get bc s1ap-native -o yaml > s1ap-native-bc.yaml
vi s1ap-native-bc.yaml

Note: In short, delete everything in the metadata, only leave the name
Last row (shift g), remove the status 
:wq

oc get dc # deploymentconfig
oc get dc s1ap-native -o yaml > s1ap-native-dc.yaml # -o means output
# Same thing with bc, remove everything in the metadata except the name and delete the status: entry also
# Additionally delete the trigger also for dc (deploymentconfig)

# Giving permission to a group to pull an image
oc policy add-role-to-group system:image-puller system:serviceaccounts:dynamic-extend-campaign --namespace=custom-images

# Making someone admin in Openshift
oc adm policy add-cluster-role-to-user cluster-admin zx013524
oc adm policy add-cluster-role-to-user cluster-admin zx013202

# Deleting pvc
oc get pvc | grep efs-read
oc delete pvc efs-read-esp17 -n seamless-prepaid-activation-stg --dry-run
oc delete pvc efs-read-esp17 -n seamless-prepaid-activation-stg
oc delete pvc efs-read-esp19 -n seamless-prepaid-activation-stg
oc delete pvc efs-read-esp20 -n seamless-prepaid-activation-stg
