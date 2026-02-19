FROM node:25-alpine3.22


# what is the most important thing to copy to the container? The package.json, because it has the dependencies of the project. If we copy the whole project, we will have to install the dependencies every time we change a file, which is not efficient. By copying only the package.json first, we can install the dependencies and then copy the rest of the files, which will be faster.
COPY package*.json /app/
# where is this /app directory spoted? f
WORKDIR /app
RUN npm i 