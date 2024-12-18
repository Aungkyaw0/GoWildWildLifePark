# GoWildWildLifePark Management System

## 📋 Overview
GoWildWildLifePark is a web-based management system designed to help wildlife park staff manage various aspects of their operations. Built with Java EE and JSP, this system provides a comprehensive solution for tracking animals, enclosures, keepers, diets, and species information.

## 🚀 Features
- **Animal Management**: Track individual animals with details like name, gender, and arrival year

- **Keeper Management**: Maintain staff records including name, DOB, and rank
- **Enclosure Tracking**: Monitor different types of enclosures and their locations
- **Diet Planning**: Manage different diet types and feeding schedules
- **Species Information**: Record and update species details including conservation status

## 🛠 Technical Stack
- **Backend**: Java EE

- **Frontend**: JSP (JavaServer Pages)
- **Database**: MySQL
- **Server**: Apache Tomcat 8.5
- **Build/Deploy**: Eclipse IDE with Dynamic Web Project

## 🏗 Project Structure
```
GoWildWildLifePark/
├── src/
│ └── main/
│ ├── java/
│ │ └── com/
│ │ └── csm/
│ │ ├── dao/
│ │ ├── entity/
│ │ └── DBManager.java
│ └── webapp/
│ ├── Animal/
│ ├── Diet/
│ ├── Enclosure/
│ ├── Keeper/
│ ├── Species/
│ └── WEB-INF/
```



## 💻 Installation & Setup

1. Clone the repository

2. Import as Dynamic Web Project in Eclipse
3. Configure Apache Tomcat 8.5 server
4. Add MySQL connector JAR to WEB-INF/lib
5. Set up MySQL database
6. Deploy and run on Tomcat server

## 🔧 Dependencies
- Java 1.8

- MySQL Connector Java 8.0.26
- Protobuf Java 3.11.4
- Apache Tomcat 8.5

## 🌟 Key Features Breakdown

- **CRUD Operations**: Full support for Create, Read, Update, Delete operations

- **Relational Data Management**: Interconnected management of all park entities
- **User-Friendly Interface**: Simple and intuitive web interface
- **Error Handling**: Robust exception handling for database operations
- **Data Validation**: Input validation for data integrity

## 🔒 Security Considerations
- SQL injection prevention through prepared statements

- Error handling with appropriate user feedback
- Session management for secure operations

## 🤝 Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License
This project is part of a computer science course and is intended for educational purposes.

## Author

Originally developed by Aung Kyaw Thu (Aungkyaw0) (16.08.23)


---
*Note: This is an educational project developed as part of a computer science course curriculum.*