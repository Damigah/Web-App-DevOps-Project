# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Technology Stack](#technology-stack)
- [Progression](#progression)
- [License](#license)

## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![Screenshot 2023-08-31 at 15 48 48](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

## Getting Started

### Prerequisites

For the application to succesfully run, you need to install the following packages:

- flask (version 2.2.2)
- pyodbc (version 4.0.39)
- SQLAlchemy (version 2.0.21)
- werkzeug (version 2.2.3)

### Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

## Progression

### **Delivery Date**

A delivery date column was added to the main branch into **app.py** and **orders.html** files by merging branches from **feature/add-delivery-date** into **main**. Within the feature/add-delivery-date I had modified the branch to add the delivery date into both files using Visual Studio Code. After making the changes into the branch, I **git add .**, **git commit -m "message"** and utilised **git push --set-upstream origin feature/add-delivery-date** to set up the branch in my **remote repository** and **git push**. I made a **pull request** from feature/add-delivery-date into main and reviewed the changes. After being satisfied with the changes, I merge the two branches.

It was then not needed to modify the files and had to **revert** the changes back by using **git pull** to fetch the contents in the **remote repository**. I made a feature branch using **git branch revert-delivery-date** from the main branch. I use **git checkout revert-delivery-date** to switch into the branch and used the **git log** command to find the log before merging into main. When the appropiate log was found I used **git revert 23c0b3** to revert the changes and **git push --set-upstream origin revert-delivery-date** and **git push** the changes into my remote repository. I made a pull request and check the changes into the main branch before merging the two branches. I check my main branch to see the changes made.

### **Dockerfile**

Creating a Dockerfile which uses all the dependencies and configurations for deployment.

Step 1: Containerise the Web Application
- Select the base of your image using the **"FROM"** command. The base of this project would be **python:3.8-slim**.
- **"WORKDIR"** will be the working directory and in this case it will be **'/app'**.
- To **copy** the application files you use **"COPY . /app"** as **'.'** is setting as the current directory and **'/app'** as the destination.
- Install Python packages from **requirements.txt** to add the dependencies that is relevant for the task. **Prerequisites** provides the information what is in the the text file.
- The Flask application should be accessed outside the container as Docker needs to listen on a specified port during runtime. We use the **"EXPOSE"** command on port **5000**.
- To complete the image a start-up command is required. **"CMD"** would be used to start up the Flask application. This image will be using **"CMD ["python","app.py"]"** to run the Python file first.

Step 2: Building the Docker Image
- Build the image using **"docker build -t {name of the image} ."** as I named my image **'devops'**.

Step 3: Run the Container into your Local Machine
- To test the image, use **"docker run -p 5000:5000 {name of the image}"**. This utilises **port 500** from the local machine to the container to access the application from my local development environment.
- Use **"http://127.0.0.1:5000"** in the web browser to test if the information loads up.

Step 4: Push the Image into Docker Hub
- Tag the Docker image with the relevant information using **"docker tag {name of the image} {docker-hub-username}/{image-name}:{tag}"**.
- Finally, utilise **"docker push {docker-hub-username}/{image-name}:{tag}"** to push it into **Docker hub**.

Please check **Dockerfile** and **requirements.txt** in the main branch for the files.

### **Terraform**
Terraform will be the foundation for provisioning an Azure Kubernetes Service (AKS) cluster using infrastructure as code (IaC).

**Defining Networking**

Provisioning the network for the AKS cluster is essential to make sure the networking services in Azure functions to your liking. To build the infrastructure it is advisable to use variables, main and outputs terraform files.

1. Variables
 - Resource group: A container that contains the relevant Azure resources to be managed and deployed. 
 - Location: Where the service of the AKS cluster will be located.
 - Vnet address space: A range of virtual addresses that is assigned for the task to communicate with each other within the resource group.

2. Main
 - Azure resource group: A container that contains the relevant Azure resources to be managed and deployed.
 - Virtual Network (VNet): Allows resources to commuicate with eachother.
 - Control Plane Subnet: Manages the resources and clusters such as nodes and pods.
 - Worker Node Subnet: A virtual Machine that processes a portion of an application's workload.
 - Network Security Group (NSG): Security rules that manages inbound and outbound traffic for several types of Azure resources.

3. Outputs
 - vnet_id: An identity of a virtual network.
 - control_plane_subnet_id: Identity of a subnet of a control plane.
 - worker_node_subnet_id: Identity of a subnet for a worker node.
 - networking_resource_group_name: Resource group name for the network aspects of the AKS cluster. 
 - aks_nsg_id: Identity for the network security group.

After configuring the settings, you initalise the directory using **terraform init**. The set up will be on the main branch in the **networking directory**.

**Defining AKS-Cluster**

Provisioning the cluster for the AKS cluster is essential to make sure the Kubernetes services in Azure functions how you want it. To build the infrastructure it is advisable to use variables, main and outputs terraform files.

1. Variables
- aks_cluster_name: The name of the provisioned cluster.
- cluster_location: The location of the cluster being provisioned.
- dns_prefix: It defines the DNS prefix of cluster
- kubernetes_version: The version of the Kubernetes cluster.
- service_principal_client_id: This provides the Client ID for the service principal associated with the cluster.
- service_principal_secret: This will provide the password yo access the cluster.

resource_group_name, vnet_id, control_plane_subnet_id and worker_node_subnet_id are the output variables from the networking module.

2. Main
- azurerm_kubernetes_cluster: You add the variables that will associate with the name, location, resource group name, DNS prefix and the Kubernetes version
- default_node_pool: This is used to configure the cluster in Azure.
- service_principal: It is an identity used for applications, hosted services, and automated tools to access the resources.

3. Outputs
- aks_cluster_name: The name of the provisioned cluster.
- aks_cluster_id: ID of the AKS cluster.
- aks_kubeconfig: The kubernetes configuration file of the cluster. Uses kubectl to interact with and managing the AKS cluster.

After configuring the settings, you initalise the directory using **terraform init**. The set up will be on the main branch in the **aks-cluster directory**.

**Creating the Cluster**
The inputs used to create the cluster.

1. **Networking**
- resource_group_name: "networking-rg"
- location: "UK South"
- vnet_address_space: ["10.0.0.0/16"]

2. **AKS Cluster**
- cluster_name: "terraform-aks-cluster"
- location: "UK South"
- dns_prefix: "myaks-project"
- kubernetes_version: "1.26.6"
- service_principal_client_id: Azure client ID
- service_principal_secret: Azure client secret

resource_group_name, vnet_id, control_plane_subnet_id, worker_node_subnet_id and aks_nsg_id are the output variables from the networking module.

After configuring the settings, you initalise the directory using **terraform init**. The set up will be on the main branch in the **aks-terraform directory**.

**Creating a Service Principal**
A service principal is an identity to use services, applications and automated tools to access Azure resources. Different levels of restricted access are roles assigned by the service principal, which allows control over which resources can be accessed and at which level.

```
az ad sp create-for-rbac --name {name} --role contributor --scopes /subscriptions/{your-subscription-id}
```

### **Kubernetes**
Kubernetes orchestrates containerised applications to automate scaling, software deployment and management. 

**Deployment and Service Manifests**

For the Kubernetes deployment process, a manifest file must be created which in this project is named **application-manifest.yaml**. The **flask-app-deployment** is the name for the resource deployment for managing the containerised web application. The file specified to have 2 replica pods while using the rolling strategy and has labels for pod management. Furthermore, a Service manifest named **flask-app-service** was used for internal communication. TCP protocol on **port 80** with a target port of **5000** is the **same** as the expose port in the container. The service type was set to **ClusterIP** for internal usage within the AKS cluster.

**Deployment Strategy**

**Rolling update** is utilised because when the new pods are ready, they gradually switch with the old pods without any downtime. This allows one pod to deploy while the other becomes temporarily unavailable to maintain high availability. The Rolling Updates strategy aligns with the application's internal nature, enabling updates without disrupting ongoing operations. It guarantees a smooth transition from old to new pods, allowing efficient maintenance and continuous improvement.

**Testing and Validation**

After the application is deployed on the AKS cluster, you test and validate the reliability and the functionality. This involves checking the status of services and pods to confirm exposure is correct within the cluster.
The user access the application by initiating **port forwarding** to a local machine to allow the interaction with the web application at **http://127.0.0.1:5000**. The testing phase focuses on the orders table and the add order functionality of the application to ensure proper display is present and allows an addition of a order. With validating the steps it aims to make sure that the application performs as expected in the AKS environment.

**Distribution and Accessibility**

For the application to be distributed within the organisation **without** depending on port forwarding, the user would utilise a **Load Balancer** to expose the service externally or a **Ingress resource**. This would make the application accessible to other **internal users** securely. For **external access**, users would go through extra security measures such as authentication and authorisation, possibly using tools like **OAuth** (authorisation to another application) or **Azure AD** (Azure Active Directory). Consideration for network policies and secure communication (HTTPS) would be essential to protect the application and its data from potential external threats. Documentation and communication channels would be established to guide users on accessing the application securely.

### **CI/CD Pipelines with Azure DevOps**

**Source Repository Configuration**

The source code for our application is hosted on GitHub and select the repository you want to work with.

**Starter Pipeline Template**

After selecting the repository in GitHub, select the pipeline to initiate using a **Starter Pipeline template** that provides a foundation to add tasks like Docker image and a Kubernetes file.

**Pipeline Trigger**:
- The pipeline is defaulted to automatically execute on each push to the main branch of the application repository i.e main (shown in the image below).

![image](https://github.com/Damigah/Web-App-DevOps-Project/assets/124197859/9669464c-a47a-4bc6-b2e0-1e866386ce91)

**Pipeline Pool**
- This is where the job will run.

![image](https://github.com/Damigah/Web-App-DevOps-Project/assets/124197859/62a1994d-2160-4571-bae4-b13efc9ff9e4)

**Docker Hub Integration**

1. **Service Connection Setup**:
- Generate a personal access token on Docker Hub.
- Configured an Azure DevOps service connection using the Docker Hub personal access token.

2. **Pipeline Docker Image Build and Push**:
- Type in **'Docker'** in the task search bar and select.
- **Container registry**: Select a Docker registry service connection.
- **Repository**: Name of the image on Docker Hub.
- Docker task added to the pipeline with the **'buildandPush'** command.
- Set a path to the Dockerfile on where it is located in the repository. The Dockerfile is located in the **main** branch so it was left as default.
- Add a tag that is relevant to the image e.g **'latest'**.

![image](https://github.com/Damigah/Web-App-DevOps-Project/assets/124197859/9952128e-8fa9-48d5-9658-d1dbfc2bde70)

**AKS Integration**

1. **AKS Service Connection**:
- Established a service connection within Azure DevOps to link the CI/CD pipeline with the AKS cluster securely.

2. **Deploy to Kubernetes Task**:
- Type in **'Kubernetes'** in the task search bar and select.
- Modified the pipeline to include the Deploy to Kubernetes task using the **'deploy'** command.
- **ConnectionType**: 'azureResourceManager' since it was deployed on on AKS (Azure Kubernetes Services).
- **AzureSubscriptionConnection**: choose the subscription you want to use.
- **AzureResourceGroup**: The resource group you want it deployed (must match the resource group in **'main.tf'**).
- **KubernetesCluster**: The name of the cluster (must match the cluster name in **'main.tf'**).
- **Manifests**: Name of the file to deploy with (the file must be in your remote repository).

![image](https://github.com/Damigah/Web-App-DevOps-Project/assets/124197859/f5cc3d91-6409-49e8-a52d-6ad8306a06e0)

**Validation Steps**

1. **CI/CD Pipeline Execution**:
- Successfully ran the CI/CD pipeline to build and push the Docker image from Docker Hub. It was then deploy to the AKS cluster.

2. **Testing the Deployed Cluster** 
- **Monitor** the status of the pod within the AKS cluster.
- **Access** the application initiate port forwarding using **'kubectl'**.
- **Test** the application's functionality locally to ensure it operates correctly in the AKS cluster.

### **AKS Cluster Monitoring and Alert**

The monitoring and alerting setup for the AKS cluster is important when it comes to DevOps pipeline. It makes sure that the cluster operates efficiently and to detect potential issues to be sorted.

**Metrics Explorer Charts**

The charts presents details of how the cluster is behaving.

1. **Average Node CPU Usage**

- This collects data across all CPU node usage in the cluster.
- The cluster in the image below is running normal as there is also spikes of low usage which is fine.

![image](https://github.com/Damigah/Web-App-DevOps-Project/assets/124197859/42a62a11-afc1-41ce-8a78-4c6223e7b2fd)

2. **Average Pod Count**

- It displays the average pod that are being used within the cluster.
- It shows a constant straight line of 16 pods meaning that the pods were **not** scaled in the duration.

![image](https://github.com/Damigah/Web-App-DevOps-Project/assets/124197859/9092c9e2-beca-4498-98ba-938703672ac1)

3. **Used Disk Percentage**

- It shows the disk percentage that is being used.
- The disk on average is being used at 9.5% meaning it is in a **stable** workload.

![image](https://github.com/Damigah/Web-App-DevOps-Project/assets/124197859/a8078898-27dd-4111-8494-c58faa7598ad)

4. **Bytes Read and Written per Second**

- Metrics that measures the amount of data being read from and written to a storage device.
- 'Bytes Read per Second' is constant with a **few** spikes which is minor but as for 'Writen per Second' it **fluctuates** in between a certain limit.

![image](https://github.com/Damigah/Web-App-DevOps-Project/assets/124197859/a9a39e00-ed32-471e-a77c-3f194cc508fb)

**Log Analytics**

Log configurations that are used to analyse the cluster.

1. **Average Node CPU Usage Percentage per Minute**

- This configuration captures data of the CPU usage and identifying the performance of the cluster.
- Shows a consistent pattern, but has one anomaly.

![Screenshot 2024-01-11 004139](https://github.com/Damigah/Web-App-DevOps-Project/assets/124197859/082f503a-566c-4c5e-bda7-9f1d6e029b13)

2. **Average Node Memory Usage Percentage per Minute**

- Collects data of the memory usage of nodes which allows you to detect the performance and efficiently of the resources.
- Illustrates data with minimal differences over time.

![image](https://github.com/Damigah/Web-App-DevOps-Project/assets/124197859/ba97684c-5e4d-4310-83ba-36183794ab8f)

3. **Pods Counts with Phase**

- Provides information on the count of pods with different phases; showing the states that it is in such as Pending, Running, or Terminating.
- The insights into pod lifecycle illustrates the cluster's workload is distributed and consistent.

![image](https://github.com/Damigah/Web-App-DevOps-Project/assets/124197859/190e5d7e-ec5b-4cc1-b3ce-6eacad769b2b)

4. **Find Warning Value in Container Logs**

- Finding warning signals within container logs is crucial in order to detect issues and take reasonable adjustments.
- The image below illustrates the code to finding the problem after running the code.

![image](https://github.com/Damigah/Web-App-DevOps-Project/assets/124197859/9b40aa2c-a30c-43ff-8ba4-3d02da8b32cf)

5. **Monitoring Kubernetes Events**

- Monitoring Kubernetes events, such as pod scheduling, scaling activities, and errors, is important to track the health and stability of the cluster.

![image](https://github.com/Damigah/Web-App-DevOps-Project/assets/124197859/0526073a-c8b8-4d9c-8ede-b87656cd84dd)

- Assisting the chart above, they are caused by the pods being 'Unhealthy' or 'FailedScheduling' after applying the pods using CI/CD Azure DevOps.
  - Minimum that failed: 1
  - Maximum that failed: 8

![image](https://github.com/Damigah/Web-App-DevOps-Project/assets/124197859/c8aef58d-0e6b-4584-8192-681748a29c3f)

A query was saved for each of these logs to be accessed when needed. 

**Alert Configuration**

Alerts had been set up to ensure that you get notified when limits were exceeded to take precautions.

1. **Disk Usage Percentage Alert**

- The alarm gets triggered when the usage exceeds over **90%**.
- Checks every 5 minutes, with a 15-minute loopback.
- Notified through email.

![image](https://github.com/Damigah/Web-App-DevOps-Project/assets/124197859/14f32b57-cd88-4135-ac5e-67588100e4ba)

2. **CPU and Memory Usage Percentage Alerts**

- The alarm gets triggered when the usage exceeds over **80%**.
- This will potentially affect the performance which reduces the application performance.

**Response Strategies to Alarms**

There are numbers of ways to respond to alarms that are triggered. They are:

### Azure Key Vault for Secret Management


```
 az aks update --resource-group <resource-group> --name <aks-cluster-name> --enable-managed-identity
```

```
az aks nodepool upgrade --resource-group <resource-group> --cluster-name <aks-cluster-name> --name <nodepool-name>
```

```
az aks show --resource-group <resource-group> --name <aks-cluster-name> --query identityProfile
```

```
az role assignment create --role "Key Vault Secrets Officer" \
--assignee <managed-identity-client-id> \
--scope subscriptions/{subscription-id}/resourceGroups/{resource-group}/providers/Microsoft.KeyVault/vaults/{key-vault-name}
```

## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
