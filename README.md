# Run it without mongodb.
    docker run -it --rm mulspace/meteor bash

# Run it with mongodb
## Start the two containers
     docker run -itd --name mongo mongo
     docker run -it --rm --link mongo:mongo -p 3000:3000 mulspace/meteor bash
## Then run the command in meteor container.
    meteor create test && cd test && MONGO_URL=mongodb://mongo:27017/test meteor

# Run the meteor directly when start the container.
    docker run -it --rm --link mongo:mongo -p 3000:3000 \
        -v $PWD:test:/home/meteor \
        mulspace/meteor \
        bash -c "cd test && MONGO_URL=mongodb://mongo:27017/test meteor"

