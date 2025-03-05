# SonarQube Setup & Terraform Project Analysis

This guide explains how to set up **SonarQube** on a local machine and analyze a **Terraform directory** for code quality and security checks.

## 🚀 1. Install & Run SonarQube
### **Method 1: Using Docker (Recommended)**
```sh
docker run -d --name sonarqube \  
  -p 9000:9000 \  
  -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true \  
  sonarqube:lts-community
```
🔹 This runs SonarQube on **http://localhost:9000/**.  
🔹 Login with **admin / admin**.

### **Method 2: Manual Installation (Without Docker)**
1. Install **Java 17** from [Adoptium](https://adoptium.net/).
2. Download **SonarQube Community Edition** from [here](https://www.sonarqube.org/downloads/).
3. Extract the ZIP file and navigate to `bin/windows-x86-64/`.
4. Run:
   ```sh
   StartSonar.bat
   ```
5. Open **http://localhost:9000/** and log in.

## 🚀 2. Install SonarScanner
1. Download **SonarScanner** from [here](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/).
2. Extract it and add the **`bin` folder** to your system **PATH**.
3. Verify installation:
   ```sh
   sonar-scanner -h
   ```

## 🚀 3. Analyze a Terraform Directory
1. Navigate to your Terraform project folder:
   ```sh
   cd /path/to/terraform-project
   ```
2. Run SonarScanner:
   ```sh
   sonar-scanner -Dsonar.projectKey=terraform-project \  
     -Dsonar.sources=. \  
     -Dsonar.host.url=http://localhost:9000 \  
     -Dsonar.login=admin \  
     -Dsonar.password=admin
   ```

## 🚀 4. View Results in SonarQube
- Open **http://localhost:9000/projects**.
- Click on the **Terraform project**.
- Review **code quality, security vulnerabilities, and best practices**.

## 🎯 Notes
- By default, SonarQube **does not deeply analyze `.tf` files**.
- Use additional tools like **Checkov, TfLint, or SonarTerraform Plugin** for better Terraform analysis.
- Can be integrated with **Jenkins, GitHub Actions, and GitLab CI/CD** for automated scanning.

## ✅ Next Steps
Want to set up **Terraform + SonarQube in CI/CD**? Explore advanced configurations and plugins!

---
📌 **Author:** Karthik Jetling  
📌 **GitHub:** [CodeByKarthik](https://github.com/CodeByKarthik)
