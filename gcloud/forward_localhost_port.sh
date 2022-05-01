You can use Local Port Forwarding when you ssh into the target instance hosted in GCP.

Local port forwarding lets you connect from your local machine to another server. To use local port forwarding, you need to know your destination server, source port and target port.

You should already know your destination server. The target port must be the one on which your flask app is listening. The source port can be any port that is not in use on your local computer.


Assuming flask app is listening on port 8080 on the GCP instance and you want to make the app available in your local computer on port 9876, ssh into your GCP instance using the following command:

ssh -L 9876:127.0.0.1:8080 <username>@<gcpInstanceIP>