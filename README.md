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

### Dockerfile

Creating a Dockerfile which uses all the dependencies and configurations for deployment.

Step 1: Containerize the Web Application
- Select the base of your image using the **"FROM"** command. The base of this project would be **python:3.8-slim**.
- **"WORKDIR"** will be the working directory and in this case it will be **'/app'**.
- To **copy** the application files you use **"COPY . /app"** as **'.'** is setting as the current directory and **'/app'** as the destination.
- Install Python packages from **requirements.txt** to add the dependencies that is relevant for the task. **Prerequisites** provides the information what is in the the text file.
- The Flask application should be accessed outside the container as Docker needs to listen on a specified port during runtime. We use the **"EXPOSE"** command on port **5000**.
- To complete the image a start-up command is required. **"CMD"** would be used to start up the Flask application. This image will be using **"CMD ["python","app.py"]"** to run the Python file first.

Step 2: Building the Docker Image
- Build the image using **"docker build -t 'name of the image' ."** as I named my image **'devops'**.

Step 3: Run the Container into your Local Machine
- To test the image, use **"docker run -p 5000:5000 'name of the image'"**. This utilises **port 500** from the local machine to the container to access the application from my local development environment.
- Use **"http://127.0.0.1:5000"** in the web browser to test if the information loads up.

Step 4: Push the Image into Docker Hub
- Tag the Docker image with the relevant information using **"docker tag 'name of the image' 'docker-hub-username'/'image-name':'tag'"**.
- Finally, utilise **"docker push 'docker-hub-username'/'image-name':'tag'"** to push it into **Docker hub**.

Please check **Dockerfile** and **requirements.txt** in the main branch for the files.

## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
