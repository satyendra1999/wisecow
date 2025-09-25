# Wisecow on Kubernetes  

## 📝 Project Overview  
This project demonstrates how to **containerize and deploy the Wisecow application** using Docker and Kubernetes.  
We also automated the **CI/CD pipeline with GitHub Actions** to build and push Docker images to DockerHub whenever changes are committed.  

---

## ⚙️ Prerequisites  
Before starting, ensure the following are installed and configured:  
- 🐳 Docker  
- ☸️ Minikube / Kind cluster  
- ⎈ kubectl  
- 🌐 GitHub account  
- 📦 DockerHub account  

---

## 🐳 Dockerization  

1. ## Clone the repository:  
  Link url- git clone https://github.com/satyendra1999/wisecow.git
  cd wisecow

2. ## Build the Docker image

    docker build -t satyendra1999/wisecow:latest .
    
3. ## Push the image to DockerHub:
    docker login:
    docker push satyendra1999/wisecow:latest
✅ At this point, the Wisecow app image is available on DockerHub.

---

4. ## 🤖 CI/CD with GitHub Actions
    A workflow file .github/workflows/ci.yml was created.

    ## This workflow automatically:

     - Builds the Docker image.

     - Pushes it to DockerHub whenever changes are committed to the repository.

     - To verify the workflow run:

     - Push any change to the repository.

Check the Actions tab in GitHub → job should succeed → image updated in DockerHub.

---

5. ## ☸️ Kubernetes Deployment

minikube start
    ## Apply deployment manifest:
        
        kubectl apply -f wisecow-deployment.yml
        kubectl apply -f wisecow-service.yml

5. ## Verify pods and service:
    kubectl get pods
    kubectl get svc

6. ##  Access the application using Minikube:
    minikube service wisecow-service --url

✅ The Wisecow application is now live on your Kubernetes cluster.

*******************************************************************************************
## ✅End Goal Achieved
📦 Containerized the Wisecow app with Docker.

🔄 Automated build & push with GitHub Actions.

☸️ Deployed the application on Kubernetes with service exposure.

🔐 (Challenge goals: TLS & auto-CD were optional and not implemented).
