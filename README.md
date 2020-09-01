#clone the repository

Make sure you have composer and xampp on your pc

#install vendor files
<code>composer intsall</code>

Copy <b>.env.example</b> file to <b>.env</b> on the root folder. You can type <code>copy .env.example .env</code> if using command prompt on Windows

Change db credentials in <b>.env,</b> file, if you are using xampp with root user, no need to change.

#import the database<br>
Check .sql file in the code and import into your phpmyadmin

#generate keys
<code>php artisan key:generate</code>

#serve the files 
<code>php artisan serve</code>

Site will be served at http://localhost:8000/
