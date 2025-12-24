# Use a lightweight Node.js base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package files first to leverage Docker layer caching
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on (app.js defaults to 8080)
EXPOSE 8080

# Define the command to run the application
CMD ["npm", "start"]