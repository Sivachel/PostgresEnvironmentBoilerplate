# Student Register 

We were tasked as a group to collaboratively develop a web application for a client within the span of a week. This web application was created to allow the user, in this case a teacher, the ability to record the attendance of students across any number of classes, as well as the ability to add student data to the database and view or edit any previous attendance records.


### Requirements and Components
* Displaying student, group and attendance details
* Adding, updating and deleting details to these fields
* SQL Database that holds data for these fields
* Protection against exploits such as SQL injection

### Methodology

For this project, we implemented an Agile work methodology to provide rapid and continuous delivery of a working product. This methodology also allowed us to create a work enviroment where communication within the team was made simple and meaningful. To ensure that the project was consistently up to date, we used Github to allow each developer to work on their own branch, keeping conflicting updates to a minimum and ensuring that each developer worked on the latest version of the product. At the end of every sprint, the current updated and working solution would be pushed to the master branch.

## Design

***Student Form***

|Student ID	|  First Name	| Last name	|       
|---			|---			|---			|
|   			|   			|   			|      


***Show Attendance Form***

|Student ID|First Name|Last Name|Status|Date|Comments|
|---		 |---		  |---		  |---	   |--- |---     |
|   		 |   		  |   		  | 	   |    |        |

***Groups Form***

|Group ID		|  Group Name	|     
|---			|---			|
|   			|   			|

***Folder Structure***

	--Register
		--controllers
		--models
		--public
			--css
			--images
		--views
			--partials
			--register
			
![Imgur](https://i.imgur.com/QX3pJqa.png)

### Tools used

1. Ruby (Sinatara, Rack, PG, Racker)
2. HTML and CSS
3. Model View Controller
4. SQL PostGreSQL 11
4. Atom


### ***Task Diary***

| Day                                                                         | Task| Completed? |  
|------------------------------------------------------------------------------|-----------|--------------------|
|28th January 2019                                                        | Create a folder structure and template in Atom, set up Github repository and ensure branches for each component are made.       |        Yes          |  
|29th January 2019                                                   | Set up all basic functionality of all forms and push a working product to the master branch. The teacher(user) should be able to add, delete and edit student attendance information and this information should be displayed in a table. Implement Faker gem to create sample data for testing the limitations of data entry(found bug with apostrophes), add styling to the pages. Achieve the minimum viable product by the end of the day.       | Yes                    |   
|30th January 2019       | Attendance page functionality, navigation bar, fix folder structure, improve styling on all pages and general bug fixing. Start development on a search bar to allow the user to search for students.      |       Yes             |   
| 31st Janaury 2019      | Finish search bar functionality and create ability to sort columns by first name, last name and ID. Continue bug fixing and implement some small css fixes.         |  Yes    |   
| 1st February 2019      | Complete all functionality, add additional fixes to the styling, include Edit Groups page, fix headers, delete groups and add link to groups to individual stuents.       |  Yes    |   


### ***User Guide***

* From the home page, you can click on a group name or group ID, which will take you to that group's page. Displayed here are all the students within that Group.

* Click on a student name or ID to display their profile, which should display their name and bio, as well as a table of their attendance information. From this page, you can create a new attendance entry for this student, as well as edit the current student's information. 

* Clicking Home or the logo in the navigation bar will take you back to the home page.

* Clicking Add New Student will take you to a form where you can add a new student to the database. In this form, parameters for the student's first name, last name, group ID and bio are available to edit before adding the student.

* Type in the name of a student or their student ID into the search bar and press enter to locate a student. This will take you to a page that displays all possible students that fit the search parameters you have entered. From here, you can click any student to take you to their profile page.

### Development Team

* Louis Puchowski (Manager)
* Ashley Whitehouse 
* Zac Harrison 
* Aymen Jeewa 
* Yinka Merit 
* Thomas Shirley
* Jozef Mclaughlin 
* Abdullah Jalil
