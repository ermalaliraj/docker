# Node.js - Hello World Docker Container from scratch


### Dockerfile content:
    FROM node:14
    WORKDIR /usr/src/app
    COPY package*.json app.js ./
    RUN npm install
    EXPOSE 3000
    CMD ["node", "app.js"]
    
### app.js 
    const express = require('express')
    const app = express()
    
    app.get('/', (req, res) => res.send('Hello World!'))
    app.listen(3000, () => console.log('Server ready'))
    
### package.json generation (or copy already generated)
    npm init -y
    npm install express
    
### Test in local 
    node app.js 
    curl -S localhost:3000 => Hello World!
    
### Build Docker Image
    docker build -t examplenode .

### Run container
    docker run -d -p 3000:3000 --name node-app examplenode
    curl -S localhost:3000 => Hello World!
    
    
    
### Links
[docker-node-container-example](https://flaviocopes.com/docker-node-container-example/)
