# Web Project #Delphinium
Java e-commerce software
* Catalogue
* Shopping cart
* Search
* QnA, Review
* Merchandise registration
* Administration
* * *
### See the views
![main.jsp](https://github.com/Sunn-y/sunn-y.github.com/blob/master/img/Delp_main.png)
![catalogue.jsp](https://github.com/Sunn-y/sunn-y.github.com/blob/master/img/Delp_catal.png)
* * *
### Development environment
* Java v1.8 +
* Apache-Tomcat v8.5
* Oracle 11g XE 11.2
* * *	
### Run the application with Tomcat 
1. Change port number of Tomcat server: 8090
2. Add code on *context.xml*(username, password of your DB)
<pre><code>&lt;Resource name="jdbc/myoracle" auth="Container"
              type="javax.sql.DataSource" driverClassName="oracle.jdbc.OracleDriver"
              url="jdbc:oracle:thin:@127.0.0.1:1521:mysid"
              username="scott" password="tiger" maxTotal="20" maxIdle="10"
              maxWaitMillis="-1"/&gt;</code></pre>     
* * *
### Access the application:
##### ※ Run *delphinium/dto/total.sql* ------> All data is sample data from real websites.
* Access the deployed web application at: http://localhost:8090/Delphinium/main.do
* Access the admin section at: http://localhost:8090/Delphinium/loginForm.do
	* username : admin
	* password : delp
