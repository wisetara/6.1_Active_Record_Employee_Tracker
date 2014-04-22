6.1_Active_Record
=================

Active Record practice - epicodus projects - in-progress
Employee tracker
Let's build an app for a company to help track what its employees are working on. Here are the features to build:

Let users add and list employees.
Let users create divisions in the company and add employees to a division. In this company, an employee only belongs to one division (there is a one-to-many relationship between employees and divisions). Let users list out divisions, and then choose a division to see what employees are in it.
Let users add and list projects, and assign projects to employees. For now, assume that a project has only one employee working on it, but that an employee should be able to track the history of the projects they've worked on or are currently working on. (Again, this is a one-to-many relationship.)
Now, the company has gotten more collaborative - multiple employees can work on the same project. For this many-to-many relationship, read the Rails guide on the has_and_belongs_to_many association. In their example, the code t.belongs_to :assembly is equivalent to t.column :assembly_id, :integer. They also gloss over the need to name your join table in alphabetic order, e.g. kittens_people not people_kittens. To add a new project to what an employee is working on, run something like employee.projects << project1.To see what employees are working on a project, you'll run something like project.employees. Active Record will automatically work through the join table for you!
The company wants to start tracking what each employee contributed to a project. Read the Rails guide on has_many :through and use it instead of has_and_belongs_to_many. Make sure that the company can provide a description of each employee's contribution to the project.
Let the company choose a division and list out all of the projects its employees have worked on. Do this with a single line of Active Record methods.
Now the company wants to run reports on which projects employees have worked on at various time. Let the company add start and end dates to projects, then choose an employee and a date range and see which projects they worked on during that time.
