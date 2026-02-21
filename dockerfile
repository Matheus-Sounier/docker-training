# The FROM command in a Dockerfile is used to specify the base image for the container. In this case, we are using the "node:25-alpine3.22" image, which is a lightweight version of Node.js based on Alpine Linux. This image includes the necessary runtime environment for running Node.js applications, and it is optimized for performance and security. By using a specific version of Node.js, we can ensure that our application will run consistently across different environments and avoid compatibility issues.
FROM node:25-alpine3.22

# The RUN command in a Dockerfile is used to execute a command in the container during the build process. In this case, we are using the RUN command to create a new user and group called "app". The "addgroup" command is used to create a new group, and the "adduser" command is used to create a new user and add it to the specified group. By creating a non-root user, we can improve the security of our application by limiting the permissions of the user that runs the application. This helps to prevent potential security vulnerabilities and reduces the risk of unauthorized access or damage to the system.
RUN addgroup app && adduser -S -G app app

# The USER command in a Dockerfile is used to specify the user that will be used to run the commands in the container. In this case, we are creating a new user called "app" and setting it as the user for the container. This is a security best practice, as it prevents the application from running with root privileges, which can help to mitigate potential security vulnerabilities. By using a non-root user, we can limit the permissions of the application and reduce the risk of unauthorized access or damage to the system.
USER app

# The WORKDIR command in a Dockerfile is used to set the working directory for any subsequent commands that are run in the container. It specifies the directory where the application code will be located and where the commands will be executed. By setting the WORKDIR, you can avoid having to specify the full path to files and directories in your commands, making it easier to manage and maintain your Dockerfile. In this case, we set the WORKDIR to /app, which means that any commands that follow will be executed in the /app directory.
WORKDIR /app

# The package.json, because it has the dependencies of the project. If we copy the whole project, we will have to install the dependencies every time we change a file, which is not efficient. By copying only the package.json first, we can install the dependencies and then copy the rest of the files, which will be faster.
COPY package*.json /app/

# The RUN command in a Dockerfile is used to execute a command in the container during the build process. In this case, we are using the RUN command to install the dependencies of the application by running "npm i". This will read the package.json file and install all the dependencies listed in it. By running this command during the build process, we can ensure that all the necessary dependencies are installed in the container before it is run.
RUN npm i 

# The dot in the COPY command means "copy everything in the current directory". So, when we run the command "COPY . /app/", it will copy all the files and folders in the current directory (where the Dockerfile is located) to the /app directory in the container. This is a common practice to ensure that all the necessary files for the application are included in the container.
COPY . .

# The EXPOSE command in a Dockerfile is used to specify the port number that the container will listen on at runtime. In this case, we are exposing port 3000, which means that when the container is run, it will listen for incoming connections on port 3000. This is important because it allows us to access the application running inside the container from outside the container, such as from a web browser or another application. 
EXPOSE 3000

# The CMD command in a Dockerfile is used to specify the default command that will be executed when the container is run. In this case, we are using the CMD command to run the server.js file using Node.js. This means that when the container is started, it will automatically execute the command "node server.js", which will start the application and allow it to listen for incoming requests on port 3000 (as specified by the EXPOSE command). The CMD command can be overridden at runtime by specifying a different command when starting the container, but if no command is provided, it will default to the one specified in the Dockerfile
CMD [ "node", "src/server.js" ]