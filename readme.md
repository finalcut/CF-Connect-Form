This is a simple form that is used to manage MU Alert notifcation contact information within blackboard connect.  It has two library dependancies:

1. FW/1  v 1.x - this is the older version that supports coldfusion 8.  Clone from : git@mugit02.marshall.edu:fw_1_-_version_1_x.git
2. com.blackboard.connect - coldfusion library that provides an interface to the blackboard connect web api.  Clone from git@mugit02.marshall.edu:blackboard_connect_coldfusion_api_.git

In order to get this application to work you have to install both of those aforementioned libraries.  I suggest you create a directory, outside of your web root, called cf-libraries; then create a com/blackboard/connect directory and put the com.blackboard.connect files in that directory.  Likewise create a org/corfield directory and put the framework.cfc file for fw1 in that directory.

Then you'll need to create two Coldfusion Mappings in the CF administrator.  One to /org to your cf-libraries/org directory and another to /com to your cf-libraries/com directory.  Once those two libraries are setup and their mappings exist you should be able to visit your alert system at http://yourwebserver.com/alert (or wherever you put it.)

Note: The app depends on receiving a url argument named ID with a value that is encrypted.  The encrypted value must be a pipe delimited list of four values:
```
	munetid|901number|firstname|lastname
```

If the id value is not provided, it is not encrypted properly, or it doesn't contain the right number or types of arguments the application will not work.
