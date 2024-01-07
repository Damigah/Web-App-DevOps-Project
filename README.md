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

### Delivery Date

A delivery date column was added to the main branch into **app.py** and **orders.html** files by merging branches from **feature/add-delivery-date** into **main**. Within the feature/add-delivery-date I had modified the branch to add the delivery date into both files using Visual Studio Code. After making the changes into the branch, I **git add .**, **git commit -m "message"** and utilised **git push --set-upstream origin feature/add-delivery-date** to set up the branch in my **remote repository** and **git push**. I made a **pull request** from feature/add-delivery-date into main and reviewed the changes. After being satisfied with the changes, I merge the two branches.

It was then not needed to modify the files and had to **revert** the changes back by using **git pull** to fetch the contents in the **remote repository**. I made a feature branch using **git branch revert-delivery-date** from the main branch. I use **git checkout revert-delivery-date** to switch into the branch and used the **git log** command to find the log before merging into main. When the appropiate log was found I used **git revert 23c0b3** to revert the changes and **git push --set-upstream origin revert-delivery-date** and **git push** the changes into my remote repository. I made a pull request and check the changes into the main branch before merging the two branches. I check my main branch to see the changes made.

### **Dockerfile**

Creating a Dockerfile which uses all the dependencies and configurations for deployment.

Step 1: Containerize the Web Application
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
- resource_group_name: "netowrking-rg"
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



## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
