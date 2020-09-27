# Delphinium
Java e-commerce software
* * *

* Catalogue
* Shopping cart
* Search
* QnA, Review
* Merchandise registration
* Administration

### See the demo
![main.jsp](../sunn-y.github.com/img/Delp_catal.png)

##### Development environment
* java 1.8
* tomcat v8.5
* oracle v11.0
	
##### Run the application with Tomcat 

1. port번호 변경(8088)
2. context.xml (DB 아이디, 비밀번호 쓰기)
<pre><code>&lt;Resource name="jdbc/myoracle" auth="Container"
              type="javax.sql.DataSource" driverClassName="oracle.jdbc.OracleDriver"
              url="jdbc:oracle:thin:@127.0.0.1:1521:mysid"
              username="scott" password="tiger" maxTotal="20" maxIdle="10"
              maxWaitMillis="-1"/&gt;</code></pre>




### Access the application:
-------------------

* Access the deployed web application at: http://localhost:8090/Delphinium/main.do
* Access the admin section at: http://localhost:8090/Delphinium/loginForm.do
	* username : admin
	* password : delp

The instructions above will let you run the application with default settings and configurations.
Please read the instructions on how to connect to MySQL, configure an email server and configure other subsystems


### Participation:
-------------------

If you have interest in giving feedback or for participating to Shopizer project in any way
Feel to use the contact form <http://www.shopizer.com/contact.html> and share your email address
so we can send an invite to our Slack channel


